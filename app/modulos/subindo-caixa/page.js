import Link from "next/link";
import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../lib/member-auth";

const methods = [
  {
    number: "01",
    title: "Serviços de Streaming",
    category: "ENTRETENIMENTO",
    image: "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?auto=format&fit=crop&w=1000&q=82",
    alt: "Sala de cinema com tela iluminada",
    description: "Construa uma audiência de pessoas interessadas em filmes e séries e ofereça serviços de entretenimento legítimos, com catálogo, direitos de distribuição e condições transparentes.",
    steps: ["Pesquise fornecedores e plataformas com autorização para distribuir os conteúdos oferecidos; verifique estabilidade, suporte, compatibilidade e regras para revendedores.", "Escolha um público e crie conteúdo original sobre filmes, gêneros, novidades e recomendações. Use trailers, imagens e trechos somente quando tiver autorização ou licença aplicável.", "Organize um fluxo de atendimento: publicação útil, resposta a quem interagir, página com planos e suporte para dúvidas. Ferramentas como Manychat podem automatizar respostas dentro das regras da plataforma.", "Calcule custos, taxas, suporte e margem antes de definir preços. Cuide da retenção com atendimento e informações claras sobre renovação e cancelamento."],
    tools: "Instagram, Manychat, Canva e uma plataforma de streaming devidamente licenciada.",
    offer: "Prepare uma página explicando compatibilidade, catálogo disponível, preço, formas de pagamento, suporte e regras de cancelamento. Não prometa títulos ou canais sem confirmar os direitos e a disponibilidade.",
    prompt: ""
  },
  {
    number: "02",
    title: "Melhorias de Fotos com IA",
    category: "SERVIÇO VISUAL",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=1000&q=82",
    alt: "Hambúrguer fotografado para divulgação comercial",
    description: "Ajude restaurantes, lojas e profissionais a apresentar produtos com imagens mais nítidas, bem iluminadas e consistentes. É possível começar com ferramentas acessíveis e amostras pequenas.",
    steps: ["Procure negócios com fotos que poderiam melhorar, priorizando estabelecimentos com contato comercial público.", "Use imagens próprias, autorizadas pelo estabelecimento ou disponibilizadas para edição. Prepare duas ou três amostras sem publicar o material do cliente sem consentimento.", "Corrija luz, enquadramento, nitidez e consistência visual, preservando a aparência real do produto.", "Apresente a comparação de forma personalizada e ofereça pacotes com quantidade, prazo e número de revisões definidos."],
    tools: "ChatGPT com recursos de imagem, Photoshop ou Lightroom, Canva e ferramentas de melhoria de resolução.",
    offer: "Como referência de teste, experimente 5 imagens por R$ 60, 10 por R$ 100 ou 20 por R$ 180. Ajuste ao tempo, à complexidade e às revisões; esses valores são exemplos, não garantia de preço de mercado.",
    prompt: "Edite a imagem enviada como um profissional de fotografia comercial. Melhore iluminação, contraste, balanço de branco, enquadramento, nitidez e redução de ruído. Preserve a identidade da marca, textos, logotipos, cores e características reais do produto. Não invente ingredientes, detalhes, acessórios ou benefícios; não altere rótulos, preços ou proporções. Evite saturação exagerada e aparência artificial. Gere uma versão natural, profissional e adequada para catálogo digital e redes sociais. Se algum detalhe não puder ser recuperado com segurança, preserve-o em vez de inventar informação."
  },
  {
    number: "03",
    title: "Criação de Sites com IA",
    category: "PROJETOS DE MAIOR VALOR",
    image: "https://images.unsplash.com/photo-1467232004584-a241de8bcf5d?auto=format&fit=crop&w=1000&q=82",
    alt: "Layout de website em monitor de computador",
    description: "Crie sites e páginas para empresas que dependem apenas das redes sociais ou têm uma presença digital desatualizada. Venda o resultado comercial — clareza, confiança e facilidade de contato — e não só o visual.",
    steps: ["Escolha um segmento e encontre empresas que poderiam se beneficiar de um site próprio.", "Monte uma demonstração identificada como conceito, usando informações verificadas e conteúdo autorizado. Não publique como se fosse o site oficial sem permissão.", "Mostre como o site pode apresentar serviços, localização, perguntas frequentes e um caminho claro para orçamento, agendamento ou contato.", "Combine escopo, prazo, revisões, domínio, hospedagem, manutenção e propriedade dos materiais antes de começar."],
    tools: "Lovable, Framer, v0, ChatGPT e Vercel, escolhendo apenas as ferramentas adequadas ao projeto.",
    offer: "Como faixas iniciais para validar a oferta, considere landing pages simples entre R$ 500 e R$ 1.200 e sites institucionais entre R$ 1.200 e R$ 3.000. O preço depende de páginas, integrações, conteúdo e suporte.",
    prompt: "Crie um site responsivo, moderno e personalizado para [EMPRESA], do segmento [SEGMENTO], em [CIDADE]. Objetivo principal: [CONTATOS/ORÇAMENTOS/AGENDAMENTOS]. Inclua apresentação clara, serviços, diferenciais reais, galeria autorizada, perguntas frequentes, localização quando disponível, chamada para ação e rodapé. Use identidade visual coerente, excelente experiência mobile, acessibilidade, metadados básicos de SEO, imagens otimizadas e links funcionais. Não invente depoimentos, avaliações, certificações, preços ou resultados. Não crie botões que não funcionam. Revise navegação, formulário, responsividade e desempenho antes de finalizar."
  },
  {
    number: "04",
    title: "Marketing de Afiliados",
    category: "COMISSÕES",
    image: "https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=1000&q=82",
    alt: "Equipe planejando estratégia comercial",
    description: "Promova ferramentas e produtos de terceiros por meio de programas legítimos. Uma abordagem é focar em soluções para empresas, como CRM, agendamento, atendimento, automação e organização de processos.",
    steps: ["Escolha um público e identifique problemas que ele enfrenta de verdade.", "Pesquise soluções, teste quando possível e confira reputação, comissão, regras, prazo de atribuição e pagamento.", "Produza tutoriais, comparações e demonstrações úteis em vez de apenas publicar links.", "Identifique links de afiliado com transparência e acompanhe cliques, cadastros, vendas e cancelamentos quando os dados estiverem disponíveis."],
    tools: "Canva, editor de vídeo, página de conteúdo, ferramentas de análise e plataformas de afiliados confiáveis.",
    offer: "Exemplo: comissão de R$ 80 por venda aprovada e dez vendas gerariam R$ 800 brutos, antes de estornos, impostos e custos. Comissão alta não compensa um produto ruim ou inadequado.",
    prompt: ""
  },
  {
    number: "05",
    title: "Edição de Vídeos",
    category: "PACOTES MENSAIS",
    image: "https://images.unsplash.com/photo-1574717024653-61fd2cf4d44d?auto=format&fit=crop&w=1000&q=82",
    alt: "Estação de edição de vídeo com monitor e timeline",
    description: "Empresas que já gravam conteúdo podem precisar de cortes melhores, legendas, áudio limpo, ritmo e versões para Reels, TikTok e Shorts. Você pode vender por vídeo ou por pacote mensal.",
    steps: ["Encontre negócios que publicam vídeos, mas têm espaço para melhorar a edição.", "Monte três exemplos com materiais próprios ou autorizados, demonstrando ritmo, legendas, enquadramento e áudio.", "Ofereça uma pequena demonstração e pergunte sobre volume, estilo, prazo e objetivo dos vídeos.", "Defina por escrito quantidade, duração, formatos, revisões, entrega, direitos de uso e responsabilidade por gravação."],
    tools: "CapCut, DaVinci Resolve, Premiere Pro, ferramentas de legenda e armazenamento compartilhado.",
    offer: "Exemplos para testar: 4 vídeos por R$ 400; 10 por R$ 1.200; 15 por R$ 2.250. Projetos complexos podem custar mais. Calcule seu tempo de edição antes de fechar o pacote.",
    prompt: ""
  },
  {
    number: "06",
    title: "Criação de SaaS com IA",
    category: "PRODUTO RECORRENTE",
    image: "https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=1000&q=82",
    alt: "Painel de software com gráficos e métricas",
    description: "Desenvolva um software que resolva um problema específico e cobre por assinatura ou uso. A IA acelera o desenvolvimento, mas um SaaS real também exige segurança, testes, suporte e manutenção.",
    steps: ["Converse com potenciais clientes e descubra como resolvem o problema hoje, o que custa tempo e quais soluções já pagam.", "Valide a demanda antes de construir: mostre uma proposta, um protótipo ou uma demonstração e procure sinais concretos de interesse.", "Construa um MVP com a funcionalidade central, autenticação, banco de dados e controles de acesso adequados.", "Teste os fluxos, proteja credenciais, configure cobrança e webhooks com segurança, documente suporte e acompanhe cancelamentos e feedback."],
    tools: "ChatGPT, Lovable ou v0 para desenvolvimento assistido, banco de dados como Neon ou Supabase e hospedagem como Vercel.",
    offer: "Exemplo de teste: planos de R$ 19,90, R$ 39,90 e R$ 79,90 por mês. Ajuste pelo valor entregue e pelos custos de infraestrutura, APIs, taxas, suporte e impostos.",
    prompt: "Planeje um micro-SaaS para [PÚBLICO] que enfrenta [PROBLEMA]. Antes de codificar, defina MVP, fluxos, arquitetura, tabelas e permissões. Implemente autenticação e autorização no servidor, isolamento dos dados por usuário/organização, validação de entradas, tratamento de erros e proteção de chaves em variáveis de ambiente. Cada botão deve executar uma ação real; não apresente dados simulados como reais. Se houver cobrança recorrente, valide pagamentos por webhook seguro e trate cancelamentos e inadimplência. Teste os fluxos principais e documente configurações pendentes. Não declare pronto para produção sem verificar segurança e funcionamento."
  },
  {
    number: "07",
    title: "Gestão de Redes Sociais",
    category: "SERVIÇO RECORRENTE",
    image: "https://images.unsplash.com/photo-1611262588024-d12430b98920?auto=format&fit=crop&w=1000&q=82",
    alt: "Pessoa usando aplicativos de redes sociais no celular",
    description: "Ajude negócios a manter uma presença organizada nas redes sociais com calendário editorial, peças gráficas, legendas e relatórios simples.",
    steps: ["Escolha um nicho e analise a frequência e a qualidade das publicações atuais.", "Monte um calendário de conteúdo e exemplos de posts com identidade visual consistente.", "Defina o que está incluído: quantidade de posts, stories, legendas, agendamento e relatório.", "Apresente uma proposta mensal, obtenha aprovação do conteúdo e use acessos autorizados com permissões adequadas."],
    tools: "Canva, Meta Business Suite, ferramentas de planejamento e planilhas de acompanhamento.",
    offer: "Comece com um pacote-piloto de entregáveis bem definidos. O preço deve considerar planejamento, criação, atendimento, reuniões e relatórios — não apenas o número de artes.",
    prompt: ""
  },
  {
    number: "08",
    title: "Automação de WhatsApp e Processos",
    category: "EFICIÊNCIA PARA EMPRESAS",
    image: "https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1000&q=82",
    alt: "Profissionais trabalhando juntos em um processo comercial",
    description: "Ajude empresas a organizar perguntas frequentes, encaminhar solicitações, registrar contatos e reduzir tarefas manuais usando ferramentas de automação permitidas.",
    steps: ["Mapeie o processo atual e pergunte onde há atrasos, retrabalho ou perda de informações.", "Desenhe um fluxo simples com opções claras, transferência para atendimento humano e tratamento de exceções.", "Implemente com ferramentas oficiais e compatíveis, respeitando consentimento, privacidade e regras de mensagens.", "Teste casos reais, documente o funcionamento e ofereça manutenção para mudanças no processo."],
    tools: "Plataformas oficiais de atendimento e automação, CRM, formulários e ferramentas de integração compatíveis.",
    offer: "Cobre implantação pelo escopo e, se necessário, uma mensalidade para monitoramento e ajustes. Deixe claro quais integrações, volumes e atendimentos estão incluídos.",
    prompt: ""
  },
  {
    number: "09",
    title: "Landing Pages e Copywriting",
    category: "CONVERSÃO",
    image: "https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=1000&q=82",
    alt: "Notebook com gráficos de marketing e análise de desempenho",
    description: "Crie páginas focadas em uma única ação — pedir orçamento, agendar, baixar um material ou comprar — com uma mensagem clara e conteúdo que responda às dúvidas do público.",
    steps: ["Entenda o público, a oferta, a objeção principal e a ação desejada.", "Escreva uma estrutura com promessa verificável, benefícios, processo, perguntas frequentes e chamada para ação.", "Construa uma página rápida, responsiva e com formulário ou link de contato funcional.", "Meça visitas e conversões quando possível e proponha melhorias baseadas em dados, sem prometer resultados garantidos."],
    tools: "ChatGPT, ferramentas de site, analytics com consentimento adequado e testes de usabilidade.",
    offer: "Venda a página e, quando fizer sentido, ofereça manutenção, atualização de conteúdo ou análise periódica como serviço separado.",
    prompt: ""
  },
  {
    number: "10",
    title: "Templates e Produtos Digitais",
    category: "PRODUTO ESCALÁVEL",
    image: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1000&q=82",
    alt: "Notebook e materiais de trabalho em uma mesa",
    description: "Transforme um processo repetitivo em templates, planilhas, checklists, kits de design, roteiros ou guias que economizem tempo de um público específico.",
    steps: ["Escolha uma tarefa frequente e descubra como o público a executa atualmente.", "Crie um material original, claro e fácil de usar; inclua instruções e exemplos fictícios identificados como exemplos.", "Teste com algumas pessoas e corrija pontos confusos antes de vender.", "Prepare uma página de venda com entregáveis, compatibilidade, suporte e política de reembolso clara."],
    tools: "Canva, Google Sheets, Notion, ferramentas de pagamento e uma página simples de vendas.",
    offer: "Comece com um produto pequeno e um preço fácil de testar. Não copie materiais de terceiros nem use depoimentos, números ou resultados inventados.",
    prompt: ""
  }
];

const actionPlan = [
  ["Dia 1", "Escolha um método e defina um público específico."],
  ["Dia 2", "Pesquise cinco referências e anote como cada oferta resolve o problema."],
  ["Dia 3", "Converse com potenciais clientes e registre as dificuldades que mencionarem."],
  ["Dia 4", "Escreva sua oferta, escopo, prazo, preço de teste e custos."],
  ["Dia 5", "Prepare uma demonstração ou amostra original e autorizada."],
  ["Dia 6", "Apresente a oferta de forma personalizada e respeitosa."],
  ["Dia 7", "Revise respostas, tempo investido, custos e o próximo ajuste."]
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

      <div className="module-page-content subindo-caixa">
        <div className="module-page-breadcrumb">SUA JORNADA <span>/</span> MÓDULO 08</div>
        <section className="module-hero-card subindo-hero">
          <div className="module-hero-number">08</div>
          <div className="module-hero-copy">
            <span className="module-kicker"><i/> NOVO MÓDULO · RENDA NO DIGITAL</span>
            <h1>Subindo Caixa</h1>
            <p>Ideias práticas para transformar habilidades, serviços e produtos digitais em oportunidades de renda — com estratégia, validação e execução.</p>
          </div>
          <div className="module-hero-orbit" aria-hidden="true"><span>R$</span></div>
        </section>

        <section className="sc-intro">
          <div><span className="module-section-eyebrow">10 CAMINHOS PARA EXPLORAR</span><h2>Encontre uma oportunidade. <em>Execute com método.</em></h2></div>
          <p>Você não precisa começar por tudo. Escolha uma ideia compatível com suas habilidades, valide se existe demanda e evolua com base no retorno real do mercado. Valores e exemplos são referências para teste, não promessa de ganhos.</p>
        </section>

        <section className="sc-method-grid" aria-label="Métodos para subir caixa">
          {methods.map((method) => (
            <a className="sc-method-card" href={`#metodo-${method.number}`} key={method.number}>
              <div className="sc-card-image"><img src={method.image} alt={method.alt} loading={method.number === "01" || method.number === "02" || method.number === "03" ? "eager" : "lazy"} /><span>{method.number}</span></div>
              <div className="sc-card-content"><span className="sc-card-category">{method.category}</span><h3>{method.title}</h3><p>{method.description}</p><span className="sc-card-link">VER PASSO A PASSO <b>↗</b></span></div>
            </a>
          ))}
        </section>

        <section className="sc-principles">
          <div><span className="module-section-eyebrow">O MÉTODO 🔥</span><h2>Antes de vender, <em>entenda a dor.</em></h2><p>O princípio vale para todos os caminhos: encontre um problema específico, entenda como ele é resolvido hoje, prepare uma solução pequena e converse com pessoas que realmente possam precisar dela.</p></div>
          <div className="sc-principle-list">
            <article><span>01</span><div><b>Escolha um público</b><p>Evite tentar vender para todo mundo. Quanto mais claro o público, mais fácil entender suas necessidades.</p></div></article>
            <article><span>02</span><div><b>Valide a necessidade</b><p>Converse com potenciais clientes antes de investir muito dinheiro ou tempo.</p></div></article>
            <article><span>03</span><div><b>Monte uma oferta simples</b><p>Defina entregáveis, prazo, preço, limites e o que não está incluído.</p></div></article>
            <article><span>04</span><div><b>Aprenda com o mercado</b><p>Registre dúvidas, objeções, custos e tempo de execução. Ajuste com base em sinais reais.</p></div></article>
          </div>
        </section>

        <section className="sc-detail-list" aria-label="Guias detalhados">
          {methods.map((method) => (
            <article className="sc-detail-card" id={`metodo-${method.number}`} key={method.number}>
              <div className="sc-detail-media"><img src={method.image} alt={method.alt} loading="lazy" /><span>MÉTODO {method.number}</span></div>
              <div className="sc-detail-body">
                <div className="module-section-eyebrow">{method.category}</div><h2>{method.title}</h2><p className="sc-detail-description">{method.description}</p>
                <h3>Passo a passo</h3><ol>{method.steps.map((step) => <li key={step}>{step}</li>)}</ol>
                <div className="sc-info-block"><b>Ferramentas úteis</b><p>{method.tools}</p></div>
                <div className="sc-info-block"><b>Como estruturar a oferta</b><p>{method.offer}</p></div>
                {method.prompt ? <details className="sc-prompt"><summary>Ver prompt pronto para copiar <span>+</span></summary><div><pre>{method.prompt}</pre><button type="button" onClick={undefined} className="sc-copy-hint">Selecione o texto para copiar e adaptar</button></div></details> : null}
              </div>
            </article>
          ))}
        </section>

        <section className="sc-action-plan">
          <div><span className="module-section-eyebrow">SAIA DA TEORIA</span><h2>Seu plano de ação <em>em 7 dias.</em></h2><p>Use esse roteiro como exercício de validação. O objetivo é aprender e testar uma oferta, não prever vendas ou prometer retorno financeiro.</p></div>
          <div className="sc-action-days">{actionPlan.map(([day, task]) => <article key={day}><span>{day}</span><p>{task}</p></article>)}</div>
        </section>

        <section className="sc-final-note"><span>!</span><p><b>Jogue limpo e proteja seu negócio.</b> Respeite direitos autorais, licenças, privacidade e regras das plataformas. Não use depoimentos falsos, não prometa renda garantida e calcule custos, taxas, impostos e tempo de trabalho antes de avaliar o lucro.</p></section>

        <nav className="module-pager" aria-label="Navegar entre módulos">
          <Link href="/modulos/integracao-e-entrega" className="module-pager-link"><span>← MÓDULO ANTERIOR</span><b>Integração e entrega</b></Link>
          <Link href="/painel" className="module-pager-link next"><span>VOLTAR AO PAINEL →</span><b>Continuar jornada</b></Link>
        </nav>
        <footer className="module-page-footer">O CLONE DIGITAL <span>ENCONTRE. ANALISE. ESTRUTURE. TESTE.</span></footer>
      </div>
    </main>
  );
}
