import { verifyAuthentication, jsonError } from "../../../../../lib/passkeys";
export const runtime = "nodejs";
export async function POST(request) {
  try {
    const body = await request.json();
    if (!body.email || !body.response) return jsonError("Informe o e-mail e a resposta da chave.");
    await verifyAuthentication(body.email, body.response);
    return Response.json({ ok: true, redirect: "/painel" });
  } catch (error) {
    console.error("Passkey authentication failed", error instanceof Error ? error.message : "unknown_error");
    return jsonError(error.message || "Não foi possível validar a chave.", 401);
  }
}
