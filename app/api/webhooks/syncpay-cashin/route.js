import crypto from "node:crypto";
import { neon } from "@neondatabase/serverless";
import { sendMemberAccessEmail } from "../../../../lib/activation-email";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

function safeEqual(left, right) {
  const a = Buffer.from(String(left ?? ""));
  const b = Buffer.from(String(right ?? ""));
  return a.length === b.length && crypto.timingSafeEqual(a, b);
}

function statusFor(value) {
  const status = String(value ?? "").toLowerCase();
  if (["completed", "paid", "approved", "succeeded"].includes(status)) return "approved";
  if (["refunded", "refund", "estornado"].includes(status)) return "refunded";
  if (["chargeback", "chargedback", "disputed", "med"].includes(status)) return "chargeback";
  if (["failed", "refused", "declined", "canceled", "cancelled", "expired"].includes(status)) return "failed";
  if (["pending", "waiting_payment", "processing", "created"].includes(status)) return "pending";
  return null;
}

function normalizeEmail(value) {
  return typeof value === "string" ? value.trim().toLowerCase() : "";
}

export async function POST(request) {
  const expectedToken = process.env.SYNCPAY_CASHIN_WEBHOOK_TOKEN;
  const urlToken = new URL(request.url).searchParams.get("token");
  const authorization = request.headers.get("authorization") || "";
  const bearerToken = /^Bearer\s+(.+)$/i.exec(authorization)?.[1]?.trim() || "";
  // Per-charge callbacks can carry the secret in the URL. Also accept the documented
  // legacy Bearer form, but never accept an unsigned event without one of these secrets.
  const receivedToken = bearerToken || urlToken;
  if (!expectedToken || !receivedToken || !safeEqual(receivedToken, expectedToken)) {
    return Response.json({ error: "Não autorizado." }, { status: 401 });
  }

  const databaseUrl = process.env.DATABASE_URL;
  if (!databaseUrl) return Response.json({ error: "Webhook não configurado." }, { status: 503 });

  let payload;
  try { payload = await request.json(); }
  catch { return Response.json({ error: "JSON inválido." }, { status: 400 }); }

  // Cash-in webhook contract: id is the SyncPay identifier, amount is in BRL.
  const paymentId = String(payload?.id ?? payload?.identifier ?? "").trim();
  const nextStatus = statusFor(payload?.status);
  const email = normalizeEmail(payload?.client?.email ?? payload?.customer?.email);
  const amount = Number(payload?.amount);
  if (!paymentId || paymentId.length > 200 || !nextStatus ||
      !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || !Number.isFinite(amount) || amount < 0) {
    return Response.json({ error: "Dados da transação inválidos." }, { status: 400 });
  }

  const sql = neon(databaseUrl);
  const eventTime = String(payload?.updated_at ?? payload?.paid_at ?? payload?.created_at ?? "").slice(0, 64);
  const eventId = `cashin.updated:${paymentId}:${String(payload.status).toLowerCase()}:${eventTime}`.slice(0, 255);
  let claimedId = null;
  try {
    const claims = await sql`
      INSERT INTO payment_events (provider, provider_event_id, event_type, processing_status, received_at)
      VALUES ('syncpay', ${eventId}, 'cashin.updated', 'processing', now())
      ON CONFLICT (provider, provider_event_id) DO UPDATE
        SET processing_status = 'processing', received_at = now(), error_code = NULL
        WHERE payment_events.processing_status IN ('received', 'failed')
           OR (payment_events.processing_status = 'processing' AND payment_events.received_at < now() - interval '5 minutes')
      RETURNING id
    `;
    if (!claims.length) return Response.json({ received: true, duplicate: true });
    claimedId = claims[0].id;

    const matches = await sql`
      SELECT o.id, o.product_id, o.customer_email, o.amount, o.status, p.is_active
      FROM orders o JOIN products p ON p.id = o.product_id
      WHERE o.provider = 'syncpay' AND o.provider_payment_id = ${paymentId}
      LIMIT 1
    `;
    if (!matches.length) {
      // A very fast provider callback can arrive before the checkout stores the returned identifier.
      // Return 503 so the provider retries instead of permanently acknowledging a transient race.
      await sql`UPDATE payment_events SET processing_status = 'failed', error_code = 'order_not_found_yet'
        WHERE id = ${claimedId}`;
      return Response.json({ error: "Pedido ainda não localizado; tente novamente." }, { status: 503 });
    }

    const order = matches[0];
    // Never associate a provider notification with a different buyer or amount.
    if (normalizeEmail(order.customer_email) !== email || Number(order.amount) !== Math.round(amount * 100)) {
      await sql`UPDATE payment_events SET processing_status = 'ignored', processed_at = now(),
        error_code = 'order_mismatch' WHERE id = ${claimedId}`;
      return Response.json({ received: true, ignored: true, reason: "order_mismatch" });
    }

    const saved = await sql`
      UPDATE orders SET
        status = CASE
          WHEN orders.status IN ('refunded', 'chargeback') THEN orders.status
          WHEN orders.status = 'approved' AND ${nextStatus} IN ('pending', 'failed', 'cancelled', 'expired') THEN orders.status
          ELSE ${nextStatus}
        END,
        approved_at = CASE WHEN ${nextStatus} = 'approved' THEN COALESCE(approved_at, now()) ELSE approved_at END,
        refunded_at = CASE WHEN ${nextStatus} = 'refunded' THEN COALESCE(refunded_at, now()) ELSE refunded_at END,
        metadata = metadata || ${JSON.stringify({ syncpay_cashin_status: payload.status, syncpay_updated_at: eventTime || null })}::jsonb,
        updated_at = now()
      WHERE id = ${order.id}
      RETURNING id, product_id, customer_email, status
    `;
    const updated = saved[0];

    if (updated.status === "approved" && order.is_active) {
      await sql`
        INSERT INTO entitlements (order_id, product_id, customer_email, status, granted_at, updated_at)
        VALUES (${updated.id}, ${updated.product_id}, ${updated.customer_email}, 'active', now(), now())
        ON CONFLICT (order_id) DO UPDATE SET customer_email = EXCLUDED.customer_email,
          status = 'active', revoked_at = NULL, revocation_reason = NULL, updated_at = now()
      `;
      if (order.status !== "approved") await sendMemberAccessEmail(updated.customer_email);

      // Track affiliate commission only after verified payment; do not perform SyncPay split here.
      try {
        const attribution = await sql`
          SELECT aa.id AS attribution_id, aa.affiliate_id, a.commission_percent
          FROM affiliate_attributions aa
          JOIN affiliates a ON a.id = aa.affiliate_id AND a.status = 'approved'
          JOIN member_accounts ma ON ma.id = a.account_id AND lower(ma.email) <> ${updated.customer_email}
          WHERE lower(aa.customer_email) = ${updated.customer_email}
            AND aa.expires_at > now()
            AND aa.converted_order_id IS NULL
          ORDER BY aa.created_at DESC
          LIMIT 1
        `;
        if (attribution.length) {
          const amountCents = Number(order.amount);
          const commissionCents = Math.max(0, Math.round(amountCents * Number(attribution[0].commission_percent) / 100));
          await sql`
            INSERT INTO affiliate_commissions (affiliate_id, order_id, order_amount_cents, commission_cents, status)
            VALUES (${attribution[0].affiliate_id}, ${updated.id}, ${amountCents}, ${commissionCents}, 'approved')
            ON CONFLICT (order_id) DO NOTHING
          `;
          await sql`UPDATE affiliate_attributions SET converted_order_id = ${updated.id}
            WHERE id = ${attribution[0].attribution_id} AND converted_order_id IS NULL`;
        }
      } catch (affiliateError) {
        console.error("SyncPay cash-in affiliate attribution skipped", affiliateError instanceof Error ? affiliateError.message : "unknown_error");
      }
    } else if (["refunded", "chargeback"].includes(updated.status)) {
      await sql`UPDATE entitlements SET status = 'revoked',
        revoked_at = COALESCE(revoked_at, now()), revocation_reason = ${updated.status}, updated_at = now()
        WHERE order_id = ${updated.id}`;
      await sql`UPDATE affiliate_commissions SET status = 'reversed', updated_at = now()
        WHERE order_id = ${updated.id} AND status <> 'reversed'`;
    }

    await sql`UPDATE payment_events SET order_id = ${updated.id}, processing_status = 'processed',
      processed_at = now(), error_code = NULL WHERE id = ${claimedId}`;
    return Response.json({ received: true, processed: true, status: updated.status });
  } catch (error) {
    if (claimedId) {
      try { await sql`UPDATE payment_events SET processing_status = 'failed', error_code = 'processing_error' WHERE id = ${claimedId}`; }
      catch { /* recover stale claims after five minutes */ }
    }
    console.error("SyncPay cash-in webhook failed", error instanceof Error ? error.message : "unknown_error");
    return Response.json({ error: "Falha ao processar notificação." }, { status: 500 });
  }
}
