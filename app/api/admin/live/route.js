import { NextResponse } from "next/server";
import { getDatabase } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

function getYoutubeId(value) {
  const raw = String(value || "").trim();
  if (/^[a-zA-Z0-9_-]{11}$/.test(raw)) return raw;
  try {
    const url = new URL(raw);
    if (url.hostname === "youtu.be") {
      const id = url.pathname.split("/").filter(Boolean)[0];
      return /^[a-zA-Z0-9_-]{11}$/.test(id || "") ? id : "";
    }
    if (url.hostname === "youtube.com" || url.hostname.endsWith(".youtube.com")) {
      const v = url.searchParams.get("v");
      if (/^[a-zA-Z0-9_-]{11}$/.test(v || "")) return v;
      const parts = url.pathname.split("/").filter(Boolean);
      const marker = parts.findIndex((part) => ["live", "embed", "shorts"].includes(part));
      const id = marker >= 0 ? parts[marker + 1] : "";
      return /^[a-zA-Z0-9_-]{11}$/.test(id || "") ? id : "";
    }
  } catch {}
  return "";
}

export async function GET() {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  try {
    const sql = getDatabase();
    const rows = await sql`SELECT video_url, updated_at FROM live_stream_settings WHERE id = true LIMIT 1`;
    return NextResponse.json({ video_url: rows[0]?.video_url || "", updated_at: rows[0]?.updated_at || null });
  } catch {
    return NextResponse.json({ error: "Não foi possível carregar a configuração da live." }, { status: 500 });
  }
}

export async function PUT(request) {
  if (!(await isAdminRequest())) return NextResponse.json({ error: "Não autorizado." }, { status: 401 });
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Dados inválidos." }, { status: 400 }); }
  const videoUrl = String(body?.video_url || "").trim();
  if (videoUrl && !getYoutubeId(videoUrl)) return NextResponse.json({ error: "Informe um link válido do YouTube Live ou o ID do vídeo." }, { status: 400 });
  if (videoUrl.length > 500) return NextResponse.json({ error: "O link é muito longo." }, { status: 400 });
  try {
    const sql = getDatabase();
    const rows = await sql`INSERT INTO live_stream_settings (id, video_url, updated_at)
      VALUES (true, ${videoUrl}, now())
      ON CONFLICT (id) DO UPDATE SET video_url = EXCLUDED.video_url, updated_at = now()
      RETURNING video_url, updated_at`;
    return NextResponse.json({ settings: rows[0] });
  } catch (error) {
    console.error("Live settings save failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível salvar a configuração da live." }, { status: 500 });
  }
}
