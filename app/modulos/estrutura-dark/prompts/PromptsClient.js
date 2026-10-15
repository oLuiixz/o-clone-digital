"use client";

import { useMemo, useState } from "react";

const topics = [
  "Pesquisando seus concorrentes",
  "Criando um Plano de Negócios",
  "Redação de Propostas para Clientes",
  "Declaração de visão da empresa",
  "Gerando Ideias de Negócios",
  "Preparando-se para receber investidores",
  "Contratação e Liderança",
  "Escrevendo um Resumo de Reunião",
  "Gerando ideias de produtos",
  "Gerando ideias de funil",
  "Escolhendo um nicho",
  "Escrevendo uma página de vendas",
  "Escrevendo Landing Page",
  "Escrevendo uma Copy de Order Bump",
  "Escrevendo uma página de upsell",
  "Escrevendo uma página de agradecimento",
  "Criando copy's eficazes para anúncios",
  "Gerando ideias para criativos",
  "Headlines para anúncios no Facebook",
  "Escreva scripts para criativos",
  "Criando imagens que chamam a atenção",
  "Teste A/B de copy para conversão",
  "Pesquisando os pontos de dor e desejos do seu cliente ideal",
  "Brainstorming de novas ideias para criativos",
  "Gerando uma lista de palavras-chave",
  "Criação de Blogposts",
  "Fazendo otimização SEO",
  "Criando um calendário de Conteúdo",
  "Melhorando um Copy",
  "Brand-voice",
  "Escrevendo uma Copy Avançada",
  "Revisando sua Copy",
  "Copy para SMS de promoções e vendas",
  "Campanhas de opt-in por SMS para geração de leads",
  "Lembretes por SMS e mensagens de follow-up",
  "Ideias de conteúdo para TikTok",
  "Pesquisando seu público no TikTok",
  "Pesquisando seu público no TikTok — variações",
  "Avaliações de produtos afiliados",
  "Tabelas de comparação de produtos afiliados",
  "Recomendações de produtos afiliados",
  "Descrições de produtos afiliados",
  "E-mails de produtos afiliados",
  "Otimizando um perfil efetivo do LinkedIn",
  "Ideias para postagens no LinkedIn",
  "Aproveitando os grupos do LinkedIn",
  "Estratégia de conteúdo do LinkedIn",
  "Anúncios para LinkedIn",
  "Hashtags do LinkedIn",
  "Automação do LinkedIn",
  "Webinar ou Workshop",
  "Posts que chamem atenção",
  "Imagens para post",
  "Criando Mood Boards",
  "Pesquisando hashtags",
  "Gerando assuntos de e-mail",
  "Criando um e-mail de vendas",
  "E-mail de onboarding",
  "Abandono de carrinho",
  "Newsletter",
  "E-mail de boas-vindas",
  "Escrevendo um e-mail frio",
  "Lista de perguntas frequentes",
  "Gerenciando comunicação com clientes",
  "Respondendo a comentários de clientes ou haters",
  "Aumentando a retenção de clientes",
  "Pesquisando seus clientes",
  "Perguntas para entrevista de podcast",
  "Roteiro de podcast",
  "Divulgação de convidados de podcast",
  "Descrições de produtos",
  "Editorial",
  "Otimizando seu site para SEO",
  "Depoimentos de clientes",
  "Traduzindo copy do site em diferentes idiomas",
  "Projetando CTAs",
  "Script de vídeo do YouTube",
  "Título de vídeo do YouTube",
  "Descrição de vídeo do YouTube amigável para SEO",
  "Script de anúncio em vídeo do YouTube",
  "Ideias para miniaturas do YouTube",
  "Otimizando o perfil do Twitter/X",
  "Escrevendo tweets e threads",
  "Aproveitando tendências do Twitter/X",
  "Anúncios do Twitter/X",
  "Tornando tweets virais",
  "Otimizando o crescimento do Twitter/X"
];

function Icon({ name, size = 20 }) {
  const paths = {
    search: ["M11 19a8 8 0 1 0 0-16 8 8 0 0 0 0 16Z", "m21 21-4.35-4.35"],
    copy: ["M8 8h12v12H8z", "M16 8V4H4v12h4"],
    sparkles: ["m12 3 1.8 5.2L19 10l-5.2 1.8L12 17l-1.8-5.2L5 10l5.2-1.8L12 3Z", "m19 14 1 2.5 2.5 1-2.5 1L19 21l-1-2.5-2.5-1 2.5-1 1-2.5Z"],
    arrow: ["M5 12h14", "m12 5 7 7-7 7"],
    book: ["M4 4.5A2.5 2.5 0 0 1 6.5 2H20v18H6.5A2.5 2.5 0 0 0 4 22V4.5Z", "M4 18a2 2 0 0 1 2-2h14"],
    close: ["M18 6 6 18", "m6 6 12 12"]
  };
  return <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.7" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">{(paths[name] || paths.sparkles).map((d,i)=><path key={i} d={d}/>)}</svg>;
}

function makePrompts(topic, context) {
  const extra = context.trim() ? "\\nContexto do meu projeto: " + context.trim() : "";
  const base = "Tema: " + topic + "." + extra;
  return [
    ["Estratégia completa", "Atue como um especialista sênior. Desenvolva uma estratégia completa para " + base + " Inclua diagnóstico, objetivos, público-alvo, posicionamento, plano de execução por etapas, recursos necessários e métricas de sucesso."],
    ["Plano de ação", "Crie um plano de ação prático para " + base + " Organize em etapas semanais, priorize tarefas por impacto e esforço, indique entregáveis e defina como acompanhar os resultados."],
    ["Ideias criativas", "Gere 10 ideias originais relacionadas a " + base + " Para cada ideia, explique o conceito, diferencial, público ideal e como executar."],
    ["Versão para iniciantes", "Explique como começar com " + base + " usando linguagem simples. Crie um roteiro passo a passo, liste ferramentas úteis, erros comuns e uma checklist para colocar em prática."],
    ["Versão avançada", "Atue como consultor especialista e proponha uma abordagem avançada para " + base + " Considere boas práticas, tendências, otimizações e oportunidades pouco exploradas."],
    ["Pesquisa e análise", "Faça uma análise estruturada sobre " + base + " Separe fatos conhecidos, hipóteses que precisam ser validadas, perguntas de pesquisa e recomendações baseadas em evidências. Não invente dados."],
    ["Copy persuasiva", "Crie uma comunicação persuasiva sobre " + base + " usando benefício principal, diferenciais concretos, objeções e chamada para ação. Evite promessas exageradas e clichês."],
    ["Checklist profissional", "Monte uma checklist profissional para revisar " + base + " Antes de finalizar, inclua critérios de qualidade, pontos de atenção e sinais de que cada etapa está pronta."],
    ["Otimização", "Avalie como melhorar " + base + " Liste gargalos prováveis, mudanças de alto impacto, testes que podem ser feitos e métricas para comparar antes e depois."],
    ["Exemplos prontos", "Crie 5 exemplos completos e diferentes para " + base + " Explique brevemente quando usar cada exemplo e quais partes devo personalizar."],
    ["Teste A/B", "Planeje um teste A/B para " + base + " Defina hipótese, variável principal, versões A e B, público, métrica de sucesso, duração sugerida e como interpretar os resultados."],
    ["Revisão crítica", "Revise criticamente esta abordagem para " + base + " Aponte falhas, riscos, informações ausentes e oportunidades. Depois apresente uma versão melhorada com justificativa."]
  ].map(([label, text]) => ({ label, text: text + extra }));
}

export default function PromptsClient() {
  const [query, setQuery] = useState("");
  const [selected, setSelected] = useState(topics[0]);
  const [context, setContext] = useState("");
  const filtered = useMemo(() => topics.filter(t => t.toLowerCase().includes(query.toLowerCase())), [query]);
  const prompts = useMemo(() => selected ? makePrompts(selected, context) : [], [selected, context]);
  const [copied, setCopied] = useState("");
  async function copyPrompt(text, label) {
    try {
      await navigator.clipboard.writeText(text);
      setCopied(label);
      window.setTimeout(() => setCopied(""), 1800);
    } catch {
      const area = document.createElement("textarea");
      area.value = text;
      document.body.appendChild(area);
      area.select();
      document.execCommand("copy");
      area.remove();
      setCopied(label);
    }
  }

  return <main className="pc-page">
    <style>{`
      :root{--pc-bg:#0b0b0d;--pc-panel:#141418;--pc-panel2:#1c1c22;--pc-text:#f4f4f6;--pc-muted:#a1a1aa;--pc-line:#2d2d36;--pc-accent:#a78bfa;--pc-accent2:#7c3aed}
      html[data-tema="light"]{--pc-bg:#f7f7fa;--pc-panel:#fff;--pc-panel2:#f0eff5;--pc-text:#202027;--pc-muted:#666674;--pc-line:#e2e1e9}
      .pc-page{min-height:100vh;background:radial-gradient(ellipse at 75% 0%,rgba(124,58,237,.18),transparent 35%),var(--pc-bg);color:var(--pc-text);padding:22px; font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif}
      .pc-page .pc-shell{max-width:1200px;margin:auto}.pc-page .pc-back{display:inline-flex;align-items:center;gap:8px;color:var(--pc-muted);text-decoration:none;font-size:13px;margin:5px 0 24px}.pc-page .pc-hero{padding:30px;border:1px solid var(--pc-line);border-radius:22px;background:linear-gradient(130deg,rgba(124,58,237,.16),var(--pc-panel));margin-bottom:22px}.pc-page .pc-kicker{font-size:10px;letter-spacing:1.8px;color:var(--pc-accent);font-weight:850}.pc-page .pc-hero h1{font-size:clamp(30px,5vw,48px);letter-spacing:-1.8px;margin:12px 0}.pc-page .pc-hero p{color:var(--pc-muted);line-height:1.7;max-width:760px;margin:0}.pc-page .pc-stats{display:flex;gap:10px;flex-wrap:wrap;margin-top:20px}.pc-page .pc-stat{border:1px solid var(--pc-line);border-radius:12px;background:var(--pc-panel);padding:12px 15px}.pc-page .pc-stat strong{display:block;font-size:19px}.pc-page .pc-stat span{font-size:11px;color:var(--pc-muted)}
      .pc-page .pc-layout{display:grid;grid-template-columns:minmax(260px,.8fr) minmax(0,1.4fr);gap:18px;align-items:start}.pc-page .pc-panel{border:1px solid var(--pc-line);border-radius:18px;background:var(--pc-panel);overflow:hidden}.pc-page .pc-panel-head{padding:17px;border-bottom:1px solid var(--pc-line)}.pc-page .pc-panel-head h2{font-size:16px;margin:0 0 12px}.pc-page .pc-search{display:flex;align-items:center;gap:9px;border:1px solid var(--pc-line);border-radius:11px;background:var(--pc-panel2);padding:0 11px;color:var(--pc-muted)}.pc-page .pc-search input{border:0;outline:0;background:transparent;color:var(--pc-text);width:100%;min-width:0;padding:12px 0}.pc-page .pc-topic-list{padding:8px;max-height:640px;overflow:auto}.pc-page .pc-topic{display:flex;align-items:center;gap:10px;width:100%;text-align:left;padding:12px;border:1px solid transparent;border-radius:11px;background:transparent;color:var(--pc-text);cursor:pointer;font:inherit;font-size:12px;line-height:1.45}.pc-page .pc-topic:hover{background:var(--pc-panel2)}.pc-page .pc-topic.active{background:rgba(124,58,237,.14);border-color:rgba(167,139,250,.3);color:var(--pc-accent)}.pc-page .pc-topic-number{font-size:10px;color:var(--pc-muted);min-width:22px;font-variant-numeric:tabular-nums}.pc-page .pc-detail{padding:22px}.pc-page .pc-detail-top{display:flex;justify-content:space-between;align-items:flex-start;gap:12px}.pc-page .pc-detail h2{font-size:24px;letter-spacing:-.5px;margin:0 0 8px}.pc-page .pc-muted{color:var(--pc-muted);font-size:13px;line-height:1.65}.pc-page .pc-label{display:block;font-size:12px;font-weight:750;margin:22px 0 8px}.pc-page .pc-context{width:100%;box-sizing:border-box;min-height:78px;resize:vertical;border:1px solid var(--pc-line);border-radius:12px;background:var(--pc-panel2);color:var(--pc-text);padding:12px;font:inherit;outline:none}.pc-page .pc-context:focus{border-color:var(--pc-accent)}.pc-page .pc-prompt{border:1px solid var(--pc-line);border-radius:14px;padding:15px;margin-top:12px;background:var(--pc-panel2)}.pc-page .pc-prompt-top{display:flex;justify-content:space-between;align-items:center;gap:10px}.pc-page .pc-prompt h3{font-size:13px;margin:0}.pc-page .pc-prompt p{font-size:12px;line-height:1.75;color:var(--pc-muted);white-space:pre-wrap;overflow-wrap:anywhere;margin:12px 0}.pc-page .pc-copy{display:inline-flex;align-items:center;gap:7px;border:1px solid rgba(167,139,250,.3);border-radius:9px;background:rgba(124,58,237,.13);color:var(--pc-accent);padding:8px 10px;font-size:11px;font-weight:800;cursor:pointer;white-space:nowrap}.pc-page .pc-empty{padding:25px;color:var(--pc-muted);text-align:center;font-size:13px}.pc-page .pc-foot{color:var(--pc-muted);font-size:11px;line-height:1.6;margin-top:16px}
      @media(max-width:820px){.pc-page .pc-layout{grid-template-columns:1fr}.pc-page .pc-topic-list{max-height:280px;display:grid;grid-template-columns:repeat(2,minmax(0,1fr))}.pc-page .pc-hero{padding:23px}}@media(max-width:540px){.pc-page{padding:12px}.pc-page .pc-topic-list{grid-template-columns:1fr}.pc-page .pc-detail{padding:16px}.pc-page .pc-detail-top{display:block}.pc-page .pc-prompt-top{align-items:flex-start;flex-direction:column}.pc-page .pc-copy{width:100%;justify-content:center}.pc-page .pc-hero h1{letter-spacing:-1px}}
    `}</style>
    <div className="pc-shell">
      <a className="pc-back" href="/app">← Voltar ao Método Dark Motion</a>
      <section className="pc-hero">
        <span className="pc-kicker">BIBLIOTECA DE INTELIGÊNCIA ARTIFICIAL</span>
        <h1>+1000 Prompts ChatGPT</h1>
        <p>Encontre ideias e comandos para marketing, copywriting, negócios, conteúdo, SEO, redes sociais, e-mail e muito mais. Escolha um tema, personalize com o contexto do seu projeto e copie o prompt para usar no ChatGPT.</p>
        <div className="pc-stats"><div className="pc-stat"><strong>{topics.length}</strong><span>temas organizados</span></div><div className="pc-stat"><strong>{topics.length * 12}+</strong><span>modelos editáveis</span></div><div className="pc-stat"><strong>Copiar</strong><span>com um clique</span></div></div>
      </section>
      <div className="pc-layout">
        <section className="pc-panel">
          <div className="pc-panel-head"><h2>Explorar temas</h2><div className="pc-search"><Icon name="search" size={17}/><input value={query} onChange={e=>setQuery(e.target.value)} placeholder="Buscar tema..." aria-label="Buscar tema"/></div></div>
          <div className="pc-topic-list">{filtered.map((topic,i)=><button key={topic} className={"pc-topic"+(selected===topic?" active":"")} onClick={()=>setSelected(topic)}><span className="pc-topic-number">{String(topics.indexOf(topic)+1).padStart(2,"0")}</span><span>{topic}</span></button>)}
            {!filtered.length&&<div className="pc-empty">Nenhum tema encontrado.</div>}
          </div>
        </section>
        <section className="pc-panel">
          {selected ? <div className="pc-detail">
            <div className="pc-detail-top"><div><h2 style={{marginTop:8}}>{selected}</h2><div className="pc-muted">Prompts editáveis para adaptar ao seu negócio.</div></div></div>
            <label className="pc-label" htmlFor="pc-context">Contexto do seu projeto (opcional)</label>
            <textarea id="pc-context" className="pc-context" value={context} onChange={e=>setContext(e.target.value)} placeholder="Ex.: vendo um produto digital para iniciantes, público de 18 a 35 anos..."/>
            {prompts.map((p,i)=><article className="pc-prompt" key={p.label}><div className="pc-prompt-top"><h3>{String(i+1).padStart(2,"0")} · {p.label}</h3><button className="pc-copy" onClick={()=>copyPrompt(p.text,p.label)}><Icon name="copy" size={14}/>{copied===p.label?"Copiado!":"Copiar prompt"}</button></div><p>{p.text}</p></article>)}
            <div className="pc-foot">Dica: substitua os detalhes genéricos por informações reais do seu produto, público e objetivo antes de enviar ao ChatGPT.</div>
          </div> : <div className="pc-empty">Escolha um tema para ver os prompts.</div>}
        </section>
      </div>
    </div>
  </main>;
}
