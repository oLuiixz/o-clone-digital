import { NextResponse } from "next/server";
import { getCurrentMember, getDatabase } from "../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

async function ensureTable(sql) {
  await sql`CREATE TABLE IF NOT EXISTS community_messages (
    id BIGSERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES member_accounts(id) ON DELETE CASCADE,
    message TEXT NOT NULL DEFAULT '',
    media_data TEXT,
    media_type TEXT,
    media_name TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
  )`;
  await sql`CREATE INDEX IF NOT EXISTS community_messages_created_idx ON community_messages (created_at DESC)`;
  await sql`CREATE TABLE IF NOT EXISTS community_presence (account_id UUID PRIMARY KEY REFERENCES member_accounts(id) ON DELETE CASCADE, last_seen_at TIMESTAMPTZ NOT NULL DEFAULT now())`;
}

export async function GET(request) {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Acesso restrito aos membros ativos." }, { status: 401 });
  try {
    const sql = getDatabase();
    await ensureTable(sql);
    const { searchParams } = new URL(request.url);
    if (searchParams.get("members") === "1") {
      await sql`INSERT INTO community_presence (account_id, last_seen_at) VALUES (${member.id}, now()) ON CONFLICT (account_id) DO UPDATE SET last_seen_at = now()`;
      const ownerEmail = (process.env.COMMUNITY_OWNER_EMAIL || "contato@oclonedigital.xyz").trim().toLowerCase();
      const members = await sql`SELECT a.id, a.display_name, a.photo_data, p.last_seen_at, lower(a.email) = ${ownerEmail} AS is_owner
        FROM member_accounts a
        JOIN entitlements e ON lower(e.customer_email) = lower(a.email) AND e.status = 'active'
        JOIN orders o ON o.id = e.order_id AND o.status = 'approved'
        JOIN products pr ON pr.id = e.product_id AND pr.is_active = true
        LEFT JOIN community_presence p ON p.account_id = a.id
        WHERE a.email_verified_at IS NOT NULL
        GROUP BY a.id, a.display_name, a.photo_data, p.last_seen_at, a.email
        ORDER BY (lower(a.email) = ${ownerEmail}) DESC, a.display_name ASC LIMIT 200`;
      return NextResponse.json({ members: members.map(item => ({ id: item.id, display_name: item.display_name || "Membro", photo_data: item.photo_data || null, online: item.last_seen_at ? Date.now() - new Date(item.last_seen_at).getTime() < 90000 : false, tags: [item.is_owner ? "Owner" : "Membro"] })) });
    }
    const after = Number(searchParams.get("after") || 0);
    const rows = after > 0
      ? await sql`SELECT m.id, m.account_id, m.message, m.media_data, m.media_type, m.media_name, m.created_at, a.display_name, a.photo_data
          FROM community_messages m JOIN member_accounts a ON a.id = m.account_id
          WHERE m.id > ${after} ORDER BY m.id ASC LIMIT 100`
      : await sql`SELECT m.id, m.account_id, m.message, m.media_data, m.media_type, m.media_name, m.created_at, a.display_name, a.photo_data
          FROM (SELECT * FROM community_messages ORDER BY id DESC LIMIT 100) m
          JOIN member_accounts a ON a.id = m.account_id ORDER BY m.id ASC`;
    return NextResponse.json({ messages: rows.map(row => ({ ...row, media_data: row.media_data || null, photo_data: row.photo_data || null })) });
  } catch (error) {
    console.error("Community read failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível carregar a comunidade." }, { status: 500 });
  }
}

export async function POST(request) {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Acesso restrito aos membros ativos." }, { status: 401 });
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
  if (body?.action === "heartbeat") {
    try {
      const sql = getDatabase();
      await ensureTable(sql);
      await sql`INSERT INTO community_presence (account_id, last_seen_at) VALUES (${member.id}, now()) ON CONFLICT (account_id) DO UPDATE SET last_seen_at = now()`;
      return NextResponse.json({ ok: true });
    } catch (error) {
      console.error("Community presence update failed", error instanceof Error ? error.message : "unknown_error");
      return NextResponse.json({ error: "Não foi possível atualizar presença." }, { status: 500 });
    }
  }
  const message = typeof body?.message === "string" ? body.message.trim().slice(0, 2000) : "";
  const mediaData = typeof body?.mediaData === "string" ? body.mediaData : "";
  const mediaType = typeof body?.mediaType === "string" ? body.mediaType : "";
  const mediaName = typeof body?.mediaName === "string" ? body.mediaName.trim().slice(0, 120) : "";
  const allowed = ["image/jpeg", "image/png", "image/webp", "image/gif", "video/mp4", "video/webm", "audio/mpeg", "audio/mp4", "audio/ogg", "audio/webm", "audio/wav"];
  if (!message && !mediaData) return NextResponse.json({ error: "Escreva uma mensagem ou anexe um arquivo." }, { status: 400 });
  if (mediaData) {
    if (!allowed.includes(mediaType) || !new RegExp("^data:" + mediaType.replace(/[.*+?^${}()|[\]\\]/g, "\\$&") + ";base64,[A-Za-z0-9+/=]+$").test(mediaData)) {
      return NextResponse.json({ error: "Formato de arquivo não permitido." }, { status: 400 });
    }
    if (mediaData.length > 1_650_000) return NextResponse.json({ error: "Por enquanto, cada arquivo pode ter até 1,2 MB." }, { status: 413 });
  }
  try {
    const sql = getDatabase();
    await ensureTable(sql);
    const rows = await sql`INSERT INTO community_messages (account_id, message, media_data, media_type, media_name)
      VALUES (${member.id}, ${message}, ${mediaData || null}, ${mediaData ? mediaType : null}, ${mediaData ? mediaName : null})
      RETURNING id, account_id, message, media_data, media_type, media_name, created_at`;
    return NextResponse.json({ ok: true, message: { ...rows[0], display_name: member.display_name || "Membro", photo_data: member.photo_data || null } }, { status: 201 });
  } catch (error) {
    console.error("Community post failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível publicar. Tente novamente." }, { status: 500 });
  }
}
