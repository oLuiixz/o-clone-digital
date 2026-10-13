import { NextResponse } from "next/server";
import { getDatabase } from "../../../../lib/member-auth";
import { isAdminRequest } from "../../../../lib/admin-auth";
export const runtime="nodejs";
export const dynamic="force-dynamic";
export async function GET(){if(!(await isAdminRequest()))return NextResponse.json({error:"Não autorizado."},{status:401});try{const sql=getDatabase();const orders=await sql`
SELECT o.id,o.customer_email,o.provider,o.provider_checkout_id,o.provider_payment_id,o.status,o.amount,o.currency,o.created_at,o.approved_at,p.name AS product_name,e.status AS entitlement_status,
EXISTS(SELECT 1 FROM member_accounts a WHERE lower(a.email)=lower(o.customer_email) AND a.password_hash IS NOT NULL) AS account_activated
FROM orders o JOIN products p ON p.id=o.product_id LEFT JOIN entitlements e ON e.order_id=o.id ORDER BY o.created_at DESC LIMIT 300`;
const history=await sql`SELECT id,order_id,customer_email,channel,action,status,details,provider_message_id,created_at FROM admin_delivery_events ORDER BY created_at DESC LIMIT 500`;
return NextResponse.json({orders,history});}catch(error){console.error("Admin orders load failed",error instanceof Error?error.message:"unknown_error");return NextResponse.json({error:"Falha ao carregar pedidos. Confira se a migração 003 foi aplicada no Neon."},{status:500});}}