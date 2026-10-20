"use client";
import { useCallback, useEffect, useState } from "react";
import Link from "next/link";
import "../admin.css";
import "./payments.css";

const money = (value, currency = "BRL") => new Intl.NumberFormat("pt-BR", { style: "currency", currency: String(currency || "BRL").trim() }).format(Number(value || 0) / 100);
const date = value => value ? new Date(value).toLocaleString("pt-BR", { dateStyle: "short", timeStyle: "short" }) : "—";
const statusLabel = value => ({ approved: "Aprovado", pending: "Pendente", refunded: "Reembolsado", cancelled: "Cancelado", active: "Ativo", revoked: "Revogado" }[value] || value || "—");

export default function AdminPaymentsPage() {
  const [orders, setOrders] = useState([]);
  const [history, setHistory] = useState([]);
  const [authenticated, setAuthenticated] = useState(false);
  const [checking, setChecking] = useState(true);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [filter, setFilter] = useState("all");
  const [query, setQuery] = useState("");

  const load = useCallback(async () => {
    setLoading(true); setError("");
    try {
      const response = await fetch("/api/admin/orders", { cache: "no-store", credentials: "same-origin" });
      const data = await response.json();
      if (response.status === 401) { setAuthenticated(false); return; }
      if (!response.ok) throw new Error(data.error || "Não foi possível carregar os pagamentos.");
      setOrders(data.orders || []); setHistory(data.history || []); setAuthenticated(true);
    } catch (e) { setError(e.message || "Falha ao carregar pagamentos."); }
    finally { setLoading(false); setChecking(false); }
  }, []);

  useEffect(() => { load(); }, [load]);

  const visible = orders.filter(order => {
    const matchesFilter = filter === "all" || (filter === "approved" ? order.status === "approved" : filter === "pending" ? order.status === "pending" : order.status !== "approved" && order.status !== "pending");
    const haystack = [order.customer_email, order.product_name, order.provider, order.provider_payment_id, order.provider_checkout_id].join(" ").toLowerCase();
    return matchesFilter && haystack.includes(query.toLowerCase());
  });
  const approved = orders.filter(order => order.status === "approved");
  const pending = orders.filter(order => order.status === "pending");
  const revenue = approved.reduce((sum, order) => sum + Number(order.amount || 0), 0);

  if (checking) return <main className="admin-page admin-payments-route"><div className="admin-shell"><p>Verificando sessão administrativa…</p></div></main>;
  if (!authenticated) return <main className="admin-page"><div className="admin-main"><section className="admin-panel"><p className="eyebrow">O CLONE DIGITAL · ACESSO RESTRITO</p><h1>Pagamentos</h1><p>Entre pelo <Link href="/admin">painel administrativo</Link> para acessar esta área.</p><Link className="primary-button" href="/admin">Ir para o login administrativo</Link></section></div></main>;

  return <main className="admin-page">
    <aside className="admin-sidebar">
      <Link className="admin-sidebar-brand" href="/admin"><span className="admin-logo-mark">OC</span><span>O CLONE <b>DIGITAL</b><small>PAINEL ADMINISTRATIVO</small></span></Link>
      <nav className="admin-sidebar-nav" aria-label="Navegação administrativa">
        <Link href="/admin">Dashboard</Link><Link className="is-active" href="/admin/pagamentos">Pagamentos</Link><Link href="/admin#acesso-gratuito">Acesso gratuito</Link><Link href="/admin#historico">Histórico</Link><Link href="/admin#avisos-globais">Anúncios</Link><Link href="/admin/feedback">Feedbacks</Link><Link href="/admin/ferramentas">Ferramentas</Link><Link href="/admin/configuracoes">Configurações</Link>
      </nav>
      <div className="admin-sidebar-bottom"><Link href="/painel">Abrir área de membros ↗</Link></div>
    </aside>
    <div className="admin-main">
      <header className="admin-topbar"><div><span className="eyebrow">GESTÃO FINANCEIRA</span><h1>Pagamentos</h1><p>Pedidos, aprovações e concessão de acesso em um só lugar.</p></div><button className="secondary" disabled={loading} onClick={load}>{loading ? "Atualizando…" : "Atualizar dados"}</button></header>
      {error && <div className="settings-warning" role="alert">{error}</div>}
      <section className="admin-stats-grid">
        <article className="admin-stat-card"><span>Receita aprovada</span><strong>{money(revenue)}</strong><small>Somatório dos pedidos aprovados carregados</small></article>
        <article className="admin-stat-card"><span>Pedidos</span><strong>{orders.length}</strong><small>Até 300 pedidos recentes</small></article>
        <article className="admin-stat-card"><span>Aprovados</span><strong>{approved.length}</strong><small>Pedidos com pagamento aprovado</small></article>
        <article className="admin-stat-card"><span>Pendentes</span><strong>{pending.length}</strong><small>Aguardando confirmação</small></article>
      </section>
      <section className="admin-panel" aria-labelledby="orders-title">
        <div className="admin-panel-heading"><div><span className="eyebrow">PEDIDOS</span><h2 id="orders-title">Pedidos recentes</h2></div><span className="heading-count">{visible.length} registros</span></div>
        <div className="admin-toolbar"><input aria-label="Pesquisar pagamentos" placeholder="Buscar por e-mail, produto ou provedor…" value={query} onChange={e => setQuery(e.target.value)} /><select aria-label="Filtrar por status" value={filter} onChange={e => setFilter(e.target.value)}><option value="all">Todos os status</option><option value="approved">Aprovados</option><option value="pending">Pendentes</option><option value="other">Outros status</option></select></div>
        <div className="admin-table-wrap"><table className="admin-table"><thead><tr><th>Comprador</th><th>Produto</th><th>Valor</th><th>Status</th><th>Acesso</th><th>Data</th></tr></thead><tbody>
          {visible.map(order => <tr key={order.id}><td><strong>{order.customer_email || "—"}</strong><small>{order.provider || "Provedor não informado"}</small></td><td>{order.product_name || "—"}</td><td>{money(order.amount, order.currency)}</td><td><span className={"status-pill " + (order.status === "approved" ? "success" : order.status === "pending" ? "warning" : "neutral")}>{statusLabel(order.status)}</span></td><td><span className={"status-pill " + (order.entitlement_status === "active" && order.status === "approved" ? "success" : "neutral")}>{order.entitlement_status === "active" && order.status === "approved" ? "Ativo" : statusLabel(order.entitlement_status || "Sem acesso")}</span></td><td>{date(order.created_at)}</td></tr>)}
          {!visible.length && <tr><td colSpan="6">{loading ? "Carregando pedidos…" : "Nenhum pedido encontrado para esse filtro."}</td></tr>}
        </tbody></table></div>
        <p className="admin-muted">Os dados exibidos vêm da API administrativa protegida. Esta tela é somente de consulta; não altera pedidos nem libera acesso manualmente.</p>
      </section>
      <section className="admin-panel"><div className="admin-panel-heading"><div><span className="eyebrow">ENTREGA</span><h2>Histórico de entrega</h2></div><span className="heading-count">{history.length} eventos</span></div><div className="admin-table-wrap"><table className="admin-table"><thead><tr><th>Comprador</th><th>Ação</th><th>Status</th><th>Canal</th><th>Data</th></tr></thead><tbody>{history.slice(0, 30).map(event => <tr key={event.id}><td>{event.customer_email || "—"}</td><td>{event.action || "—"}</td><td>{statusLabel(event.status)}</td><td>{event.channel || "—"}</td><td>{date(event.created_at)}</td></tr>)}{!history.length && <tr><td colSpan="5">Nenhum evento de entrega encontrado.</td></tr>}</tbody></table></div></section>
      <footer><span>O CLONE DIGITAL</span><span>ÁREA ADMINISTRATIVA · SOMENTE LEITURA</span></footer>
    </div>
  </main>;
}
