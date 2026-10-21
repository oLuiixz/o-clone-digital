const modules = [
  { number: "01", slug: "entendendo-o-processo", title: "Entendendo o processo", description: "Conheça o caminho da pesquisa ao primeiro teste.", lessons: "Introdução e mapa do método", status: "Disponível", progress: 0 },
  { number: "02", slug: "mineracao-de-ofertas", title: "Mineração de ofertas", description: "Aprenda a pesquisar anúncios e encontrar referências.", lessons: "Biblioteca de Anúncios · Pesquisa · Organização", status: "Disponível", progress: 0 },
  { number: "03", slug: "analise-da-oferta", title: "Análise da oferta", description: "Entenda a promessa, o público, os criativos e a estrutura.", lessons: "Anúncios · Página · VSL · Diferenciais", status: "Disponível", progress: 0 },
  { number: "04", slug: "estrutura-e-produto", title: "Estrutura e produto", description: "Planeje uma oferta própria a partir das referências estudadas.", lessons: "Produto · Entregável · Posicionamento", status: "Disponível", progress: 0 },
  { number: "05", slug: "pagina-de-vendas-e-vsl", title: "Página de vendas e VSL", description: "Estruture sua comunicação e apresente a oferta com clareza.", lessons: "Roteiro · Página · Revisão", status: "Disponível", progress: 0 },
  { number: "06", slug: "primeiro-anuncio", title: "Primeiro anúncio", description: "Prepare a campanha inicial e entenda como testar com responsabilidade.", lessons: "Criativo · Configuração · Métricas", status: "Disponível", progress: 0 },
  { number: "07", slug: "integracao-e-entrega", title: "Integração e entrega", description: "Organize pagamento, confirmação, acesso ao produto e suporte ao comprador.", lessons: "Checkout · Automação · Acesso · Pós-venda", status: "Disponível", progress: 0 },
  { number: "08", slug: "subindo-caixa", title: "Subindo Caixa", description: "Explore caminhos práticos para criar renda no digital e transformar habilidades em ofertas.", lessons: "O método 🔥 · Serviços digitais · Afiliados · Produto próprio", status: "Novo módulo", progress: 0 },
  { number: "09", slug: "nicho-hot", title: "🔥 Nicho HOT 🔞", description: "Explore oportunidades no mercado adulto com estratégia, responsabilidade e foco em ofertas legais.", lessons: "Pesquisa de mercado · Oferta · Aquisição de tráfego · Conversão · Compliance", status: "Novo módulo", progress: 0 },
  { number: "10", slug: "clonagem-de-oferta", title: "Clonagem de Oferta", description: "Da mineração à entrega: estruture uma oferta própria com um processo completo.", lessons: "Processo · Mineração · Análise · Produto · Página/VSL · Anúncio · Entrega", status: "Novo módulo", progress: 0 },
  { number: "11", slug: "vibe-coding", title: "Vibe Coding (IA)", description: "Crie sites, sistemas e produtos digitais com ChatGPT e ferramentas de desenvolvimento.", lessons: "ChatGPT · GitHub · Vercel · Neon · Supabase · Resend · Apify · UI", status: "Novo módulo", progress: 0 },
  { number: "12", slug: "revenda-streaming", title: "Revenda Streaming", description: "Estruture uma operação de IPTV com fornecedores autorizados, painéis, clientes e receita recorrente.", lessons: "Fornecedores · Painéis · Clientes · Renovações · Vendas", status: "Novo módulo", progress: 0 },
  { number: "13", slug: "dinheiro-facebook", title: "Dinheiro com Facebook (Orgânico)", description: "Crie conteúdo original, construa comunidade e explore monetização orgânica responsável.", lessons: "Páginas · Reels · Stories · Conteúdo · Monetização · Analytics", status: "Novo módulo", progress: 0 },
  { number: "14", slug: "dinheiro-tiktok", title: "Dinheiro com TikTok (Orgânico)", description: "Aprenda conteúdo curto, retenção e oportunidades de monetização orgânica.", lessons: "Posicionamento · Ganchos · Vídeos · Comunidade · Monetização", status: "Novo módulo", progress: 0 },
  { number: "15", slug: "ecommerce", title: "Ecommerce", description: "Aprenda a planejar uma loja virtual, trabalhar com Shopify e organizar vendas, operação e métricas.", lessons: "Nicho · Shopify · Catálogo · Pagamentos · Marketing · Métricas · Lançamento", status: "Novo módulo", progress: 0 },
  { number: "16", slug: "estrutura-dark", title: "Estrutura Dark", description: "Organize referências, posicionamento e a estrutura de um projeto digital com uma jornada dedicada.", lessons: "Estrutura · Referências · Conteúdo validado · Prompts", status: "Novo módulo", progress: 0 },
];

const quickLinks = [
  { icon: "search", title: "Minerar ofertas", text: "Pesquisar e salvar referências", module: "MÓDULO 02", slug: "mineracao-de-ofertas" },
  { icon: "chart", title: "Analisar uma oferta", text: "Entender os elementos que funcionam", module: "MÓDULO 03", slug: "analise-da-oferta" },
  { icon: "layers", title: "Montar minha estrutura", text: "Organizar produto e comunicação", module: "MÓDULO 04", slug: "estrutura-e-produto" },
];

const navigation = [
  { icon: "home", label: "Início", href: "#inicio" },
  { icon: "modules", label: "Módulos", href: "#modulos" },
  { icon: "files", label: "Ferramentas", href: "/ferramentas" },
  { icon: "community", label: "Comunidade", href: "/comunidade" },
  { icon: "settings", label: "Configurações", href: "/configuracoes" },
];


function Icon({ name, size = 18 }) {
  const common = { width: size, height: size, viewBox: "0 0 24 24", fill: "none", stroke: "currentColor", strokeWidth: 1.7, strokeLinecap: "round", strokeLinejoin: "round", "aria-hidden": true, focusable: "false" };
  const paths = {
    home: <><path d="m3 10 9-7 9 7" /><path d="M5 9v11h14V9M9 20v-6h6v6" /></>,
    modules: <><rect x="4" y="3" width="16" height="18" rx="2" /><path d="M8 8h8M8 12h8M8 16h5" /></>,
    files: <><path d="M4 7.5A2.5 2.5 0 0 1 6.5 5H10l2 2h5.5A2.5 2.5 0 0 1 20 9.5v8a2.5 2.5 0 0 1-2.5 2.5h-11A2.5 2.5 0 0 1 4 17.5Z" /><path d="M4 10h16" /></>,
    community: <><path d="M20 11.5a7.5 7.5 0 0 1-7.5 7.5H5l-2 2v-9.5A7.5 7.5 0 0 1 10.5 4H12a8 8 0 0 1 8 7.5Z" /><path d="M8 11h.01M12 11h.01M16 11h.01" /></>,
    settings: <><circle cx="12" cy="12" r="3" /><path d="M19.4 15a1.7 1.7 0 0 0 .3 1.9l.1.1-1.8 1.8-.1-.1a1.7 1.7 0 0 0-1.9-.3 1.7 1.7 0 0 0-1 1.5v.2h-2.6v-.2a1.7 1.7 0 0 0-1-1.5 1.7 1.7 0 0 0-1.9.3l-.1.1-1.8-1.8.1-.1a1.7 1.7 0 0 0 .3-1.9 1.7 1.7 0 0 0-1.5-1H6.3v-2.6h.2a1.7 1.7 0 0 0 1.5-1 1.7 1.7 0 0 0-.3-1.9l-.1-.1 1.8-1.8.1.1a1.7 1.7 0 0 0 1.9.3 1.7 1.7 0 0 0 1-1.5v-.2H15v.2a1.7 1.7 0 0 0 1 1.5 1.7 1.7 0 0 0 1.9-.3l.1-.1 1.8 1.8-.1.1a1.7 1.7 0 0 0-.3 1.9 1.7 1.7 0 0 0 1.5 1h.2v2.6h-.2a1.7 1.7 0 0 0-1.5 1Z" /></>,
    search: <><circle cx="10.8" cy="10.8" r="6.3" /><path d="m16 16 4.2 4.2" /></>,
    chart: <><path d="M4 19V5M4 19h16" /><path d="m7 15 4-4 3 2 5-6" /><path d="M16 7h3v3" /></>,
    layers: <><path d="m12 3 9 5-9 5-9-5 9-5Z" /><path d="m3 12 9 5 9-5M3 16l9 5 9-5" /></>,
    arrow: <><path d="M7 17 17 7M8 7h9v9" /></>,
    help: <><circle cx="12" cy="12" r="9" /><path d="M9.6 9a2.5 2.5 0 1 1 4.2 1.8c-1.1 1-1.8 1.3-1.8 2.7M12 17h.01" /></>,
    more: <><circle cx="5" cy="12" r="1" /><circle cx="12" cy="12" r="1" /><circle cx="19" cy="12" r="1" /></>
  };
  return <svg {...common}>{paths[name] || paths.layers}</svg>;
}

import ModuleProgress from "../components/ModuleProgress";
import MemberFeedback from "../components/MemberFeedback";
import CommunityUnreadBadge from "../components/CommunityUnreadBadge";
import { redirect } from "next/navigation";
import { getCurrentMember } from "../../lib/member-auth";

export default async function Home() {
  const member = await getCurrentMember();
  if (!member) redirect("/login");
  const muxPlaybackId = process.env.NEXT_PUBLIC_MUX_INTRO_PLAYBACK_ID?.trim();
  const streamableIntroVideoId = process.env.NEXT_PUBLIC_STREAMABLE_INTRO_VIDEO_ID?.trim() || "9xrXdsYz";
  const hasMuxIntroVideo = Boolean(muxPlaybackId && /^[a-zA-Z0-9_-]+$/.test(muxPlaybackId));
  const hasStreamableIntroVideo = /^[a-zA-Z0-9_-]+$/.test(streamableIntroVideoId);
  const hasIntroVideo = hasMuxIntroVideo || hasStreamableIntroVideo;
  const introVideoSrc = hasMuxIntroVideo
    ? `https://player.mux.com/${muxPlaybackId}`
    : `https://streamable.com/e/${streamableIntroVideoId}?autoplay=0`;
  return (
    <main className="app-shell">
      <aside className="sidebar">
        <a className="brand" href="#inicio" aria-label="O Clone Digital início">
          <img className="brand-logo" src="/imagens/logo-clone-digital.svg" alt="O Clone Digital" />
          <span className="brand-name">O CLONE <b>DIGITAL</b><small>LABORATÓRIO DE OFERTAS</small></span>
        </a>
        <div className="side-label">ESPAÇO DE TRABALHO</div>
        <nav className="navigation" aria-label="Navegação principal">
          <a className="nav-item active" href="#inicio"><span><Icon name="home" /></span> Visão geral</a>
          <a className="nav-item" href="#modulos"><span><Icon name="modules" /></span> Módulos e aulas</a>
          <a className="nav-item" href="#atalhos"><span><Icon name="search" /></span> Pesquisa de ofertas</a>
          <a className="nav-item" href="/ferramentas"><span><Icon name="layers" /></span> Ferramentas</a>
          <a className="nav-item clone-awards-nav" href="/clone-awards"><span><Icon name="chart" /></span> Clone Awards <span className="clone-awards-tag">NOVO</span></a>
          <a className="nav-item" href="/comunidade"><span><Icon name="community" /></span>Comunidade<CommunityUnreadBadge memberId={member.id} /></a>
          <a className="nav-item" href="#progresso"><span><Icon name="chart" /></span> Meu progresso</a>
          <a className="nav-item" href="/configuracoes"><span><Icon name="settings" /></span> Configurações</a>
        </nav>
        <div className="sidebar-bottom">
          <div className="help-card"><span className="help-icon"><Icon name="help" size={15} /></span><div className="help-copy"><b>Precisa de ajuda?</b><p>Fale com nossa comunidade.</p><a className="help-support-link" href="/comunidade">Fale com suporte <Icon name="arrow" size={12} /></a></div></div>
          <div className="profile"><div className="avatar">{member.photo_data ? <img src={member.photo_data} alt="" /> : (member.display_name || "Minha jornada").trim().slice(0,2).toUpperCase()}</div><div className="profile-copy"><b>{member.display_name || "Minha jornada"}</b><span>Área do aluno</span></div><span className="profile-menu"><Icon name="more" size={18} /></span></div>
        </div>
      </aside>

      <nav className="mobile-nav" aria-label="Navegação mobile">
        {navigation.map((item, index) => (
          <a className={index === 0 ? "mobile-nav-item active" : "mobile-nav-item"} href={item.href} key={item.label}>
            <span className={`mobile-nav-icon icon-${item.icon}`} aria-hidden="true">
              {item.icon === "home" && <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 3.2 2.8 11a1 1 0 0 0 1.3 1.5l.9-.8v7A2.3 2.3 0 0 0 7.3 21h3.1v-5.5h3.2V21h3.1a2.3 2.3 0 0 0 2.3-2.3v-7l.9.8a1 1 0 0 0 1.3-1.5L12 3.2Z"/></svg>}
              {item.icon === "modules" && <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><rect x="4" y="3.5" width="16" height="17" rx="2"/><path d="M8 8h8M8 12h8M8 16h5"/></svg>}
              {item.icon === "files" && <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="M4 7.5A2.5 2.5 0 0 1 6.5 5H10l2 2h5.5A2.5 2.5 0 0 1 20 9.5v8a2.5 2.5 0 0 1-2.5 2.5h-11A2.5 2.5 0 0 1 4 17.5Z"/><path d="M4 10h16"/></svg>}
              {item.icon === "community" && <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="M20 11.5a7.5 7.5 0 0 1-7.5 7.5H5l-2 2v-9.5A7.5 7.5 0 0 1 10.5 4H12a8 8 0 0 1 8 7.5Z"/><path d="M8 11h.01M12 11h.01M16 11h.01"/></svg>}
              {item.icon === "settings" && <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="3"/><path d="m19.4 15 .1.1 1.1.9-1.1 1.9-1.4-.5a7.7 7.7 0 0 1-1.5.9l-.2 1.5h-2.2l-.4-1.4a7.7 7.7 0 0 1-1.8 0l-.8 1.2-2-.9.3-1.5a7.7 7.7 0 0 1-1.3-1.3l-1.5.3-.9-2 1.2-.8a7.7 7.7 0 0 1 0-1.8l-1.2-.8.9-2 1.5.3a7.7 7.7 0 0 1 1.3-1.3l-.3-1.5 2-.9.8 1.2a7.7 7.7 0 0 1 1.8 0l.4-1.4h2.2l.2 1.5a7.7 7.7 0 0 1 1.5.9l1.4-.5 1.1 1.9-1.1.9a7.7 7.7 0 0 1 0 1.8Z"/></svg>}
            </span>
            <span>{item.label}</span>{item.icon === "community" && <CommunityUnreadBadge memberId={member.id} mobile />}
          </a>
        ))}
      </nav>

      <section className="main-panel" id="inicio">
        <header className="topbar"><div className="breadcrumb">Área do aluno <span>/</span> <b>Visão geral</b></div><div className="top-actions"><span className="status-dot"></span><span>Plataforma em construção</span><a className="user-button" aria-label="Configurações do perfil" href="/configuracoes">{member.photo_data ? <img src={member.photo_data} alt="" /> : (member.display_name || "Minha jornada").trim().slice(0,2).toUpperCase()}</a></div></header>
        <div className="content">
          <section className="hero">
            <img className="hero-banner-image" src="/imagens/banner.webp" alt="O Clone Digital — Encontre, analise, estruture e teste" />
            <div className="hero-copy">
              <div className="eyebrow"><span className="eyebrow-line"></span> SUA JORNADA COMEÇA AQUI</div>
              <h1>Da pesquisa à<br /><em>primeira oferta.</em></h1>
              <p>Um passo de cada vez. Aprenda a encontrar referências, entender a estrutura de uma oferta e construir seu próprio processo com método.</p>
              <a className="primary-button" href="#modulos">Explorar módulos <span><Icon name="arrow" size={15} /></span></a>
            </div>
            <div className="hero-art" aria-hidden="true">
              <div className="orbit orbit-one"></div><div className="orbit orbit-two"></div><div className="orbit orbit-three"></div>
              <div className="core"><span>C</span><small>ESTRUTURE</small></div>
              <div className="floating-chip chip-top"><span>01</span> PESQUISAR</div>
              <div className="floating-chip chip-right"><span>02</span> ANALISAR</div>
              <div className="floating-chip chip-bottom"><span>03</span> TESTAR</div>
            </div>
            <div className="hero-index">OCD / 001</div>
          </section>

          <section className="intro-section" aria-labelledby="intro-title">
            <div className="intro-heading">
              <div><div className="eyebrow muted">COMECE POR AQUI</div><h2 id="intro-title">Introdução ao Clone Digital</h2><p>Veja como navegar pela plataforma, encontrar as aulas e aproveitar cada ferramenta da sua jornada.</p></div>
              <span className="intro-badge">VÍDEO-GUIA</span>
            </div>
            <div className="intro-player">
              {hasIntroVideo ? (
                <iframe src={introVideoSrc} title="Introdução ao Clone Digital" loading="lazy" referrerPolicy="strict-origin-when-cross-origin" allow="autoplay; encrypted-media; picture-in-picture; fullscreen" allowFullScreen />
              ) : (
                <div className="intro-placeholder"><span>▶</span><div><b>Seu vídeo de boas-vindas aparecerá aqui.</b><p>O vídeo de introdução será carregado aqui assim que o player estiver disponível.</p></div></div>
              )}
            </div>
          </section>

          <ModuleProgress modules={modules} />

          <section className="section-block clone-awards-promo"><div className="clone-awards-promo-card"><div className="clone-awards-promo-copy"><span className="eyebrow muted">NOVIDADE · DESAFIOS E RANKING</span><h2>Seu próximo nível começa aqui.</h2><p>Escolha sua trilha, conclua desafios e ganhe XP com evidências aprovadas pela equipe.</p><a className="primary-button" href="/clone-awards">Entrar no Clone Awards <span><Icon name="arrow" size={15} /></span></a></div><div className="clone-awards-promo-score"><span>15</span><small>NÍVEIS</small><i></i><span>15.000</span><small>XP MÁXIMO</small></div></div></section>

          <section className="section-block" id="atalhos">
            <div className="section-heading"><div><div className="eyebrow muted">COMECE POR AQUI</div><h2>O que você quer construir hoje?</h2></div><span className="section-note">ATALHOS DA JORNADA</span></div>
            <div className="quick-grid">{quickLinks.map((item) => <a className="quick-card" href={`/modulos/${item.slug}`} key={item.title}><div className="quick-top"><span className="quick-icon"><Icon name={item.icon} size={19} /></span><span className="arrow"><Icon name="arrow" size={16} /></span></div><span className="quick-module">{item.module}</span><h3>{item.title}</h3><p>{item.text}</p></a>)}</div>
          </section>

          <MemberFeedback />

          <footer className="footer"><span>O CLONE DIGITAL <b>© 2026</b></span><span>ENCONTRE. ANALISE. ESTRUTURE. TESTE.</span></footer>
        </div>
      </section>
    </main>
  );
}
