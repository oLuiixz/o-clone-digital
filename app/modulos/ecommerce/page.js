import Link from "next/link";
import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../lib/member-auth";

export const dynamic = "force-dynamic";

const lessons = [
  {
    n: "01", title: "Entenda o modelo de e-commerce", tag: "FUNDAMENTOS",
    intro: "E-commerce é a venda de produtos ou serviços por canais digitais. A loja é só uma parte do negócio: também existem aquisição de clientes, estoque ou fornecedor, entrega, pagamento, atendimento e pós-venda.",
    steps: [
      "Escolha um modelo compatível com seus recursos: estoque próprio, fabricação sob demanda, produção artesanal, revenda autorizada ou dropshipping com fornecedor confiável.",
      "Calcule o custo total por pedido: produto, embalagem, frete subsidiado, taxas de pagamento, plataforma, impostos, atendimento, devoluções e aquisição de clientes.",
      "Defina para quem a loja existe e qual problema, desejo ou conveniência ela atende. Evite montar um catálogo genérico sem posicionamento."
    ],
    action: "Escreva em uma frase: “Minha loja ajuda [público] a conseguir [benefício real] com [tipo de produto]”."
  },
  {
    n: "02", title: "Escolha e valide um nicho", tag: "PESQUISA",
    intro: "Um nicho viável combina procura identificável, produto adequado, margem possível, operação confiável e espaço para diferenciar a experiência. Tendência ou visualização em anúncio não são prova de vendas lucrativas.",
    steps: [
      "Liste três públicos e problemas concretos. Pesquise perguntas, avaliações de clientes, buscas, concorrentes e reclamações recorrentes.",
      "Compare cinco a dez produtos por preço praticado, custo entregue, fragilidade, tamanho, frequência de compra, sazonalidade e facilidade de explicar o valor.",
      "Converse com potenciais clientes ou teste uma página simples com orçamento limitado. Meça interesse real, não apenas curtidas.",
      "Confirme a qualidade e a procedência do produto, prazos reais, política de troca e a capacidade do fornecedor de atender à demanda."
    ],
    action: "Monte uma tabela com produto, público, preço, custo total, concorrentes, diferenciais e evidências de demanda."
  },
  {
    n: "03", title: "Prepare sua loja na Shopify", tag: "PLATAFORMA",
    intro: "A Shopify reúne vitrine, catálogo, pedidos e recursos de operação de loja virtual. Os nomes e a disponibilidade de recursos podem variar conforme plano, país e configuração.",
    steps: [
      "Crie a conta pelo site oficial e confira os preços, período de teste, recursos e condições atuais antes de escolher um plano.",
      "Escolha um tema responsivo, mantenha a navegação simples e personalize cores, tipografia, logotipo e imagens para a identidade da marca.",
      "Configure domínio, remetente de e-mail, moeda, idioma, dados comerciais e informações de contato.",
      "Organize menus essenciais: Início, Catálogo, Sobre, Contato, Entrega e devoluções, Privacidade e Termos.",
      "Instale apenas aplicativos necessários. Cada app adicional pode afetar custo, velocidade, privacidade e manutenção."
    ],
    action: "Antes de divulgar a loja, abra-a no celular e complete o fluxo de compra como se fosse um cliente."
  },
  {
    n: "04", title: "Monte catálogo e páginas de produto", tag: "VITRINE",
    intro: "Uma página de produto boa reduz dúvidas. Ela mostra o que é, para quem serve, quais são as características, quanto custa e o que acontece depois da compra.",
    steps: [
      "Use fotos próprias ou autorizadas, nítidas e consistentes. Mostre o produto de vários ângulos, detalhes, escala e contexto de uso quando relevante.",
      "Escreva título específico, descrição objetiva, materiais, dimensões, compatibilidade, cuidados, conteúdo da embalagem e limitações.",
      "Apresente preço, variações, disponibilidade, prazo estimado, frete e política de devolução sem esconder custos importantes.",
      "Organize coleções por necessidade do cliente. Evite criar dezenas de categorias antes de ter catálogo suficiente.",
      "Não use avaliações falsas, fotos de terceiros sem autorização ou alegações de desempenho que não consiga comprovar."
    ],
    action: "Revise uma página com esta pergunta: alguém que nunca viu o produto consegue decidir sem precisar adivinhar detalhes importantes?"
  },
  {
    n: "05", title: "Pagamento, frete e operação", tag: "BASTIDORES",
    intro: "A experiência depois do botão de compra influencia confiança, custos e recompra. Configure a operação antes de aumentar o tráfego.",
    steps: [
      "Compare provedores de pagamento disponíveis para sua região, taxas, prazo de recebimento, antifraude e processo de estorno.",
      "Defina regiões atendidas, transportadoras, preço e prazo de frete, embalagem e rotina de despacho. Não prometa entrega que não controla.",
      "Crie um fluxo para confirmação do pedido, separação, envio, rastreio, dúvidas, troca, devolução e reembolso.",
      "Mantenha políticas claras e cumpra as regras de defesa do consumidor, privacidade, tributação e comércio eletrônico aplicáveis no Brasil.",
      "Faça um pedido de teste, verifique e-mails e mensagens e confirme que estoque, frete e preço aparecem corretamente."
    ],
    action: "Desenhe o caminho do pedido: pagamento → separação → envio → rastreio → entrega → suporte."
  },
  {
    n: "06", title: "Aquisição: conteúdo e anúncios", tag: "MARKETING",
    intro: "Tráfego não corrige uma oferta confusa nem uma operação ruim. Comece com uma proposta clara e teste mensagens diferentes em vez de apostar todo o orçamento em uma única ideia.",
    steps: [
      "Crie conteúdos úteis que demonstrem o produto, respondam dúvidas e mostrem seu uso real. Use materiais próprios ou licenciados.",
      "Prepare variações de criativo com ângulos diferentes: problema atendido, demonstração, comparação honesta, detalhes e perguntas frequentes.",
      "Se anunciar, defina um orçamento de teste que possa perder sem comprometer despesas essenciais e acompanhe cada campanha por período comparável.",
      "Use links com parâmetros UTM e mantenha registro de canal, campanha, criativo, custo, pedidos e receita atribuída.",
      "Respeite políticas de publicidade, privacidade e consentimento. Não use falsas urgências, promessas enganosas ou segmentação proibida."
    ],
    action: "Planeje três criativos, cada um com uma hipótese diferente e uma métrica para avaliar."
  },
  {
    n: "07", title: "Números que você precisa acompanhar", tag: "MÉTRICAS",
    intro: "Acompanhe o negócio com dados reais e não confunda faturamento com lucro. Analise períodos comparáveis e confirme a origem dos números.",
    steps: [
      "Taxa de conversão = pedidos ÷ sessões × 100. Use o mesmo período e confira como sua plataforma define sessão e pedido.",
      "Ticket médio = receita de pedidos ÷ número de pedidos. Observe descontos, frete e cancelamentos conforme o relatório utilizado.",
      "Margem de contribuição por pedido = receita líquida do pedido menos custos variáveis, taxas, produto, embalagem, frete subsidiado e demais custos variáveis.",
      "ROAS = receita atribuída aos anúncios ÷ gasto com anúncios. ROAS não é lucro e pode não incluir todos os custos.",
      "Acompanhe cancelamentos, devoluções, prazo de entrega, reclamações, recompra e motivos de contato para encontrar gargalos."
    ],
    action: "Crie uma planilha semanal com sessões, pedidos, conversão, receita, custos variáveis, anúncios, devoluções e margem estimada."
  },
  {
    n: "08", title: "Checklist de lançamento", tag: "EXECUÇÃO",
    intro: "Faça um lançamento pequeno, verifique o funcionamento e corrija problemas antes de tentar ampliar a operação.",
    steps: [
      "Produto, fornecedor e disponibilidade confirmados; custos e margem calculados.",
      "Domínio, identidade visual, páginas de produto e menus revisados no celular e no desktop.",
      "Pagamento, frete, estoque, e-mails transacionais e rastreio testados de ponta a ponta.",
      "Políticas de privacidade, troca, devolução, entrega, contato e termos publicadas e revisadas.",
      "Analytics e UTMs configurados; orçamento, hipótese e critério de pausa definidos.",
      "Plano de atendimento e processo para pedidos atrasados, reembolso e reclamações preparados."
    ],
    action: "Só aumente o investimento depois de confirmar que a operação entrega o que promete e que os números fazem sentido."
  }
];

const resources = [
  { title: "Shopify Brasil", description: "Conheça a plataforma e consulte recursos e planos atuais.", url: "https://www.shopify.com/br" },
  { title: "Guia de fotografia para e-commerce", description: "Material oficial Shopify para planejar imagens de produtos.", url: "https://www.shopify.com/br/blog/tutorial-fotografia-de-produto" },
  { title: "Central de ajuda Shopify: imagens", description: "Veja orientações oficiais para imagens da loja virtual.", url: "https://help.shopify.com/pt-BR/manual/online-store/images" },
  { title: "Shopify Blog: imagens de destaque", description: "Aprenda a pensar imagens de destaque para sua vitrine.", url: "https://www.shopify.com/blog/16480796-how-to-create-beautiful-and-persuasive-hero-images-for-your-online-store" }
];

export default async function EcommercePage() {
  const member = await getCurrentMember();
  if (!member) redirect("/login");
  return (
    <main className="ecommerce-page">
      <style>{`
        .ecommerce-page{min-height:100vh;background:#0b0d0c;color:#f3f5f2;padding:clamp(18px,4vw,48px);font-family:inherit}
        .ecom-wrap{max-width:1120px;margin:0 auto}
        .ecom-back{display:inline-flex;gap:8px;align-items:center;color:#a7b2a9;text-decoration:none;font-size:13px;margin-bottom:28px}
        .ecom-hero{position:relative;overflow:hidden;min-height:310px;border:1px solid #27372c;border-radius:24px;padding:clamp(24px,5vw,54px);background:radial-gradient(ellipse at 80% 20%,#284a32 0,transparent 42%),linear-gradient(120deg,#121b15,#101311 70%);display:grid;grid-template-columns:1.15fr .85fr;gap:30px;align-items:center}
        .ecom-eyebrow{color:#9bd7a6;letter-spacing:.15em;font-size:11px;font-weight:750}
        .ecom-hero h1{font-size:clamp(38px,6vw,64px);line-height:.98;letter-spacing:-.055em;margin:18px 0}
        .ecom-hero h1 em{font-style:normal;color:#9bd7a6}
        .ecom-hero p{color:#b6c0b8;max-width:540px;line-height:1.75;font-size:15px}
        .ecom-hero-actions{display:flex;gap:10px;flex-wrap:wrap;margin-top:24px}
        .ecom-btn{display:inline-flex;padding:12px 16px;border-radius:10px;background:#a4d9ac;color:#102015;text-decoration:none;font-weight:750;font-size:13px}
        .ecom-btn-secondary{background:#1b251e;color:#e7eee8;border:1px solid #334639}
        .ecom-visual{position:relative;display:flex;align-items:center;justify-content:center;min-height:220px}
        .ecom-product-shot{width:100%;max-width:370px;aspect-ratio:1.12;object-fit:cover;border-radius:18px;border:1px solid #3b5a42;box-shadow:0 24px 70px #0008}
        .ecom-shopify-mark{position:absolute;bottom:6px;left:0;background:#f8fbf7;color:#173b22;border-radius:12px;padding:12px 16px;display:flex;gap:10px;align-items:center;box-shadow:0 12px 35px #0006;font-weight:800;font-size:13px}
        .ecom-shopify-mark img{width:28px;height:28px}
        .ecom-stats{display:grid;grid-template-columns:repeat(3,1fr);gap:12px;margin:18px 0 42px}
        .ecom-stat{padding:17px;border:1px solid #242c26;background:#111512;border-radius:14px}
        .ecom-stat b{display:block;font-size:13px;margin-bottom:5px}.ecom-stat span{color:#9eaaa1;font-size:12px;line-height:1.5}
        .ecom-section{margin:42px 0}.ecom-section-head{display:flex;justify-content:space-between;gap:22px;align-items:end;margin-bottom:18px}
        .ecom-section h2{font-size:clamp(25px,3vw,34px);letter-spacing:-.035em;margin:8px 0}
        .ecom-section-head p{max-width:460px;color:#9eaaa1;line-height:1.7;font-size:13px}
        .ecom-lessons{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:14px}
        .ecom-lesson{border:1px solid #29332c;border-radius:16px;background:linear-gradient(145deg,#141a16,#101311);padding:22px}
        .ecom-lesson-top{display:flex;align-items:center;gap:12px;margin-bottom:14px}
        .ecom-num{width:38px;height:38px;border-radius:11px;background:#233c29;color:#a4d9ac;display:grid;place-items:center;font-size:12px;font-weight:800;flex-shrink:0}
        .ecom-tag{font-size:9px;letter-spacing:.14em;color:#a4d9ac;font-weight:800}
        .ecom-lesson h3{font-size:18px;margin:3px 0 0;letter-spacing:-.02em}
        .ecom-lesson>p{color:#adb8af;font-size:13px;line-height:1.7}
        .ecom-lesson ol{padding-left:19px;color:#d1d8d2;font-size:12px;line-height:1.75}
        .ecom-lesson li{padding:0 0 7px 3px}
        .ecom-action{margin-top:16px;padding:13px 14px;border-left:2px solid #8ec99a;background:#17221a;color:#dbe9dd;font-size:12px;line-height:1.65}
        .ecom-resources{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:12px}
        .ecom-resource{display:block;border:1px solid #2a342c;border-radius:13px;padding:17px;color:inherit;text-decoration:none;background:#111512;transition:border-color .18s,transform .18s}
        .ecom-resource:hover{border-color:#85bb8d;transform:translateY(-2px)}
        .ecom-resource b{display:block;font-size:14px;margin-bottom:6px}.ecom-resource span{display:block;color:#9eaaa1;font-size:12px;line-height:1.6}.ecom-resource small{display:block;color:#9bd7a6;margin-top:12px;font-weight:700}
        .ecom-footer-note{border:1px solid #2d392f;background:#111713;padding:18px;border-radius:14px;color:#aeb9b0;font-size:12px;line-height:1.7}
        @media(max-width:760px){.ecom-hero{grid-template-columns:1fr}.ecom-visual{min-height:170px}.ecom-product-shot{max-width:100%;aspect-ratio:1.7}.ecom-shopify-mark{left:8px;bottom:-4px}.ecom-stats{grid-template-columns:1fr}.ecom-lessons,.ecom-resources{grid-template-columns:1fr}.ecom-section-head{display:block}.ecom-section-head p{margin-top:8px}}
      `}</style>
      <div className="ecom-wrap">
        <Link className="ecom-back" href="/painel">← Voltar ao painel</Link>
        <section className="ecom-hero">
          <div>
            <div className="ecom-eyebrow">MÓDULO 14 · COMÉRCIO DIGITAL</div>
            <h1>Construa sua loja.<br/><em>Venda com método.</em></h1>
            <p>Aprenda a planejar um e-commerce, validar produtos, montar uma vitrine na Shopify e organizar marketing, operação e métricas — da ideia ao primeiro lançamento.</p>
            <div className="ecom-hero-actions">
              <a className="ecom-btn" href="#aulas">Começar o conteúdo ↓</a>
              <a className="ecom-btn ecom-btn-secondary" href="https://www.shopify.com/br" target="_blank" rel="noreferrer">Conhecer a Shopify ↗</a>
            </div>
          </div>
          <div className="ecom-visual">
            <img className="ecom-product-shot" src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=1000&q=85" alt="Pessoa preparando um pedido de compra online" />
            <div className="ecom-shopify-mark"><img src="https://cdn.simpleicons.org/shopify/7AB55C" alt="" /><span>SHOPIFY<br/><small>LOJA VIRTUAL</small></span></div>
          </div>
        </section>
        <div className="ecom-stats">
          <div className="ecom-stat"><b>08 aulas práticas</b><span>Da escolha do nicho à checklist de lançamento.</span></div>
          <div className="ecom-stat"><b>Foco na Shopify</b><span>Referências e materiais oficiais para aprofundar.</span></div>
          <div className="ecom-stat"><b>Operação sustentável</b><span>Custos, atendimento e métricas antes de escalar.</span></div>
        </div>
        <section className="ecom-section" id="aulas">
          <div className="ecom-section-head"><div><div className="ecom-eyebrow">TRILHA DE APRENDIZADO</div><h2>Do planejamento ao lançamento</h2></div><p>Siga as aulas em ordem. Cada etapa termina com uma ação concreta para transformar a teoria em um plano de loja.</p></div>
          <div className="ecom-lessons">
            {lessons.map((lesson) => <article className="ecom-lesson" key={lesson.n}>
              <div className="ecom-lesson-top"><span className="ecom-num">{lesson.n}</span><div><div className="ecom-tag">{lesson.tag}</div><h3>{lesson.title}</h3></div></div>
              <p>{lesson.intro}</p>
              <ol>{lesson.steps.map((step, i) => <li key={i}>{step}</li>)}</ol>
              <div className="ecom-action"><b>Ação prática:</b> {lesson.action}</div>
            </article>)}
          </div>
        </section>
        <section className="ecom-section">
          <div className="ecom-section-head"><div><div className="ecom-eyebrow">MATERIAIS DE REFERÊNCIA</div><h2>Aprenda direto com a Shopify</h2></div><p>Links para recursos oficiais sobre plataforma, imagens de produtos e construção da vitrine. Consulte sempre as condições e orientações atualizadas.</p></div>
          <div className="ecom-resources">{resources.map((resource) => <a className="ecom-resource" key={resource.url} href={resource.url} target="_blank" rel="noreferrer"><b>{resource.title} ↗</b><span>{resource.description}</span><small>ABRIR MATERIAL OFICIAL</small></a>)}</div>
        </section>
        <div className="ecom-footer-note"><b>Importante:</b> este módulo é educacional e não garante vendas ou lucro. Resultados dependem do produto, da demanda, da operação, do orçamento e da execução. Verifique custos, termos da plataforma, direitos de uso de imagens, regras de publicidade e obrigações legais antes de vender.</div>
      </div>
    </main>
  );
}
