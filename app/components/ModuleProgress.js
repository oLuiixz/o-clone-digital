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
    comingSoon: true,
    items: ["Fundamentos do Vibe Coding", "Criar páginas e ferramentas com IA", "Prompts, revisão e publicação"],
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
    comingSoon: true,
    items: ["Modelo de negócio e fornecedores autorizados", "Atendimento e gestão de clientes", "Custos, renovação e suporte"],
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
          const doneCount = children.filter((module) => completed.includes(module.number)).length;
          return <article className={`learning-track-card ${track.tone === "featured" ? "learning-track-featured" : ""} ${track.tone === "special" ? "learning-track-special" : ""}`} key={track.id}>
            <div className="learning-track-top"><span className="learning-track-number">{track.number}</span><span className="learning-track-eyebrow">{track.eyebrow}</span></div>
            <h3>{track.title}</h3>
            <p className="learning-track-description">{track.description}</p>
            {isMain && <div className="learning-track-progress"><span style={{ width: (children.length ? Math.round(doneCount / children.length * 100) : 0) + "%" }} /></div>}
            <div className="learning-submodules">
              {isMain ? children.map((module, index) => {
                const done = completed.includes(module.number);
                return <div className="learning-submodule" key={module.slug}>
                  <span className={`learning-submodule-index ${done ? "is-done" : ""}`}>{done ? "✓" : String(index + 1).padStart(2, "0")}</span>
                  <a href={`/modulos/${module.slug}`}><b>{module.title}</b><small>{module.description}</small></a>
                  <button type="button" className="learning-submodule-toggle" onClick={() => toggle(module.number)} aria-label={done ? `Desmarcar ${module.title}` : `Marcar ${module.title} como concluído`}>{done ? "Concluído" : "Marcar"}</button>
                </div>;
              }) : track.standalone ? children.map((module) => <a className="learning-submodule learning-submodule-link" href={`/modulos/${module.slug}`} key={module.slug}><span className="learning-submodule-index">↗</span><span><b>{module.title}</b><small>{module.lessons}</small></span><span className="learning-submodule-arrow">↗</span></a>) : track.items.map((item, index) => <div className="learning-submodule learning-submodule-planned" key={item}><span className="learning-submodule-index">{String(index + 1).padStart(2, "0")}</span><span><b>{item}</b><small>Conteúdo previsto para esta trilha</small></span></div>)}
            </div>
            <div className="learning-track-footer">{track.comingSoon ? <span className="learning-coming-soon">Em organização</span> : <span>{doneCount || 0} etapa(s) concluída(s)</span>}{isMain ? <span>{children.length} submódulos</span> : null}</div>
          </article>;
        })}
      </div>
      <p className="learning-footnote">As trilhas em organização mostram a estrutura planejada. Os conteúdos atuais foram preservados; novas aulas serão adicionadas dentro de cada trilha sem apagar o material existente.</p>
    </section>
  </>;
}
