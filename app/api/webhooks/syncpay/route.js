import crypto from "node:crypto";
import { neon } from "@neondatabase/serverless";
import { sendMemberAccessEmail } from "../../../../lib/activation-email";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const PROVIDER = "syncpay";
const MAX_BODY_BYTES = 1_000_000;

function constantTimeEqual(left, right) {
  const a = Buffer.from(String(left ?? ""));
  const b = Buffer.from(String(right ?? ""));
  return a.length === b.length && crypto.timingSafeEqual(a, b);
}

function validSignature(rawBody, signatureHeader, secret) {
  if (!signatureHeader || !secret) return false;
  const parts = Object.fromEntries(signatureHeader.split(",").map((part) => {
    const separator = part.indexOf("=");
    return separator < 0 ? ["", ""] : [part.slice(0, separator).trim(), part.slice(separator + 1).trim()];
  }));
  const timestamp = parts.t;
  const signature = parts.v1;
  if (!timestamp || !signature || !/^[a-f0-9]{64}$/i.test(signature)) return false;
  const seconds = Number(timestamp);
  if (!Number.isSafeInteger(seconds) || Math.abs(Date.now() / 1000 - seconds) > 300) return false;
  const expected = crypto.createHmac("sha256", secret).update(`${timestamp}.${rawBody}`).digest("hex");
  return constantTimeEqual(signature.toLowerCase(), expected);
}

function validEmail(value) {
  return typeof value === "string" && value.length <= 320 && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
}

function statusFor(status) {
  const value = String(status ?? "").toLowerCase();
  if (["completed", "paid", "approved", "succeeded"].includes(value)) return "approved";
  if (["refunded", "refund", "estornado", "refunded_partial"].includes(value)) return "refunded";
  if (["chargeback", "chargedback", "disputed", "med"].includes(value)) return "chargeback";
  if (["failed", "refused", "declined", "canceled", "cancelled", "expired"].includes(value)) return "failed";
  if (["pending", "waiting_payment", "processing", "created"].includes(value)) return "pending";
  return null;
}

export async function POST(request) {
  const secret = process.env.SYNCPAY_WEBHOOK_SECRET;
  const productReference = process.env.SYNCPAY_PRODUCT_ID;
  const databaseUrl = process.env.DATABASE_URL;
  if (!secret || !productReference || !databaseUrl) {
    return Response.json({ error: "Webhook SyncPay não configurado no servidor." }, { status: 503 });
  }

  const rawBody = await request.text();
  if (Buffer.byteLength(rawBody, "utf8") > MAX_BODY_BYTES) {
    return Response.json({ error: "Payload muito grande." }, { status: 413 });
  }
  const signature = request.headers.get("x-syncpay-signature");
  if (!validSignature(rawBody, signature, secret)) {
    return Response.json({ error: "Assinatura inválida." }, { status: 401 });
  }

  let payload;
  try { payload = JSON.parse(rawBody); }
  catch { return Response.json({ error: "JSON inválido." }, { status: 400 }); }

  const isDashboardTest = JSON.stringify(payload).includes("This is a test webhook payload.") &&
    !payload?.transaction && !payload?.transaction_id && !payload?.payment && !payload?.payment_id;
  if (isDashboardTest) return Response.json({ received: true, test: true, processed: false });

  if (!payload || typeof payload.event !== "string" || !payload.transaction) {
    return Response.json({ error: "Payload inválido." }, { status: 400 });
  }
  // Only status changes can establish paid state; transaction.created is never proof of payment.
  if (payload.event !== "transaction.updated") return Response.json({ received: true, ignored: true });

  const transaction = payload.transaction;
  const transactionId = String(transaction.reference_id ?? "").trim();
  if (!transactionId || transactionId.length > 200) {
    return Response.json({ error: "Identificador de transação ausente." }, { status: 400 });
  }
  const nextStatus = statusFor(transaction.status);
  if (!nextStatus) return Response.json({ received: true, ignored: true, reason: "unsupported_status" });

  const email = typeof payload.customer?.email === "string" ? payload.customer.email.trim().toLowerCase() : "";
  const amount = Number(transaction.amount);
  const currency = String(transaction.currency || "BRL").toUpperCase();
  if (!validEmail(email) || !Number.isFinite(amount) || amount < 0 || currency.length !== 3) {
    return Response.json({ error: "Dados da transação inválidos." }, { status: 400 });
  }

  const itemReferences = Array.isArray(payload.checkout?.items)
    ? payload.checkout.items.map((item) => String(item?.reference_id ?? "")) : [];
  const checkoutReference = String(payload.checkout?.reference_id ?? "");
  if (checkoutReference !== productReference && !itemReferences.includes(productReference)) {
    return Response.json({ received: true, ignored: true, reason: "product_mismatch" });
  }

  const sql = neon(databaseUrl);
  let claimedId = null;
  const eventId = String(payload.event_id ?? request.headers.get("x-syncpay-delivery") ??
    `${payload.event}:${transactionId}:${transaction.status}`).slice(0, 255);
  try {
    const claimed = await sql`
      INSERT INTO payment_events (provider, provider_event_id, event_type, processing_status, received_at)
      VALUES (${PROVIDER}, ${eventId}, ${payload.event}, 'processing', now())
      ON CONFLICT (provider, provider_event_id) DO UPDATE
        SET processing_status = 'processing', received_at = now(), error_code = NULL
        WHERE payment_events.processing_status IN ('received', 'failed')
           OR (payment_events.processing_status = 'processing'
               AND payment_events.received_at < now() - interval '5 minutes')
      RETURNING id
    `;
    if (!claimed.length) return Response.json({ received: true, duplicate: true });
    claimedId = claimed[0].id;

    const products = await sql`
      SELECT p.id, p.is_active
      FROM product_provider_mappings m
      JOIN products p ON p.id = m.product_id
      WHERE m.provider = ${PROVIDER}
        AND m.provider_product_id = ${productReference}
        AND m.is_active = true
      LIMIT 1
    `;
    if (!products.length || (nextStatus === "approved" && !products[0].is_active)) {
      await sql`UPDATE payment_events SET processing_status = 'ignored', processed_at = now(),
        error_code = 'product_not_configured' WHERE id = ${claimedId}`;
      return Response.json({ received: true, ignored: true, reason: "product_not_configured" });
    }

    const productId = products[0].id;
    const amountCents = Math.round(amount * 100);
    const paidAt = transaction.paid_at && !Number.isNaN(Date.parse(transaction.paid_at))
      ? new Date(transaction.paid_at).toISOString() : new Date().toISOString();
    const refundedAt = transaction.refunded_at && !Number.isNaN(Date.parse(transaction.refunded_at))
      ? new Date(transaction.refunded_at).toISOString() : new Date().toISOString();
    const metadata = JSON.stringify({
      event: payload.event, eventId, paymentMethod: transaction.payment_method ?? null,
      checkoutReference: checkoutReference || null, previousStatus: transaction.previous_status ?? null,
    });

    const saved = await sql`
      INSERT INTO orders
        (product_id, customer_email, provider, provider_checkout_id, provider_payment_id,
         status, amount, currency, approved_at, refunded_at, metadata, updated_at)
      VALUES (
        ${productId}, ${email}, ${PROVIDER}, ${checkoutReference || null}, ${transactionId},
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
        INSERT INTO entitlements (order_id, product_id, customer_email, status, granted_at, updated_at)
        VALUES (${order.id}, ${productId}, ${email}, 'active', now(), now())
        ON CONFLICT (order_id) DO UPDATE SET customer_email = EXCLUDED.customer_email,
          status = 'active', revoked_at = NULL, revocation_reason = NULL, updated_at = now()
      `;
      await sendMemberAccessEmail(email);
    } else if (["refunded", "chargeback"].includes(order.status)) {
      await sql`UPDATE entitlements SET status = 'revoked',
        revoked_at = COALESCE(revoked_at, now()), revocation_reason = ${order.status}, updated_at = now()
        WHERE order_id = ${order.id}`;
    }

    await sql`UPDATE payment_events SET order_id = ${order.id}, processing_status = 'processed',
      processed_at = now(), error_code = NULL WHERE id = ${claimedId}`;
    return Response.json({ received: true, processed: true, status: order.status });
  } catch (error) {
    if (claimedId) {
      try {
        await sql`UPDATE payment_events SET processing_status = 'failed', error_code = 'processing_error'
          WHERE id = ${claimedId}`;
      } catch { /* stale processing claims can be reclaimed after five minutes */ }
    }
    console.error("SyncPay webhook processing failed", {
      event: payload.event, transactionId,
      error: error instanceof Error ? error.message : "unknown_error",
    });
    return Response.json({ error: "Falha ao processar evento." }, { status: 500 });
  }
}
