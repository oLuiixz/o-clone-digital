import { authenticationOptions, jsonError } from "../../../../lib/passkeys";
export const runtime = "nodejs";
export async function POST(request) {
  try { const body = await request.json(); return Response.json(await authenticationOptions(body.email)); }
  catch (error) { return jsonError(error.message || "Não foi possível iniciar o acesso por chave.", 400); }
}
