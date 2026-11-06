import crypto from "node:crypto";
import { NextResponse } from "next/server";
import { getCurrentMember, getDatabase, hasActiveAccess } from "../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

function makeCode(name, email) {
  const base = String(name || email.split("@")[0] || "afiliado")
    .normalize("NFD").replace(/[\u0300-\u036f]/g, "")
    .toLowerCase().replace(/[^a-z0-9]/g, "").slice(0, 12) || "afiliado";
  return base + "-" + crypto.randomUUID().replace(/-/g, "").slice(0, 6);
}

export async function GET() {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Entre na plataforma para continuar." }, { status: 401 });
  if (!(await hasActiveAccess(member.email))) return NextResponse.json({ error: "É necessário ter uma compra ativa." }, { status: 403 });
  try {
    const sql = getDatabase();
    const rows = await sql`SELECT id, code, status, commission_percent, syncpay_recipient_id, created_at FROM affiliates WHERE account_id = ${member.id} LIMIT 1`;
    if (!rows.length) return NextResponse.json({ affiliate: null, eligible: true });
    const affiliate = rows[0];
    const counts = await sql`
      SELECT
        (SELECT count(*)::int FROM affiliate_clicks WHERE affiliate_id = ${affiliate.id}) AS clicks,
        (SELECT count(*)::int FROM affiliate_commissions WHERE affiliate_id = ${affiliate.id} AND status <> 'reversed') AS sales,
        (SELECT COALESCE(sum(commission_cents),0)::int FROM affiliate_commissions WHERE affiliate_id = ${affiliate.id} AND status IN ('pending','approved','paid')) AS commission_cents,
        (SELECT COALESCE(sum(commission_cents),0)::int FROM affiliate_commissions WHERE affiliate_id = ${affiliate.id} AND status = 'paid') AS paid_cents
    `;
    return NextResponse.json({ affiliate, stats: counts[0], eligible: true });
  } catch (error) {
    console.error("Affiliate dashboard failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Programa de afiliados ainda precisa da migração 004 no Neon." }, { status: 503 });
  }
}

export async function POST(request) {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Entre na plataforma para continuar." }, { status: 401 });
  if (!(await hasActiveAccess(member.email))) return NextResponse.json({ error: "Somente compradores com acesso ativo podem solicitar afiliação." }, { status: 403 });
  let body; try { body = await request.json(); } catch { return NextResponse.json({ error: "Informe o identificador da conta SyncPay." }, { status: 400 }); }
  const recipientId = String(body?.syncpay_recipient_id || "").trim();
  if (!/^[a-zA-Z0-9_-]{3,120}$/.test(recipientId)) return NextResponse.json({ error: "Informe um identificador SyncPay válido." }, { status: 400 });
  try {
    const sql = getDatabase();
    const existing = await sql`SELECT id, status, code FROM affiliates WHERE account_id = ${member.id} LIMIT 1`;
    if (existing.length) {
      const updated = await sql`UPDATE affiliates SET syncpay_recipient_id = ${recipientId}, updated_at = now() WHERE account_id = ${member.id} RETURNING id, code, status, commission_percent, syncpay_recipient_id, created_at`;
      return NextResponse.json({ affiliate: updated[0], message: "Identificador SyncPay salvo. A solicitação segue sujeita à validação administrativa." });
    }
    const code = makeCode(member.display_name, member.email);
    const rows = await sql`
      INSERT INTO affiliates (account_id, code, status, commission_percent, syncpay_recipient_id)
      VALUES (${member.id}, ${code}, 'pending', 40, ${recipientId})
      ON CONFLICT (account_id) DO UPDATE SET syncpay_recipient_id = EXCLUDED.syncpay_recipient_id, updated_at = now()
      RETURNING id, code, status, commission_percent, syncpay_recipient_id, created_at
    `;
    return NextResponse.json({ affiliate: rows[0], message: "Solicitação enviada para análise." }, { status: 201 });
  } catch (error) {
    console.error("Affiliate application failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Programa de afiliados ainda precisa da migração 004 no Neon." }, { status: 503 });
  }
}
