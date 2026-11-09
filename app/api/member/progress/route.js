import { NextResponse } from "next/server";
import { getCurrentMember, getDatabase } from "../../../../lib/member-auth";

export const runtime = "nodejs";

const MODULE_SLUGS = [
  "entendendo-o-processo",
  "mineracao-de-ofertas",
  "analise-da-oferta",
  "estrutura-e-produto",
  "pagina-de-vendas-e-vsl",
  "primeiro-anuncio",
  "integracao-e-entrega",
  "subindo-caixa",
  "nicho-hot",
  "clonagem-de-oferta",
  "vibe-coding",
  "revenda-streaming",
  "dinheiro-facebook",
  "dinheiro-tiktok",
  "ecommerce",
  "estrutura-dark",
];

function validSlugs(value) {
  return Array.isArray(value)
    ? [...new Set(value.filter((slug) => typeof slug === "string" && MODULE_SLUGS.includes(slug)))]
    : null;
}

export async function GET() {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Não autenticado." }, { status: 401 });

  try {
    const sql = getDatabase();
    const [progress, sync] = await Promise.all([
      sql`SELECT module_slug FROM member_module_progress WHERE account_id = ${member.id} AND completed = true`,
      sql`SELECT 1 FROM member_progress_sync WHERE account_id = ${member.id} LIMIT 1`,
    ]);
    return NextResponse.json({
      completed: progress.map((row) => row.module_slug),
      legacyImported: sync.length > 0,
    });
  } catch (error) {
    console.error("Member progress read failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível carregar seu progresso." }, { status: 500 });
  }
}

export async function PUT(request) {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Não autenticado." }, { status: 401 });

  let body;
  try { body = await request.json(); } catch {
    return NextResponse.json({ error: "Dados inválidos." }, { status: 400 });
  }

  const slugs = validSlugs(body?.completed);
  if (!slugs) return NextResponse.json({ error: "Lista de progresso inválida." }, { status: 400 });

  try {
    const sql = getDatabase();

    if (body.legacyImport === true) {
      const payload = JSON.stringify(slugs);
      const result = await sql`
        WITH claimed AS (
          INSERT INTO member_progress_sync (account_id)
          VALUES (${member.id})
          ON CONFLICT (account_id) DO NOTHING
          RETURNING account_id
        ),
        imported AS (
          INSERT INTO member_module_progress (account_id, module_slug, completed, completed_at, updated_at)
          SELECT ${member.id}, item.module_slug, true, now(), now()
          FROM claimed
          CROSS JOIN LATERAL jsonb_array_elements_text(${payload}::jsonb) AS item(module_slug)
          WHERE NOT EXISTS (
            SELECT 1 FROM member_module_progress existing
            WHERE existing.account_id = ${member.id}
          )
          ON CONFLICT (account_id, module_slug) DO NOTHING
          RETURNING module_slug
        )
        SELECT (SELECT count(*) FROM claimed)::int AS claimed,
               (SELECT count(*) FROM imported)::int AS imported
      `;
      return NextResponse.json({ ok: true, legacyImport: true, imported: Number(result[0]?.imported || 0) });
    }

    const payload = JSON.stringify(MODULE_SLUGS.map((module_slug) => ({
      module_slug,
      completed: slugs.includes(module_slug),
    })));

    await sql`
      INSERT INTO member_module_progress (account_id, module_slug, completed, completed_at, updated_at)
      SELECT ${member.id}, item.module_slug, item.completed,
             CASE WHEN item.completed THEN now() ELSE NULL END,
             now()
      FROM jsonb_to_recordset(${payload}::jsonb) AS item(module_slug text, completed boolean)
      ON CONFLICT (account_id, module_slug) DO UPDATE SET
        completed = EXCLUDED.completed,
        completed_at = EXCLUDED.completed_at,
        updated_at = now()
    `;

    return NextResponse.json({ ok: true, completed: slugs });
  } catch (error) {
    console.error("Member progress save failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível salvar seu progresso." }, { status: 500 });
  }
}
