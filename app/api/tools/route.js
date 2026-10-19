import { NextResponse } from "next/server";
import { getCurrentMember, getDatabase } from "../../../lib/member-auth";
export const runtime = "nodejs";
export const dynamic = "force-dynamic";
const seed = [
["Biblioteca de Anúncios da Meta","Pesquise anúncios ativos, anunciantes e abordagens criativas para mapear ofertas.","Pesquisa e mineração","Gratuito","https://www.facebook.com/ads/library/","Comece por palavras-chave do nicho e registre promessa, formato, página de destino e tempo de veiculação.",true],
["TikTok Creative Center","Explore anúncios, tendências e referências criativas do TikTok.","Pesquisa e mineração","Gratuito","https://ads.tiktok.com/business/creativecenter/","Use filtros de região, setor e objetivo para encontrar referências.",true],
["Google Trends","Compare o interesse de busca por temas e produtos ao longo do tempo.","Pesquisa e mineração","Gratuito","https://trends.google.com/","Compare termos semelhantes e observe sazonalidade antes de escolher uma oferta.",true],
["Pinterest Trends","Identifique temas e interesses em alta no Pinterest.","Pesquisa e mineração","Gratuito","https://trends.pinterest.com/","Útil para nichos visuais, decoração, moda, beleza e estilo de vida.",true],
["URLScan.io","Analise informações públicas e sinais técnicos de URLs e páginas.","Análise e segurança","Gratuito / pago","https://urlscan.io/","Use para investigação defensiva e análise de páginas públicas. Não envie links privados ou dados sensíveis.",true],
["Similarweb","Consulte estimativas de tráfego e canais de aquisição de sites.","Análise e segurança","Gratuito / pago","https://www.similarweb.com/","Estimativas podem variar; use como referência comparativa, não como números exatos.",true],
["BuiltWith","Investigue tecnologias utilizadas por sites públicos.","Análise e segurança","Gratuito / pago","https://builtwith.com/","Ajuda a identificar plataformas e tecnologias de páginas de referência.",true],
["Google PageSpeed Insights","Avalie desempenho e experiência de páginas web.","Criação e execução","Gratuito","https://pagespeed.web.dev/","Teste mobile e desktop e priorize recomendações que afetam carregamento.",true],
["Canva","Crie peças visuais, apresentações e materiais de divulgação.","Criação e execução","Gratuito / pago","https://www.canva.com/","Confira as licenças dos recursos e mantenha identidade visual própria.",true],
["CapCut","Edite vídeos curtos e criativos para campanhas.","Criação e execução","Gratuito / pago","https://www.capcut.com/","Use somente mídias, trilhas e materiais com direitos de uso adequados.",true],
["WordPress","Plataforma para criar e gerenciar sites e páginas.","Criação e execução","Gratuito / pago","https://wordpress.org/","A hospedagem e alguns temas ou plugins podem ter custo separado.",true],
["Framer","Construa sites e landing pages com editor visual.","Criação e execução","Gratuito / pago","https://www.framer.com/","Confira limites do plano antes de publicar em domínio próprio.",true],
["Cloudflare","Serviços de DNS, CDN, proteção e desempenho para sites.","Infraestrutura","Gratuito / pago","https://www.cloudflare.com/","Configure DNS e segurança somente para domínios que você controla.",true],
["Vercel","Hospede aplicações web e faça deploy integrado ao Git.","Infraestrutura","Gratuito / pago","https://vercel.com/","Confira os limites e condições do plano para uso comercial.",true],
["Neon","Banco de dados PostgreSQL serverless.","APIs e integrações","Gratuito / pago","https://neon.tech/","Armazene credenciais em variáveis de ambiente, nunca no frontend.",true],
["Resend","Serviço de envio de e-mails transacionais por API.","APIs e integrações","Gratuito / pago","https://resend.com/","Configure domínio e autenticação de e-mail antes de enviar mensagens em produção.",true],
["Postman","Teste e documente requisições de APIs.","APIs e integrações","Gratuito / pago","https://www.postman.com/","Nunca compartilhe tokens ou chaves em coleções públicas.",true],
["Google AI Studio","Experimente modelos de IA e prototipe integrações.","APIs e integrações","Gratuito / pago","https://aistudio.google.com/","Confira limites, preços e termos de uso atuais antes de integrar.",true],
["Shopify","Plataforma de comércio eletrônico para lojas e produtos próprios.","Fornecedores e marketplaces","Pago","https://shopify.pxf.io/c/5766908/4052989/13624","Compare taxas, integrações e logística antes de escolher uma plataforma.",true],
["Nuvemshop","Plataforma de e-commerce com foco no mercado brasileiro.","Fornecedores e marketplaces","Gratuito / pago","https://www.nuvemshop.com.br/","Consulte planos, meios de pagamento e integrações disponíveis.",true],
["Sebrae","Conteúdos e orientação para estruturar negócios e fornecedores.","Fornecedores e marketplaces","Gratuito","https://sebrae.com.br/","Use os materiais para avaliar formalização, fornecedores e viabilidade.",true]
];
async function ensure(sql) {
 await sql`CREATE TABLE IF NOT EXISTS tool_library (id BIGSERIAL PRIMARY KEY, name TEXT NOT NULL, description TEXT NOT NULL, category TEXT NOT NULL, pricing TEXT NOT NULL DEFAULT 'Gratuito', url TEXT NOT NULL, notes TEXT NOT NULL DEFAULT '', verified BOOLEAN NOT NULL DEFAULT false, is_active BOOLEAN NOT NULL DEFAULT true, created_at TIMESTAMPTZ NOT NULL DEFAULT now(), updated_at TIMESTAMPTZ NOT NULL DEFAULT now())`;
 const rows = await sql`SELECT COUNT(*)::int AS total FROM tool_library`;
 if (Number(rows[0]?.total || 0) === 0) for (const t of seed) await sql`INSERT INTO tool_library(name,description,category,pricing,url,notes,verified) VALUES(${t[0]},${t[1]},${t[2]},${t[3]},${t[4]},${t[5]},${t[6]})`;
 const suppliers = [
  ["SMS Full Bot","Fornecedor no Telegram para compra de números de WhatsApp e outros serviços.","Fornecedores e marketplaces","Consultar no Telegram","https://t.me/smsfull_bot?start=1028021521","Confira preços, disponibilidade, regras da plataforma e condições antes de comprar.",false],
  ["NotzSMS","Fornecedor no Telegram para compra de números de WhatsApp e outros serviços.","Fornecedores e marketplaces","Consultar no Telegram","https://t.me/NotzSMSBot?start=1028021521","Confira preços, disponibilidade, regras da plataforma e condições antes de comprar.",false]
 ];
 const additionalTools = [
  ["Apify","Automatize coleta de dados públicos da web e execute scrapers prontos ou personalizados.","Pesquisa e mineração","Gratuito / pago","https://apify.com/","Respeite os termos de uso, limites de acesso e privacidade dos sites consultados.",true],
  ["Manychat","Crie automações de conversas e respostas para Instagram, WhatsApp, TikTok e Messenger.","Pesquisa e mineração","Gratuito / pago","https://manychat.com/pt","Use automações em conformidade com as regras de cada canal e com o consentimento dos contatos.",true],
  ["Adsparo","Pesquise anúncios, criativos, produtos em tendência e informações de páginas anunciantes.","Pesquisa e mineração","Pago","https://adsparo.com/","Confira o preço e os recursos disponíveis no plano atual antes de assinar.",true],
  ["Kalodata","Analise tendências de produtos, criadores e dados comerciais do TikTok Shop.","Pesquisa e mineração","Gratuito / pago","https://www.kalodata.com/","Disponibilidade de dados e recursos pode variar conforme região e plano.",true],
  ["GitHub","Hospede repositórios, controle versões e colabore no desenvolvimento de projetos.","Infraestrutura","Gratuito / pago","https://github.com/","Nunca publique tokens, senhas ou chaves de API nos repositórios.",true],
  ["Netlify","Publique sites e aplicações web com deploy integrado a repositórios Git.","Infraestrutura","Gratuito / pago","https://www.netlify.com/","Confira os limites do plano e configure variáveis sensíveis nas configurações do projeto.",true]
 ];
 for (const t of additionalTools) {
  await sql`INSERT INTO tool_library(name,description,category,pricing,url,notes,verified) SELECT ${t[0]},${t[1]},${t[2]},${t[3]},${t[4]},${t[5]},${t[6]} WHERE NOT EXISTS (SELECT 1 FROM tool_library WHERE lower(name) = lower(${t[0]}))`;
 }
 await sql`UPDATE tool_library SET category = 'Pesquisa e mineração', updated_at = now() WHERE lower(name) = 'urlscan.io' AND category <> 'Pesquisa e mineração'`;
 for (const t of suppliers) {
  await sql`INSERT INTO tool_library(name,description,category,pricing,url,notes,verified) SELECT ${t[0]},${t[1]},${t[2]},${t[3]},${t[4]},${t[5]},${t[6]} WHERE NOT EXISTS (SELECT 1 FROM tool_library WHERE url = ${t[4]})`;
 }
}
export async function GET() {
 const member = await getCurrentMember();
 if (!member) return NextResponse.json({error:"Faça login para acessar as ferramentas."},{status:401});
 try { const sql=getDatabase(); await ensure(sql); const tools=await sql`SELECT id,name,description,category,pricing,url,notes,verified FROM tool_library WHERE is_active=true ORDER BY category,name`; return NextResponse.json({tools}); }
 catch(e){console.error("Tools library GET failed",e?.message);return NextResponse.json({error:"Não foi possível carregar as ferramentas."},{status:500});}
}
