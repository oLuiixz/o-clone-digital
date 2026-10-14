import { NextResponse } from "next/server";
import { getCurrentMember, getDatabase } from "../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const CATEGORIES = ["Sugestão", "Melhoria", "Nova funcionalidade", "Bug/erro"];

export async function POST(request) {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Entre na sua conta para enviar feedback." }, { status: 401 });
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
  const category = typeof body?.category === "string" ? body.category.trim() : "";
  const title = typeof body?.title === "string" ? body.title.trim() : "";
  const description = typeof body?.description === "string" ? body.description.trim() : "";
  const context = typeof body?.context === "string" ? body.context.trim() : "";
  if (!CATEGORIES.includes(category)) return NextResponse.json({ error: "Selecione uma categoria válida." }, { status: 400 });
  if (title.length < 4 || title.length > 120) return NextResponse.json({ error: "O título deve ter entre 4 e 120 caracteres." }, { status: 400 });
  if (description.length < 10 || description.length > 3000) return NextResponse.json({ error: "A descrição deve ter entre 10 e 3.000 caracteres." }, { status: 400 });
  if (context.length > 160) return NextResponse.json({ error: "O campo de contexto deve ter até 160 caracteres." }, { status: 400 });
  try {
    const sql = getDatabase();
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
    const rows = await sql`INSERT INTO member_feedback (account_id, category, title, description, context)
      VALUES (${member.id}, ${category}, ${title}, ${description}, ${context || null})
      RETURNING id, created_at`;
    return NextResponse.json({ ok: true, id: rows[0].id, createdAt: rows[0].created_at, message: "Sugestão enviada! Obrigado por ajudar a melhorar o O Clone Digital." }, { status: 201 });
  } catch (error) {
    console.error("Member feedback submission failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível enviar agora. Tente novamente em instantes." }, { status: 500 });
  }
}
