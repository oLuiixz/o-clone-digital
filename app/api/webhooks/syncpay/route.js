import { NextResponse } from "next/server";
import { createHmac, timingSafeEqual } from "node:crypto";
import { neon } from "@neondatabase/serverless";

export const runtime = "nodejs";

function validSignature(rawBody, signatureHeader, secret) {
  if (!signatureHeader || !secret) return false;
  const parts = Object.fromEntries(
    signatureHeader.split(",").map((part) => {
      const separator = part.indexOf("=");
      return separator < 0 ? ["", ""] : [part.slice(0, separator).trim(), part.slice(separator + 1).trim()];
    })
  );
  const timestamp = parts.t;
  const signature = parts.v1;
  if (!timestamp || !signature) return false;
  const timestampNumber = Number(timestamp);
  if (!Number.isFinite(timestampNumber) || Math.abs(Date.now() / 1000 - timestampNumber) > 300) return false;
  const expected = createHmac("sha256", secret).update(`${timestamp}.${rawBody}`).digest("hex");
  const suppliedBuffer = Buffer.from(signature, "hex");
  const expectedBuffer = Buffer.from(expected, "hex");
  return suppliedBuffer.length === expectedBuffer.length && timingSafeEqual(suppliedBuffer, expectedBuffer);
}

export async function POST(request) {
  const rawBody = await request.text();
  const secret = process.env.SYNCPAY_WEBHOOK_SECRET;
  const signature = request.headers.get("x-syncpay-signature");

  if (!secret) {
    return NextResponse.json({ received: false, error: "Webhook ainda não configurado no servidor." }, { status: 503 });
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
      INSERT INTO syncpay_webhook_events (event_id, event_type, transaction_id, payload)
      VALUES (
        ${String(payload.event_id ?? request.headers.get("x-syncpay-delivery") ?? "").slice(0, 180) || null},
        ${String(payload.event ?? "unknown").slice(0, 120)},
        ${String(payload.transaction?.reference_id ?? payload.transaction_id ?? payload.id ?? "").slice(0, 180) || null},
        ${JSON.stringify(payload)}::jsonb
      )
      ON CONFLICT (event_id) DO NOTHING
    `;
  } catch (error) {
    console.error("SyncPay webhook persistence failed", error);
    return NextResponse.json({ received: false, error: "Falha ao registrar evento." }, { status: 500 });
  }

  // Receives and records verified deliveries only. Payment/access handling is
  // deliberately separate until the provider's paid status is confirmed.
  return NextResponse.json({ received: true, processed: false });
}
