"use client";

import { useEffect, useMemo, useState } from "react";
import ModuleCompletion from "../../components/ModuleCompletion";

const SHOPIFY_URL = "https://shopify.pxf.io/yqXkRD";
const DSERS_URL = "https://www.dsers.com/partner/2125193142631202816?origin=subscription";
const STORAGE_KEY = "oclone-ecommerce-lessons-v1";

function inline(text, keyPrefix) {
  const pattern = /(\[[^\]]+\]\(https?:\/\/[^)]+\)|\*\*[^*]+\*\*|`[^`]+`)/g;
  return text.split(pattern).filter(Boolean).map((part, index) => {
    const key = keyPrefix + "-" + index;
    const link = part.match(/^\[([^\]]+)\]\((https?:\/\/[^)]+)\)$/);
    if (link) return <a key={key} href={link[2]} target="_blank" rel="noreferrer">{link[1]}</a>;
    if (part.startsWith("**") && part.endsWith("**")) return <strong key={key}>{part.slice(2, -2)}</strong>;
    if (part.startsWith("`") && part.endsWith("`")) return <code key={key}>{part.slice(1, -1)}</code>;
    return part;
  });
}

function renderMarkdown(markdown, prefix) {
  const lines = markdown.split(/\r?\n/);
  const nodes = [];
  let i = 0;
  while (i < lines.length) {
    const line = lines[i].trim();
    if (!line) { i++; continue; }
    if (/^###\s/.test(line)) {
      nodes.push(<h4 key={prefix + "-h-" + i}>{inline(line.replace(/^###\s+/, ""), prefix + "-hi-" + i)}</h4>);
      i++; continue;
    }
    if (line.startsWith(">")) {
      const quote = [];
      while (i < lines.length && lines[i].trim().startsWith(">")) {
        quote.push(lines[i].trim().replace(/^>\s?/, ""));
        i++;
      }
      nodes.push(<blockquote key={prefix + "-q-" + i}>{quote.map((q, j) => <p key={j}>{inline(q, prefix + "-qi-" + j)}</p>)}</blockquote>);
      continue;
    }
    if (line.includes("|") && i + 1 < lines.length && /^\s*\|?\s*:?-{2,}/.test(lines[i + 1])) {
      const rows = [];
      rows.push(line.split("|").map((cell) => cell.trim()).filter((cell, index, arr) => !(index === 0 && cell === "") && !(index === arr.length - 1 && cell === "")));
      i += 2;
      while (i < lines.length && lines[i].includes("|") && lines[i].trim()) {
        rows.push(lines[i].split("|").map((cell) => cell.trim()).filter((cell, index, arr) => !(index === 0 && cell === "") && !(index === arr.length - 1 && cell === "")));
        i++;
      }
      nodes.push(<div className="course-table-wrap" key={prefix + "-table-" + i}><table><thead><tr>{rows[0].map((cell, j) => <th key={j}>{inline(cell, prefix + "-th-" + j)}</th>)}</tr></thead><tbody>{rows.slice(1).map((row, r) => <tr key={r}>{row.map((cell, j) => <td key={j}>{inline(cell, prefix + "-td-" + r + "-" + j)}</td>)}</tr>)}</tbody></table></div>);
      continue;
    }
    if (/^[-*]\s/.test(line) || /^\d+\.\s/.test(line)) {
      const items = [];
      const ordered = /^\d+\.\s/.test(line);
      while (i < lines.length && (/^\s*[-*]\s/.test(lines[i]) || /^\s*\d+\.\s/.test(lines[i]))) {
        const raw = lines[i].trim();
        const task = raw.match(/^[-*]\s+\[([ xX])\]\s+(.*)$/);
        const value = task ? task[2] : raw.replace(/^[-*]\s+/, "").replace(/^\d+\.\s+/, "");
        items.push({ value, checked: task ? task[1].toLowerCase() === "x" : null });
        i++;
      }
      const ListTag = ordered ? "ol" : "ul";
      nodes.push(<ListTag key={prefix + "-list-" + i}>{items.map((item, j) => <li key={j}>{item.checked !== null && <span className="course-static-check" aria-hidden="true">{item.checked ? "✓" : ""}</span>}{inline(item.value, prefix + "-li-" + j)}</li>)}</ListTag>);
      continue;
    }
    const paragraph = [line];
    i++;
    while (i < lines.length && lines[i].trim() && !/^(###\s|>|[-*]\s|\d+\.\s)/.test(lines[i].trim())) {
      if (lines[i].includes("|") && i + 1 < lines.length && /^\s*\|?\s*:?-{2,}/.test(lines[i + 1])) break;
      paragraph.push(lines[i].trim());
      i++;
    }
    nodes.push(<p key={prefix + "-p-" + i}>{paragraph.map((part, j) => <span key={j}>{j > 0 ? " " : ""}{inline(part, prefix + "-pi-" + i + "-" + j)}</span>)}</p>);
  }
  return nodes;
}

function parseModule(module) {
  const lines = module.markdown.split(/\r?\n/);
  const firstHeading = lines.findIndex((line) => line.startsWith("## "));
  const introLines = lines.slice(1, firstHeading < 0 ? lines.length : firstHeading).filter((line) => !/^\s*\*.*\*\s*$/.test(line));
  const intro = introLines.join("\n").trim();
  const sections = [];
  let current = null;
  for (const line of lines.slice(firstHeading < 0 ? lines.length : firstHeading)) {
    if (line.startsWith("## ")) {
      if (current) sections.push(current);
      current = { title: line.replace(/^##\s+/, "").trim(), markdown: "" };
    } else if (current) {
      current.markdown += line + "\n";
    }
  }
  if (current) sections.push(current);
  return { ...module, intro, lessons: sections };
}

export default function EcommerceCourseExperience({ modules }) {
  const parsedModules = useMemo(() => modules.map(parseModule), [modules]);
  const allLessons = useMemo(() => parsedModules.flatMap((module, moduleIndex) => module.lessons.map((lesson, lessonIndex) => ({ key: module.id + ":" + lessonIndex, moduleIndex, lessonIndex }))), [parsedModules]);
  const [completed, setCompleted] = useState({});
  const [openedModule, setOpenedModule] = useState(0);
  const [openedLesson, setOpenedLesson] = useState("0:0");
  const [hydrated, setHydrated] = useState(false);

  useEffect(() => {
    try {
      const saved = window.localStorage.getItem(STORAGE_KEY);
      if (saved) setCompleted(JSON.parse(saved) || {});
    } catch {}
    setHydrated(true);
  }, []);

  const doneCount = allLessons.filter((lesson) => completed[lesson.key]).length;
  const total = allLessons.length;
  const percent = total ? Math.round((doneCount / total) * 100) : 0;
  const allDone = hydrated && total > 0 && doneCount === total;

  function toggleLesson(key) {
    setCompleted((previous) => {
      const next = { ...previous, [key]: !previous[key] };
      try { window.localStorage.setItem(STORAGE_KEY, JSON.stringify(next)); } catch {}
      return next;
    });
  }

  return (
    <main className="ecommerce-course">
      <style>{`
        .ecommerce-course{min-height:100vh;background:var(--bg,#0b0d0c);color:var(--text,#f3f5f2);padding:clamp(16px,3vw,42px);font-family:inherit}
        .ec-wrap{max-width:1180px;margin:0 auto}.ec-back{display:inline-flex;color:var(--muted,#a5afa8);text-decoration:none;font-size:13px;margin:0 0 22px}.ec-back:hover{color:var(--accent)}
        .ec-hero{position:relative;overflow:hidden;display:grid;grid-template-columns:1.15fr .85fr;gap:26px;align-items:center;padding:clamp(24px,4vw,44px);border:1px solid var(--line,#2b382f);border-radius:24px;background:radial-gradient(ellipse at 85% 12%,color-mix(in srgb,var(--accent,#9bdc55) 22%,transparent),transparent 45%),linear-gradient(125deg,#151d17,#101311)}
        .ec-kicker{font-size:10px;font-weight:850;letter-spacing:.16em;color:var(--accent);text-transform:uppercase}.ec-hero h1{font-size:clamp(36px,5vw,58px);line-height:.98;letter-spacing:-.055em;margin:15px 0}.ec-hero h1 span{color:var(--accent)}.ec-hero p{max-width:650px;color:#b9c4bc;font-size:14px;line-height:1.8;margin:0}
        .ec-hero img{width:100%;height:260px;object-fit:cover;border-radius:17px;border:1px solid #394a3d;box-shadow:0 18px 55px #0005}
        .ec-hero-actions{display:flex;flex-wrap:wrap;gap:10px;margin-top:22px}.ec-btn{display:inline-flex;align-items:center;justify-content:center;gap:8px;min-height:42px;padding:11px 15px;border-radius:10px;background:var(--accent);color:#101510;text-decoration:none;font-size:12px;font-weight:850;border:1px solid var(--accent);transition:transform .18s,filter .18s}.ec-btn:hover{transform:translateY(-2px);filter:brightness(1.06)}.ec-btn.alt{background:#1c2720;color:#e8f0e9;border-color:#35463a}
        .ec-progress{margin:18px 0 28px;padding:18px 20px;border:1px solid var(--line,#2b382f);border-radius:16px;background:var(--card,#111512);display:grid;grid-template-columns:1fr auto;gap:10px 20px;align-items:center}.ec-progress-copy strong{display:block;font-size:14px}.ec-progress-copy span{display:block;color:var(--muted,#9aa69d);font-size:11px;margin-top:5px}.ec-percent{font-size:24px;font-weight:850;letter-spacing:-.04em;color:var(--accent);font-variant-numeric:tabular-nums}.ec-track{height:7px;border-radius:99px;background:var(--line,#29332c);overflow:hidden;grid-column:1/-1}.ec-track span{display:block;height:100%;border-radius:99px;background:var(--accent);transition:width .3s ease}
        .ec-section-head{display:flex;align-items:end;justify-content:space-between;gap:14px;margin:34px 0 15px}.ec-section-head h2{font-size:clamp(22px,3vw,30px);letter-spacing:-.04em;margin:6px 0 0}.ec-section-head p{font-size:12px;color:var(--muted,#9aa69d);margin:0}
        .ec-layout{display:grid;grid-template-columns:290px minmax(0,1fr);gap:18px;align-items:start}.ec-nav{position:sticky;top:18px;border:1px solid var(--line,#2b382f);background:var(--card,#111512);border-radius:17px;padding:12px}.ec-nav-title{padding:9px 10px 13px;font-size:10px;font-weight:850;letter-spacing:.14em;color:var(--muted);text-transform:uppercase}.ec-nav-item{width:100%;display:flex;align-items:center;gap:10px;padding:12px 10px;border:0;border-radius:10px;background:transparent;color:inherit;text-align:left;cursor:pointer}.ec-nav-item:hover,.ec-nav-item.active{background:color-mix(in srgb,var(--accent) 11%,transparent)}.ec-nav-number{display:grid;place-items:center;flex:0 0 28px;height:28px;border-radius:8px;background:var(--surface,#202922);font-size:10px;font-weight:850;color:var(--accent)}.ec-nav-label{min-width:0;flex:1;font-size:11px;font-weight:750;line-height:1.4}.ec-nav-meta{font-size:10px;color:var(--muted);white-space:nowrap}.ec-nav-progress{height:3px;background:var(--line);border-radius:10px;overflow:hidden;margin:3px 8px 8px 48px}.ec-nav-progress span{display:block;height:100%;background:var(--accent)}
        .ec-module{border:1px solid var(--line,#2b382f);border-radius:17px;background:var(--card,#111512);overflow:hidden;margin-bottom:14px}.ec-module.active{border-color:color-mix(in srgb,var(--accent) 52%,var(--line))}.ec-module-head{width:100%;display:flex;align-items:center;gap:13px;padding:18px 19px;border:0;background:transparent;color:inherit;text-align:left;cursor:pointer}.ec-module-index{display:grid;place-items:center;flex:0 0 40px;height:40px;border-radius:12px;background:color-mix(in srgb,var(--accent) 13%,transparent);color:var(--accent);font-size:12px;font-weight:900}.ec-module-title{min-width:0;flex:1}.ec-module-title strong{display:block;font-size:14px;line-height:1.4}.ec-module-title span{display:block;margin-top:4px;color:var(--muted);font-size:11px}.ec-module-count{font-size:10px;color:var(--muted);white-space:nowrap}.ec-chevron{font-size:16px;color:var(--muted);transition:transform .2s}.ec-module.active .ec-chevron{transform:rotate(180deg)}
        .ec-module-body{padding:0 18px 18px}.ec-module-intro{font-size:13px;line-height:1.8;color:var(--muted);padding:0 2px 14px;border-bottom:1px solid var(--line);margin-bottom:12px}.ec-lesson{border:1px solid var(--line);border-radius:12px;margin:9px 0;background:var(--surface,rgba(255,255,255,.015));overflow:hidden}.ec-lesson-head{width:100%;display:flex;align-items:center;gap:11px;padding:13px 14px;background:transparent;border:0;color:inherit;text-align:left;cursor:pointer}.ec-lesson-check{display:grid;place-items:center;flex:0 0 23px;height:23px;border:1px solid var(--muted);border-radius:7px;color:#101510;font-size:12px}.ec-lesson-check.done{background:var(--accent);border-color:var(--accent)}.ec-lesson-head strong{flex:1;font-size:12px;line-height:1.5}.ec-lesson-head small{font-size:10px;color:var(--muted)}.ec-lesson-body{padding:0 17px 17px 48px}.ec-rich{font-size:12px;line-height:1.85;color:var(--muted)}.ec-rich p{margin:10px 0}.ec-rich h4{font-size:12px;color:var(--text);margin:18px 0 5px}.ec-rich strong{color:var(--text);font-weight:800}.ec-rich ul,.ec-rich ol{padding-left:20px;margin:9px 0}.ec-rich li{padding:2px 0}.ec-rich blockquote{margin:12px 0;padding:10px 13px;border-left:2px solid var(--accent);background:color-mix(in srgb,var(--accent) 7%,transparent);border-radius:0 8px 8px 0}.ec-rich blockquote p{margin:0}.ec-rich a{display:inline-flex;align-items:center;gap:6px;margin:3px 3px 3px 0;padding:7px 10px;border-radius:8px;background:color-mix(in srgb,var(--accent) 13%,transparent);border:1px solid color-mix(in srgb,var(--accent) 30%,transparent);color:var(--accent);text-decoration:none;font-size:11px;font-weight:800;overflow-wrap:anywhere}.ec-rich a:hover{filter:brightness(1.15)}.ec-rich code{font-size:11px;padding:2px 5px;border-radius:5px;background:var(--line)}.ec-rich .course-static-check{display:inline-grid;place-items:center;width:15px;height:15px;border:1px solid var(--muted);border-radius:4px;margin-right:7px;font-size:10px;color:var(--accent)}.course-table-wrap{overflow-x:auto;margin:12px 0}.course-table-wrap table{border-collapse:collapse;width:100%;font-size:11px;min-width:420px}.course-table-wrap th,.course-table-wrap td{padding:9px 10px;border:1px solid var(--line);text-align:left}.course-table-wrap th{color:var(--text);background:color-mix(in srgb,var(--accent) 8%,transparent)}
        .ec-lesson-action{display:flex;justify-content:flex-end;margin-top:15px}.ec-done-btn{display:inline-flex;align-items:center;gap:7px;padding:9px 12px;border-radius:8px;border:1px solid var(--accent);background:transparent;color:var(--accent);font-size:11px;font-weight:850;cursor:pointer}.ec-done-btn.done{background:var(--accent);color:#101510}.ec-done-btn:focus-visible,.ec-nav-item:focus-visible,.ec-module-head:focus-visible,.ec-lesson-head:focus-visible{outline:2px solid var(--accent);outline-offset:3px}
        .ec-resources{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:12px;margin:24px 0}.ec-resource{padding:17px;border:1px solid var(--line);border-radius:14px;background:var(--card);display:flex;align-items:center;gap:12px;text-decoration:none;color:inherit}.ec-resource:hover{border-color:var(--accent)}.ec-resource-mark{display:grid;place-items:center;width:37px;height:37px;border-radius:11px;background:color-mix(in srgb,var(--accent) 13%,transparent);color:var(--accent);font-size:12px;font-weight:900}.ec-resource strong{display:block;font-size:12px}.ec-resource small{display:block;color:var(--muted);font-size:10px;margin-top:4px}
        .ec-footnote{font-size:11px;line-height:1.7;color:var(--muted);margin:25px 0 10px}
        @media(max-width:850px){.ec-layout{grid-template-columns:1fr}.ec-nav{position:static;display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:3px}.ec-nav-title{grid-column:1/-1}.ec-nav-progress{margin-left:8px}.ec-hero{grid-template-columns:1fr}.ec-hero img{height:220px}}
        @media(max-width:560px){.ec-nav{grid-template-columns:1fr}.ec-progress{padding:15px}.ec-module-head{padding:14px}.ec-module-body{padding:0 11px 12px}.ec-lesson-body{padding:0 13px 14px}.ec-module-count{display:none}.ec-resources{grid-template-columns:1fr}.ec-hero img{height:180px}.ec-hero-actions .ec-btn{flex:1}.ec-section-head{align-items:start;flex-direction:column}}
        :root[data-theme="light"] .ecommerce-course{background:var(--bg,#f5f6f8);color:var(--text,#20242a)}
        :root[data-theme="light"] .ecommerce-course .ec-hero{background:linear-gradient(125deg,#fff,#eef2f5);border-color:var(--line,#dce0e6)}
        :root[data-theme="light"] .ecommerce-course .ec-hero p{color:#59616c}
        :root[data-theme="light"] .ecommerce-course .ec-hero img{border-color:#dce0e6}
        :root[data-theme="light"] .ecommerce-course .ec-btn.alt{background:#eef1f4;color:var(--text,#20242a);border-color:var(--line,#dce0e6)}
        :root[data-theme="light"] .ecommerce-course .ec-module,.ecommerce-course .ec-progress,:root[data-theme="light"] .ecommerce-course .ec-nav,:root[data-theme="light"] .ecommerce-course .ec-resource{background:var(--card,#fff);border-color:var(--line,#dce0e6)}
        :root[data-theme="light"] .ecommerce-course .ec-lesson{background:#fafbfc;border-color:var(--line,#dce0e6)}
        :root[data-theme="light"] .ecommerce-course .ec-module-intro,:root[data-theme="light"] .ecommerce-course .ec-rich{color:var(--muted,#626975)}
        :root[data-theme="light"] .ecommerce-course .ec-rich strong,:root[data-theme="light"] .ecommerce-course .ec-rich h4,:root[data-theme="light"] .ecommerce-course .ec-lesson-head strong{color:var(--text,#20242a)}
        :root[data-theme="light"] .ecommerce-course .ec-lesson-body{color:var(--muted,#626975)}
      `}</style>
      <div className="ec-wrap">
        <a className="ec-back" href="/modulos/ecommerce">← Voltar às trilhas de Ecommerce</a>
        <section className="ec-hero">
          <div>
            <div className="ec-kicker">O CLONE DIGITAL · TRILHA DE E-COMMERCE</div>
            <h1>Trabalhe com <span>E-commerce.</span></h1>
            <p>Do primeiro planejamento à operação e à escala. Avance pelos seis módulos, abra cada aula, execute as ações práticas e acompanhe sua evolução ao longo da jornada.</p>
            <div className="ec-hero-actions">
              <a className="ec-btn" href={SHOPIFY_URL} target="_blank" rel="noreferrer">Começar na Shopify ↗</a>
              <a className="ec-btn alt" href="#conteudo">Explorar aulas ↓</a>
            </div>
          </div>
          <img src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=1200&q=85" alt="Preparação de pedidos em uma operação de e-commerce" />
        </section>

        <section className="ec-progress" aria-label="Progresso geral da trilha">
          <div className="ec-progress-copy"><strong>Sua evolução na trilha</strong><span>{hydrated ? doneCount + " de " + total + " etapas concluídas" : "Carregando seu progresso..."} · O acompanhamento das aulas fica salvo neste dispositivo.</span></div>
          <div className="ec-percent">{percent}%</div>
          <div className="ec-track"><span style={{ width: percent + "%" }} /></div>
        </section>

        <div className="ec-section-head" id="conteudo">
          <div><div className="ec-kicker">CONTEÚDO DO TREINAMENTO</div><h2>Uma jornada em seis módulos</h2></div>
          <p>{parsedModules.length} módulos · {total} etapas de estudo</p>
        </div>

        <div className="ec-layout">
          <aside className="ec-nav" aria-label="Navegação dos módulos">
            <div className="ec-nav-title">Navegue pelo conteúdo</div>
            {parsedModules.map((module, index) => {
              const count = module.lessons.filter((lesson, lessonIndex) => completed[module.id + ":" + lessonIndex]).length;
              return <button key={module.id} className={"ec-nav-item " + (openedModule === index ? "active" : "")} onClick={() => { setOpenedModule(index); setOpenedLesson(index + ":0"); }}>
                <span className="ec-nav-number">{String(index + 1).padStart(2, "0")}</span>
                <span className="ec-nav-label">{module.title.replace(/^Módulo \d+\s*[—-]\s*/, "")}</span>
                <span className="ec-nav-meta">{count}/{module.lessons.length}</span>
              </button>;
            })}
          </aside>

          <section className="ec-modules" aria-label="Módulos e aulas">
            {parsedModules.map((module, moduleIndex) => {
              const count = module.lessons.filter((lesson, lessonIndex) => completed[module.id + ":" + lessonIndex]).length;
              const isOpen = openedModule === moduleIndex;
              return <article key={module.id} className={"ec-module " + (isOpen ? "active" : "")}>
                <button className="ec-module-head" onClick={() => { setOpenedModule(isOpen ? -1 : moduleIndex); setOpenedLesson(moduleIndex + ":0"); }} aria-expanded={isOpen}>
                  <span className="ec-module-index">{String(moduleIndex + 1).padStart(2, "0")}</span>
                  <span className="ec-module-title"><strong>{module.title.replace(/^Módulo \d+\s*[—-]\s*/, "")}</strong><span>{module.subtitle || (module.lessons.length + " etapas para avançar")}</span></span>
                  <span className="ec-module-count">{count}/{module.lessons.length} concluídas</span>
                  <span className="ec-chevron">⌄</span>
                </button>
                {isOpen && <div className="ec-module-body">
                  {module.intro && <div className="ec-module-intro">{renderMarkdown(module.intro, module.id + "-intro")}</div>}
                  {module.lessons.map((lesson, lessonIndex) => {
                    const key = moduleIndex + ":" + lessonIndex;
                    const storageKey = module.id + ":" + lessonIndex;
                    const lessonDone = !!completed[storageKey];
                    const lessonOpen = openedLesson === key;
                    return <section className="ec-lesson" key={storageKey}>
                      <button className="ec-lesson-head" onClick={() => setOpenedLesson(lessonOpen ? "" : key)} aria-expanded={lessonOpen}>
                        <span className={"ec-lesson-check " + (lessonDone ? "done" : "")}>{lessonDone ? "✓" : ""}</span>
                        <strong>{lesson.title}</strong>
                        <small>{lessonDone ? "Concluída" : lessonOpen ? "Aberta" : "Abrir aula"}</small>
                      </button>
                      {lessonOpen && <div className="ec-lesson-body">
                        <div className="ec-rich">{renderMarkdown(lesson.markdown, storageKey)}</div>
                        <div className="ec-lesson-action"><button className={"ec-done-btn " + (lessonDone ? "done" : "")} onClick={() => toggleLesson(storageKey)}>{lessonDone ? "✓ Aula concluída · desfazer" : "Marcar aula como concluída"}</button></div>
                      </div>}
                    </section>;
                  })}
                </div>}
              </article>;
            })}
          </section>
        </div>

        <div className="ec-section-head"><div><div className="ec-kicker">FERRAMENTAS DA JORNADA</div><h2>Links úteis</h2></div></div>
        <section className="ec-resources">
          <a className="ec-resource" href={SHOPIFY_URL} target="_blank" rel="noreferrer"><span className="ec-resource-mark">S</span><span><strong>Criar conta na Shopify</strong><small>Acesse pelo link disponibilizado no treinamento</small></span></a>
          <a className="ec-resource" href={DSERS_URL} target="_blank" rel="noreferrer"><span className="ec-resource-mark">D</span><span><strong>Criar conta no DSers</strong><small>Conecte sua loja e gerencie a importação de produtos</small></span></a>
        </section>

        <ModuleCompletion slug="ecommerce" visible={allDone} />
        <p className="ec-footnote">Conteúdo educacional. Valores, telas, recursos e condições de plataformas podem mudar; confirme as informações nos canais oficiais. Resultados comerciais dependem de execução, custos, mercado e outros fatores, sem garantia de vendas ou lucro. O progresso individual das aulas é armazenado localmente neste dispositivo; a conclusão geral do módulo é registrada no painel quando todas as etapas forem marcadas.</p>
      </div>
    </main>
  );
}
