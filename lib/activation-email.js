import { getDatabase, createOpaqueToken, hashToken, normalizeEmail } from "./member-auth";

export async function sendMemberAccessEmail(rawEmail) {
  const email = normalizeEmail(rawEmail);
  const sql = getDatabase();
  const accounts = await sql`SELECT password_hash FROM member_accounts WHERE lower(email) = ${email} LIMIT 1`;
  const baseUrl = process.env.NEXT_PUBLIC_APP_URL;
  const apiKey = process.env.RESEND_API_KEY;
  const from = process.env.RESEND_FROM_EMAIL;
  if (!apiKey || !from || !baseUrl) throw new Error("Activation email provider is not configured");

  let subject;
  let html;
  if (accounts.length && accounts[0].password_hash) {
    subject = "Seu acesso ao O Clone Digital está liberado";
    html = `<div style="font-family:Arial,sans-serif;max-width:560px;margin:auto;color:#171717"><h1>Compra confirmada!</h1><p>Seu acesso ao O Clone Digital está liberado para o e-mail desta compra.</p><p><a href="${new URL("/login", baseUrl).toString()}" style="display:inline-block;padding:13px 20px;background:#ff3045;color:#fff;text-decoration:none;border-radius:6px">Entrar na área do aluno</a></p><p>Entre com a senha que você já cadastrou.</p></div>`;
  } else {
    const token = createOpaqueToken();
    const tokenHash = hashToken(token);
    const expiresAt = new Date(Date.now() + 30 * 60 * 1000).toISOString();
    await sql`INSERT INTO member_activation_tokens (email, token_hash, expires_at)
      VALUES (${email}, ${tokenHash}, ${expiresAt})`;
    const activationUrl = new URL("/ativar", baseUrl);
    activationUrl.searchParams.set("token", token);
    subject = "Ative seu acesso ao O Clone Digital";
    html = `<div style="font-family:Arial,sans-serif;max-width:560px;margin:auto;color:#171717"><h1>Compra confirmada!</h1><p>Seu acesso ao O Clone Digital está pronto. Crie uma senha pessoal usando o link abaixo.</p><p><a href="${activationUrl.toString()}" style="display:inline-block;padding:13px 20px;background:#ff3045;color:#fff;text-decoration:none;border-radius:6px">Ativar minha conta</a></p><p>O link expira em 30 minutos e só pode ser usado uma vez. Se você não esperava esta mensagem, ignore-a.</p></div>`;
  }

  const response = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: { Authorization: `Bearer ${apiKey}`, "Content-Type": "application/json" },
    body: JSON.stringify({ from, to: [email], subject, html }),
  });
  if (!response.ok) {
    console.error("Resend member access email failed", { status: response.status });
    throw new Error("Unable to send member access email");
  }
}
