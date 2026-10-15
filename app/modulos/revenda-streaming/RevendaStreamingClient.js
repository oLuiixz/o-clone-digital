"use client";

import { useMemo, useState } from "react";
import Link from "next/link";
import "./revenda-streaming.css";

const affiliateUrl = "https://app.cakto.com.br/affiliate/invite/5be2c9ba-b511-4107-9ab7-2c2705e55af3";
const panelUrl = "https://wa.me/5535991234316?text=quero%20abrir%20meu%20proprio%20painel%20de%20IPTV";

const lessons = [
  { title: "Entenda o mercado de IPTV", level: "Fundamentos", time: "8 min", description: "Entenda como funciona a distribuição de vídeo por internet, os diferentes modelos de serviço e a diferença entre uma plataforma autorizada e uma oferta sem direitos de distribuição.", task: "Escreva qual público pretende atender e que tipo de experiência deseja oferecer. Antes de vender, confirme que o serviço tem autorização para os conteúdos e territórios anunciados.", checklist: ["Definir o público e a proposta de valor", "Entender os direitos de distribuição", "Conhecer as regras locais aplicáveis"] },
  { title: "Como avaliar fornecedores e painéis", level: "Operação", time: "12 min", description: "Não escolha um painel só pelo preço. Avalie a empresa responsável, os direitos de distribuição, os termos contratuais, a estabilidade, o suporte e a transparência comercial.", task: "Use o checklist para conversar com o fornecedor antes de pagar. Peça informações verificáveis sobre licenciamento, política de reembolso, suporte e proteção de dados.", checklist: ["Confirmar autorização e titularidade dos direitos", "Ler contrato, limites e política de cancelamento", "Testar suporte e documentação antes de contratar"] },
  { title: "Configure sua operação", level: "Organização", time: "10 min", description: "Desenhe o processo do primeiro contato até o pós-venda. Documente quem pode acessar o painel, como os dados serão protegidos e como solicitações de suporte serão acompanhadas.", task: "Monte um fluxo simples: contato, contratação, ativação autorizada, acompanhamento, renovação e cancelamento. Use apenas ferramentas e integrações permitidas pelo fornecedor.", checklist: ["Definir o fluxo de atendimento", "Proteger contas e credenciais", "Registrar consentimentos e solicitações relevantes"] },
  { title: "Planos, preços e lucratividade", level: "Financeiro", time: "9 min", description: "Preço saudável considera custo do fornecedor, taxas, impostos, suporte, inadimplência e tempo de atendimento. Não confunda faturamento com lucro.", task: "Calcule o custo total por cliente e defina uma margem mínima. Reavalie preços quando os custos mudarem e deixe as condições de cobrança claras.", checklist: ["Mapear custos fixos e variáveis", "Definir preço e margem mínima", "Registrar receitas, taxas e despesas"] },
  { title: "Clientes, vencimentos e renovações", level: "Gestão", time: "11 min", description: "Um controle confiável reduz esquecimentos e melhora a experiência. Guarde apenas os dados necessários, limite acessos e ofereça um caminho claro para atualizar ou excluir informações.", task: "Crie uma planilha com identificador do cliente, plano contratado, data de início, vencimento, status e próximo contato. Não armazene senhas de clientes nela.", checklist: ["Organizar cadastro mínimo necessário", "Criar lembretes de vencimento", "Documentar renovação, pausa e cancelamento"] },
  { title: "Divulgação e primeiros clientes", level: "Vendas", time: "10 min", description: "Apresente benefícios reais, compatibilidade, condições e limitações com clareza. Evite prometer canais, eventos ou disponibilidade que não estejam confirmados pelo serviço.", task: "Escreva uma oferta transparente com público, recursos confirmados, preço, suporte e política de cancelamento. Use apenas imagens e marcas que você tenha permissão para utilizar.", checklist: ["Definir proposta de valor verificável", "Preparar respostas para dúvidas frequentes", "Publicar condições comerciais claras"] },
  { title: "Atendimento e retenção", level: "Suporte", time: "8 min", description: "Um suporte organizado registra o problema, confirma o ambiente do cliente, acompanha a solução e comunica prazos realistas. Nunca solicite dados de pagamento ou credenciais desnecessárias.", task: "Crie respostas para dúvidas de configuração, cobrança, indisponibilidade e cancelamento. Registre cada caso sem incluir senhas ou informações sensíveis.", checklist: ["Criar respostas para perguntas frequentes", "Definir horário e canal de atendimento", "Medir satisfação e motivos de cancelamento"] },
  { title: "Plano de ação de 7 dias", level: "Execução", time: "5 min", description: "Transforme o conteúdo em passos pequenos. A meta inicial é validar a regularidade do serviço e a organização da operação antes de investir em divulgação.", task: "Dia 1: público e oferta. Dia 2: análise de fornecedores. Dia 3: custos. Dia 4: fluxo de clientes. Dia 5: suporte. Dia 6: conteúdo. Dia 7: revisar tudo antes de começar.", checklist: ["Validar fornecedor e direitos", "Revisar custos, atendimento e privacidade", "Só iniciar vendas quando os requisitos estiverem confirmados"] },
];

const tools = [
  { name: "Checklist de fornecedor", desc: "Perguntas essenciais antes de contratar", icon: "shield-check" },
  { name: "Controle de assinaturas", desc: "Clientes, planos, status e vencimentos", icon: "users" },
  { name: "Calculadora de margem", desc: "Entenda custo total e resultado por cliente", icon: "chart-no-axes-combined" },
  { name: "Modelos de atendimento", desc: "Mensagens para dúvidas e renovações", icon: "messages-square" },
];

function Icon({ name, size = 20 }) {
  const paths = {
    "monitor-play": <><rect x="3" y="4" width="18" height="13" rx="2"/><path d="m10 8 5 2.5-5 2.5zM8 21h8M12 17v4"/></>,
    "shield-check": <><path d="M12 22s8-4 8-11V5l-8-3-8 3v6c0 7 8 11 8 11Z"/><path d="m9 12 2 2 4-4"/></>,
    users: <><path d="M16 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="10" cy="7" r="4"/><path d="M20 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></>,
    "chart-no-axes-combined": <><path d="M3 3v18h18"/><path d="m19 9-5 5-4-4-5 5"/></>,
    "messages-square": <><path d="M21 11.5a8.4 8.4 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.4 8.4 0 0 1-3.8-.9L3 21l1.9-5.7a8.4 8.4 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.4 8.4 0 0 1 3.8-.9h.5a8.5 8.5 0 0 1 8 8z"/></>,
    "arrow-up-right": <><path d="M7 17 17 7M8 7h9v9"/></>,
    "check-circle": <><circle cx="12" cy="12" r="9"/><path d="m8 12 2.5 2.5L16 9"/></>,
    "play-circle": <><circle cx="12" cy="12" r="9"/><path d="m10 8 6 4-6 4z"/></>,
    "clipboard-check": <><rect x="8" y="4" width="12" height="16" rx="2"/><path d="M16 4.5V3H10v1.5M4 8v12a2 2 0 0 0 2 2h10M11 12l2 2 4-4"/></>,
    "calculator": <><rect x="5" y="3" width="14" height="18" rx="2"/><path d="M8 7h8M8 11h2m4 0h2m-8 4h2m4 0h2m-8 3h2m4 0h2"/></>,
    "headphones": <><path d="M3 14v-3a9 9 0 0 1 18 0v3"/><path d="M5 14h2v6H5a2 2 0 0 1-2-2v-2a2 2 0 0 1 2-2Zm14 0h-2v6h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2Z"/></>,
    "external-link": <><path d="M15 3h6v6M10 14 21 3"/><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/></>,
    "clock": <><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></>,
    "lock-keyhole": <><rect x="4" y="10" width="16" height="11" rx="2"/><path d="M8 10V7a4 4 0 1 1 8 0v3M12 14v3"/></>,
    "trending-up": <><path d="m3 17 6-6 4 4 8-8"/><path d="M15 7h6v6"/></>,
  };
  return <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.7" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">{paths[name] || paths["monitor-play"]}</svg>;
}

export default function RevendaStreamingClient() {
  const [active, setActive] = useState(0);
  const [done, setDone] = useState([]);
  const [search, setSearch] = useState("");
  const [checked, setChecked] = useState({});
  const filtered = useMemo(() => lessons.map((lesson, index) => ({ ...lesson, index })).filter((lesson) => (lesson.title + " " + lesson.level + " " + lesson.description).toLowerCase().includes(search.toLowerCase())), [search]);
  const current = lessons[active];
  const progress = Math.round((done.length / lessons.length) * 100);

  return <main className="rs-page">
    <div className="rs-breadcrumb"><Link href="/painel">Área do aluno</Link><span>/</span><span>Revenda Streaming</span></div>
    <section className="rs-hero">
      <img className="rs-hero-image" src="https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?auto=format&fit=crop&w=1400&q=85" alt="Televisão em uma sala moderna com iluminação ambiente" />
      <div className="rs-hero-shade" />
      <div className="rs-hero-copy">
        <span className="rs-eyebrow"><span className="rs-pulse" /> GUIA DE OPERAÇÃO</span>
        <h1>Revenda <em>Streaming</em></h1>
        <p>Estruture uma operação de IPTV profissional: escolha criteriosa de fornecedores, gestão de clientes, recorrência e atendimento.</p>
        <div className="rs-hero-tags"><span><Icon name="shield-check" size={15}/> Fornecedores autorizados</span><span><Icon name="trending-up" size={15}/> Receita recorrente</span><span><Icon name="clock" size={15}/> Aplicação prática</span></div>
        <a className="rs-hero-cta" href="#rs-aulas">Começar o módulo <Icon name="arrow-up-right" size={17}/></a>
      </div>
      <div className="rs-hero-mark">OCD / STREAMING</div>
    </section>

    <section className="rs-cta-grid" aria-label="Opções para começar">
      <article className="rs-cta-card rs-cta-affiliate">
        <div className="rs-cta-icon"><Icon name="trending-up" size={22}/></div>
        <div className="rs-cta-content"><span className="rs-kicker">OPORTUNIDADE DE AFILIAÇÃO</span><h2>Quero me afiliar</h2><p>Conheça a opção de afiliação pela Cakto e confira as condições diretamente na plataforma.</p><a className="rs-button rs-button-primary" href={affiliateUrl} target="_blank" rel="noopener noreferrer">Acessar afiliação <Icon name="arrow-up-right" size={16}/></a></div>
      </article>
      <article className="rs-cta-card rs-cta-panel">
        <div className="rs-cta-icon"><Icon name="monitor-play" size={22}/></div>
        <div className="rs-cta-content"><span className="rs-kicker">OPERAÇÃO PRÓPRIA</span><h2>Quero meu próprio painel</h2><p>Converse pelo WhatsApp para entender os requisitos, as opções disponíveis e a autorização de distribuição.</p><a className="rs-button rs-button-outline" href={panelUrl} target="_blank" rel="noopener noreferrer">Falar pelo WhatsApp <Icon name="arrow-up-right" size={16}/></a></div>
      </article>
    </section>

    <section className="rs-section-intro" id="rs-aulas"><div><span className="rs-section-kicker">TRILHA PRÁTICA</span><h2>Da estrutura à operação</h2><p>Avance no seu ritmo. Cada etapa termina com uma tarefa prática para organizar seu negócio.</p></div><div className="rs-progress-card"><div className="rs-progress-top"><span>SEU PROGRESSO</span><b>{done.length}/{lessons.length}</b></div><div className="rs-progress-bar"><span style={{width: progress + "%"}}/></div><strong>{progress}% <small>concluído</small></strong></div></section>

    <section className="rs-learning-layout">
      <aside className="rs-curriculum">
        <label className="rs-search"><span><Icon name="monitor-play" size={17}/></span><input value={search} onChange={(e) => setSearch(e.target.value)} placeholder="Buscar conteúdo..." aria-label="Buscar conteúdo"/></label>
        <div className="rs-curriculum-title"><span>CONTEÚDO DO MÓDULO</span><b>{String(lessons.length).padStart(2,"0")} ETAPAS</b></div>
        <div className="rs-lesson-list">{filtered.map((lesson) => <button key={lesson.title} className={"rs-lesson-item " + (active === lesson.index ? "is-active " : "") + (done.includes(lesson.index) ? "is-done" : "")} onClick={() => setActive(lesson.index)}><span className="rs-lesson-number">{done.includes(lesson.index) ? <Icon name="check-circle" size={18}/> : String(lesson.index + 1).padStart(2,"0")}</span><span className="rs-lesson-label"><b>{lesson.title}</b><small>{lesson.level} · {lesson.time}</small></span><Icon name="play-circle" size={18}/></button>)}</div>
        <div className="rs-curriculum-foot"><Icon name="lock-keyhole" size={16}/><span>Priorize serviços licenciados e proteja os dados dos seus clientes.</span></div>
      </aside>

      <article className="rs-lesson-detail">
        <div className="rs-lesson-banner"><img src="https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?auto=format&fit=crop&w=1200&q=80" alt="Ambiente de entretenimento em uma televisão" /><div className="rs-lesson-banner-overlay"/><span>ETAPA {String(active + 1).padStart(2,"0")} <i/> {current.level.toUpperCase()}</span><div className="rs-lesson-banner-caption"><span>GUIA PRÁTICO</span><h3>{current.title}</h3></div></div>
        <div className="rs-lesson-copy"><div className="rs-lesson-meta"><span><Icon name="clock" size={15}/>{current.time} de leitura</span><span><Icon name="clipboard-check" size={15}/>Conteúdo prático</span></div><h2>{current.title}</h2><p>{current.description}</p><div className="rs-task"><span className="rs-task-label"><Icon name="check-circle" size={16}/> SUA MISSÃO</span><p>{current.task}</p></div><div className="rs-checklist"><h3>Checklist desta etapa</h3>{current.checklist.map((item) => <label key={item} className="rs-check-row"><input type="checkbox" checked={!!checked[active + ":" + item]} onChange={(e) => setChecked((prev) => ({...prev, [active + ":" + item]: e.target.checked}))}/><span>{item}</span></label>)}</div><div className="rs-lesson-actions"><button className={"rs-button rs-complete " + (done.includes(active) ? "is-complete" : "")} onClick={() => setDone((prev) => prev.includes(active) ? prev.filter((item) => item !== active) : [...prev, active])}><Icon name="check-circle" size={17}/>{done.includes(active) ? "Marcar como pendente" : "Concluir etapa"}</button><div className="rs-step-nav"><button disabled={active === 0} onClick={() => setActive((n) => Math.max(0,n-1))}>Anterior</button><button disabled={active === lessons.length - 1} onClick={() => setActive((n) => Math.min(lessons.length - 1,n+1))}>Próxima etapa <Icon name="arrow-up-right" size={15}/></button></div></div><p className="rs-disclaimer">O conteúdo é educativo. Antes de revender qualquer serviço, confirme os direitos de distribuição, as condições do fornecedor e as regras aplicáveis na sua região.</p></div>
      </article>
    </section>

    <section className="rs-resources"><div className="rs-resources-heading"><div><span className="rs-section-kicker">CAIXA DE FERRAMENTAS</span><h2>Materiais para sua operação</h2><p>Recursos de apoio para você adaptar à sua realidade.</p></div><span className="rs-resource-count">04 RECURSOS</span></div><div className="rs-resource-grid">{tools.map((tool, i) => <article className="rs-resource-card" key={tool.name}><span className="rs-resource-icon"><Icon name={tool.icon} size={21}/></span><span className="rs-resource-index">RECURSO 0{i+1}</span><h3>{tool.name}</h3><p>{tool.desc}</p><button onClick={() => document.getElementById("rs-aulas")?.scrollIntoView({behavior:"smooth"})}>Explorar conteúdo <Icon name="arrow-up-right" size={15}/></button></article>)}</div></section>
    <footer className="rs-footer"><Link href="/painel">← Voltar para o painel</Link><span>O CLONE DIGITAL · APRENDA, ESTRUTURE, OPERE</span></footer>
  </main>;
}
