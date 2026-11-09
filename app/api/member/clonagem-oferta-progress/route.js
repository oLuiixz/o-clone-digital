import { NextResponse } from "next/server";
import { getCurrentMember, getDatabase } from "../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const LESSON_COUNTS = [2, 3, 3, 3, 3, 3, 4];
const VALID_KEYS = new Set(LESSON_COUNTS.flatMap((count, unit) =>
  Array.from({ length: count }, (_, lesson) => `${unit}-${lesson}`)
));

function normalize(value) {
  if (!Array.isArray(value)) return null;
  return [...new Set(value.filter((key) => typeof key === "string" && VALID_KEYS.has(key)))];
}

export async function GET() {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Não autenticado." }, { status: 401 });
  try {
    const sql = getDatabase();
    const [lessons, modules] = await Promise.all([
      sql`SELECT lesson_key FROM member_lesson_progress WHERE account_id = ${member.id} AND lesson_key LIKE 'clonagem-%' AND completed = true ORDER BY lesson_key`,
      sql`SELECT completed FROM member_module_progress WHERE account_id = ${member.id} AND module_slug = 'clonagem-de-oferta' LIMIT 1`,
    ]);
    return NextResponse.json({
      completed: lessons.map((row) => row.lesson_key.replace(/^clonagem-/, "")),
      moduleCompleted: modules[0]?.completed === true,
    }, { headers: { "Cache-Control": "no-store, max-age=0" } });
  } catch (error) {
    console.error("Clonagem progress read failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível carregar o progresso da Clonagem de Oferta." }, { status: 500 });
  }
}

export async function PUT(request) {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Não autenticado." }, { status: 401 });
  let body;
  try { body = await request.json(); } catch {
    return NextResponse.json({ error: "Dados inválidos." }, { status: 400 });
  }
  const completed = normalize(body?.completed);
  if (!completed) return NextResponse.json({ error: "Lista de aulas inválida." }, { status: 400 });
  try {
    const sql = getDatabase();
    const keys = completed.map((key) => `clonagem-${key}`);
    const payload = JSON.stringify(keys);
    await sql`
      WITH requested AS (
        SELECT value AS lesson_key FROM jsonb_array_elements_text(${payload}::jsonb)
      ),
      removed AS (
        DELETE FROM member_lesson_progress existing
        WHERE existing.account_id = ${member.id}
          AND existing.lesson_key LIKE 'clonagem-%'
          AND NOT EXISTS (SELECT 1 FROM requested WHERE requested.lesson_key = existing.lesson_key)
        RETURNING lesson_key
      )
      INSERT INTO member_lesson_progress (account_id, lesson_key, completed, updated_at)
      SELECT ${member.id}, requested.lesson_key, true, now()
      FROM requested
      ON CONFLICT (account_id, lesson_key) DO UPDATE SET completed = true, updated_at = now()
    `;
    const persisted = await sql`
      SELECT lesson_key FROM member_lesson_progress
      WHERE account_id = ${member.id} AND lesson_key LIKE 'clonagem-%' AND completed = true
    `;
    const saved = persisted.map((row) => row.lesson_key.replace(/^clonagem-/, ""));
    if (saved.length !== completed.length || completed.some((key) => !saved.includes(key))) {
      return NextResponse.json({ error: "O banco não confirmou todas as aulas." }, { status: 500 });
    }
    return NextResponse.json({ ok: true, completed: saved }, { headers: { "Cache-Control": "no-store, max-age=0" } });
  } catch (error) {
    console.error("Clonagem progress save failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível salvar o progresso no servidor." }, { status: 500 });
  }
}
