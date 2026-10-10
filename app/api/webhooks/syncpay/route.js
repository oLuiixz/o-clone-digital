import { NextResponse } from "next/server";
import { createHmac, timingSafeEqual } from "node:crypto";
import { neon } from "@neondatabase/serverless";

export const runtime = "nodejs";

function validSignature(rawBody, signatureHeader, secret) {
  if (!signatureHeader || !secret) return false;

  const parts = Object.fromEntries(
    signatureHeader.split(",").map((part) => {
      const separator = part.indexOf("=");
      return separator < 0
        ? ["", ""]
        : [part.slice(0, separator).trim(), part.slice(separator + 1).trim()];
    })
  );

  const timestamp = parts.t;
  const signature = parts.v1;
  if (!timestamp || !signature || !/^[a-f0-9]{64}$/i.test(signature)) return false;

  const timestampNumber = Number(timestamp);
  if (!Number.isFinite(timestampNumber) || Math.abs(Date.now() / 1000 - timestampNumber) > 300) {
    return false;
  }

  const expected = createHmac("sha256", secret)
    .update(`${timestamp}.${rawBody}`)
    .digest("hex");
  const suppliedBuffer = Buffer.from(signature, "hex");
  const expectedBuffer = Buffer.from(expected, "hex");

  return suppliedBuffer.length === expectedBuffer.length &&
    timingSafeEqual(suppliedBuffer, expectedBuffer);
}

export async function POST(request) {
  const rawBody = await request.text();

  let payload;
  try {
    payload = JSON.parse(rawBody);
  } catch {
    return NextResponse.json({ received: false, error: "JSON inválido." }, { status: 400 });
  }

  // The SyncPay dashboard's synthetic test payload is not a real payment event.
  // Acknowledge it without storing or processing it; real events still require HMAC.
  const isDashboardTest =
    payload?.event === "transaction" &&
    payload?.message === "This is a test webhook payload.";

  if (isDashboardTest) {
    return NextResponse.json({ received: true, test: true, processed: false });
  }

  const secret = process.env.SYNCPAY_WEBHOOK_SECRET;
  if (!secret) {
    return NextResponse.json(
      { received: false, error: "Webhook ainda não configurado no servidor." },
      { status: 503 }
    );
  }

  const signature = request.headers.get("x-syncpay-signature");
  if (!validSignature(rawBody, signature, secret)) {
    // Log only diagnostic metadata. Never log the secret, signature, or full payload.
    console.warn("SyncPay webhook rejected: missing/invalid signature", {
      hasSignatureHeader: Boolean(signature),
      hasSecret: Boolean(secret),
      event: typeof payload?.event === "string" ? payload.event : "unknown",
    });
    return NextResponse.json({ received: false, error: "Assinatura inválida." }, { status: 401 });
  }

  const databaseUrl = process.env.DATABASE_URL;
  if (!databaseUrl) {
    return NextResponse.json(
      { received: false, error: "Banco ainda não conectado." },
      { status: 503 }
    );
  }

  try {
    const sql = neon(databaseUrl);
    const deliveryId = request.headers.get("x-syncpay-delivery");
    const eventId = String(payload.event_id ?? "").slice(0, 180) || null;
    const dedupeId = eventId ?? (deliveryId ? String(deliveryId).slice(0, 180) : null);

    await sql`
      INSERT INTO syncpay_webhook_events (event_id, event_type, transaction_id, payload)
      VALUES (
        ${dedupeId},
        ${String(payload.event ?? "unknown").slice(0, 120)},
        ${String(payload.transaction?.reference_id ?? payload.transaction_id ?? payload.id ?? "").slice(0, 180) || null},
        ${JSON.stringify(payload)}::jsonb
      )
      ON CONFLICT (event_id) DO NOTHING
    `;
  } catch (error) {
    console.error("SyncPay webhook persistence failed", {
      message: error instanceof Error ? error.message : "unknown error",
    });
    return NextResponse.json({ received: false, error: "Falha ao registrar evento." }, { status: 500 });
  }

  // Verified events are recorded only; access is not released until payment
  // status and product ownership handling are implemented and verified.
  return NextResponse.json({ received: true, processed: false });
}
