import { NextResponse } from "next/server";
import { createSession, getDatabase, hashPassword, hashToken, normalizeEmail, hasActiveAccess } from "../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function POST(request) {
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
  const token = typeof body?.token === "string" ? body.token : "";
  const password = typeof body?.password === "string" ? body.password : "";
  if (token.length < 32 || token.length > 200 || password.length < 10 || password.length > 128) {
    return NextResponse.json({ error: "Use o link recebido por e-mail e uma senha de 10 a 128 caracteres." }, { status: 400 });
  }

  try {
    const sql = getDatabase();
    // Claim the token atomically so two concurrent requests cannot reuse it.
    const claimed = await sql`UPDATE member_activation_tokens
      SET used_at = now()
      WHERE token_hash = ${hashToken(token)} AND used_at IS NULL AND expires_at > now()
      RETURNING id, email`;
    if (!claimed.length) return NextResponse.json({ error: "Link inválido, expirado ou já utilizado. Solicite um novo." }, { status: 400 });
    const activation = claimed[0];
    const email = normalizeEmail(activation.email);
    if (!(await hasActiveAccess(email))) return NextResponse.json({ error: "Não encontramos uma compra aprovada ativa para esse e-mail." }, { status: 403 });

    const passwordHash = hashPassword(password);
    const accounts = await sql`INSERT INTO member_accounts (email, password_hash, email_verified_at, updated_at)
      VALUES (${email}, ${passwordHash}, now(), now())
      ON CONFLICT (email) DO UPDATE SET password_hash = EXCLUDED.password_hash,
        email_verified_at = COALESCE(member_accounts.email_verified_at, now()), updated_at = now()
      RETURNING id`;
    await createSession(accounts[0].id);
    return NextResponse.json({ ok: true, redirect: "/painel" });
  } catch (error) {
    console.error("Member activation failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível ativar a conta agora." }, { status: 500 });
  }
}
