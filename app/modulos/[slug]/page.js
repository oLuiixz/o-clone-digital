import Link from "next/link";
import { notFound } from "next/navigation";

const modules = [
{number:"01",slug:"entendendo-o-processo",title:"Entendendo o processo",subtitle:"Conheça o caminho da pesquisa ao primeiro teste.",intro:"Antes de criar uma oferta, entenda o processo completo e como cada etapa se conecta.",objective:"Mapear as etapas e organizar seu ponto de partida.",lessons:[["Boas-vindas e visão geral","Como funciona a jornada e o que você vai construir."],["O mapa do método","Pesquisa, análise, estruturação, criação e teste."],["Preparando seu espaço de trabalho","Organize referências, anotações e decisões."]]},
{number:"02",slug:"mineracao-de-ofertas",title:"Mineração de ofertas",subtitle:"Aprenda a pesquisar anúncios e encontrar referências.",intro:"Encontre ofertas relevantes, observe o mercado e registre referências para estudar com critério.",objective:"Criar um processo repetível para encontrar e organizar ofertas.",lessons:[["Onde encontrar referências","Fontes e formas de descobrir ofertas e anúncios."],["O que observar na pesquisa","Promessa, público, criativos e posicionamento."],["Biblioteca de ofertas","Salve links, capturas e observações com contexto."]]},
{number:"03",slug:"analise-da-oferta",title:"Análise da oferta",subtitle:"Entenda a promessa, o público, os criativos e a estrutura.",intro:"Separe os elementos de cada oferta para entender como ela apresenta problema, solução e diferenciais.",objective:"Comparar ofertas e documentar hipóteses usando um roteiro.",lessons:[["Promessa e público","Identifique para quem a oferta foi pensada."],["Criativos e mensagem","Observe gancho, argumento, demonstração e chamada."],["Página e VSL","Analise a sequência da comunicação."],["Ficha de análise","Registre evidências, dúvidas e hipóteses."]]},
{number:"04",slug:"estrutura-e-produto",title:"Estrutura e produto",subtitle:"Planeje uma oferta própria a partir das referências estudadas.",intro:"Transforme os aprendizados da pesquisa em uma proposta própria, útil e coerente, sem copiar materiais de terceiros.",objective:"Definir proposta de valor, entregável e posicionamento inicial.",lessons:[["Definindo o problema","Delimite o público e o problema que pretende resolver."],["Desenhando o entregável","Organize formato, componentes e experiência."],["Diferenciais e posicionamento","Explique o que torna sua proposta relevante."],["Checklist da estrutura","Confira clareza, viabilidade e consistência."]]},
{number:"05",slug:"pagina-de-vendas-e-vsl",title:"Página de vendas e VSL",subtitle:"Estruture sua comunicação e apresente a oferta com clareza.",intro:"Uma página ou vídeo de vendas deve ajudar o público a entender a oferta e tomar uma decisão informada.",objective:"Planejar a mensagem principal e a sequência de apresentação.",lessons:[["Estrutura da página","Título, contexto, benefícios, dúvidas e chamada para ação."],["Roteiro de VSL","Apresente problema, solução e oferta com lógica."],["Provas e transparência","Use informações verificáveis e evite promessas sem comprovação."],["Revisão antes de publicar","Confira clareza, links e experiência mobile."]]},
{number:"06",slug:"primeiro-anuncio",title:"Primeiro anúncio",subtitle:"Prepare a campanha inicial e aprenda a testar com responsabilidade.",intro:"Defina o que será testado, quais resultados acompanhar e um orçamento compatível com sua realidade. Testes não garantem vendas.",objective:"Planejar um teste pequeno, mensurável e alinhado à oferta.",lessons:[["Planejando o criativo","Conecte a mensagem à promessa real da oferta."],["Checklist da campanha","Revise destino, rastreamento, orçamento e políticas."],["Métricas essenciais","Entenda cliques, conversões, custo e qualidade."],["Aprendendo com o teste","Registre hipóteses e resultados para decidir próximos passos."]]}
];

export function generateStaticParams(){return modules.map(({slug})=>({slug}));}

export default async function ModulePage({params}){
  const {slug}=await params;
  const module=modules.find(item=>item.slug===slug);
  if(!module) notFound();
  const index=modules.findIndex(item=>item.slug===slug);
  const previous=modules[index-1], next=modules[index+1];
  return <main className="module-page-shell">
    <header className="module-page-topbar"><Link href="/" className="module-back-link">← Voltar ao painel</Link><div className="module-page-brand"><span className="brand-mark">C<span>.</span></span><span>O CLONE <b>DIGITAL</b></span></div></header>
    <div className="module-page-content">
      <div className="module-page-breadcrumb">SUA JORNADA <span>/</span> MÓDULO {module.number}</div>
      <section className="module-hero-card"><div className="module-hero-number">{module.number}</div><div className="module-hero-copy"><span className="module-kicker"><i/> MÓDULO {module.number} · TRILHA DE APRENDIZADO</span><h1>{module.title}</h1><p>{module.subtitle}</p></div><div className="module-hero-orbit" aria-hidden="true"><span>C.</span></div></section>
      <section className="module-learning-grid">
        <article className="module-content-card"><div className="module-section-eyebrow">VISÃO GERAL</div><h2>O que você vai aprender</h2><p className="module-intro">{module.intro}</p><div className="module-objective"><span>↗</span><div><b>Objetivo deste módulo</b><p>{module.objective}</p></div></div></article>
        <aside className="module-outline-card"><div className="module-section-eyebrow">ROTEIRO DE APRENDIZADO</div><h2>Conteúdo do módulo</h2><div className="module-lesson-list">{module.lessons.map(([title,description],i)=><article className="module-lesson" key={title}><span className="module-lesson-number">{String(i+1).padStart(2,"0")}</span><div><h3>{title}</h3><p>{description}</p></div><span className="module-lesson-state" title="Aula planejada">○</span></article>)}</div><div className="module-content-note"><span>i</span> O roteiro está organizado. Aulas completas, vídeos e materiais serão adicionados por etapa.</div></aside>
      </section>
      <nav className="module-pager" aria-label="Navegar entre módulos">{previous?<Link href={`/modulos/${previous.slug}`} className="module-pager-link"><span>← MÓDULO ANTERIOR</span><b>{previous.title}</b></Link>:<Link href="/" className="module-pager-link"><span>← PAINEL PRINCIPAL</span><b>Voltar ao início</b></Link>}{next?<Link href={`/modulos/${next.slug}`} className="module-pager-link next"><span>PRÓXIMO MÓDULO →</span><b>{next.title}</b></Link>:<Link href="/" className="module-pager-link next"><span>FIM DA TRILHA</span><b>Voltar ao painel</b></Link>}</nav>
      <footer className="module-page-footer">O CLONE DIGITAL <span>ENCONTRE. ANALISE. ESTRUTURE. TESTE.</span></footer>
    </div>
  </main>;
}
