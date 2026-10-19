import Link from "next/link";
import { redirect } from "next/navigation";
import { getCurrentMember } from "../../../lib/member-auth";

export const dynamic = "force-dynamic";

export default async function EcommercePage() {
  const member = await getCurrentMember();
  if (!member) redirect("/login");
  return (
    <main className="ecommerce-hub">
      <style>{`
        .ecommerce-hub{min-height:100vh;background:#0b0d0c;color:#f3f5f2;padding:clamp(18px,4vw,48px);font-family:inherit}
        .eh-wrap{max-width:1100px;margin:0 auto}.eh-back{display:inline-flex;margin-bottom:28px;color:#a7b2a9;text-decoration:none;font-size:13px}
        .eh-hero{padding:clamp(26px,5vw,52px);border:1px solid #2a392e;border-radius:24px;background:radial-gradient(ellipse at 82% 15%,#294a32 0,transparent 40%),linear-gradient(120deg,#151d17,#101311)}
        .eh-kicker{font-size:11px;font-weight:800;letter-spacing:.16em;color:var(--accent)}.eh-hero h1{font-size:clamp(38px,6vw,62px);line-height:1;letter-spacing:-.055em;margin:16px 0}.eh-hero h1 em{font-style:normal;color:var(--accent)}.eh-hero p{max-width:660px;color:#b8c2ba;line-height:1.8;font-size:15px}
        .eh-choices{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:18px;margin:24px 0}.eh-card{overflow:hidden;border:1px solid #2b352e;border-radius:20px;background:#111512;text-decoration:none;color:inherit;transition:transform .2s,border-color .2s}.eh-card:hover{transform:translateY(-3px);border-color:var(--accent)}
        .eh-image{width:100%;height:230px;object-fit:cover;display:block;background:#1b251e}.eh-card-content{padding:24px}.eh-number{font-size:10px;letter-spacing:.15em;font-weight:800;color:var(--accent)}.eh-card h2{font-size:25px;letter-spacing:-.035em;margin:10px 0}.eh-card p{color:#aeb9b0;font-size:13px;line-height:1.75;min-height:68px}.eh-tags{display:flex;gap:7px;flex-wrap:wrap;margin:18px 0}.eh-tag{font-size:10px;padding:7px 9px;border-radius:8px;background:#1b251e;color:#c7d9ca;border:1px solid #2b3d30}.eh-cta{display:flex;justify-content:space-between;align-items:center;padding-top:16px;border-top:1px solid #263029;font-weight:750;font-size:13px;color:var(--accent)}.eh-note{color:#849087;font-size:12px;line-height:1.7;margin-top:20px}
        @media(max-width:720px){.eh-choices{grid-template-columns:1fr}.eh-image{height:195px}.eh-card p{min-height:0}}

        :root[data-theme="light"] .ecommerce-hub{background:var(--bg,#f5f6f8);color:var(--text,#20242a)}
        :root[data-theme="light"] .ecommerce-hub .eh-hero{background:linear-gradient(120deg,#fff,#f0f3f6);border-color:var(--line,#dce0e6)}
        :root[data-theme="light"] .ecommerce-hub .eh-back,:root[data-theme="light"] .ecommerce-hub .eh-hero p,:root[data-theme="light"] .ecommerce-hub .eh-card p,:root[data-theme="light"] .ecommerce-hub .eh-note{color:var(--muted,#626975)}
        :root[data-theme="light"] .ecommerce-hub .eh-card{background:var(--card,#fff);border-color:var(--line,#dce0e6)}
        :root[data-theme="light"] .ecommerce-hub .eh-tag{background:#eef1f4;color:var(--text,#20242a);border-color:var(--line,#dce0e6)}
        :root[data-theme="light"] .ecommerce-hub .eh-cta{border-color:var(--line,#dce0e6)}
      
      `}
</style>
      <div className="eh-wrap">
        <Link className="eh-back" href="/painel">← Voltar ao painel</Link>
        <section className="eh-hero">
          <div className="eh-kicker">O CLONE DIGITAL · E-COMMERCE</div>
          <h1>Escolha seu caminho<br/>no <em>Ecommerce.</em></h1>
          <p>Aqui dentro existem duas trilhas diferentes: uma para quem quer construir e operar a própria loja virtual e outra para quem quer trabalhar revendendo produtos. Escolha por onde começar — cada caminho tem aulas e estratégias próprias.</p>
        </section>
        <section className="eh-choices" aria-label="Escolha uma trilha de Ecommerce">
          <Link href="/modulos/ecommerce/trabalhe-com-ecommerce" className="eh-card">
            <img className="eh-image" src="https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=1200&q=85" alt="Preparação de um pedido para uma loja virtual" />
            <div className="eh-card-content">
              <div className="eh-number">TRILHA 01 · LOJA PRÓPRIA</div>
              <h2>Trabalhe com Ecommerce</h2>
              <p>Aprenda a estruturar uma operação de loja virtual, com foco em Shopify, posicionamento de marca, catálogo, checkout, marketing e gestão.</p>
              <div className="eh-tags"><span className="eh-tag">Shopify</span><span className="eh-tag">Loja virtual</span><span className="eh-tag">Marketing</span></div>
              <div className="eh-cta"><span>Entrar nesta trilha</span><span>↗</span></div>
            </div>
          </Link>
          <Link href="/modulos/ecommerce/revenda-ecommerce" className="eh-card">
            <img className="eh-image" src="https://images.unsplash.com/photo-1607082349566-187342175e2f?auto=format&fit=crop&w=1200&q=85" alt="Caixas e operação de separação de pedidos" />
            <div className="eh-card-content">
              <div className="eh-number">TRILHA 02 · REVENDA</div>
              <h2>Revenda Ecommerce</h2>
              <p>Aprenda a encontrar produtos e fornecedores, calcular margem, escolher canais de venda e organizar pedidos, entrega e pós-venda para revender com método.</p>
              <div className="eh-tags"><span className="eh-tag">Fornecedores</span><span className="eh-tag">Margem</span><span className="eh-tag">Operação</span></div>
              <div className="eh-cta"><span>Entrar nesta trilha</span><span>↗</span></div>
            </div>
          </Link>
        </section>
        <p className="eh-note">As trilhas são independentes e podem ser estudadas separadamente. Nenhuma estratégia garante vendas ou lucro: valide a demanda, confira os custos e respeite as regras aplicáveis ao seu negócio.</p>
      </div>
    </main>
  );
}
