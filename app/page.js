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

export default function Home() {
  return (
    <main className="app-shell">
      <aside className="sidebar">
        <a className="brand" href="#" aria-label="O Clone Digital início">
          <span className="brand-mark">C<span>.</span></span>
          <span className="brand-name">O CLONE <b>DIGITAL</b><small>LABORATÓRIO DE OFERTAS</small></span>
        </a>
        <div className="side-label">ESPAÇO DE TRABALHO</div>
        <nav className="navigation">
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
