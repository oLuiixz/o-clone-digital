import Link from "next/link";

const checkoutUrl = process.env.NEXT_PUBLIC_SYNCPAY_CHECKOUT_URL || "https://link.syncpayments.com.br/VwhUi7";
const modules = [
  ["01","Entendendo o processo","Veja como as etapas se conectam e por onde começar."],
  ["02","Mineração de ofertas","Pesquise anúncios, páginas e referências com mais critério."],
  ["03","Análise da oferta","Observe promessa, público, criativos e estrutura."],
  ["04","Estrutura e produto","Planeje uma proposta própria a partir do que estudou."],
  ["05","Página de vendas e VSL","Organize a mensagem e apresente sua oferta com clareza."],
  ["06","Primeiro anúncio","Prepare um teste inicial e acompanhe as métricas."],
  ["07","Integração e entrega","Entenda checkout, acesso, automação e pós-venda."]
];
const faqs = [
  ["O que é o O Clone Digital?","É uma plataforma educacional organizada por etapas para ajudar você a pesquisar referências, analisar ofertas, estruturar um produto próprio e preparar um primeiro teste de anúncio."],
  ["Preciso ter experiência no mercado digital?","A jornada foi pensada para quem está começando e precisa de um caminho organizado. Você pode avançar etapa por etapa, sem tentar fazer tudo de uma vez."],
  ["O conteúdo garante vendas ou lucro?","Não. Resultados dependem de diversos fatores, incluindo execução, oferta, mercado, orçamento e ajustes. O Clone Digital ensina um processo; não promete vendas ou lucro garantidos."],
  ["Vou aprender a copiar produtos de outras pessoas?","A proposta é estudar referências para compreender estruturas e desenvolver uma oferta própria. Conteúdos, marcas e materiais de terceiros devem ser usados respeitando direitos autorais e as permissões aplicáveis."],
  ["Como recebo meu acesso?","Após a confirmação da compra, o acesso é vinculado ao e-mail informado no pedido. Se você já comprou, use a opção de entrar na área do aluno."]
];
function Arrow(){return <svg aria-hidden="true" viewBox="0 0 24 24" fill="none"><path d="M5 12h14M13 5l7 7-7 7" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"/></svg>}
function Check(){return <svg aria-hidden="true" viewBox="0 0 24 24" fill="none"><path d="m5 12 4.5 4.5L19 7" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"/></svg>}
function ArrowUpRight(){return <svg aria-hidden="true" viewBox="0 0 24 24" fill="none"><path d="M7 17 17 7M8 7h9v9" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"/></svg>}
function ArrowDown(){return <svg aria-hidden="true" viewBox="0 0 24 24" fill="none"><path d="M12 4v16m-7-7 7 7 7-7" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"/></svg>}
function SearchIcon(){return <svg aria-hidden="true" viewBox="0 0 24 24" fill="none"><circle cx="10.8" cy="10.8" r="6.8" stroke="currentColor" strokeWidth="1.7"/><path d="m16 16 4.2 4.2" stroke="currentColor" strokeWidth="1.7" strokeLinecap="round"/></svg>}
function LayoutIcon(){return <svg aria-hidden="true" viewBox="0 0 24 24" fill="none"><rect x="3.5" y="4" width="17" height="16" rx="2" stroke="currentColor" strokeWidth="1.7"/><path d="M3.5 9h17M9 9v11" stroke="currentColor" strokeWidth="1.7"/></svg>}
function ShieldIcon(){return <svg aria-hidden="true" viewBox="0 0 24 24" fill="none"><path d="M12 3 20 6v5.5c0 4.7-3.2 7.8-8 9.5-4.8-1.7-8-4.8-8-9.5V6l8-3Z" stroke="currentColor" strokeWidth="1.7" strokeLinejoin="round"/><path d="m8.5 12 2.2 2.2 4.8-4.8" stroke="currentColor" strokeWidth="1.7" strokeLinecap="round" strokeLinejoin="round"/></svg>}

export default function SalesPage(){
 return <main className="sales-page">
  <div className="sales-topline"><span className="sales-status-dot"/> UM PROCESSO MAIS CLARO PARA COMEÇAR NO DIGITAL</div>
  <header className="sales-header">
   <Link className="sales-brand" href="/" aria-label="O Clone Digital início"><img src="/imagens/E900F1F7-AFCC-42AA-AA22-F92B83E84AF8.png" alt=""/><span>O CLONE <b>DIGITAL</b><small>LABORATÓRIO DE OFERTAS</small></span></Link>
   <nav className="sales-nav" aria-label="Navegação da página"><a href="#metodo">O método</a><a href="#jornada">A jornada</a><a href="#duvidas">Dúvidas</a></nav>
   <Link className="sales-header-login" href="/login">Já tenho acesso <Arrow/></Link>
  </header>
  <section className="sales-hero">
   <div className="sales-hero-glow" aria-hidden="true"/>
   <div className="sales-hero-copy">
    <div className="sales-kicker"><span/> PESQUISAR. ANALISAR. ESTRUTURAR. TESTAR.</div>
    <h1>Menos achismo.<br/><em>Mais método.</em></h1>
    <p className="sales-hero-lead">Aprenda a sair da pesquisa de referências para a estruturação da sua própria oferta — com uma jornada organizada, prática e etapa por etapa.</p>
    <div className="sales-hero-actions"><a className="sales-button sales-button-primary" href="#oferta">Conhecer o O Clone Digital <Arrow/></a><a className="sales-button sales-button-quiet" href="#metodo">Ver como funciona <span className="sales-play"><ArrowDown/></span></a></div>
    <div className="sales-hero-footnote"><span><Check/></span> Um caminho organizado para quem está começando</div>
   </div>
   <div className="sales-product-stage" aria-label="Prévia ilustrativa da organização dos módulos da plataforma">
    <div className="sales-stage-orbit sales-stage-orbit-one"/><div className="sales-stage-orbit sales-stage-orbit-two"/>
    <div className="sales-stage-card">
     <div className="sales-stage-top"><div className="sales-stage-brand"><span className="sales-stage-mark">C</span><span>O CLONE <b>DIGITAL</b><small>ÁREA DE APRENDIZADO</small></span></div><span className="sales-live"><i/> SUA JORNADA</span></div>
     <div className="sales-stage-welcome"><span>SEU PRÓXIMO PASSO</span><h2>Transforme pesquisa<br/>em direção.</h2><p>Uma etapa de cada vez. Um processo que você consegue acompanhar.</p></div>
     <div className="sales-stage-progress"><div><span>JORNADA DE APRENDIZADO</span><b>07 etapas</b></div><div className="sales-stage-progress-track"><span/></div></div>
     <div className="sales-stage-modules">{modules.slice(0,3).map(([n,title,desc])=><div className={n==="01"?"sales-stage-module is-active":"sales-stage-module"} key={n}><span>{n}</span><div><b>{title}</b><small>{desc}</small></div><span className="sales-stage-arrow"><ArrowUpRight/></span></div>)}</div>
     <div className="sales-stage-bottom"><span><i/> CONTEÚDO ORGANIZADO POR ETAPAS</span><span>OCD / 01</span></div>
    </div>
    <div className="sales-float-note sales-float-note-top"><span className="sales-float-icon"><ArrowUpRight/></span><div><b>Pesquise com intenção</b><small>Organize suas referências</small></div></div>
    <div className="sales-float-note sales-float-note-bottom"><span className="sales-float-check"><Check/></span><div><b>Construa seu processo</b><small>Avance no seu ritmo</small></div></div>
   </div>
  </section>
  <section className="sales-banner-showcase" aria-label="Banner oficial do O Clone Digital">
   <div className="sales-banner-copy"><div className="sales-kicker"><span/> CONHEÇA A PLATAFORMA</div><h2>Seu próximo passo<br/>começa <em>aqui.</em></h2><p>Uma jornada organizada para transformar pesquisa em decisões mais conscientes — no seu ritmo, etapa por etapa.</p><a className="sales-text-link" href="#oferta">Conhecer o acesso <Arrow/></a></div>
   <div className="sales-banner-frame"><img src="/imagens/banner.webp" alt="Banner oficial do O Clone Digital" loading="lazy"/><span className="sales-banner-caption"><i/> O CLONE DIGITAL <b> / </b> SUA JORNADA NO DIGITAL</span></div>
  </section>
  <div className="sales-proof-strip"><div><span>01</span><b>Clareza no caminho</b></div><i/><div><span>02</span><b>Pesquisa com critério</b></div><i/><div><span>03</span><b>Estrutura própria</b></div><i/><div><span>04</span><b>Teste consciente</b></div></div>
  <section className="sales-section sales-method" id="metodo">
   <div className="sales-section-heading"><div><div className="sales-kicker"><span/> A IDEIA POR TRÁS DO MÉTODO</div><h2>Você não precisa<br/>fazer tudo <em>no escuro.</em></h2></div><p>O mercado digital pode parecer confuso quando cada informação está em um lugar. O O Clone Digital organiza as etapas para você entender o que pesquisar, o que observar e qual pode ser o próximo passo.</p></div>
   <div className="sales-method-grid">
    <article className="sales-method-card sales-method-card-featured"><span className="sales-card-index">01 / PESQUISA</span><div className="sales-method-symbol"><SearchIcon/></div><h3>Encontre referências para estudar</h3><p>Aprenda a pesquisar ofertas e anúncios públicos, reunir referências e registrar o que vale investigar melhor.</p><span className="sales-card-line"/></article>
    <article className="sales-method-card"><span className="sales-card-index">02 / ANÁLISE</span><div className="sales-method-symbol"><LayoutIcon/></div><h3>Entenda a estrutura por trás da oferta</h3><p>Observe promessa, público, criativos, página e VSL sem confundir referência com garantia de resultado.</p><span className="sales-card-line"/></article>
    <article className="sales-method-card"><span className="sales-card-index">03 / EXECUÇÃO</span><div className="sales-method-symbol"><ArrowUpRight/></div><h3>Organize uma oferta que seja sua</h3><p>Use o que aprendeu para planejar produto, comunicação e um teste inicial com mais clareza.</p><span className="sales-card-line"/></article>
   </div>
  </section>
  <section className="sales-journey" id="jornada"><div className="sales-journey-head"><div><div className="sales-kicker"><span/> UMA JORNADA EM ETAPAS</div><h2>Do primeiro estudo<br/>ao primeiro <em>teste.</em></h2></div><p>Conteúdo organizado para avançar com consistência, sem pular direto para a parte mais difícil.</p></div>
   <div className="sales-module-list">{modules.map(([n,title,desc])=><article className="sales-module-row" key={n}><span className="sales-module-number">{n}</span><div className="sales-module-copy"><h3>{title}</h3><p>{desc}</p></div><span className="sales-module-arrow"><ArrowUpRight/></span></article>)}</div>
   <p className="sales-journey-note">O conteúdo é educacional. As etapas podem ser ajustadas conforme a evolução do material.</p>
  </section>
  <section className="sales-section sales-fit"><div className="sales-fit-intro"><div className="sales-kicker"><span/> FEITO PARA APRENDER FAZENDO</div><h2>Mais organização.<br/><em>Menos dispersão.</em></h2><p>Uma base para quem quer parar de pular entre ideias e começar a trabalhar com um processo mais claro.</p><a className="sales-text-link" href="#oferta">Quero conhecer a plataforma <Arrow/></a></div>
   <div className="sales-fit-list"><div><span><Check/></span><p><b>Para quem está começando</b><small>Entenda a sequência antes de tentar executar tudo ao mesmo tempo.</small></p></div><div><span><Check/></span><p><b>Para quem precisa de direção</b><small>Organize a pesquisa, as observações e as decisões em etapas.</small></p></div><div><span><Check/></span><p><b>Para quem quer criar algo próprio</b><small>Estude estruturas como referência e desenvolva sua própria comunicação e entrega.</small></p></div><div><span><Check/></span><p><b>Para quem quer testar com consciência</b><small>Prepare-se para avaliar dados e aprender com os testes, sem promessas irreais.</small></p></div></div>
  </section>
  <section className="sales-offer-section" id="oferta"><div className="sales-offer-glow" aria-hidden="true"/><div className="sales-offer-copy"><div className="sales-kicker"><span/> SEU PRÓXIMO PASSO</div><h2>Comece com um plano.<br/><em>Avance com método.</em></h2><p>Conheça a jornada do O Clone Digital e organize o seu próximo passo no mercado digital.</p><div className="sales-offer-checks"><span><Check/> Jornada dividida em 7 etapas</span><span><Check/> Conteúdo educacional e prático</span><span><Check/> Acesso vinculado ao e-mail da compra</span></div></div>
   <div className="sales-offer-card"><div className="sales-offer-card-top"><img src="/imagens/E900F1F7-AFCC-42AA-AA22-F92B83E84AF8.png" alt=""/><span>O CLONE DIGITAL</span></div><div className="sales-offer-name">ACESSO À PLATAFORMA</div><h3>O Clone Digital</h3><p>Uma jornada organizada para pesquisar, analisar, estruturar e testar.</p>
    <div className="sales-offer-pricing"><span className="sales-offer-price-label">CONDIÇÃO ESPECIAL DE LANÇAMENTO</span><div className="sales-offer-price"><span>R$</span> 17<small>,90</small></div><span className="sales-offer-price-note">Pagamento único · Sem mensalidade</span></div>
    {checkoutUrl?<a className="sales-button sales-button-primary sales-buy-button" href={checkoutUrl} target="_blank" rel="noreferrer">Quero acessar agora <Arrow/></a>:<div className="sales-checkout-pending"><b>Checkout SyncPay pendente</b><span>O link oficial de compra ainda precisa ser configurado para ativar a finalização nesta página.</span></div>}
    <Link className="sales-offer-login" href="/login">Já comprou? Entre na área do aluno <Arrow/></Link><div className="sales-offer-secure"><span><ShieldIcon/></span> Compra somente pelo checkout oficial configurado</div>
   </div>
  </section>
  <section className="sales-faq sales-section" id="duvidas"><div className="sales-faq-heading"><div className="sales-kicker"><span/> PERGUNTAS FREQUENTES</div><h2>Antes de <em>começar.</em></h2><p>Informação clara para você decidir com tranquilidade.</p></div><div className="sales-faq-list">{faqs.map(([q,a])=><details key={q} className="sales-faq-item"><summary>{q}<span>+</span></summary><p>{a}</p></details>)}</div></section>
  <footer className="sales-footer"><Link className="sales-brand" href="/"><img src="/imagens/E900F1F7-AFCC-42AA-AA22-F92B83E84AF8.png" alt=""/><span>O CLONE <b>DIGITAL</b><small>LABORATÓRIO DE OFERTAS</small></span></Link><p>Aprendizado, pesquisa e execução com responsabilidade.</p><div><Link href="/login">Área do aluno</Link><a href="#metodo">O método</a><a href="#duvidas">Dúvidas</a></div><small>© {new Date().getFullYear()} O Clone Digital. Conteúdo educacional. Resultados não são garantidos.</small></footer>
 </main>
}