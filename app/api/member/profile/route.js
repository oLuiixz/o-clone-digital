import { NextResponse } from "next/server";
import { getCurrentMember, getDatabase } from "../../../../lib/member-auth";

export const runtime = "nodejs";

export async function GET() {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Não autenticado." }, { status: 401 });
  const sql = getDatabase();
  const rows = await sql`SELECT display_name, photo_data, preferred_theme, accent_color FROM member_accounts WHERE id = ${member.id} LIMIT 1`;
  const profile = rows[0];
  return NextResponse.json({ name: profile?.display_name || "Minha jornada", photo: profile?.photo_data || "", theme: profile?.preferred_theme || "dark", accent: profile?.accent_color || "#ff3045" });
}

export async function PUT(request) {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Não autenticado." }, { status: 401 });
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Dados inválidos." }, { status: 400 }); }
  const name = typeof body.name === "string" ? body.name.trim().slice(0, 60) : "Minha jornada";
  const photo = typeof body.photo === "string" ? body.photo : "";
  const theme = body.theme === "light" ? "light" : "dark";
  const accent = /^#[0-9a-fA-F]{6}$/.test(body.accent || "") ? body.accent : "#ff3045";
  if (name.length < 1) return NextResponse.json({ error: "Informe um nome." }, { status: 400 });
  if (photo && (!/^data:image\/(png|jpeg|webp|gif);base64,[A-Za-z0-9+/=]+$/.test(photo) || photo.length > 2_900_000)) {
    return NextResponse.json({ error: "Imagem inválida ou maior que o limite permitido de 2 MB." }, { status: 400 });
  }
  const sql = getDatabase();
  await sql`UPDATE member_accounts SET display_name = ${name}, photo_data = ${photo || null}, preferred_theme = ${theme}, accent_color = ${accent}, updated_at = now() WHERE id = ${member.id}`;
  return NextResponse.json({ ok: true, name, photo, theme, accent });
}
