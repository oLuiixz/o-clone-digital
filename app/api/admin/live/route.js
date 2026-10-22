import { NextResponse } from "next/server";
import { getDatabase } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";
import webpush from "web-push";
import { sendResendEmail } from "../../../../lib/resend-email";


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
    const current = await sql`SELECT video_url FROM live_stream_settings WHERE id = true LIMIT 1`;
    const wasLive = Boolean(current[0]?.video_url);
    const rows = await sql`INSERT INTO live_stream_settings (id, video_url, updated_at)
      VALUES (true, ${videoUrl}, now())
      ON CONFLICT (id) DO UPDATE SET video_url = EXCLUDED.video_url, updated_at = now()
      RETURNING video_url, updated_at`;
    const isLive = Boolean(videoUrl);
    if (isLive && !wasLive) {
      try {
        const members = await sql`SELECT id, email, display_name FROM member_accounts WHERE email IS NOT NULL AND email <> ''`;
        const title = "A transmissão ao vivo começou!";
        const textBody = "A live do O Clone Digital já começou. Entre agora para acompanhar a transmissão.";
        const target = "https://oclonedigital.xyz/ao-vivo";
        if (process.env.RESEND_API_KEY && process.env.RESEND_FROM_EMAIL) {
          const esc = value => String(value ?? "").replace(/[&<>"']/g, ch => ({ "&":"&amp;", "<":"&lt;", ">":"&gt;", '"':"&quot;", "'":"&#39;" }[ch]));
          await Promise.allSettled(members.filter(m => m.email).map(m => sendResendEmail({ to: m.email, subject: title, text: textBody + " " + target, html: `<div style="font-family:Arial,sans-serif;background:#15151b;color:#f4f4f5;padding:28px;border-radius:12px"><h1>${title}</h1><p>Olá ${esc(m.display_name || "aluno")},</p><p>${textBody}</p><a href="${target}" style="color:white;background:#ff3045;padding:12px 18px;border-radius:8px;text-decoration:none">Assistir à live</a></div>` }))));
        }
        if (process.env.VAPID_PUBLIC_KEY && process.env.VAPID_PRIVATE_KEY && process.env.VAPID_SUBJECT) {
          webpush.setVapidDetails(process.env.VAPID_SUBJECT, process.env.VAPID_PUBLIC_KEY, process.env.VAPID_PRIVATE_KEY);
          const subs = await sql`SELECT s.endpoint, s.p256dh, s.auth FROM member_push_subscriptions s`;
          await Promise.allSettled(subs.map(sub => webpush.sendNotification({ endpoint: sub.endpoint, keys: { p256dh: sub.p256dh, auth: sub.auth } }, JSON.stringify({ title, body: textBody, url: "/ao-vivo", tag: "live-started" }))));
        }
      } catch (notifyError) {
        console.error("Live start notifications failed", notifyError instanceof Error ? notifyError.message : "unknown_error");
      }
    }
    return NextResponse.json({ settings: rows[0], notificationsTriggered: isLive && !wasLive });
  } catch (error) {
    console.error("Live settings save failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível salvar a configuração da live." }, { status: 500 });
  }
}
