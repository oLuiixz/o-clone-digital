import { NextResponse } from "next/server";
import { createOpaqueToken, getAppBaseUrl, getDatabase, hashToken, normalizeEmail } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";
import { activationEmailContent, sendResendEmail } from "../../../../lib/resend-email";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function POST(request) {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
  const orderId = typeof body?.orderId === "string" ? body.orderId : "";
  const action = body?.action;
  if (!/^[0-9a-f-]{36}$/i.test(orderId) || !["generate", "email", "manual"].includes(action)) {
    return NextResponse.json({ error: "Ação ou pedido inválido." }, { status: 400 });
  }
  const sql = getDatabase();
  try {
    const rows = await sql`SELECT o.id,o.customer_email,o.status,p.name AS product_name FROM orders o JOIN products p ON p.id=o.product_id JOIN entitlements e ON e.order_id=o.id AND e.status='active' WHERE o.id=${orderId} AND o.status='approved' LIMIT 1`;
    if (!rows.length) return NextResponse.json({ error: "Só é possível entregar compras aprovadas com acesso ativo." }, { status: 409 });
    const email = normalizeEmail(rows[0].customer_email);
    if (action === "manual") {
      await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details) VALUES(${orderId},${email},'manual','manual_delivered','delivered',${String(body.details || "Entrega manual confirmada pelo administrador").slice(0,1000)})`;
      return NextResponse.json({ ok: true, message: "Entrega manual registrada no histórico." });
    }
    const base = getAppBaseUrl();
    if (!base) return NextResponse.json({ error: "NEXT_PUBLIC_APP_URL não configurada." }, { status: 503 });
    const token = createOpaqueToken();
    const expires = new Date(Date.now() + 30 * 60 * 1000).toISOString();
    await sql`INSERT INTO member_activation_tokens(email,token_hash,expires_at) VALUES(${email},${hashToken(token)},${expires})`;
    const url = new URL("/ativar", base);
    url.searchParams.set("token", token);
    await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details) VALUES(${orderId},${email},'manual','activation_link_generated','generated','Link válido por 30 minutos; mostrado uma única vez')`;
    if (action === "generate") return NextResponse.json({ ok: true, activationUrl: url.toString(), expiresAt: expires });
    try {
      const content = activationEmailContent({ activationUrl: url.toString() });
      await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details) VALUES(${orderId},${email},'email','send_attempt','pending','Tentativa de envio via Resend iniciada')`;
      const result = await sendResendEmail({ to: email, ...content });
      await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details,provider_message_id) VALUES(${orderId},${email},'email','email_accepted','sent','Resend aceitou a mensagem; entrega na caixa de entrada ainda não confirmada',${String(result.id || "").slice(0,500)})`;
      return NextResponse.json({ ok: true, message: "E-mail aceito pelo Resend; isso não confirma chegada à caixa de entrada.", messageId: result.id || null });
    } catch (error) {
      const detail = String(error?.message || "Falha no Resend").slice(0,1000);
      await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details) VALUES(${orderId},${email},'email','email_failed','failed',${detail})`;
      return NextResponse.json({ error: "Falha no envio: " + detail }, { status: 502 });
    }
  } catch (error) {
    console.error("Admin delivery failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Falha na ação. Confira a migração 003 no Neon." }, { status: 500 });
  }
}
