import { NextResponse } from "next/server";
import { createHmac, timingSafeEqual } from "node:crypto";
import { neon } from "@neondatabase/serverless";

export const runtime = "nodejs";

function validSignature(rawBody, signature, secret) {
  if (!signature || !secret) return false;
  const supplied = signature.replace(/^sha256=/i, "").trim();
  const expected = createHmac("sha256", secret).update(rawBody).digest("hex");
  try {
    const a = Buffer.from(supplied, "hex");
    const b = Buffer.from(expected, "hex");
    return a.length === b.length && timingSafeEqual(a, b);
  } catch {
    return false;
  }
}

export async function POST(request) {
  const rawBody = await request.text();
  const secret = process.env.SYNCPAY_WEBHOOK_SECRET;
  const signature =
    request.headers.get("x-webhook-signature") ||
    request.headers.get("x-signature");

  if (!secret) {
    return NextResponse.json(
      { received: false, error: "Webhook ainda não configurado no servidor." },
      { status: 503 }
    );
  }

  if (!validSignature(rawBody, signature, secret)) {
    return NextResponse.json({ received: false, error: "Assinatura inválida." }, { status: 401 });
  }

  let payload;
  try {
    payload = JSON.parse(rawBody);
  } catch {
    return NextResponse.json({ received: false, error: "JSON inválido." }, { status: 400 });
  }

  const databaseUrl = process.env.DATABASE_URL;
  if (!databaseUrl) {
    return NextResponse.json({ received: false, error: "Banco ainda não conectado." }, { status: 503 });
  }

  try {
    const sql = neon(databaseUrl);
    await sql`
      INSERT INTO syncpay_webhook_events (event_type, transaction_id, payload)
      VALUES (
        ${String(payload.event ?? payload.type ?? payload.status ?? "unknown").slice(0, 120)},
        ${String(payload.transaction_id ?? payload.transactionId ?? payload.id ?? "").slice(0, 180)},
        ${JSON.stringify(payload)}::jsonb
      )
    `;
  } catch (error) {
    console.error("SyncPay webhook persistence failed", error);
    return NextResponse.json({ received: false, error: "Falha ao registrar evento." }, { status: 500 });
  }

  // Events are recorded only. Access is not granted until the provider's
  // signature format and confirmed-paid status have been verified.
  return NextResponse.json({ received: true, processed: false });
}
