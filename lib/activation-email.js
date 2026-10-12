import nodemailer from "nodemailer";
import { getDatabase, createOpaqueToken, hashToken, normalizeEmail, getAppBaseUrl } from "./member-auth";

export async function sendMemberAccessEmail(rawEmail) {
  const email = normalizeEmail(rawEmail);
  if (!email) throw new Error("Activation email recipient is invalid");

  const sql = getDatabase();
  const accounts = await sql`SELECT password_hash FROM member_accounts WHERE lower(email) = ${email} LIMIT 1`;
  const baseUrl = getAppBaseUrl();
  const smtpUser = process.env.SMTP_USER;
  const smtpPassword = process.env.SMTP_APP_PASSWORD;
  const from = process.env.SMTP_FROM_EMAIL || smtpUser;
  if (!smtpUser || !smtpPassword || !from || !baseUrl) {
    throw new Error("Gmail SMTP activation email is not configured");
  }

  const port = Number(process.env.SMTP_PORT || 465);
  const transporter = nodemailer.createTransport({
    host: process.env.SMTP_HOST || "smtp.gmail.com",
    port,
    secure: port === 465,
    auth: { user: smtpUser, pass: smtpPassword },
  });

  // Verify SMTP before creating a token so a configuration failure does not
  // leave an activation link in the database that was never emailed.
  try {
    await transporter.verify();
  } catch (error) {
    console.error("Gmail SMTP verification failed", error instanceof Error ? error.message : "unknown_error");
    throw new Error("Gmail SMTP is unavailable");
  }

  let subject;
  let html;
  if (accounts.length && accounts[0].password_hash) {
    subject = "Seu acesso ao O Clone Digital está liberado";
    html = `<div style="font-family:Arial,sans-serif;max-width:560px;margin:auto;color:#171717"><h1>Compra confirmada!</h1><p>Seu acesso ao O Clone Digital está liberado para o e-mail desta compra.</p><p><a href="${new URL("/login", baseUrl).toString()}" style="display:inline-block;padding:13px 20px;background:#ff3045;color:#fff;text-decoration:none;border-radius:6px">Entrar na área do aluno</a></p><p>Entre com a senha que você já cadastrou.</p></div>`;
  } else {
    const token = createOpaqueToken();
    const tokenHash = hashToken(token);
    const expiresAt = new Date(Date.now() + 30 * 60 * 1000).toISOString();
    await sql`INSERT INTO member_activation_tokens (email, token_hash, expires_at)
      VALUES (${email}, ${tokenHash}, ${expiresAt})`;
    const activationUrl = new URL("/ativar", baseUrl);
    activationUrl.searchParams.set("token", token);
    subject = "Ative seu acesso ao O Clone Digital";
    html = `<div style="font-family:Arial,sans-serif;max-width:560px;margin:auto;color:#171717"><h1>Compra confirmada!</h1><p>Seu acesso ao O Clone Digital está pronto. Crie uma senha pessoal usando o link abaixo.</p><p><a href="${activationUrl.toString()}" style="display:inline-block;padding:13px 20px;background:#ff3045;color:#fff;text-decoration:none;border-radius:6px">Ativar minha conta</a></p><p>O link expira em 30 minutos e só pode ser usado uma vez. Se você não esperava esta mensagem, ignore-a.</p></div>`;
  }

  try {
    await transporter.sendMail({ from, to: email, subject, html });
  } catch (error) {
    console.error("Gmail SMTP member access email failed", error instanceof Error ? error.message : "unknown_error");
    throw new Error("Unable to send member access email");
  }
}
