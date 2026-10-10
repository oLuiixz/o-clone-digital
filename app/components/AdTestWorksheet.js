"use client";

import { useEffect, useMemo, useState } from "react";

const fields = [
  { key: "name", label: "Nome do teste", placeholder: "Ex.: Criativo com demonstração", wide: false },
  { key: "dates", label: "Período planejado", placeholder: "Início, fim e duração", wide: false },
  { key: "objective", label: "Objetivo da campanha", placeholder: "Qual evento ou resultado será observado?", wide: true, multiline: true },
  { key: "hypothesis", label: "Hipótese a investigar", placeholder: "Acredito que [público] responderá a [mensagem] porque...", wide: true, multiline: true },
  { key: "audience", label: "Público e configuração", placeholder: "Público, posicionamentos e motivo da escolha", wide: true, multiline: true },
  { key: "hook", label: "Gancho do criativo", placeholder: "Qual situação ou benefício abre a mensagem?", wide: true, multiline: true },
  { key: "message", label: "Argumento e demonstração", placeholder: "Como explica a solução? Que prova autêntica pode mostrar?", wide: true, multiline: true },
  { key: "cta", label: "Chamada e destino", placeholder: "Texto do CTA, URL e página/checkout revisados", wide: true, multiline: true },
  { key: "budget", label: "Orçamento máximo", placeholder: "Valor total que pode ser perdido sem afetar despesas essenciais", wide: false },
  { key: "metrics", label: "Métricas e eventos confiáveis", placeholder: "Impressões, cliques, CTR, CPC, eventos, CPA...", wide: true, multiline: true },
  { key: "pause", label: "Condições de pausa", placeholder: "Limite de gasto, falha técnica ou condição de risco", wide: true, multiline: true },
  { key: "results", label: "Resultados observados", placeholder: "Registre números, período e origem dos dados", wide: true, multiline: true },
  { key: "interpretation", label: "O que os dados sugerem — e o que não provam", placeholder: "Separe observações de hipóteses e limitações da amostra.", wide: true, multiline: true },
  { key: "decision", label: "Decisão e justificativa", placeholder: "Pausar, corrigir, testar outra hipótese ou continuar no limite", wide: true, multiline: true },
  { key: "next", label: "Próxima ação", placeholder: "Uma ação concreta para o próximo ciclo", wide: true, multiline: true },
];
const KEY = "clone-digital-primeiro-anuncio-v1";

export default function AdTestWorksheet() {
  const blank = () => Object.fromEntries(fields.map((field) => [field.key, ""]));
  const [records, setRecords] = useState([]);
  const [id, setId] = useState("");
  const [form, setForm] = useState({});
  const [ready, setReady] = useState(false);
  const [notice, setNotice] = useState("");
  useEffect(() => {
    try {
      const saved = JSON.parse(window.localStorage.getItem(KEY) || "[]");
      if (Array.isArray(saved)) setRecords(saved.filter((item) => item && typeof item.id === "string" && item.data));
    } catch { setRecords([]); }
    setForm(blank());
    setReady(true);
  }, []);
  useEffect(() => {
    if (!ready) return;
    try { window.localStorage.setItem(KEY, JSON.stringify(records)); }
    catch { setNotice("O navegador não conseguiu salvar. Copie a ficha como backup."); }
  }, [records, ready]);
  const filled = useMemo(() => fields.filter((field) => String(form[field.key] || "").trim()).length, [form]);
  function update(key, value) { setForm((old) => ({ ...old, [key]: value })); setNotice(""); }
  function newRecord() { setId(""); setForm(blank()); setNotice("Nova ficha pronta."); }
  function save() {
    const name = String(form.name || "").trim() || "Teste de anúncio sem título";
    const nextId = id || `ad-test-${Date.now()}`;
    const record = { id: nextId, name, updatedAt: new Date().toISOString(), data: form };
    setRecords((old) => old.some((item) => item.id === nextId) ? old.map((item) => item.id === nextId ? record : item) : [record, ...old]);
    setId(nextId); setNotice("Plano salvo neste navegador.");
  }
  function openRecord(nextId) {
    const record = records.find((item) => item.id === nextId);
    setId(record ? nextId : ""); setForm(record ? { ...blank(), ...record.data } : blank());
    setNotice(record ? `Plano “${record.name}” aberto.` : "");
  }
  function removeRecord() { setRecords((old) => old.filter((item) => item.id !== id)); newRecord(); setNotice("Plano excluído."); }
  async function copy() {
    const text = ["O CLONE DIGITAL — PLANO DE TESTE DE ANÚNCIO", ...fields.map((field) => `${field.label}: ${form[field.key] || "Não preenchido"}`), "", "Anúncios envolvem risco. Não há garantia de vendas; não use dinheiro de despesas essenciais."].join("\n");
    try { await navigator.clipboard.writeText(text); setNotice("Plano copiado."); }
    catch { setNotice("Cópia automática indisponível. Copie os campos manualmente."); }
  }
  return <section className="worksheet-card" aria-label="Planejador de primeiro anúncio">
    <div className="worksheet-header"><div><div className="module-section-eyebrow">FERRAMENTA PRÁTICA</div><h2>Planejador do primeiro teste de anúncio</h2><p>Registre uma hipótese, um limite de gasto e critérios de decisão antes de publicar. Cliques e faturamento isolados não comprovam lucro nem validação.</p></div><div className="worksheet-count">{filled}/{fields.length}<span>campos preenchidos</span></div></div>
    <div className="worksheet-saved-list"><label htmlFor="ad-test-saved">Planos salvos</label><div className="worksheet-saved-controls"><select id="ad-test-saved" value={id} onChange={(event) => openRecord(event.target.value)}><option value="">Novo plano / não selecionado</option>{records.map((item) => <option key={item.id} value={item.id}>{item.name}</option>)}</select><button type="button" className="worksheet-secondary-button" onClick={newRecord}>Novo plano</button></div></div>
    <div className="worksheet-form-grid">{fields.map((field) => <label key={field.key} className={field.wide ? "worksheet-field worksheet-field-wide" : "worksheet-field"}><span>{field.label}</span>{field.multiline ? <textarea rows={3} value={form[field.key] || ""} placeholder={field.placeholder} onChange={(event) => update(field.key, event.target.value)} /> : <input value={form[field.key] || ""} placeholder={field.placeholder} onChange={(event) => update(field.key, event.target.value)} />}</label>)}</div>
    <div className="worksheet-actions"><button type="button" className="worksheet-primary-button" onClick={save}>Salvar plano</button><button type="button" className="worksheet-secondary-button" onClick={copy}>Copiar plano</button>{id && <button type="button" className="worksheet-delete-button" onClick={removeRecord}>Excluir plano</button>}</div>
    {notice && <p className="worksheet-notice" role="status">{notice}</p>}
    <p className="worksheet-disclaimer">Os dados ficam somente neste navegador e não sincronizam entre dispositivos. Defina o limite de investimento antes de publicar e nunca aumente o gasto para tentar recuperar perdas.</p>
  </section>;
}
