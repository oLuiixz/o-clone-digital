import Link from "next/link";
import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../lib/member-auth";

const methods = [
  {
    number: "01",
    title: "Serviços digitais",
    tag: "COMECE COM UMA HABILIDADE",
    description: "Transforme uma habilidade que você já tem em um serviço simples e fácil de explicar. Exemplos: edição de vídeos curtos, criação de artes, configuração de páginas, organização de catálogos ou montagem de apresentações.",
    steps: [
      "Escolha um serviço específico que consiga entregar com qualidade.",
      "Defina para quem ele é útil e qual problema resolve.",
      "Monte uma amostra própria para demonstrar o resultado esperado.",
      "Aborde potenciais clientes de forma personalizada, sem spam, e combine escopo, prazo e preço antes de começar."
    ]
  },
  {
    number: "02",
    title: "Afiliados com estratégia",
    tag: "DIVULGAÇÃO COM CRITÉRIO",
    description: "Promova produtos de terceiros por meio de programas legítimos de afiliados. O foco é escolher algo relevante para um público específico e produzir conteúdo útil, em vez de apenas espalhar links.",
    steps: [
      "Escolha um nicho que você consiga estudar e comunicar com honestidade.",
      "Confira reputação, regras, comissão, condições de pagamento e qualidade do produto.",
      "Crie conteúdo original que ajude a pessoa a entender o problema e avaliar a solução.",
      "Identifique claramente links de afiliado e acompanhe cliques e conversões quando esses dados estiverem disponíveis."
    ]
  },
  {
    number: "03",
    title: "Produto digital próprio",
    tag: "CONSTRUA UM ATIVO",
    description: "Organize conhecimento ou um processo que você domina em um material útil: checklist, planilha, guia, modelo, aula ou pequeno treinamento. Valide a demanda antes de investir muito tempo na produção.",
    steps: [
      "Converse com pessoas do público e descubra uma dificuldade concreta.",
      "Crie uma versão inicial pequena que resolva um problema específico.",
      "Apresente a oferta com descrição, preço, limites e entregáveis claros.",
      "Recolha feedback real e melhore o produto sem usar depoimentos ou resultados inventados."
    ]
  },
  {
    number: "04",
    title: "Intermediação e oportunidades locais",
    tag: "CONECTE DEMANDA E SOLUÇÃO",
    description: "Você pode encontrar negócios que precisam de um serviço, conectar-se a profissionais capazes de executá-lo e atuar como prestador ou parceiro, desde que todos entendam responsabilidades, prazos e remuneração.",
    steps: [
      "Identifique uma necessidade real de um negócio ou profissional.",
      "Converse com as partes antes de prometer qualquer entrega.",
      "Formalize por escrito o escopo, os custos, os prazos e quem responde pelo serviço.",
      "Comece com um projeto pequeno e peça autorização antes de usar qualquer trabalho como portfólio."
    ]
  }
];

export default async function SubindoCaixaPage() {
  const member = await getCurrentMember();
  if (!member) redirect("/login");

  return (
    <main className="module-page-shell">
      <header className="module-page-topbar">
        <Link href="/painel" className="module-back-link">← Voltar ao painel</Link>
        <div className="module-page-brand"><span className="brand-mark">C<span>.</span></span><span>O CLONE <b>DIGITAL</b></span></div>
      </header>

      <div className="module-page-content">
        <div className="module-page-breadcrumb">SUA JORNADA <span>/</span> MÓDULO 08</div>
        <section className="module-hero-card">
          <div className="module-hero-number">08</div>
          <div className="module-hero-copy">
            <span className="module-kicker"><i/> NOVO MÓDULO · RENDA NO DIGITAL</span>
            <h1>Subindo Caixa</h1>
            <p>Caminhos práticos para transformar habilidades, pesquisa e boas ofertas em oportunidades de renda.</p>
          </div>
          <div className="module-hero-orbit" aria-hidden="true"><span>R$</span></div>
        </section>

        <section className="module-learning-grid">
          <article className="module-content-card">
            <div className="module-section-eyebrow">VISÃO GERAL</div>
            <h2>Faça a ideia sair do papel</h2>
            <p className="module-intro">Este módulo reúne caminhos diferentes para buscar renda no digital. Você vai encontrar opções que podem começar com uma habilidade ou serviço, outras que dependem de audiência e divulgação, e outras que exigem construir um produto próprio. Escolha de acordo com o tempo, os recursos e as competências que você realmente tem.</p>
            <div className="module-objective"><span>↗</span><div><b>Objetivo deste módulo</b><p>Sair com uma opção inicial, uma oferta simples e um próximo passo verificável — sem confundir faturamento com lucro e sem tratar nenhuma estratégia como dinheiro garantido.</p></div></div>
            <div className="module-benefits"><h3>Antes de começar</h3><ul>
              <li>Prefira resolver um problema real de um público definido.</li>
              <li>Comece pequeno e valide o interesse antes de assumir custos altos.</li>
              <li>Registre despesas, taxas, tempo de trabalho e receita para entender o resultado real.</li>
              <li>Use comunicação honesta e respeite as regras das plataformas, os direitos autorais e os dados pessoais.</li>
            </ul></div>
          </article>

          <aside className="module-outline-card">
            <div className="module-section-eyebrow">ROTEIRO DE APRENDIZADO</div>
            <h2>Dentro do módulo</h2>
            <div className="module-lesson-list">
              <article className="module-lesson"><span className="module-lesson-number">01</span><div><h3>O método 🔥</h3><p>Um roteiro para encontrar uma necessidade, montar uma oferta enxuta e buscar os primeiros clientes.</p></div><span className="module-lesson-state">✦</span></article>
              <article className="module-lesson"><span className="module-lesson-number">02</span><div><h3>Serviços digitais</h3><p>Transforme uma habilidade em um serviço claro e vendável.</p></div><span className="module-lesson-state">○</span></article>
              <article className="module-lesson"><span className="module-lesson-number">03</span><div><h3>Afiliados com estratégia</h3><p>Escolha produtos e produza conteúdo útil para um público específico.</p></div><span className="module-lesson-state">○</span></article>
              <article className="module-lesson"><span className="module-lesson-number">04</span><div><h3>Produto digital próprio</h3><p>Valide uma ideia pequena antes de ampliar a produção.</p></div><span className="module-lesson-state">○</span></article>
              <article className="module-lesson"><span className="module-lesson-number">05</span><div><h3>Intermediação e oportunidades</h3><p>Conecte demandas reais a soluções com escopo e responsabilidades claros.</p></div><span className="module-lesson-state">○</span></article>
            </div>
            <div className="module-content-note"><span>i</span> Use as estratégias como ponto de partida. Os resultados variam e não há garantia de renda.</div>
          </aside>
        </section>

        <section className="module-deep-content">
          <article className="module-deep-section"><span className="module-deep-index">01</span><div><h2>O método 🔥</h2><p>O princípio é simples: em vez de começar criando algo enorme, encontre um problema específico, ofereça uma solução pequena e converse com pessoas que realmente possam precisar dela. Pesquise o mercado, observe como outras ofertas explicam seus serviços, desenvolva uma proposta original e teste o interesse antes de investir pesado.</p><p><strong>Passo 1 — Escolha um público:</strong> defina quem você quer ajudar, evitando “todo mundo”. <strong>Passo 2 — Encontre uma dor concreta:</strong> procure uma tarefa que esse público precisa resolver, uma dificuldade recorrente ou algo que consome tempo. <strong>Passo 3 — Monte uma oferta enxuta:</strong> descreva o que será entregue, o prazo, o preço e o que não está incluído. <strong>Passo 4 — Mostre uma amostra:</strong> produza um exemplo próprio para a pessoa entender a proposta. <strong>Passo 5 — Valide:</strong> converse com potenciais clientes e registre dúvidas, objeções e interesse real. <strong>Passo 6 — Ajuste:</strong> use o retorno para melhorar a oferta antes de escalar.</p><p>O primeiro objetivo é aprender se existe demanda e se você consegue entregar valor. Não é promessa de dinheiro rápido: pode ser necessário testar, ajustar a proposta e ouvir muitos “não”.</p></div></article>
          {methods.map((method) => <article className="module-deep-section" key={method.number}><span className="module-deep-index">{method.number}</span><div><div className="module-section-eyebrow">{method.tag}</div><h2>{method.title}</h2><p>{method.description}</p><ol>{method.steps.map((step) => <li key={step}>{step}</li>)}</ol></div></article>)}
          <article className="module-deep-section"><span className="module-deep-index">05</span><div><h2>Seu plano de ação para os próximos 7 dias</h2><p><strong>Dia 1:</strong> escolha um caminho e um público. <strong>Dia 2:</strong> pesquise cinco referências e anote o que cada uma oferece. <strong>Dia 3:</strong> converse com potenciais clientes ou pessoas do público. <strong>Dia 4:</strong> escreva sua proposta, preço inicial, prazo e entregáveis. <strong>Dia 5:</strong> prepare uma amostra original. <strong>Dia 6:</strong> apresente a oferta de forma personalizada e respeitosa. <strong>Dia 7:</strong> revise as respostas, os custos e o próximo ajuste.</p><p>Este roteiro é um exercício de validação, não uma previsão de vendas. Não invista dinheiro que você não pode perder e desconfie de promessas de lucro garantido.</p></div></article>
        </section>

        <nav className="module-pager" aria-label="Navegar entre módulos">
          <Link href="/modulos/integracao-e-entrega" className="module-pager-link"><span>← MÓDULO ANTERIOR</span><b>Integração e entrega</b></Link>
          <Link href="/painel" className="module-pager-link next"><span>VOLTAR AO PAINEL →</span><b>Continuar jornada</b></Link>
        </nav>
        <footer className="module-page-footer">O CLONE DIGITAL <span>ENCONTRE. ANALISE. ESTRUTURE. TESTE.</span></footer>
      </div>
    </main>
  );
}
