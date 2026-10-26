import { NextResponse } from "next/server";
import crypto from "node:crypto";
import { getCurrentMember } from "../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

function base64url(value) {
  return Buffer.from(typeof value === "string" ? value : JSON.stringify(value)).toString("base64url");
}

export async function POST(request) {
  try {
    const member = await getCurrentMember();
    if (!member) return NextResponse.json({ error: "Sua sessão expirou ou o acesso de membro não está ativo. Entre novamente na plataforma." }, { status: 401 });
    const key = process.env.LIVEKIT_API_KEY?.trim();
    const secret = process.env.LIVEKIT_API_SECRET?.trim();
    const host = process.env.NEXT_PUBLIC_LIVEKIT_URL?.trim();
    if (!key || !secret || !host) return NextResponse.json({ error: "Configuração incompleta do LiveKit na Vercel. Confira URL, API Key e API Secret." }, { status: 503 });
    if (!/^wss:\/\//i.test(host)) return NextResponse.json({ error: "A URL do LiveKit precisa começar com wss:// e pertencer ao projeto correto." }, { status: 503 });
    let body;
    try { body = await request.json(); } catch { return NextResponse.json({ error: "Requisição inválida." }, { status: 400 }); }
    const room = typeof body?.room === "string" ? body.room : "";
    if (!["sala-geral", "networking", "duvidas"].includes(room)) return NextResponse.json({ error: "Sala inválida." }, { status: 400 });
    const identity = String(member.id || "");
    if (!identity) return NextResponse.json({ error: "Não foi possível identificar sua conta de membro." }, { status: 401 });
    const now = Math.floor(Date.now() / 1000);
    const header = base64url({ alg: "HS256", typ: "JWT" });
    const payload = base64url({ iss: key, sub: identity, name: String(member.display_name || "Membro").slice(0, 80), nbf: now - 5, iat: now, exp: now + 60 * 60, video: { roomJoin: true, room, canPublish: true, canSubscribe: true, canPublishData: true } });
    const unsigned = header + "." + payload;
    const signature = crypto.createHmac("sha256", secret).update(unsigned).digest("base64url");
    return NextResponse.json({ token: unsigned + "." + signature, serverUrl: host, room, identity, name: String(member.display_name || "Membro") });
  } catch (error) {
    console.error("LiveKit token generation failed", error instanceof Error ? error.message : "unknown_error");
    return NextResponse.json({ error: "Não foi possível gerar o acesso à sala. Tente novamente; se persistir, verifique os logs da API." }, { status: 500 });
  }
}
