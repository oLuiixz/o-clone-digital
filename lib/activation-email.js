import { getDatabase, createOpaqueToken, hashToken, normalizeEmail, getAppBaseUrl } from "./member-auth";
import { activationEmailContent, memberAccessEmailContent, sendResendEmail } from "./resend-email";

export async function sendMemberAccessEmail(rawEmail) {
  const email = normalizeEmail(rawEmail);
  if (!email) throw new Error("Activation email recipient is invalid");

  const sql = getDatabase();
  const accounts = await sql`SELECT password_hash FROM member_accounts WHERE lower(email) = ${email} LIMIT 1`;
  const baseUrl = getAppBaseUrl();
  if (!baseUrl) throw new Error("NEXT_PUBLIC_APP_URL não configurada.");

  let activationUrl = new URL("/login", baseUrl).toString();
  let content = memberAccessEmailContent({ activationUrl });

  if (!accounts.length || !accounts[0].password_hash) {
    const token = createOpaqueToken();
    const tokenHash = hashToken(token);
    const expiresAt = new Date(Date.now() + 30 * 60 * 1000).toISOString();
    await sql`INSERT INTO member_activation_tokens (email, token_hash, expires_at)
      VALUES (${email}, ${tokenHash}, ${expiresAt})`;
    const url = new URL("/ativar", baseUrl);
    url.searchParams.set("token", token);
    activationUrl = url.toString();
    content = activationEmailContent({ activationUrl });
  }

  await sendResendEmail({ to: email, ...content });
}
