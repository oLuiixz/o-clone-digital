import { NextResponse } from "next/server";
import nodemailer from "nodemailer";
import { createOpaqueToken, getDatabase, hashToken, normalizeEmail, hasActiveAccess, getAppBaseUrl } from "../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function POST(request) {
  let body;
  try {
    body = await request.json();
  } catch {
    return NextResponse.json({ error: "Requisição inválida." }, { status: 400 });
  }

  const email = normalizeEmail(body?.email);
  if (!/^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/.test(email) || email.length > 320) {
    return NextResponse.json({ error: "Informe um e-mail válido." }, { status: 400 });
  }

  const generic = {
    message: "Se houver uma compra aprovada para esse e-mail, enviaremos um link de ativação.",
  };

  // Validate delivery configuration BEFORE creating a token, so failed SMTP
  // configuration never leaves an activation token that the customer cannot use.
  const smtpUser = process.env.SMTP_USER?.trim();
  const smtpPassword = process.env.SMTP_APP_PASSWORD?.replace(/\\s/g, "");
  const from = process.env.SMTP_FROM_EMAIL?.trim() || smtpUser;
  const baseUrl = getAppBaseUrl();

  if (!smtpUser || !smtpPassword || !from || !baseUrl) {
    console.error("Activation email is not configured.");
    return NextResponse.json(
      { error: "O envio de e-mail ainda não está configurado. Tente novamente mais tarde." },
      { status: 503 },
    );
  }

  let transporter;
  try {
    if (!(await hasActiveAccess(email))) return NextResponse.json(generic);

    const sql = getDatabase();
    const existing = await sql`SELECT id, password_hash FROM member_accounts WHERE lower(email) = ${email} LIMIT 1`;
    if (existing.length && existing[0].password_hash) {
      return NextResponse.json({
        message: "Essa conta já foi ativada. Entre com sua senha ou use a recuperação de senha.",
      });
    }

    transporter = nodemailer.createTransport({
      host: "smtp.gmail.com",
      port: 465,
      secure: true,
      auth: { user: smtpUser, pass: smtpPassword },
      connectionTimeout: 10000,
      greetingTimeout: 10000,
      socketTimeout: 15000,
    });

    // Verify SMTP before creating the token. This catches invalid credentials
    // or unavailable SMTP without leaving a fresh token behind.
    await transporter.verify();

    const token = createOpaqueToken();
    const tokenHash = hashToken(token);
    const expiresAt = new Date(Date.now() + 30 * 60 * 1000).toISOString();
    await sql`INSERT INTO member_activation_tokens (email, token_hash, expires_at)
      VALUES (${email}, ${tokenHash}, ${expiresAt})`;

    const activationUrl = new URL("/ativar", baseUrl);
    activationUrl.searchParams.set("token", token);

    await transporter.sendMail({
      from: { name: "O Clone Digital", address: from },
      to: email,
      subject: "Ative seu acesso ao O Clone Digital",
      text: `Seu acesso ao O Clone Digital está pronto. Acesse este link para criar sua senha: ${activationUrl.toString()}\\n\\nO link expira em 30 minutos e só pode ser usado uma vez. Se você não solicitou isso, ignore esta mensagem.`,
      html: `<div style="font-family:Arial,sans-serif;max-width:560px;margin:auto;color:#171717"><h1>Seu acesso está pronto</h1><p>Confirme seu acesso ao O Clone Digital e crie sua senha pessoal.</p><p><a href="${activationUrl.toString()}" style="display:inline-block;padding:13px 20px;background:#ff3045;color:#fff;text-decoration:none;border-radius:6px">Ativar minha conta</a></p><p>O link expira em 30 minutos e só pode ser usado uma vez. Se você não solicitou isso, ignore esta mensagem.</p></div>`,
    });

    return NextResponse.json(generic);
  } catch (error) {
    console.error("Activation request failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json(
      { error: "Não foi possível iniciar a ativação agora." },
      { status: 500 },
    );
  } finally {
    transporter?.close();
  }
}
