import { getDatabase, createOpaqueToken, hashToken, normalizeEmail, getAppBaseUrl } from "./member-auth";
import { activationEmailContent, sendResendEmail } from "./resend-email";

export async function sendMemberAccessEmail(rawEmail) {
  const email = normalizeEmail(rawEmail);
  if (!email) throw new Error("Activation email recipient is invalid");

  const sql = getDatabase();
  const accounts = await sql`SELECT password_hash FROM member_accounts WHERE lower(email) = ${email} LIMIT 1`;
  const baseUrl = getAppBaseUrl();
  if (!baseUrl) throw new Error("NEXT_PUBLIC_APP_URL não configurada.");

  let activationUrl = new URL("/login", baseUrl).toString();
  let subject = "Seu acesso ao O Clone Digital está liberado";
  let text = "Sua compra foi confirmada. Entre na área do aluno com a senha que você já cadastrou: " + activationUrl;
  let html = `<div style="font-family:Arial,sans-serif;max-width:560px;margin:auto;color:#171717"><h1>Compra confirmada!</h1><p>Seu acesso ao O Clone Digital está liberado.</p><p><a href="${activationUrl}" style="display:inline-block;padding:13px 20px;background:#ff3045;color:#fff;text-decoration:none;border-radius:6px">Entrar na área do aluno</a></p><p>Entre com a senha que você já cadastrou.</p></div>`;

  if (!accounts.length || !accounts[0].password_hash) {
    const token = createOpaqueToken();
    const tokenHash = hashToken(token);
    const expiresAt = new Date(Date.now() + 30 * 60 * 1000).toISOString();
    await sql`INSERT INTO member_activation_tokens (email, token_hash, expires_at)
      VALUES (${email}, ${tokenHash}, ${expiresAt})`;
    const url = new URL("/ativar", baseUrl);
    url.searchParams.set("token", token);
    activationUrl = url.toString();
    const content = activationEmailContent({ activationUrl });
    subject = content.subject;
    text = content.text;
    html = content.html;
  }
  await sendResendEmail({ to: email, subject, text, html });
}
