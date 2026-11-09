import { NextResponse } from "next/server";
import { getCurrentMember, getDatabase } from "../../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function POST() {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Não autenticado." }, { status: 401 });

  try {
    const sql = getDatabase();
    const lessonRows = await sql`SELECT count(*)::int AS total FROM member_lesson_progress WHERE account_id = ${member.id} AND lesson_key LIKE '0-%' OR account_id = ${member.id} AND lesson_key LIKE '1-%' OR account_id = ${member.id} AND lesson_key LIKE '2-%' OR account_id = ${member.id} AND lesson_key LIKE '3-%' OR account_id = ${member.id} AND lesson_key LIKE '4-%' OR account_id = ${member.id} AND lesson_key LIKE '5-%' OR account_id = ${member.id} AND lesson_key LIKE '6-%' OR account_id = ${member.id} AND lesson_key LIKE '7-%' AND completed = true`;
    if ((lessonRows[0]?.total || 0) < 50) return NextResponse.json({ error: "Conclua todas as 50 aulas antes de finalizar este módulo." }, { status: 409 });
    await sql`
      INSERT INTO member_module_progress (account_id, module_slug, completed, completed_at, updated_at)
      VALUES (${member.id}, 'vibe-coding', true, now(), now())
      ON CONFLICT (account_id, module_slug) DO UPDATE SET
        completed = true,
        completed_at = now(),
        updated_at = now()
    `;

    const rows = await sql`
      SELECT completed
      FROM member_module_progress
      WHERE account_id = ${member.id} AND module_slug = 'vibe-coding'
      LIMIT 1
    `;
    if (rows[0]?.completed !== true) {
      return NextResponse.json({ error: "O banco não confirmou a conclusão do módulo." }, { status: 500 });
    }

    return NextResponse.json({ ok: true, moduleCompleted: true }, {
      headers: { "Cache-Control": "no-store, max-age=0" },
    });
  } catch (error) {
    console.error("Vibe Coding module completion failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível registrar a conclusão do módulo." }, { status: 500 });
  }
}
