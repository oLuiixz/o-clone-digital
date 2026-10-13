import { NextResponse } from "next/server";
export const runtime = "nodejs";
export const dynamic = "force-dynamic";

// Cakto integration retired. No events from this provider may change orders or entitlements.
export async function GET() {
  return NextResponse.json({ error: "Integração Cakto desativada. Utilize a SyncPay." }, { status: 410 });
}
export async function POST() {
  return NextResponse.json({ error: "Integração Cakto desativada. Utilize a SyncPay." }, { status: 410 });
}
