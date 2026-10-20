import { NextResponse } from "next/server";
import { createSession, getDatabase, hashPassword, hashToken, normalizeEmail } from "../../../../lib/member-auth";

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
    const emailHash = hashToken(token);
    const passwordHash = hashPassword(password);
    // Validate purchase, claim the one-time token, and create the account in one
    // PostgreSQL statement. A failed validation cannot burn the activation token.
    const accounts = await sql`
      WITH eligible AS (
        SELECT t.id, t.email,
          (SELECT NULLIF(trim(o.metadata->>'customer_name'), '')
           FROM orders o
           WHERE lower(o.customer_email) = lower(t.email) AND o.status = 'approved'
           ORDER BY o.approved_at DESC NULLS LAST, o.created_at DESC
           LIMIT 1) AS purchase_name
        FROM member_activation_tokens t
        WHERE t.token_hash = ${emailHash}
          AND t.used_at IS NULL
          AND t.expires_at > now()
          AND EXISTS (
            SELECT 1 FROM entitlements e
            JOIN products p ON p.id = e.product_id AND p.is_active = true
            JOIN orders o ON o.id = e.order_id AND o.status = 'approved'
            WHERE lower(e.customer_email) = lower(t.email) AND e.status = 'active'
          )
          AND NOT EXISTS (
            SELECT 1 FROM member_accounts a
            WHERE lower(a.email) = lower(t.email) AND a.password_hash IS NOT NULL
          )
        FOR UPDATE OF t
      ),
      claimed AS (
        UPDATE member_activation_tokens t
        SET used_at = now()
        FROM eligible e
        WHERE t.id = e.id AND t.used_at IS NULL AND t.expires_at > now()
        RETURNING lower(e.email) AS email, e.purchase_name
      ),
      account AS (
        INSERT INTO member_accounts (email, display_name, password_hash, email_verified_at, updated_at)
        SELECT email, purchase_name, ${passwordHash}, now(), now()
        FROM claimed
        ON CONFLICT (email) DO UPDATE SET
          password_hash = EXCLUDED.password_hash,
          display_name = CASE
            WHEN (member_accounts.display_name IS NULL OR trim(member_accounts.display_name) = ''
              OR lower(trim(member_accounts.display_name)) = 'minha jornada')
              AND EXCLUDED.display_name IS NOT NULL
            THEN EXCLUDED.display_name ELSE member_accounts.display_name END,
          email_verified_at = COALESCE(member_accounts.email_verified_at, now()),
          updated_at = now()
        WHERE member_accounts.password_hash IS NULL
        RETURNING id
      )
      SELECT id FROM account
    `;
    if (!accounts.length) {
      return NextResponse.json({ error: "Link inválido, expirado ou já utilizado, ou não encontramos uma compra aprovada ativa para esse e-mail. Solicite um novo link se necessário." }, { status: 400 });
    }
    await createSession(accounts[0].id);
    return NextResponse.json({ ok: true, redirect: "/painel" });
  } catch (error) {
    console.error("Member activation failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível ativar a conta agora." }, { status: 500 });
  }
}
