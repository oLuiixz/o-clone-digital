import { NextResponse } from "next/server";
import { createOpaqueToken, getDatabase, hashToken, normalizeEmail, hasActiveAccess } from "../../../../lib/member-auth";
import { activationEmailContent, getActivationUrl, sendResendEmail } from "../../../../lib/resend-email";

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

  const generic = {
    message: "Se houver uma compra aprovada para esse e-mail, enviaremos um link de ativação.",
  };

  if (!process.env.RESEND_API_KEY?.trim() || !process.env.RESEND_FROM_EMAIL?.trim()) {
    console.error("Activation email is not configured in Resend.");
    return NextResponse.json(
      { error: "O envio de e-mail ainda não está configurado. Tente novamente mais tarde." },
      { status: 503 },
    );
  }

  try {
    if (!(await hasActiveAccess(email))) return NextResponse.json(generic);

    const sql = getDatabase();
    const existing = await sql`SELECT id, password_hash FROM member_accounts WHERE lower(email) = ${email} LIMIT 1`;
    if (existing.length && existing[0].password_hash) {
      return NextResponse.json({
        message: "Essa conta já foi ativada. Entre com sua senha ou use a recuperação de senha.",
      });
    }

    const token = createOpaqueToken();
    const activationUrl = getActivationUrl(token);
    const emailContent = activationEmailContent({ activationUrl });
    const tokenHash = hashToken(token);
    const expiresAt = new Date(Date.now() + 30 * 60 * 1000).toISOString();

    // Remove expired/consumed tokens so repeated requests do not grow this table forever.
    await sql`DELETE FROM member_activation_tokens WHERE expires_at <= now() OR used_at IS NOT NULL`;
    await sql`INSERT INTO member_activation_tokens (email, token_hash, expires_at)
      VALUES (${email}, ${tokenHash}, ${expiresAt})`;

    await sendResendEmail({ to: email, ...emailContent });
    return NextResponse.json(generic);
  } catch (error) {
    console.error("Activation request failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json(
      { error: "Não foi possível iniciar a ativação agora. Confira o e-mail e tente novamente." },
      { status: 500 },
    );
  }
}
