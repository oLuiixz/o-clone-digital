import { neon } from "@neondatabase/serverless";

export const runtime = "nodejs";
export const dynamic = "force-dynamic";

const API_BASE = "https://api.syncpayments.com.br/api/partner/v1";
const PROVIDER = "syncpay";
const PRODUCT_SLUG = "o-clone-digital";

function normalizeEmail(value) {
  return typeof value === "string" ? value.trim().toLowerCase() : "";
}

function onlyDigits(value) {
  return String(value ?? "").replace(/\D/g, "");
}

function validCpf(value) {
  const cpf = onlyDigits(value);
  if (!/^\d{11}$/.test(cpf) || /^(\d)\1{10}$/.test(cpf)) return false;
  for (let length = 9; length <= 10; length++) {
    let sum = 0;
    for (let i = 0; i < length; i++) sum += Number(cpf[i]) * (length + 1 - i);
    const digit = (sum * 10) % 11 % 10;
    if (digit !== Number(cpf[length])) return false;
  }
  return true;
}

async function syncpayRequest(path, init) {
  const response = await fetch(`${API_BASE}${path}`, {
    ...init,
    cache: "no-store",
    signal: AbortSignal.timeout(12000),
  });
  const data = await response.json().catch(() => null);
  if (!response.ok) {
    console.error("SyncPay API request failed", { path, status: response.status });
    throw new Error("Não foi possível criar o Pix na SyncPay.");
  }
  return data;
}

async function getAccessToken() {
  const clientId = process.env.SYNCPAY_CLIENT_ID;
  const clientSecret = process.env.SYNCPAY_CLIENT_SECRET;
  if (!clientId || !clientSecret) throw new Error("SyncPay API credentials are not configured");
  const data = await syncpayRequest("/auth-token", {
    method: "POST",
    headers: { "Content-Type": "application/json", Accept: "application/json" },
    body: JSON.stringify({ client_id: clientId, client_secret: clientSecret }),
  });
  if (!data?.access_token) throw new Error("SyncPay did not return an access token");
  return data.access_token;
}

export async function POST(request) {
  const databaseUrl = process.env.DATABASE_URL;
  if (!databaseUrl) return Response.json({ error: "Checkout temporariamente indisponível." }, { status: 503 });

  let body;
  try { body = await request.json(); }
  catch { return Response.json({ error: "Dados inválidos." }, { status: 400 }); }

  const name = String(body?.name ?? "").trim().replace(/\s+/g, " ").slice(0, 120);
  const email = normalizeEmail(body?.email);
  const cpf = onlyDigits(body?.cpf);
  const phone = onlyDigits(body?.phone);
  if (name.length < 2 || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || email.length > 320 ||
      !validCpf(cpf) || phone.length < 10 || phone.length > 13 || body?.method !== "pix" || body?.accepted !== true) {
    return Response.json({ error: "Confira nome, e-mail, CPF, celular e aceite os termos. No momento, somente Pix está disponível." }, { status: 400 });
  }

  const sql = neon(databaseUrl);
  let orderId;
  try {
    // This first-party checkout is affiliate-only. Require a current attribution
    // for the same buyer email before creating any order or requesting a Pix charge.
    const eligibleReferral = await sql`
      SELECT aa.id
      FROM affiliate_attributions aa
      JOIN affiliates a ON a.id = aa.affiliate_id AND a.status = 'approved'
      WHERE lower(aa.customer_email) = ${email}
        AND aa.expires_at > now()
        AND aa.converted_order_id IS NULL
      ORDER BY aa.created_at DESC
      LIMIT 1
    `;
    if (!eligibleReferral.length) {
      return Response.json({ error: "Este checkout é exclusivo para compras por indicação. Volte ao link do seu afiliado e use o mesmo e-mail." }, { status: 403 });
    }

    const products = await sql`SELECT id, price_amount FROM products WHERE slug = ${PRODUCT_SLUG} AND is_active = true LIMIT 1`;
    if (!products.length) return Response.json({ error: "Produto indisponível no momento." }, { status: 503 });
    const product = products[0];
    const amountCents = Number(product.price_amount);
    if (!Number.isInteger(amountCents) || amountCents < 100) {
      return Response.json({ error: "Preço do produto não está configurado corretamente." }, { status: 503 });
    }

    // Create a durable pending order before calling the provider. Never grant access here.
    const orders = await sql`
      INSERT INTO orders (product_id, customer_email, provider, status, amount, currency, metadata, updated_at)
      VALUES (${product.id}, ${email}, ${PROVIDER}, 'pending', ${amountCents}, 'BRL',
        ${JSON.stringify({ source: "first_party_pix_checkout", customer_name: name, created_by: "checkout_api" })}::jsonb, now())
      RETURNING id
    `;
    orderId = orders[0].id;

    const webhookToken = process.env.SYNCPAY_CASHIN_WEBHOOK_TOKEN;
    const configuredUrl = new URL(process.env.NEXT_PUBLIC_APP_URL || "https://www.oclonedigital.xyz");
    if (configuredUrl.hostname === "oclonedigital.xyz") configuredUrl.hostname = "www.oclonedigital.xyz";
    const appUrl = configuredUrl.origin;
    if (!webhookToken || !/^[a-f0-9]{32,128}$/i.test(webhookToken)) {
      await sql`UPDATE orders SET status = 'failed', updated_at = now(), metadata = metadata || ${JSON.stringify({ checkout_error: "webhook_not_configured" })}::jsonb WHERE id = ${orderId}`;
      return Response.json({ error: "Checkout Pix ainda não foi habilitado no servidor." }, { status: 503 });
    }
    const webhookUrl = new URL("/api/webhooks/syncpay-cashin", appUrl);
    webhookUrl.searchParams.set("token", webhookToken);

    const accessToken = await getAccessToken();
    const charge = await syncpayRequest("/cash-in", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${accessToken}`,
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        amount: amountCents / 100,
        description: "O Clone Digital - acesso à plataforma",
        webhook_url: webhookUrl.toString(),
        client: { name, cpf, email, phone },
      }),
    });
    const identifier = String(charge?.identifier ?? "").trim();
    const pixCode = String(charge?.pix_code ?? "").trim();
    if (!identifier || identifier.length > 200 || !pixCode || pixCode.length > 10000) {
      throw new Error("SyncPay returned an incomplete Pix charge");
    }

    await sql`
      UPDATE orders SET provider_payment_id = ${identifier},
        provider_checkout_id = ${orderId},
        metadata = metadata || ${JSON.stringify({ syncpay_identifier: identifier, pix_created_at: new Date().toISOString() })}::jsonb,
        updated_at = now()
      WHERE id = ${orderId} AND status = 'pending'
    `;

    return Response.json({
      orderId,
      payment: { method: "pix", status: "pending", pixCode, identifier },
      amount: amountCents,
      currency: "BRL",
    }, { status: 201 });
  } catch (error) {
    if (orderId) {
      try {
        await sql`UPDATE orders SET status = 'failed', updated_at = now(),
          metadata = metadata || ${JSON.stringify({ checkout_error: "provider_request_failed" })}::jsonb
          WHERE id = ${orderId} AND status = 'pending' AND provider_payment_id IS NULL`;
      } catch { /* keep original checkout error */ }
    }
    console.error("Pix checkout failed", error instanceof Error ? error.message : "unknown_error");
    return Response.json({ error: "Não foi possível gerar o Pix agora. Tente novamente mais tarde." }, { status: 502 });
  }
}
