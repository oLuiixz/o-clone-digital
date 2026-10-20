import { NextResponse } from "next/server";
import { getDatabase, hashPassword, hashToken } from "../../../../lib/member-auth";
export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function POST(request) {
  let body;
  try { body = await request.json(); }
  catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }

  const token = typeof body?.token === "string" ? body.token : "";
  const password = typeof body?.password === "string" ? body.password : "";
  if (token.length < 32 || token.length > 200 || password.length < 10 || password.length > 128) {
    return NextResponse.json({ error: "Link inválido ou senha fora dos requisitos." }, { status: 400 });
  }

  try {
    const sql = getDatabase();
    const tokenHash = hashToken(token);
    const passwordHash = hashPassword(password);

    // Consume the token, update the password, and revoke all sessions atomically.
    // If any database operation fails, PostgreSQL rolls the entire statement back.
    const changed = await sql`
      WITH claimed AS (
        UPDATE member_password_reset_tokens
        SET used_at = now()
        WHERE token_hash = ${tokenHash}
          AND used_at IS NULL
          AND expires_at > now()
        RETURNING account_id
      ),
      updated AS (
        UPDATE member_accounts AS account
        SET password_hash = ${passwordHash}, updated_at = now()
        FROM claimed
        WHERE account.id = claimed.account_id
        RETURNING account.id
      ),
      revoked AS (
        DELETE FROM member_sessions AS session
        USING updated
        WHERE session.account_id = updated.id
        RETURNING session.account_id
      )
      SELECT id FROM updated
    `;

    if (!changed.length) {
      return NextResponse.json({ error: "Link inválido, expirado ou já utilizado. Solicite outro." }, { status: 400 });
    }
    return NextResponse.json({ ok: true, redirect: "/login" });
  } catch (error) {
    console.error("Password reset failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível redefinir a senha agora." }, { status: 500 });
  }
}
