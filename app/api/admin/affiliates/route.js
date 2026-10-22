import { NextResponse } from "next/server";
import { getDatabase } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET() {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  try {
    const sql = getDatabase();
    const affiliates = await sql`
      SELECT a.id, a.code, a.status, a.commission_percent, a.created_at,
             m.email, m.display_name,
             (SELECT count(*)::int FROM affiliate_clicks c WHERE c.affiliate_id = a.id) AS clicks,
             (SELECT count(*)::int FROM affiliate_commissions c WHERE c.affiliate_id = a.id AND c.status <> 'reversed') AS sales,
             (SELECT COALESCE(sum(c.commission_cents),0)::int FROM affiliate_commissions c WHERE c.affiliate_id = a.id AND c.status IN ('pending','approved','paid')) AS commission_cents
      FROM affiliates a JOIN member_accounts m ON m.id = a.account_id
      ORDER BY CASE a.status WHEN 'pending' THEN 0 WHEN 'approved' THEN 1 ELSE 2 END, a.created_at DESC
      LIMIT 500
    `;
    return NextResponse.json({ affiliates });
  } catch (error) {
    console.error("Admin affiliates load failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível carregar os afiliados." }, { status: 500 });
  }
}

export async function PATCH(request) {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
  const id = String(body?.id || "");
  const status = String(body?.status || "");
  const commission = Number(body?.commission_percent);
  if (!/^[0-9a-f-]{36}$/i.test(id)) return NextResponse.json({ error: "Afiliado inválido." }, { status: 400 });
  if (!["pending", "approved", "blocked"].includes(status)) return NextResponse.json({ error: "Status inválido." }, { status: 400 });
  if (!Number.isFinite(commission) || commission < 0 || commission > 100) return NextResponse.json({ error: "Comissão deve ficar entre 0% e 100%." }, { status: 400 });
  try {
    const sql = getDatabase();
    const rows = await sql`
      UPDATE affiliates SET status = ${status}, commission_percent = ${commission}, updated_at = now()
      WHERE id = ${id}
      RETURNING id, status, commission_percent
    `;
    if (!rows.length) return NextResponse.json({ error: "Afiliado não encontrado." }, { status: 404 });
    return NextResponse.json({ affiliate: rows[0] });
  } catch (error) {
    console.error("Admin affiliate update failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível atualizar o afiliado." }, { status: 500 });
  }
}
