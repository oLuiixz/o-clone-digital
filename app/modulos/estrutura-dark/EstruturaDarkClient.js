"use client";

import { useMemo, useState } from "react";
import Link from "next/link";

function renderBlock(block, index) {
  if (block.type === "link") return <p key={index}><a href={block.href} target="_blank" rel="noreferrer">{block.text} ↗</a></p>;
  if (block.type === "li") return <li key={index}>{block.text}</li>;
  if (block.type === "h3") return <h3 key={index}>{block.text}</h3>;
  return <p key={index}>{block.text}</p>;
}

export default function EstruturaDarkClient({ lessons }) {
  const [query, setQuery] = useState("");
  const [active, setActive] = useState(0);
  const filtered = useMemo(() => {
    const q = query.trim().toLocaleLowerCase("pt-BR");
    if (!q) return lessons;
    return lessons.filter((lesson) => [lesson.t, lesson.d, ...(lesson.blocks || []).map((b) => b.text)].join(" ").toLocaleLowerCase("pt-BR").includes(q));
  }, [lessons, query]);
  const selected = filtered[Math.min(active, Math.max(0, filtered.length - 1))];

  return <main className="module-page">
    <div className="module-page-shell">
      <nav className="module-breadcrumb"><Link href="/painel">Painel</Link><span>/</span><span>Estrutura Dark</span></nav>
      <header className="module-hero">
        <div className="module-section-eyebrow">TRILHA IMPORTADA DO DARKMOTION</div>
        <h1>Estrutura Dark</h1>
        <p className="module-intro">Conteúdo do Método Dark Motion organizado em uma biblioteca de aulas pesquisável. Selecione uma aula para abrir o material completo.</p>
        <div className="module-hero-meta"><span>{lessons.length} conteúdos importados</span><span>Texto, listas e referências</span></div>
      </header>
      <section className="module-content-card" style={{marginTop:24}}>
        <label htmlFor="dark-search" className="module-section-eyebrow">PESQUISAR CONTEÚDO</label>
        <input id="dark-search" value={query} onChange={(e)=>{setQuery(e.target.value);setActive(0)}} placeholder="Buscar aula, nicho, conteúdo, monetização..." style={{width:"100%",marginTop:10,padding:"13px 15px",borderRadius:12,border:"1px solid var(--line)",background:"var(--surface)",color:"var(--text)"}} />
        <p style={{fontSize:13,opacity:.7,marginTop:8}}>{filtered.length} de {lessons.length} conteúdos</p>
      </section>
      <section className="estrutura-dark-layout">
        <aside className="module-content-card estrutura-dark-index">
          <div className="module-section-eyebrow">BIBLIOTECA DE AULAS</div>
          <div className="estrutura-dark-lesson-list">
            {filtered.map((lesson,index)=><button type="button" key={lesson.t+"-"+index} className={index===active?"estrutura-dark-lesson active":"estrutura-dark-lesson"} onClick={()=>setActive(index)}>
              <span>{String(index+1).padStart(2,"0")}</span><span><b>{lesson.t}</b><small>{lesson.d || "Conteúdo do método"}</small></span>
            </button>)}
            {!filtered.length && <p>Nenhum conteúdo encontrado. Tente outra palavra.</p>}
          </div>
        </aside>
        <article className="module-content-card estrutura-dark-article">
          {selected ? <><div className="module-section-eyebrow">AULA {String(active+1).padStart(2,"0")} / {filtered.length}</div><h2>{selected.t}</h2>{selected.d && <p className="module-intro">{selected.d}</p>}<div className="estrutura-dark-body">{(selected.blocks||[]).map(renderBlock)}</div><div className="estrutura-dark-navigation"><button type="button" disabled={active<=0} onClick={()=>setActive(v=>Math.max(0,v-1))}>← Aula anterior</button><button type="button" disabled={active>=filtered.length-1} onClick={()=>setActive(v=>Math.min(filtered.length-1,v+1))}>Próxima aula →</button></div></>:<p>Não encontramos conteúdo com esse termo.</p>}
        </article>
      </section>
      <nav className="module-pager"><Link href="/modulos/entendendo-o-processo" className="module-pager-link"><span>TRILHA ORIGINAL</span><b>Ver módulos do O Clone Digital</b></Link><Link href="/painel" className="module-pager-link next"><span>VOLTAR</span><b>Painel principal</b></Link></nav>
    </div>
    <style jsx>{`
      .estrutura-dark-layout{display:grid;grid-template-columns:minmax(260px, .8fr) minmax(0,1.5fr);gap:18px;margin-top:20px;align-items:start}
      .estrutura-dark-index{position:sticky;top:18px;max-height:76vh;overflow:auto}
      .estrutura-dark-lesson-list{display:grid;gap:5px;margin-top:12px}
      .estrutura-dark-lesson{display:grid;grid-template-columns:30px minmax(0,1fr);gap:10px;text-align:left;padding:11px;border:1px solid transparent;border-radius:10px;background:transparent;color:var(--text);cursor:pointer}
      .estrutura-dark-lesson>span:first-child{font-size:11px;opacity:.6;padding-top:2px}
      .estrutura-dark-lesson b{display:block;font-size:13px;line-height:1.4}
      .estrutura-dark-lesson small{display:block;margin-top:4px;font-size:11px;line-height:1.4;opacity:.65}
      .estrutura-dark-lesson:hover,.estrutura-dark-lesson.active{background:var(--surface2);border-color:var(--line)}
      .estrutura-dark-lesson.active{box-shadow:inset 3px 0 var(--accent)}
      .estrutura-dark-article h2{font-size:clamp(24px,3vw,34px);margin:12px 0}
      .estrutura-dark-body{margin-top:24px;line-height:1.8;overflow-wrap:anywhere}
      .estrutura-dark-body p{margin:0 0 16px}
      .estrutura-dark-body h3{font-size:17px;margin:24px 0 8px}
      .estrutura-dark-body ul{padding-left:22px;margin:0 0 18px}
      .estrutura-dark-body li{margin:0 0 8px}
      .estrutura-dark-body a{color:var(--accent);text-decoration:underline}
      .estrutura-dark-navigation{display:flex;justify-content:space-between;gap:12px;border-top:1px solid var(--line);padding-top:18px;margin-top:28px}
      .estrutura-dark-navigation button{border:1px solid var(--line);border-radius:10px;padding:10px 13px;background:var(--surface2);color:var(--text);cursor:pointer}
      .estrutura-dark-navigation button:disabled{opacity:.4;cursor:not-allowed}
      @media(max-width:800px){.estrutura-dark-layout{grid-template-columns:1fr}.estrutura-dark-index{position:static;max-height:330px}.estrutura-dark-lesson small{display:none}}
    `}</style>
  </main>;
}
