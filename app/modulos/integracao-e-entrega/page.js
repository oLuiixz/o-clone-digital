import Link from "next/link";

const lessons = [
  ["01", "O caminho completo da compra", "Desenhe a jornada real: anúncio ou conteúdo → página de vendas → checkout → confirmação do pagamento → entrega → suporte. Para cada etapa, anote quem é responsável, qual ferramenta participa e como você verificará se funcionou. Não prometa acesso imediato se houver uma etapa manual."],
  ["02", "Configure o checkout com transparência", "Cadastre nome, descrição, preço, moeda, parcelamento quando houver, recorrência quando aplicável, política de reembolso, contato de suporte e informações exigidas pela plataforma. Revise a oferta no celular e confirme que o comprador entende exatamente o que está comprando antes de pagar."],
  ["03", "Pagamento aprovado não é a mesma coisa que clique", "Use o status oficial da plataforma de pagamento como fonte de verdade. Não libere acesso apenas porque alguém abriu a página de obrigado ou enviou um comprovante por mensagem. Para PIX, cartão e boleto, respeite os estados que o provedor realmente informa e não trate pagamento pendente como aprovado."],
  ["04", "Webhook e automação sem atalhos", "Quando houver integração por webhook, valide a assinatura ou o mecanismo de autenticação documentado pelo provedor, confira o identificador do evento e processe cada evento de forma idempotente — uma repetição não pode liberar duplicado, cobrar de novo nem disparar mensagens sem controle. Guarde logs mínimos para diagnosticar falhas e nunca exponha segredos no navegador."],
  ["05", "Entregue o produto com instruções claras", "Defina onde o comprador acessa o conteúdo, como recebe o link, quais são os requisitos e o que fazer se o e-mail não chegar. Prefira uma área autenticada ou link individual com prazo quando o produto exigir controle de acesso. Evite links públicos permanentes para materiais que deveriam ser restritos e não solicite senhas de outras contas."],
  ["06", "Teste antes de vender de verdade", "Faça uma compra de teste no ambiente permitido pelo provedor ou use um fluxo de teste documentado. Verifique confirmação, dados recebidos, criação do acesso, e-mail ou mensagem, experiência no celular e procedimento de reembolso/cancelamento. Teste também pagamento recusado, pendente, duplicidade de evento e falha temporária da entrega. Não use dados falsos em produção."],
  ["07", "Suporte, reembolso e problemas comuns", "Prepare respostas para: pagamento aprovado sem acesso, e-mail incorreto, link expirado, pagamento pendente, cobrança duplicada e pedido de cancelamento. Peça apenas os dados necessários para localizar a compra, confirme a identidade de forma proporcional e nunca peça número completo do cartão, código de segurança ou senha. Registre o caso e informe prazo realista para resolver."],
  ["08", "Acompanhe a operação sem expor dados", "Registre identificador do pedido, estado do pagamento, estado da entrega, data e resultado da resolução, usando acesso restrito. Separe receita bruta de taxas, reembolsos, impostos e custos. Limite o acesso aos dados pessoais, defina retenção adequada e siga a legislação aplicável, incluindo obrigações de privacidade e defesa do consumidor."],
];

const checklist = [
  "A descrição do produto, preço e condições correspondem ao que será entregue.",
  "O checkout foi revisado em celular e computador.",
  "A aprovação é confirmada pelo provedor, não por uma tela visitada pelo cliente.",
  "Eventos repetidos não criam acessos ou mensagens duplicadas.",
  "O comprador recebe instruções claras e um canal de suporte funcional.",
  "Existe um processo testado para falha, cancelamento e reembolso.",
  "Credenciais e segredos ficam no servidor e não no código público.",
  "Os dados pessoais coletados são necessários e têm acesso restrito.",
];

export default function IntegracaoEntregaPage() {
  return (
    <main className="module-page-shell">
      <header className="module-page-topbar">
        <Link className="module-back-link" href="/">← Voltar para a jornada</Link>
        <div className="module-page-brand"><span className="brand-mark">C</span><span>O CLONE <b>DIGITAL</b></span></div>
      </header>
      <div className="module-page-content">
        <div className="module-page-breadcrumb">TRILHA DE APRENDIZADO <span>/</span> MÓDULO 07</div>
        <section className="module-hero-card">
          <div className="module-hero-number">07</div>
          <div className="module-hero-copy">
            <div className="module-kicker"><i /> OPERAÇÃO E EXPERIÊNCIA DO CLIENTE</div>
            <h1>Integração e entrega</h1>
            <p>Conecte checkout, confirmação do pagamento, acesso ao produto e suporte. Uma venda só está bem organizada quando a pessoa recebe o que comprou e sabe como pedir ajuda.</p>
          </div>
          <div className="module-hero-orbit" aria-hidden="true"><span>→</span></div>
        </section>

        <div className="module-learning-grid">
          <section className="module-content-card">
            <div className="module-section-eyebrow">OBJETIVO DO MÓDULO</div>
            <h2>Da compra à entrega, sem pontas soltas</h2>
            <p className="module-intro">Neste módulo, você vai mapear o caminho do cliente e preparar uma operação simples, verificável e segura. O objetivo não é integrar ferramentas por integrar: é garantir que cada etapa tenha uma condição clara de sucesso, um plano para falhas e uma pessoa responsável por resolver problemas.</p>
            <div className="module-objective"><span>✓</span><div><b>Ao concluir</b><p>Você terá um mapa da jornada de compra, um checklist de configuração e testes, e um plano de suporte para os problemas mais comuns.</p></div></div>
            <div className="module-section-eyebrow" style={{marginTop: 28}}>MODELO DE FLUXO</div>
            <div className="module-lesson-list">
              {["Oferta e página revisadas", "Checkout recebe o pedido", "Provedor confirma o status", "Sistema valida o evento", "Acesso e instruções são enviados", "Pedido fica registrado para suporte"].map((item, i) => (
                <div className="module-lesson" key={item}><span className="module-lesson-number">{String(i + 1).padStart(2, "0")}</span><div><h3>{item}</h3><p>{i === 2 ? "A confirmação deve vir da fonte confiável de pagamento." : i === 3 ? "Verifique autenticidade e evite processar o mesmo evento duas vezes." : i === 4 ? "Informe como entrar, onde encontrar o conteúdo e como pedir ajuda." : "Documente a etapa e o que fazer quando ela não ocorrer como esperado."}</p></div><span className="module-lesson-state">›</span></div>
              ))}
            </div>
            <div className="module-content-note"><span>i</span> Os nomes dos menus e recursos variam entre plataformas. Siga a documentação oficial do checkout, do provedor de pagamento e da ferramenta de entrega que você escolher.</div>
          </section>

          <section className="module-outline-card">
            <div className="module-section-eyebrow">AULAS DO MÓDULO</div>
            <h2>O que você vai aprender</h2>
            <div className="module-lesson-list">
              {lessons.map(([number, title, description]) => (
                <article className="module-lesson" key={number}>
                  <span className="module-lesson-number">{number}</span>
                  <div><h3>{title}</h3><p>{description}</p></div>
                  <span className="module-lesson-state">•</span>
                </article>
              ))}
            </div>
          </section>
        </div>

        <section className="module-outline-card" style={{marginTop: 18}}>
          <div className="module-section-eyebrow">MATERIAL DE APOIO</div>
          <h2>Checklist antes de abrir as vendas</h2>
          <p className="module-intro">Marque cada item apenas depois de verificar na prática. Se uma etapa essencial falhar, corrija antes de aumentar o tráfego ou anunciar que o acesso é automático.</p>
          <div className="module-lesson-list" style={{marginTop: 14}}>
            {checklist.map((item, i) => <div className="module-lesson" key={item}><span className="module-lesson-number">{String(i + 1).padStart(2, "0")}</span><div><h3>{item}</h3></div><span className="module-lesson-state">□</span></div>)}
          </div>
        </section>

        <section className="module-outline-card" style={{marginTop: 18}}>
          <div className="module-section-eyebrow">EXERCÍCIO PRÁTICO</div>
          <h2>Desenhe e teste a sua jornada</h2>
          <p className="module-intro">Preencha este roteiro no seu documento de trabalho:</p>
          <div className="module-lesson-list" style={{marginTop: 14}}>
            {[
              ["Produto e promessa", "O que a pessoa compra e quais entregáveis recebe?"],
              ["Checkout e pagamento", "Qual plataforma processa a compra e qual status confirma a aprovação?"],
              ["Regra de liberação", "Que evento libera o acesso e como você impede duplicidade?"],
              ["Canal de entrega", "Onde o cliente acessa e qual instrução receberá?"],
              ["Plano de falha", "Quem resolve, como o cliente entra em contato e qual prazo realista será informado?"],
              ["Evidência do teste", "Qual compra ou evento de teste confirma que o fluxo completo funcionou?"],
            ].map(([title, prompt], i) => <div className="module-lesson" key={title}><span className="module-lesson-number">{String(i + 1).padStart(2, "0")}</span><div><h3>{title}</h3><p>{prompt}</p></div></div>)}
          </div>
          <div className="module-objective"><span>✓</span><div><b>Critério de conclusão</b><p>Você consegue demonstrar, em teste, o que acontece desde a compra até o acesso e explicar o que fará se o pagamento ou a entrega falhar.</p></div></div>
        </section>

        <nav className="module-pager">
          <Link className="module-pager-link" href="/modulos/primeiro-anuncio"><span>← MÓDULO ANTERIOR</span><b>06 · Primeiro anúncio</b></Link>
          <Link className="module-pager-link next" href="/"><span>FIM DA TRILHA</span><b>Voltar à visão geral ↗</b></Link>
        </nav>
        <footer className="module-page-footer"><div>O CLONE DIGITAL <span>© 2026</span></div><div>ESTRUTURE. ENTREGUE. MELHORE.</div></footer>
      </div>
    </main>
  );
}
