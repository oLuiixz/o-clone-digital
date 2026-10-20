import { NextResponse } from "next/server";
import { createOpaqueToken, getDatabase, hashToken, normalizeEmail } from "../../../../lib/member-auth";
import { activationEmailContent, sendResendEmail } from "../../../../lib/resend-email";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function POST(request) {
  let body;
  try { body = await request.json(); }
  catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }

  const email = normalizeEmail(body?.email);
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || email.length > 320) {
    return NextResponse.json({ error: "Informe um e-mail válido." }, { status: 400 });
  }

  const generic = { message: "Se houver uma conta ativa com esse e-mail, enviaremos instruções para redefinir a senha." };
  if (!process.env.RESEND_API_KEY?.trim() || !process.env.RESEND_FROM_EMAIL?.trim()) {
    return NextResponse.json({ error: "O envio de e-mail não está configurado no momento." }, { status: 503 });
  }

  // Validate URL configuration before creating any token in the database.
  const base = process.env.NEXT_PUBLIC_APP_URL?.trim();
  if (!base) {
    console.error("Password reset request failed: NEXT_PUBLIC_APP_URL is not configured.");
    return NextResponse.json({ error: "A recuperação está temporariamente indisponível." }, { status: 503 });
  }

  let url;
  try {
    const configuredUrl = new URL(base);
    const isLocalDevelopment = process.env.NODE_ENV !== "production" &&
      configuredUrl.protocol === "http:" &&
      ["localhost", "127.0.0.1"].includes(configuredUrl.hostname);
    if ((configuredUrl.protocol !== "https:" && !isLocalDevelopment) ||
        configuredUrl.username || configuredUrl.password) {
      throw new Error("Unsafe application URL");
    }
    url = new URL("/redefinir-senha", configuredUrl.origin);
  } catch {
    console.error("Password reset request failed: NEXT_PUBLIC_APP_URL must be a valid HTTPS URL.");
    return NextResponse.json({ error: "A recuperação está temporariamente indisponível." }, { status: 503 });
  }

  try {
    const sql = getDatabase();
    const accounts = await sql`SELECT id FROM member_accounts WHERE lower(email) = ${email} AND password_hash IS NOT NULL AND email_verified_at IS NOT NULL LIMIT 1`;
    if (!accounts.length) return NextResponse.json(generic);

    const token = createOpaqueToken();
    url.searchParams.set("token", token);
    const content = activationEmailContent({ activationUrl: url.toString() });
    const expiresAt = new Date(Date.now() + 30 * 60 * 1000).toISOString();

    // Remove expired/consumed tokens so repeated requests do not grow this table forever.
    await sql`DELETE FROM member_password_reset_tokens WHERE expires_at <= now() OR used_at IS NOT NULL`;
    await sql`INSERT INTO member_password_reset_tokens (account_id, token_hash, expires_at)
      VALUES (${accounts[0].id}, ${hashToken(token)}, ${expiresAt})`;

    await sendResendEmail({
      to: email,
      ...content,
      subject: "Redefina sua senha do O Clone Digital",
      text: `Use este link para redefinir sua senha: ${url}\n\nO link expira em 30 minutos e só pode ser usado uma vez.`,
    });
    return NextResponse.json(generic);
  } catch (error) {
    console.error("Password reset request failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível iniciar a recuperação agora." }, { status: 500 });
  }
}
