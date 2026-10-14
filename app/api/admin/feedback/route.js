import { NextResponse } from "next/server";
import { getDatabase } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";
const STATUSES = ["Recebida", "Em análise", "Planejada", "Em desenvolvimento", "Concluída", "Não planejada"];

async function ensureTable(sql) {
  await sql`CREATE TABLE IF NOT EXISTS member_feedback (
    id BIGSERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES member_accounts(id) ON DELETE CASCADE,
    category TEXT NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    context TEXT,
    status TEXT NOT NULL DEFAULT 'Recebida',
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
  )`;
}

export async function GET() {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  try {
    const sql = getDatabase();
    await ensureTable(sql);
    const feedback = await sql`SELECT f.id, f.category, f.title, f.description, f.context, f.status, f.created_at, f.updated_at,
      a.email AS member_email, a.display_name AS member_name
      FROM member_feedback f JOIN member_accounts a ON a.id = f.account_id
      ORDER BY CASE WHEN f.status = 'Recebida' THEN 0 ELSE 1 END, f.created_at DESC LIMIT 500`;
    return NextResponse.json({ feedback, statuses: STATUSES });
  } catch (error) {
    console.error("Admin feedback list failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível carregar as sugestões." }, { status: 500 });
  }
}

export async function PATCH(request) {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
  const id = Number(body?.id);
  const status = typeof body?.status === "string" ? body.status : "";
  if (!Number.isSafeInteger(id) || id < 1 || !STATUSES.includes(status)) return NextResponse.json({ error: "Informe uma solicitação e um status válido." }, { status: 400 });
  try {
    const sql = getDatabase();
    await ensureTable(sql);
    const rows = await sql`UPDATE member_feedback SET status = ${status}, updated_at = now() WHERE id = ${id} RETURNING id, status, updated_at`;
    if (!rows.length) return NextResponse.json({ error: "Sugestão não encontrada." }, { status: 404 });
    return NextResponse.json({ ok: true, feedback: rows[0] });
  } catch (error) {
    console.error("Admin feedback update failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível atualizar o status." }, { status: 500 });
  }
}
