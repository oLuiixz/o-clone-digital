import crypto from "node:crypto";
import { neon } from "@neondatabase/serverless";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const PROVIDER = "cakto";
const TOLERANCE_SECONDS = 300;
const MAX_BODY_BYTES = 1_000_000;

function equal(aValue, bValue) {
  const a = Buffer.from(String(aValue ?? ""));
  const b = Buffer.from(String(bValue ?? ""));
  return a.length === b.length && crypto.timingSafeEqual(a, b);
}

function verifySignature(rawBody, timestamp, header, secret) {
  if (!/^\d+$/.test(String(timestamp ?? ""))) return false;
  const seconds = Number(timestamp);
  if (!Number.isSafeInteger(seconds) || Math.abs(Date.now() / 1000 - seconds) > TOLERANCE_SECONDS) return false;
  const digest = crypto.createHmac("sha256", secret)
    .update(`${timestamp}.`)
    .update(rawBody)
    .digest("hex");
  return String(header ?? "").split(",").map((part) => part.trim())
    .filter((part) => part.startsWith("v1="))
    .some((part) => equal(part, `v1=${digest}`));
}

function statusFor(event, data) {
  if (event === "purchase_approved" && data.status === "paid") return "approved";
  if (event === "refund" && data.status === "refunded") return "refunded";
  if (event === "chargeback" && data.status === "chargedback") return "chargeback";
  if (event === "purchase_refused" && data.status === "refused") return "failed";
  if (["pix_gerado", "boleto_gerado"].includes(event) && data.status === "waiting_payment") return "pending";
  return null;
}

function validEmail(value) {
  return typeof value === "string" && value.length <= 320 &&
    /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
}

export async function POST(request) {
  const secret = process.env.CAKTO_WEBHOOK_SECRET;
  const productId = process.env.CAKTO_PRODUCT_ID;
  const databaseUrl = process.env.DATABASE_URL;
  if (!secret || !productId || !databaseUrl) {
    return Response.json({ error: "Webhook não configurado no servidor." }, { status: 503 });
  }

  const timestamp = request.headers.get("x-cakto-timestamp");
  const signature = request.headers.get("x-cakto-signature");
  const rawBody = await request.text();
  if (Buffer.byteLength(rawBody, "utf8") > MAX_BODY_BYTES) {
    return Response.json({ error: "Payload muito grande." }, { status: 413 });
  }
  if (!verifySignature(rawBody, timestamp, signature, secret)) {
    return Response.json({ error: "Assinatura inválida." }, { status: 401 });
  }

  let payload;
  try {
    payload = JSON.parse(rawBody);
  } catch {
    return Response.json({ error: "JSON inválido." }, { status: 400 });
  }
  if (!payload || typeof payload.event !== "string" || !payload.data ||
      !equal(payload.secret, secret)) {
    return Response.json({ error: "Payload inválido." }, { status: 400 });
  }

  // This event has no order/payment ID and must never grant access.
  if (payload.event === "checkout_abandonment") {
    return Response.json({ received: true, ignored: true });
  }

  const items = Array.isArray(payload.data) ? payload.data : [payload.data];
  if (!items.length || items.length > 50) {
    return Response.json({ error: "Quantidade de pedidos inválida." }, { status: 400 });
  }

  const sql = neon(databaseUrl);
  const outcomes = [];

  for (const data of items) {
    if (!data || typeof data.id !== "string" || !data.id || data.id.length > 200) {
      outcomes.push({ processed: false, reason: "missing_order_id" });
      continue;
    }

    // Include event type so a refund/chargeback is not deduplicated as the approval.
    const eventId = `${payload.event}:${data.id}`.slice(0, 255);
    let claimedId = null;

    try {
      const claimed = await sql`
        INSERT INTO payment_events
          (provider, provider_event_id, event_type, processing_status, received_at)
        VALUES (${PROVIDER}, ${eventId}, ${payload.event}, 'processing', now())
        ON CONFLICT (provider, provider_event_id) DO UPDATE
          SET processing_status = 'processing', received_at = now(), error_code = NULL
          WHERE payment_events.processing_status IN ('received', 'failed')
             OR (payment_events.processing_status = 'processing'
                 AND payment_events.received_at < now() - interval '5 minutes')
        RETURNING id
      `;
      if (!claimed.length) {
        outcomes.push({ processed: false, reason: "duplicate_or_in_progress" });
        continue;
      }
      claimedId = claimed[0].id;

      const nextStatus = statusFor(payload.event, data);
      if (!nextStatus) {
        await sql`UPDATE payment_events SET processing_status = 'ignored',
          processed_at = now(), error_code = 'unsupported_event' WHERE id = ${claimedId}`;
        outcomes.push({ processed: false, reason: "unsupported_event" });
        continue;
      }

      if (data.product?.id !== productId) {
        await sql`UPDATE payment_events SET processing_status = 'ignored',
          processed_at = now(), error_code = 'product_mismatch' WHERE id = ${claimedId}`;
        outcomes.push({ processed: false, reason: "product_mismatch" });
        continue;
      }

      const email = data.customer?.email?.trim().toLowerCase();
      const amount = Number(data.amount);
      const currency = String(data.offer?.currency || "BRL").toUpperCase();
      if (!validEmail(email) || !Number.isFinite(amount) || amount < 0 || currency.length !== 3) {
        await sql`UPDATE payment_events SET processing_status = 'ignored',
          processed_at = now(), error_code = 'invalid_order_data' WHERE id = ${claimedId}`;
        outcomes.push({ processed: false, reason: "invalid_order_data" });
        continue;
      }

      const products = await sql`
        SELECT id, is_active FROM products
        WHERE provider_product_id = ${productId} LIMIT 1
      `;
      if (!products.length || (nextStatus === "approved" && !products[0].is_active)) {
        await sql`UPDATE payment_events SET processing_status = 'ignored',
          processed_at = now(), error_code = 'product_not_configured' WHERE id = ${claimedId}`;
        outcomes.push({ processed: false, reason: "product_not_configured" });
        continue;
      }

      const productRowId = products[0].id;
      const amountCents = Math.round(amount * 100);
      const paidAt = data.paidAt && !Number.isNaN(Date.parse(data.paidAt))
        ? new Date(data.paidAt).toISOString() : new Date().toISOString();
      const refundedAt = data.refundedAt && !Number.isNaN(Date.parse(data.refundedAt))
        ? new Date(data.refundedAt).toISOString() : new Date().toISOString();
      const metadata = JSON.stringify({
        event: payload.event,
        refId: data.refId ?? null,
        offerId: data.offer?.id ?? null,
        offerType: data.offer_type ?? null,
        paymentMethod: data.paymentMethod ?? null,
      });

      const saved = await sql`
        INSERT INTO orders
          (product_id, customer_email, provider, provider_checkout_id, provider_payment_id,
           status, amount, currency, approved_at, refunded_at, metadata, updated_at)
        VALUES (
          ${productRowId}, ${email}, ${PROVIDER}, ${data.checkoutUrl ?? null}, ${data.id},
          ${nextStatus}, ${amountCents}, ${currency},
          ${nextStatus === "approved" ? paidAt : null},
          ${nextStatus === "refunded" ? refundedAt : null},
          ${metadata}::jsonb, now()
        )
        ON CONFLICT (provider, provider_payment_id) DO UPDATE SET
          customer_email = EXCLUDED.customer_email,
          provider_checkout_id = EXCLUDED.provider_checkout_id,
          status = CASE
            WHEN orders.status IN ('refunded', 'chargeback') THEN orders.status
            WHEN EXCLUDED.status = 'pending' AND orders.status = 'approved' THEN orders.status
            ELSE EXCLUDED.status
          END,
          amount = EXCLUDED.amount,
          currency = EXCLUDED.currency,
          approved_at = CASE
            WHEN orders.status IN ('refunded', 'chargeback') THEN orders.approved_at
            WHEN EXCLUDED.status = 'approved' THEN COALESCE(orders.approved_at, EXCLUDED.approved_at)
            ELSE orders.approved_at
          END,
          refunded_at = CASE WHEN EXCLUDED.status = 'refunded'
            THEN COALESCE(orders.refunded_at, EXCLUDED.refunded_at) ELSE orders.refunded_at END,
          metadata = orders.metadata || EXCLUDED.metadata,
          updated_at = now()
        RETURNING id, status
      `;
      const order = saved[0];

      if (order.status === "approved") {
        await sql`
          INSERT INTO entitlements
            (order_id, product_id, customer_email, status, granted_at, updated_at)
          VALUES (${order.id}, ${productRowId}, ${email}, 'active', now(), now())
          ON CONFLICT (order_id) DO UPDATE SET
            customer_email = EXCLUDED.customer_email, status = 'active',
            revoked_at = NULL, revocation_reason = NULL, updated_at = now()
        `;
      } else if (["refunded", "chargeback"].includes(order.status)) {
        await sql`
          UPDATE entitlements SET status = 'revoked',
            revoked_at = COALESCE(revoked_at, now()),
            revocation_reason = ${order.status}, updated_at = now()
          WHERE order_id = ${order.id}
        `;
      }

      await sql`UPDATE payment_events SET order_id = ${order.id},
        processing_status = 'processed', processed_at = now(), error_code = NULL
        WHERE id = ${claimedId}`;
      outcomes.push({ processed: true, status: order.status });
    } catch (error) {
      if (claimedId) {
        try {
          await sql`UPDATE payment_events SET processing_status = 'failed',
            error_code = 'processing_error' WHERE id = ${claimedId}`;
        } catch {
          // A stale processing claim can be reclaimed after five minutes.
        }
      }
      console.error("Cakto webhook processing failed", {
        event: payload.event, orderId: data.id,
        error: error instanceof Error ? error.message : "unknown_error",
      });
      return Response.json({ error: "Falha ao processar evento." }, { status: 500 });
    }
  }

  return Response.json({ received: true, outcomes });
}
