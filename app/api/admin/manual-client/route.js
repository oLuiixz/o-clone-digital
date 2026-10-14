import { NextResponse } from "next/server";
import { createOpaqueToken, getAppBaseUrl, getDatabase, hashToken, normalizeEmail } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";
import { activationEmailContent, sendResendEmail } from "../../../../lib/resend-email";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET() {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  try {
    const sql = getDatabase();
    const products = await sql`SELECT id, name, slug FROM products WHERE is_active = true ORDER BY name`;
    return NextResponse.json({ products });
  } catch (error) {
    console.error("Manual client products failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível carregar os produtos ativos." }, { status: 500 });
  }
}

export async function POST(request) {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
  const email = normalizeEmail(body?.email);
  const name = typeof body?.name === "string" ? body.name.trim().slice(0, 120) : "";
  const productId = typeof body?.productId === "string" ? body.productId : "";
  const notes = typeof body?.notes === "string" ? body.notes.trim().slice(0, 500) : "";
  if (!name || name.length < 2 || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || email.length > 254 || !/^[0-9a-f-]{36}$/i.test(productId)) {
    return NextResponse.json({ error: "Informe nome, e-mail válido e produto." }, { status: 400 });
  }

  try {
    const sql = getDatabase();
    const products = await sql`SELECT id, name, currency FROM products WHERE id = ${productId} AND is_active = true LIMIT 1`;
    if (!products.length) return NextResponse.json({ error: "Produto não encontrado ou inativo." }, { status: 404 });

    // If access already exists, reuse the approved order instead of failing or duplicating the grant.
    const existing = await sql`SELECT o.id FROM entitlements e JOIN orders o ON o.id=e.order_id
      WHERE lower(e.customer_email)=${email} AND e.product_id=${productId}
      AND e.status='active' AND o.status='approved' ORDER BY o.created_at DESC LIMIT 1`;
    let orderId;
    let renewed = false;
    if (existing.length) {
      orderId = existing[0].id;
      renewed = true;
    } else {
      const orderRows = await sql`INSERT INTO orders (product_id, customer_email, provider, status, amount, currency, approved_at, metadata)
        VALUES (${productId}, ${email}, 'admin_free', 'approved', 0, ${products[0].currency || "BRL"}, now(),
        jsonb_build_object('source','manual_admin','customer_name',${name}::text,'notes',${notes}::text))
        RETURNING id`;
      orderId = orderRows[0].id;
      await sql`INSERT INTO entitlements (order_id, product_id, customer_email, status)
        VALUES (${orderId}, ${productId}, ${email}, 'active')`;
    }

    const base = getAppBaseUrl();
    if (!base) return NextResponse.json({ error: "URL do site não configurada. Confira NEXT_PUBLIC_APP_URL na Vercel." }, { status: 503 });
    const token = createOpaqueToken();
    const expires = new Date(Date.now() + 30 * 60 * 1000).toISOString();
    await sql`INSERT INTO member_activation_tokens (email, token_hash, expires_at) VALUES (${email}, ${hashToken(token)}, ${expires})`;
    const url = new URL("/ativar", base);
    url.searchParams.set("token", token);
    const eventDetails = (renewed
      ? "Novo link de ativação gerado para acesso já existente por " + name
      : "Acesso gratuito concedido manualmente por " + name)
      + (notes ? ". Observação: " + notes : "") + ". Link válido por 30 minutos.";
    await sql`INSERT INTO admin_delivery_events (order_id, customer_email, channel, action, status, details)
      VALUES (${orderId}, ${email}, 'manual', 'activation_link_generated', 'generated', ${eventDetails.slice(0,1000)})`;

    let emailSent = false;
    let emailWarning = "";
    try {
      const content = activationEmailContent({ activationUrl: url.toString(), name });
      await sendResendEmail({ to: email, ...content });
      emailSent = true;
      await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details)
        VALUES(${orderId},${email},'email','email_accepted','sent','Resend aceitou o e-mail de ativação')`;
    } catch (mailError) {
      emailWarning = "O acesso está registrado, mas o e-mail não foi enviado. Copie o link exibido e envie manualmente.";
      console.error("Manual access email failed", mailError instanceof Error ? mailError.message : "unknown_error");
      await sql`INSERT INTO admin_delivery_events(order_id,customer_email,channel,action,status,details)
        VALUES(${orderId},${email},'email','email_failed','failed',${String(mailError?.message || "Falha no Resend").slice(0,1000)})`;
    }
    return NextResponse.json({
      ok: true,
      message: renewed
        ? (emailSent ? "Acesso existente mantido. Novo link gerado e e-mail aceito pelo Resend." : "Acesso existente mantido. " + emailWarning)
        : (emailSent ? "Acesso gratuito criado e e-mail aceito pelo Resend." : "Acesso gratuito criado. " + emailWarning),
      emailSent, emailWarning: emailWarning || null, activationUrl: url.toString(), expiresAt: expires, orderId, renewed
    });
  } catch (error) {
    console.error("Manual free access failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível concluir a ação. Confira as migrações do banco e os logs da Vercel." }, { status: 500 });
  }
}
