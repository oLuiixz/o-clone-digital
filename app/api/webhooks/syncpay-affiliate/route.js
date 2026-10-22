import crypto from "node:crypto";
import { neon } from "@neondatabase/serverless";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const PROVIDER = "syncpay_affiliate";
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

function statusFor(status) {
  const value = String(status ?? "").toLowerCase();
  if (["completed", "paid", "approved", "succeeded"].includes(value)) return "approved";
  if (["refunded", "refund", "estornado"].includes(value)) return "refunded";
  if (["chargeback", "chargedback", "disputed", "med"].includes(value)) return "chargeback";
  if (["failed", "refused", "declined", "canceled", "cancelled", "expired"].includes(value)) return "failed";
  if (["pending", "waiting_payment", "processing", "created"].includes(value)) return "pending";
  return null;
}

function validEmail(value) {
  return typeof value === "string" && value.length <= 320 && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
}

/**
 * Separate affiliate-only webhook.
 * It never grants/revokes access and never creates/updates orders. The primary
 * SyncPay webhook remains responsible for payment state and member entitlements.
 * Configure this endpoint only after the provider confirms multi-webhook support.
 */
export async function POST(request) {
  const secret = process.env.SYNCPAY_AFFILIATE_WEBHOOK_SECRET;
  const productReference = process.env.SYNCPAY_PRODUCT_ID;
  const databaseUrl = process.env.DATABASE_URL;
  if (!secret || !productReference || !databaseUrl) {
    return Response.json({ error: "Webhook de afiliados não configurado." }, { status: 503 });
  }

  const rawBody = await request.text();
  if (Buffer.byteLength(rawBody, "utf8") > MAX_BODY_BYTES) {
    return Response.json({ error: "Payload muito grande." }, { status: 413 });
  }

  let payload;
  try { payload = JSON.parse(rawBody); }
  catch { return Response.json({ error: "JSON inválido." }, { status: 400 }); }

  const signature = request.headers.get("x-syncpay-signature");
  if (!validSignature(rawBody, signature, secret)) {
    return Response.json({ error: "Assinatura inválida." }, { status: 401 });
  }

  if (payload?.event !== "transaction.updated" || !payload?.transaction) {
    return Response.json({ received: true, ignored: true });
  }

  const transaction = payload.transaction;
  const transactionId = String(transaction.reference_id ?? "").trim();
  const status = statusFor(transaction.status);
  const email = String(payload.customer?.email ?? "").trim().toLowerCase();
  const amount = Number(transaction.amount);
  if (!transactionId || transactionId.length > 200 || !status || !validEmail(email) || !Number.isFinite(amount) || amount < 0) {
    return Response.json({ error: "Dados da transação inválidos." }, { status: 400 });
  }

  const itemReferences = Array.isArray(payload.checkout?.items)
    ? payload.checkout.items.map((item) => String(item?.reference_id ?? "")) : [];
  const checkoutReference = String(payload.checkout?.reference_id ?? "");
  if (checkoutReference !== productReference && !itemReferences.includes(productReference)) {
    return Response.json({ received: true, ignored: true, reason: "product_mismatch" });
  }

  const sql = neon(databaseUrl);
  const eventId = `${payload.event}:${transactionId}:${String(transaction.status).toLowerCase()}`.slice(0, 255);
  let claimedId = null;

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

    const orders = await sql`
      SELECT id, status, customer_email, amount
      FROM orders
      WHERE provider = 'syncpay' AND provider_payment_id = ${transactionId}
      LIMIT 1
    `;
    if (!orders.length) {
      await sql`UPDATE payment_events SET processing_status = 'failed', error_code = 'order_not_found'
        WHERE id = ${claimedId}`;
      return Response.json({ error: "Pedido ainda não encontrado; a SyncPay deve tentar novamente." }, { status: 503 });
    }

    const order = orders[0];
    if (["refunded", "chargeback"].includes(status) || ["refunded", "chargeback"].includes(order.status)) {
      await sql`
        UPDATE affiliate_commissions SET status = 'reversed', updated_at = now()
        WHERE order_id = ${order.id} AND status <> 'reversed'
      `;
    } else if (status === "approved" && order.status === "approved") {
      const attribution = await sql`
        SELECT aa.id AS attribution_id, aa.affiliate_id, a.commission_percent
        FROM affiliate_attributions aa
        JOIN affiliates a ON a.id = aa.affiliate_id AND a.status = 'approved'
        JOIN member_accounts ma ON ma.id = a.account_id AND lower(ma.email) <> ${email}
        WHERE lower(aa.customer_email) = ${email}
          AND aa.expires_at > now()
          AND (aa.converted_order_id IS NULL OR aa.converted_order_id = ${order.id})
        ORDER BY aa.created_at DESC
        LIMIT 1
      `;

      if (attribution.length) {
        const amountCents = Number(order.amount);
        const commissionCents = Math.max(0, Math.round(amountCents * Number(attribution[0].commission_percent) / 100));
        await sql`
          INSERT INTO affiliate_commissions (affiliate_id, order_id, order_amount_cents, commission_cents, status)
          VALUES (${attribution[0].affiliate_id}, ${order.id}, ${amountCents}, ${commissionCents}, 'approved')
          ON CONFLICT (order_id) DO NOTHING
        `;
        await sql`
          UPDATE affiliate_attributions SET converted_order_id = ${order.id}
          WHERE id = ${attribution[0].attribution_id}
            AND (converted_order_id IS NULL OR converted_order_id = ${order.id})
        `;
      }
    }

    await sql`UPDATE payment_events SET processing_status = 'processed', processed_at = now(), error_code = NULL
      WHERE id = ${claimedId}`;
    return Response.json({ received: true, processed: true });
  } catch (error) {
    if (claimedId) {
      try {
        await sql`UPDATE payment_events SET processing_status = 'failed', error_code = 'processing_error' WHERE id = ${claimedId}`;
      } catch {}
    }
    console.error("SyncPay affiliate webhook failed", error instanceof Error ? error.message : "unknown_error");
    return Response.json({ error: "Falha ao processar evento de afiliados." }, { status: 500 });
  }
}
