import { NextResponse } from "next/server";
import { getDatabase } from "../../../lib/member-auth";

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
  try {
    const sql = getDatabase();
    const rows = await sql`SELECT video_url, updated_at FROM live_stream_settings WHERE id = true LIMIT 1`;
    const videoUrl = rows[0]?.video_url || process.env.NEXT_PUBLIC_YOUTUBE_LIVE_ID || "";
    return NextResponse.json({ videoId: getYoutubeId(videoUrl), updatedAt: rows[0]?.updated_at || null });
  } catch (error) {
    console.error("Live settings load failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ videoId: getYoutubeId(process.env.NEXT_PUBLIC_YOUTUBE_LIVE_ID || "") });
  }
}
