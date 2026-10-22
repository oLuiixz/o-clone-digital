import { NextResponse } from "next/server";
import { getDatabase } from "../../../../lib/member-auth";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

export async function GET(request, { params }) {
  const { code: rawCode } = await params;
  const code = String(rawCode || "").trim().toLowerCase();
  const destination = new URL("/", request.url);
  const response = NextResponse.redirect(destination, 302);

  if (!/^[a-z0-9-]{3,40}$/.test(code)) return response;

  try {
    const sql = getDatabase();
    const rows = await sql`SELECT id FROM affiliates WHERE lower(code) = ${code} AND status = 'approved' LIMIT 1`;
    if (rows.length) {
      await sql`INSERT INTO affiliate_clicks (affiliate_id) VALUES (${rows[0].id})`;
      response.cookies.set("ocd_affiliate_ref", code, {
        httpOnly: true,
        secure: process.env.NODE_ENV === "production",
        sameSite: "lax",
        path: "/",
        maxAge: 60 * 60 * 24 * 30,
      });
    }
  } catch (error) {
    console.error("Affiliate click tracking failed", error instanceof Error ? error.message : "unknown_error");
  }

  return response;
}
