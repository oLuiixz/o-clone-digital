"use client";

import { useEffect, useState } from "react";

const STORAGE_KEY = "clone-digital-module-progress";

const tracks = [
  {
    id: "estrutura-dark",
    number: "01",
    title: "Estrutura Dark",
    eyebrow: "TRILHA PRINCIPAL",
    description: "Construa um negócio digital sem precisar aparecer: da pesquisa de ofertas à estrutura e ao primeiro teste.",
    tone: "featured",
    modules: ["entendendo-o-processo", "mineracao-de-ofertas", "analise-da-oferta", "estrutura-e-produto", "pagina-de-vendas-e-vsl", "primeiro-anuncio", "integracao-e-entrega"],
  },
  {
    id: "vibe-coding",
    number: "02",
    title: "Vibe Coding",
    eyebrow: "CRIAÇÃO COM IA",
    description: "Use inteligência artificial para planejar, criar e melhorar páginas, ferramentas e produtos digitais.",
    tone: "standard",
    standalone: true,
    slug: "vibe-coding",
    items: ["ChatGPT · prompts e desenvolvimento", "GitHub · versionamento", "Vercel · deploy", "Neon e Supabase · banco de dados", "Resend · e-mails", "Apify · APIs", "21st.dev e Uiverse · componentes"],
  },
  {
    id: "afiliados",
    number: "03",
    title: "Afiliados",
    eyebrow: "AQUISIÇÃO E COMISSÕES",
    description: "Aprenda a escolher produtos, construir uma estratégia de conteúdo e divulgar links de afiliado com transparência.",
    tone: "standard",
    comingSoon: true,
    items: ["Escolha de produtos e plataformas", "Conteúdo e distribuição", "Links, métricas e otimização"],
  },
  {
    id: "revenda-streaming",
    number: "04",
    title: "Revenda Streaming",
    eyebrow: "NEGÓCIO DE RECORRÊNCIA",
    description: "Organize uma operação de revenda de serviços de streaming somente com fornecedores autorizados e modelos permitidos.",
    tone: "standard",
    standalone: true,
    slug: "revenda-streaming",
    items: ["IPTV e fornecedores autorizados", "Painéis e gestão de clientes", "Planos, renovações e lucratividade"],
  },
  {
    id: "dinheiro-facebook",
    number: "07",
    title: "Dinheiro com Facebook (Orgânico)",
    eyebrow: "CONTEÚDO E MONETIZAÇÃO",
    description: "Crie conteúdo original, desenvolva uma comunidade e explore formas responsáveis de monetização orgânica.",
    tone: "standard",
    standalone: true,
    slug: "dinheiro-facebook",
    items: ["Posicionamento e conteúdo", "Reels, Stories e posts", "Monetização e métricas"],
  },
  {
    id: "dinheiro-tiktok",
    number: "08",
    title: "Dinheiro com TikTok (Orgânico)",
    eyebrow: "VÍDEO CURTO E COMUNIDADE",
    description: "Aprenda ganchos, retenção, consistência e caminhos de monetização sem depender de anúncios.",
    tone: "standard",
    standalone: true,
    slug: "dinheiro-tiktok",
    items: ["Roteiros e retenção", "Comunidade e analytics", "Monetização responsável"],
  },
  {
    id: "subindo-caixa",
    number: "05",
    title: "Subindo Caixa",
    eyebrow: "OPORTUNIDADES PRÁTICAS",
    description: "Explore caminhos para gerar renda, desenvolver habilidades e transformar serviços ou ideias em ofertas.",
    tone: "standard",
    standalone: true,
    slug: "subindo-caixa",
    items: ["O método", "Serviços digitais", "Afiliados e produto próprio"],
  },
  {
    id: "nicho-hot",
    number: "06",
    title: "Nicho HOT",
    eyebrow: "TRILHA ESPECIALIZADA · 18+",
    description: "Pesquise o mercado adulto e estruture uma operação com foco em privacidade, consentimento e conformidade.",
    tone: "special",
    standalone: true,
    slug: "nicho-hot",
    items: ["Pesquisa de mercado", "Estrutura da oferta", "Aquisição e operação responsável"],
  },
  {
    id: "clonagem-de-oferta",
    number: "09",
    title: "Clonagem de Oferta",
    eyebrow: "PROCESSO COMPLETO",
    description: "Da mineração à entrega: analise referências e construa uma oferta própria, com etapas práticas e organizadas.",
    tone: "standard",
    standalone: true,
    slug: "clonagem-de-oferta",
    items: ["Entenda o processo", "Mineração e análise", "Produto, página e VSL", "Anúncio, integração e entrega"],
  },

];

export default function ModuleProgress({ modules }) {
  const [completed, setCompleted] = useState([]);
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    try {
      const saved = JSON.parse(localStorage.getItem(STORAGE_KEY) || "[]");
      const validNumbers = new Set(modules.map((module) => module.number));
      if (Array.isArray(saved)) setCompleted([...new Set(saved.filter((number) => validNumbers.has(number)))]);
    } catch {
      setCompleted([]);
    }
    setLoaded(true);
  }, [modules]);

  useEffect(() => {
    if (!loaded) return;
    try { localStorage.setItem(STORAGE_KEY, JSON.stringify(completed)); } catch {}
  }, [completed, loaded]);

  function toggle(number) {
    setCompleted((current) => current.includes(number) ? current.filter((item) => item !== number) : [...current, number]);
  }

  const percent = modules.length ? Math.round((completed.length / modules.length) * 100) : 0;
  const mainModules = tracks[0].modules.map((slug) => modules.find((module) => module.slug === slug)).filter(Boolean);
  const standaloneModules = tracks.filter((track) => track.standalone).map((track) => modules.find((module) => module.slug === track.slug)).filter(Boolean);
  const allTrackedModules = [...mainModules, ...standaloneModules];
  const completedTracked = allTrackedModules.filter((module) => completed.includes(module.number)).length;

  return <>
    <section className="stats-grid" id="progresso">
      <div className="stat-card"><span className="stat-label">SEU PROGRESSO</span><div className="stat-main">{loaded ? percent : 0}<span>%</span></div><div className="stat-foot"><span className="mini-track"><i style={{ width: (loaded ? percent : 0) + "%" }} /></span>{completed.length} de {modules.length} aulas/módulos marcados</div></div>
      <div className="stat-card"><span className="stat-label">TRILHAS ORGANIZADAS</span><div className="stat-main">06<span className="stat-unit"> trilhas</span></div><div className="stat-foot">Escolha um caminho e avance por etapas</div></div>
      <div className="stat-card"><span className="stat-label">ESTRUTURA DARK</span><div className="stat-main">{completedTracked}<span className="stat-unit"> / {allTrackedModules.length}</span></div><div className="stat-foot">Etapas concluídas na trilha principal e extras</div></div>
    </section>

    <section className="section-block modules-section organized-learning" id="modulos">
      <div className="section-heading"><div><div className="eyebrow muted">MAPA DE APRENDIZADO</div><h2>Escolha sua trilha</h2></div><span className="section-note">CONTEÚDO POR OBJETIVO</span></div>
      <p className="learning-intro">Cada trilha reúne módulos menores em uma sequência lógica. A Estrutura Dark é o caminho principal; as outras trilhas organizam especializações e novas formas de gerar receita.</p>
      <div className="learning-track-grid">
        {tracks.map((track) => {
          const isMain = track.id === "estrutura-dark";
          const children = isMain ? mainModules : track.standalone ? modules.filter((module) => module.slug === track.slug) : [];
          const count = isMain ? children.length : track.standalone ? children.length : track.items.length;
          const countLabel = isMain || track.standalone ? `${String(count).padStart(2, "0")} módulo${count === 1 ? "" : "s"}` : `${String(count).padStart(2, "0")} tópicos previstos`;
          const doneCount = children.filter((module) => completed.includes(module.number)).length;
          return <a className={`learning-track-card learning-track-compact ${track.tone === "featured" ? "learning-track-featured" : ""} ${track.tone === "special" ? "learning-track-special" : ""}`} href={isMain ? "/modulos/estrutura-dark" : track.standalone ? `/modulos/${track.slug}` : "#"} key={track.id} onClick={(event) => { if (track.comingSoon) event.preventDefault(); }}>
            <div className="learning-track-top"><span className="learning-track-number">{track.number}</span><span className="learning-track-eyebrow">{track.eyebrow}</span></div>
            <h3>{track.title}</h3>
            <p className="learning-track-description">{track.description}</p>
            <div className="learning-track-meta"><span className="learning-track-count">{countLabel}</span>{isMain && <span className="learning-track-done">{doneCount}/{count} concluídos</span>}{track.comingSoon && <span className="learning-coming-soon">Em organização</span>}</div>
            {isMain && <div className="learning-track-progress"><span style={{ width: (children.length ? Math.round(doneCount / children.length * 100) : 0) + "%" }} /></div>}
            <div className="learning-track-open">{track.comingSoon ? "Conteúdo em breve" : "Explorar trilha"} <span>↗</span></div>
          </a>;
        })}
      </div>
      <p className="learning-footnote">As trilhas em organização mostram a estrutura planejada. Os conteúdos atuais foram preservados; novas aulas serão adicionadas dentro de cada trilha sem apagar o material existente.</p>
    </section>
  </>;
}
