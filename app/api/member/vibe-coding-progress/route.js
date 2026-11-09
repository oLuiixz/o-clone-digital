import { NextResponse } from "next/server";
import { getCurrentMember, getDatabase } from "../../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

// Keep this map aligned with the lesson arrays in VibeCodingClient.js.
const LESSON_COUNTS = [1, 4, 4, 3, 4, 4, 5, 4, 4, 4, 5, 8];
const TOTAL_LESSONS = LESSON_COUNTS.reduce((sum, count) => sum + count, 0);
const VALID_LESSON_KEYS = new Set(
  LESSON_COUNTS.flatMap((count, moduleIndex) =>
    Array.from({ length: count }, (_, lessonIndex) => `${moduleIndex}-${lessonIndex}`)
  )
);

function normalizeCompleted(value) {
  if (!Array.isArray(value)) return null;
  return [...new Set(value.filter((key) => typeof key === "string" && VALID_LESSON_KEYS.has(key)))];
}

export async function GET() {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Não autenticado." }, { status: 401 });

  try {
    const sql = getDatabase();
    const rows = await sql`
      SELECT lesson_key
      FROM member_lesson_progress
      WHERE account_id = ${member.id} AND completed = true
      ORDER BY lesson_key
    `;
    return NextResponse.json({ completed: rows.map((row) => row.lesson_key) }, {
      headers: { "Cache-Control": "no-store, max-age=0" },
    });
  } catch (error) {
    console.error("Vibe Coding progress read failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível carregar seu progresso. Verifique a migração de progresso das aulas." }, { status: 500 });
  }
}

export async function PUT(request) {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Não autenticado." }, { status: 401 });

  let body;
  try { body = await request.json(); } catch {
    return NextResponse.json({ error: "Dados inválidos." }, { status: 400 });
  }

  const completed = normalizeCompleted(body?.completed);
  if (!completed) return NextResponse.json({ error: "Lista de aulas inválida." }, { status: 400 });

  try {
    const sql = getDatabase();
    const payload = JSON.stringify(completed);
    await sql`
      WITH requested AS (
        SELECT value AS lesson_key
        FROM jsonb_array_elements_text(${payload}::jsonb)
      ),
      removed AS (
        DELETE FROM member_lesson_progress existing
        WHERE existing.account_id = ${member.id}
          AND NOT EXISTS (
            SELECT 1 FROM requested
            WHERE requested.lesson_key = existing.lesson_key
          )
        RETURNING lesson_key
      )
      INSERT INTO member_lesson_progress (account_id, lesson_key, completed, updated_at)
      SELECT ${member.id}, requested.lesson_key, true, now()
      FROM requested
      ON CONFLICT (account_id, lesson_key) DO UPDATE SET
        completed = true,
        updated_at = now()
    `;

    const allLessonsCompleted = completed.length === TOTAL_LESSONS;
    await sql`
      INSERT INTO member_module_progress (account_id, module_slug, completed, completed_at, updated_at)
      VALUES (
        ${member.id},
        'vibe-coding',
        ${allLessonsCompleted},
        CASE WHEN ${allLessonsCompleted} THEN now() ELSE NULL END,
        now()
      )
      ON CONFLICT (account_id, module_slug) DO UPDATE SET
        completed = EXCLUDED.completed,
        completed_at = EXCLUDED.completed_at,
        updated_at = now()
    `;

    const persisted = await sql`
      SELECT lesson_key
      FROM member_lesson_progress
      WHERE account_id = ${member.id} AND completed = true
      ORDER BY lesson_key
    `;
    const persistedKeys = persisted.map((row) => row.lesson_key);
    if (persistedKeys.length !== completed.length || completed.some((key) => !persistedKeys.includes(key))) {
      return NextResponse.json({ error: "O banco não confirmou todas as conclusões. Tente novamente." }, { status: 500 });
    }

    return NextResponse.json({
      ok: true,
      completed: persistedKeys,
      completedCount: persistedKeys.length,
      totalLessons: TOTAL_LESSONS,
      moduleCompleted: allLessonsCompleted,
    }, { headers: { "Cache-Control": "no-store, max-age=0" } });
  } catch (error) {
    console.error("Vibe Coding progress save failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível salvar seu progresso. Verifique se a migração de progresso das aulas foi aplicada." }, { status: 500 });
  }
}
