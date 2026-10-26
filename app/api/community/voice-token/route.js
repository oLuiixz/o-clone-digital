import { NextResponse } from "next/server";
import crypto from "node:crypto";
import { getCurrentMember } from "../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

function base64url(value) {
  return Buffer.from(typeof value === "string" ? value : JSON.stringify(value)).toString("base64url");
}

export async function POST(request) {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Acesso restrito aos membros ativos." }, { status: 401 });
  const key = process.env.LIVEKIT_API_KEY;
  const secret = process.env.LIVEKIT_API_SECRET;
  const host = process.env.NEXT_PUBLIC_LIVEKIT_URL;
  if (!key || !secret || !host) return NextResponse.json({ error: "Canais de voz ainda não configurados. O administrador precisa configurar o LiveKit na Vercel." }, { status: 503 });
  let body;
  try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
  const room = typeof body?.room === "string" ? body.room : "";
  if (!["sala-geral", "networking", "duvidas"].includes(room)) return NextResponse.json({ error: "Sala inválida." }, { status: 400 });
  const now = Math.floor(Date.now() / 1000);
  const header = base64url({ alg: "HS256", typ: "JWT" });
  const payload = base64url({ iss: key, sub: String(member.id), name: String(member.display_name || "Membro").slice(0, 80), nbf: now, exp: now + 60 * 60, video: { roomJoin: true, room, canPublish: true, canSubscribe: true, canPublishData: true } });
  const unsigned = header + "." + payload;
  const signature = crypto.createHmac("sha256", secret).update(unsigned).digest("base64url");
  return NextResponse.json({ token: unsigned + "." + signature, serverUrl: host, room, identity: String(member.id), name: String(member.display_name || "Membro") });
}
