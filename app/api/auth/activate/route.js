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
    // Check eligibility before consuming the one-time token. A token must remain
    // usable if the associated purchase has no active access yet.
    const candidates = await sql`SELECT id, email FROM member_activation_tokens
      WHERE token_hash = ${hashToken(token)} AND used_at IS NULL AND expires_at > now()
      LIMIT 1`;
    if (!candidates.length) return NextResponse.json({ error: "Link inválido, expirado ou já utilizado. Solicite um novo." }, { status: 400 });
    const activation = candidates[0];
    const email = normalizeEmail(activation.email);
    if (!(await hasActiveAccess(email))) return NextResponse.json({ error: "Não encontramos uma compra aprovada ativa para esse e-mail." }, { status: 403 });

    // Claim atomically after eligibility validation so concurrent requests cannot
    // reuse the same token.
    const claimed = await sql`UPDATE member_activation_tokens
      SET used_at = now()
      WHERE id = ${activation.id} AND used_at IS NULL AND expires_at > now()
      RETURNING id`;
    if (!claimed.length) return NextResponse.json({ error: "Link inválido, expirado ou já utilizado. Solicite um novo." }, { status: 400 });

    const purchaseNames = await sql`SELECT NULLIF(trim(metadata->>'customer_name'), '') AS customer_name
      FROM orders WHERE lower(customer_email) = ${email} AND status = 'approved'
      ORDER BY approved_at DESC NULLS LAST, created_at DESC LIMIT 1`;
    const purchaseName = purchaseNames[0]?.customer_name?.trim().slice(0, 120) || null;
    const passwordHash = hashPassword(password);
    const accounts = await sql`INSERT INTO member_accounts (email, display_name, password_hash, email_verified_at, updated_at)
      VALUES (${email}, ${purchaseName}, ${passwordHash}, now(), now())
      ON CONFLICT (email) DO UPDATE SET password_hash = EXCLUDED.password_hash,
        display_name = CASE WHEN (member_accounts.display_name IS NULL OR trim(member_accounts.display_name) = '' OR lower(trim(member_accounts.display_name)) = 'minha jornada') AND ${purchaseName} IS NOT NULL THEN ${purchaseName} ELSE member_accounts.display_name END,
        email_verified_at = COALESCE(member_accounts.email_verified_at, now()), updated_at = now()
      RETURNING id`;
    await createSession(accounts[0].id);
    return NextResponse.json({ ok: true, redirect: "/painel" });
  } catch (error) {
    console.error("Member activation failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível ativar a conta agora." }, { status: 500 });
  }
}
