"use client";

import { useEffect, useState } from "react";

const STORAGE_KEY = "clone-digital-module-progress";

export default function ModuleProgress({ modules }) {
  const [completed, setCompleted] = useState([]);
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    try {
      const saved = JSON.parse(localStorage.getItem(STORAGE_KEY) || "[]");
      if (Array.isArray(saved)) setCompleted(saved);
    } catch {}
    setLoaded(true);
  }, []);

  function toggle(number) {
    setCompleted((current) => {
      const next = current.includes(number)
        ? current.filter((item) => item !== number)
        : [...current, number];
      try { localStorage.setItem(STORAGE_KEY, JSON.stringify(next)); } catch {}
      return next;
    });
  }

  const percent = Math.round((completed.length / modules.length) * 100);

  return <>
    <section className="stats-grid" id="progresso">
      <div className="stat-card"><span className="stat-label">SEU PROGRESSO</span><div className="stat-main">{loaded ? percent : 0}<span>%</span></div><div className="stat-foot"><span className="mini-track"><i style={{width: (loaded ? percent : 0) + "%"}} /></span>{completed.length} de {modules.length} módulos concluídos</div></div>
      <div className="stat-card"><span className="stat-label">TRILHA DE APRENDIZADO</span><div className="stat-main">07<span className="stat-unit"> módulos</span></div><div className="stat-foot">Do básico ao primeiro teste</div></div>
      <div className="stat-card"><span className="stat-label">MATERIAIS PRÁTICOS</span><div className="stat-main">06</div><div className="stat-foot">Roteiros e exercícios para aplicar</div></div>
    </section>
    <div className="module-list">{modules.map((module) => {
      const done = completed.includes(module.number);
      return <div className="module-row" key={module.number}>
        <div className="module-number">{module.number}</div>
        <a className="module-info" href={`/modulos/${module.slug}`}><h3>{module.title}</h3><p>{module.description}</p><span className="lesson-meta">{module.lessons}</span></a>
        <div className="module-state"><span className={done ? "state-pill completed" : "state-pill"}><i></i>{done ? "Concluído" : "Disponível"}</span><div className="module-progress"><span style={{width: done ? "100%" : "0%"}} /></div><button type="button" className="module-complete-button" onClick={() => toggle(module.number)}>{done ? "Desmarcar conclusão" : "Marcar como concluído"}</button></div>
        <a className="module-arrow" href={`/modulos/${module.slug}`} aria-label={`Abrir módulo ${module.number}`}>↗</a>
      </div>;
    })}</div>
  </>;
}