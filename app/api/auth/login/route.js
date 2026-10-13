import { NextResponse } from "next/server";
import { createSession, getDatabase, normalizeEmail, verifyPassword, hasActiveAccess } from "../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function POST(request) {
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
  const email = normalizeEmail(body?.email);
  const password = typeof body?.password === "string" ? body.password : "";
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || email.length > 320 || !password || password.length > 128) {
    return NextResponse.json({ error: "E-mail ou senha inválidos." }, { status: 400 });
  }
  try {
    const sql = getDatabase();
    const rows = await sql`SELECT id, email, password_hash, email_verified_at FROM member_accounts
      WHERE lower(email) = ${email} LIMIT 1`;
    if (!rows.length || !rows[0].email_verified_at || !verifyPassword(password, rows[0].password_hash)) {
      return NextResponse.json({ error: "E-mail ou senha inválidos." }, { status: 401 });
    }
    if (!(await hasActiveAccess(email))) {
      return NextResponse.json({ error: "Não há uma compra ativa vinculada a este e-mail." }, { status: 403 });
    }
    await createSession(rows[0].id);
    return NextResponse.json({ ok: true, redirect: "/painel" });
  } catch (error) {
    console.error("Member login failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível entrar agora." }, { status: 500 });
  }
}
