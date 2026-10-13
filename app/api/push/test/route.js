import { NextResponse } from "next/server";
import webpush from "web-push";
import { getCurrentMember, getDatabase } from "../../../../lib/member-auth";

export const runtime = "nodejs";

export async function POST() {
  const member = await getCurrentMember();
  if (!member) return NextResponse.json({ error: "Faça login para testar notificações." }, { status: 401 });
  const publicKey = process.env.VAPID_PUBLIC_KEY;
  const privateKey = process.env.VAPID_PRIVATE_KEY;
  if (!publicKey || !privateKey) return NextResponse.json({ error: "O servidor ainda não tem as chaves push configuradas." }, { status: 503 });
  webpush.setVapidDetails(process.env.VAPID_SUBJECT || "mailto:suporte@oclonedigital.xyz", publicKey, privateKey);
  const sql = getDatabase();
  const subscriptions = await sql`SELECT endpoint, p256dh, auth FROM member_push_subscriptions WHERE account_id = ${member.id}`;
  if (!subscriptions.length) return NextResponse.json({ error: "Este dispositivo ainda não está inscrito nas notificações." }, { status: 404 });
  const payload = JSON.stringify({ title: "O Clone Digital", body: "Tudo certo! As notificações push estão funcionando neste dispositivo.", url: "/painel", tag: "ocd-push-test" });
  const results = await Promise.allSettled(subscriptions.map(async sub => {
    try {
      await webpush.sendNotification({ endpoint: sub.endpoint, keys: { p256dh: sub.p256dh, auth: sub.auth } }, payload, { TTL: 60, urgency: "normal" });
    } catch (error) {
      if (error?.statusCode === 404 || error?.statusCode === 410) await sql`DELETE FROM member_push_subscriptions WHERE endpoint = ${sub.endpoint}`;
      throw error;
    }
  }));
  const delivered = results.filter(result => result.status === "fulfilled").length;
  if (!delivered) return NextResponse.json({ error: "O serviço push recusou a entrega. Reative as notificações neste dispositivo." }, { status: 502 });
  return NextResponse.json({ ok: true, delivered });
}
