const modules = [
  { number: "01", title: "Entendendo o processo", description: "Conheça o caminho da pesquisa ao primeiro teste.", lessons: "Introdução e mapa do método", status: "Disponível em breve", progress: 0 },
  { number: "02", title: "Mineração de ofertas", description: "Aprenda a pesquisar anúncios e encontrar referências.", lessons: "Biblioteca de Anúncios · Pesquisa · Organização", status: "Em planejamento", progress: 0 },
  { number: "03", title: "Análise da oferta", description: "Entenda a promessa, o público, os criativos e a estrutura.", lessons: "Anúncios · Página · VSL · Diferenciais", status: "Em planejamento", progress: 0 },
  { number: "04", title: "Estrutura e produto", description: "Planeje uma oferta própria a partir das referências estudadas.", lessons: "Produto · Entregável · Posicionamento", status: "Em planejamento", progress: 0 },
  { number: "05", title: "Página de vendas e VSL", description: "Estruture sua comunicação e apresente a oferta com clareza.", lessons: "Roteiro · Página · Revisão", status: "Em planejamento", progress: 0 },
  { number: "06", title: "Primeiro anúncio", description: "Prepare a campanha inicial e entenda como testar com responsabilidade.", lessons: "Criativo · Configuração · Métricas", status: "Em planejamento", progress: 0 },
];

const quickLinks = [
  { icon: "⌕", title: "Minerar ofertas", text: "Pesquisar e salvar referências", module: "MÓDULO 02" },
  { icon: "◫", title: "Analisar uma oferta", text: "Entender os elementos que funcionam", module: "MÓDULO 03" },
  { icon: "✳", title: "Montar minha estrutura", text: "Organizar produto e comunicação", module: "MÓDULO 04" },
];

const navigation = [
  { icon: "home", label: "Início", href: "#inicio" },
  { icon: "modules", label: "Módulos", href: "#modulos" },
  { icon: "files", label: "Documentos", href: "#atalhos" },
  { icon: "settings", label: "Configurações", href: "#progresso" },
];

export default function Home() {
  return (
    <main className="app-shell">
      <aside className="sidebar">
        <a className="brand" href="#inicio" aria-label="O Clone Digital início">
          <span className="brand-mark">C<span>.</span></span>
          <span className="brand-name">O CLONE <b>DIGITAL</b><small>LABORATÓRIO DE OFERTAS</small></span>
        </a>
        <div className="side-label">ESPAÇO DE TRABALHO</div>
        <nav className="navigation" aria-label="Navegação principal">
          <a className="nav-item active" href="#inicio"><span>⌂</span> Visão geral</a>
          <a className="nav-item" href="#modulos"><span>▤</span> Módulos e aulas</a>
          <a className="nav-item" href="#atalhos"><span>⌕</span> Pesquisa de ofertas</a>
          <a className="nav-item" href="#modulos"><span>◈</span> Ferramentas e materiais</a>
          <a className="nav-item" href="#progresso"><span>↗</span> Meu progresso</a>
        </nav>
        <div className="sidebar-bottom">
          <div className="help-card"><span className="help-icon">?</span><div><b>Precisa de ajuda?</b><p>Em breve, um espaço de suporte.</p></div></div>
          <div className="profile"><div className="avatar">CD</div><div className="profile-copy"><b>Minha jornada</b><span>Área do aluno</span></div><span className="profile-menu">···</span></div>
        </div>
      </aside>

      <nav className="mobile-nav" aria-label="Navegação mobile">
        {navigation.map((item, index) => (
          <a className={index === 0 ? "mobile-nav-item active" : "mobile-nav-item"} href={item.href} key={item.label}>
            <span className={`mobile-nav-icon icon-${item.icon}`} aria-hidden="true">
              {item.icon === "home" && <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 3.2 2.8 11a1 1 0 0 0 1.3 1.5l.9-.8v7A2.3 2.3 0 0 0 7.3 21h3.1v-5.5h3.2V21h3.1a2.3 2.3 0 0 0 2.3-2.3v-7l.9.8a1 1 0 0 0 1.3-1.5L12 3.2Z"/></svg>}
              {item.icon === "modules" && <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><rect x="4" y="3.5" width="16" height="17" rx="2"/><path d="M8 8h8M8 12h8M8 16h5"/></svg>}
              {item.icon === "files" && <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="M4 7.5A2.5 2.5 0 0 1 6.5 5H10l2 2h5.5A2.5 2.5 0 0 1 20 9.5v8a2.5 2.5 0 0 1-2.5 2.5h-11A2.5 2.5 0 0 1 4 17.5Z"/><path d="M4 10h16"/></svg>}
              {item.icon === "settings" && <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="3"/><path d="m19.4 15 .1.1 1.1.9-1.1 1.9-1.4-.5a7.7 7.7 0 0 1-1.5.9l-.2 1.5h-2.2l-.4-1.4a7.7 7.7 0 0 1-1.8 0l-.8 1.2-2-.9.3-1.5a7.7 7.7 0 0 1-1.3-1.3l-1.5.3-.9-2 1.2-.8a7.7 7.7 0 0 1 0-1.8l-1.2-.8.9-2 1.5.3a7.7 7.7 0 0 1 1.3-1.3l-.3-1.5 2-.9.8 1.2a7.7 7.7 0 0 1 1.8 0l.4-1.4h2.2l.2 1.5a7.7 7.7 0 0 1 1.5.9l1.4-.5 1.1 1.9-1.1.9a7.7 7.7 0 0 1 0 1.8Z"/></svg>}
            </span>
            <span>{item.label}</span>
          </a>
        ))}
      </nav>

      <section className="main-panel" id="inicio">
        <header className="topbar"><div className="breadcrumb">Área do aluno <span>/</span> <b>Visão geral</b></div><div className="top-actions"><span className="status-dot"></span><span>Plataforma em construção</span><button className="user-button" aria-label="Perfil">CD</button></div></header>
        <div className="content">
          <section className="hero">
            <div className="hero-copy">
              <div className="eyebrow"><span className="eyebrow-line"></span> SUA JORNADA COMEÇA AQUI</div>
              <h1>Da pesquisa à<br /><em>primeira oferta.</em></h1>
              <p>Um passo de cada vez. Aprenda a encontrar referências, entender a estrutura de uma oferta e construir seu próprio processo com método.</p>
              <a className="primary-button" href="#modulos">Explorar módulos <span>↗</span></a>
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

          <section className="stats-grid" id="progresso">
            <div className="stat-card"><span className="stat-label">SEU PROGRESSO</span><div className="stat-main">0<span>%</span></div><div className="stat-foot"><span className="mini-track"><i></i></span> Sua jornada começa agora</div></div>
            <div className="stat-card"><span className="stat-label">TRILHA DE APRENDIZADO</span><div className="stat-main">06<span className="stat-unit"> módulos</span></div><div className="stat-foot">Do básico ao primeiro teste</div></div>
            <div className="stat-card"><span className="stat-label">MATERIAIS PRÁTICOS</span><div className="stat-main">—</div><div className="stat-foot">Checklists e ferramentas em preparação</div></div>
          </section>

          <section className="section-block" id="atalhos">
            <div className="section-heading"><div><div className="eyebrow muted">COMECE POR AQUI</div><h2>O que você quer construir hoje?</h2></div><span className="section-note">ATALHOS DA JORNADA</span></div>
            <div className="quick-grid">{quickLinks.map((item) => <a className="quick-card" href="#modulos" key={item.title}><div className="quick-top"><span className="quick-icon">{item.icon}</span><span className="arrow">↗</span></div><span className="quick-module">{item.module}</span><h3>{item.title}</h3><p>{item.text}</p></a>)}</div>
          </section>

          <section className="section-block modules-section" id="modulos">
            <div className="section-heading"><div><div className="eyebrow muted">TRILHA DE APRENDIZADO</div><h2>Seus módulos</h2></div><span className="section-note">06 ETAPAS PLANEJADAS</span></div>
            <div className="module-list">{modules.map((module) => <article className="module-row" key={module.number}><div className="module-number">{module.number}</div><div className="module-info"><h3>{module.title}</h3><p>{module.description}</p><span className="lesson-meta">{module.lessons}</span></div><div className="module-state"><span className={module.number === "01" ? "state-pill soon" : "state-pill"}><i></i>{module.status}</span><div className="module-progress"><span style={{ width: module.progress + "%" }}></span></div></div><span className="module-arrow">↗</span></article>)}</div>
          </section>
          <footer className="footer"><span>O CLONE DIGITAL <b>© 2026</b></span><span>ENCONTRE. ANALISE. ESTRUTURE. TESTE.</span></footer>
        </div>
      </section>
    </main>
  );
}
