"use client";

import { useEffect, useMemo, useState } from "react";

const fields = [
  { key: "product", label: "Produto e versão", placeholder: "Nome do produto que será entregue", wide: false },
  { key: "price", label: "Preço e condições", placeholder: "Preço, parcelas e recorrência, se houver", wide: false },
  { key: "checkout", label: "Checkout escolhido", placeholder: "Plataforma e link de checkout", wide: true, multiline: true },
  { key: "delivery", label: "Local e forma de entrega", placeholder: "Área autenticada, e-mail ou outro canal; descreva o acesso.", wide: true, multiline: true },
  { key: "approval", label: "Como confirmar pagamento", placeholder: "Evento/status oficial documentado pelo provedor", wide: true, multiline: true },
  { key: "security", label: "Validação e proteção do webhook", placeholder: "Assinatura, segredo no servidor, verificação do evento e idempotência", wide: true, multiline: true },
  { key: "access", label: "Regra de concessão e revogação de acesso", placeholder: "O que libera, mantém, suspende ou revoga o acesso?", wide: true, multiline: true },
  { key: "support", label: "Canal de suporte", placeholder: "Contato real e prazo de resposta que pode cumprir", wide: true, multiline: true },
  { key: "refund", label: "Cancelamento e reembolso", placeholder: "Política publicada e processo operacional", wide: true, multiline: true },
  { key: "testApproved", label: "Teste de pagamento aprovado", placeholder: "Passos e evidência do teste permitido pelo provedor", wide: true, multiline: true },
  { key: "testPending", label: "Teste pendente, recusado e duplicado", placeholder: "Resultado esperado para cada estado/evento", wide: true, multiline: true },
  { key: "testDelivery", label: "Teste de falha de entrega", placeholder: "Como detectar, reprocessar e comunicar o problema", wide: true, multiline: true },
  { key: "privacy", label: "Dados pessoais e retenção", placeholder: "Quais dados são necessários, quem acessa e por quanto tempo", wide: true, multiline: true },
  { key: "pending", label: "Pendências antes de vender", placeholder: "Configurações, políticas, links e testes que faltam", wide: true, multiline: true },
];
const KEY = "clone-digital-operacao-entrega-v1";

export default function DeliveryOperationsWorksheet() {
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
    catch { setNotice("Não foi possível salvar no navegador. Copie a ficha como backup."); }
  }, [records, ready]);
  const filled = useMemo(() => fields.filter((field) => String(form[field.key] || "").trim()).length, [form]);
  function update(key, value) { setForm((old) => ({ ...old, [key]: value })); setNotice(""); }
  function newRecord() { setId(""); setForm(blank()); setNotice("Nova ficha pronta."); }
  function save() {
    const name = String(form.product || "").trim() || "Operação sem título";
    const nextId = id || `delivery-plan-${Date.now()}`;
    const record = { id: nextId, name, updatedAt: new Date().toISOString(), data: form };
    setRecords((old) => old.some((item) => item.id === nextId) ? old.map((item) => item.id === nextId ? record : item) : [record, ...old]);
    setId(nextId); setNotice("Plano operacional salvo neste navegador.");
  }
  function openRecord(nextId) {
    const record = records.find((item) => item.id === nextId);
    setId(record ? nextId : ""); setForm(record ? { ...blank(), ...record.data } : blank());
    setNotice(record ? `Plano “${record.name}” aberto.` : "");
  }
  function removeRecord() { setRecords((old) => old.filter((item) => item.id !== id)); newRecord(); setNotice("Plano excluído."); }
  async function copy() {
    const text = ["O CLONE DIGITAL — PLANO DE INTEGRAÇÃO E ENTREGA", ...fields.map((field) => `${field.label}: ${form[field.key] || "Não preenchido"}`), "", "Este documento é planejamento. Não confirma que qualquer integração foi implementada ou testada."].join("\n");
    try { await navigator.clipboard.writeText(text); setNotice("Plano copiado."); }
    catch { setNotice("Cópia automática indisponível. Copie os campos manualmente."); }
  }
  return <section className="worksheet-card" aria-label="Planejador de integração e entrega">
    <div className="worksheet-header"><div><div className="module-section-eyebrow">FERRAMENTA PRÁTICA</div><h2>Plano de integração e entrega</h2><p>Documente as regras da operação antes de conectar checkout, pagamentos e liberação de acesso. Preencher esta ficha não implementa a integração nem substitui os testes reais.</p></div><div className="worksheet-count">{filled}/{fields.length}<span>campos preenchidos</span></div></div>
    <div className="worksheet-saved-list"><label htmlFor="delivery-plan-saved">Planos salvos</label><div className="worksheet-saved-controls"><select id="delivery-plan-saved" value={id} onChange={(event) => openRecord(event.target.value)}><option value="">Novo plano / não selecionado</option>{records.map((item) => <option key={item.id} value={item.id}>{item.name}</option>)}</select><button type="button" className="worksheet-secondary-button" onClick={newRecord}>Novo plano</button></div></div>
    <div className="worksheet-form-grid">{fields.map((field) => <label key={field.key} className={field.wide ? "worksheet-field worksheet-field-wide" : "worksheet-field"}><span>{field.label}</span>{field.multiline ? <textarea rows={3} value={form[field.key] || ""} placeholder={field.placeholder} onChange={(event) => update(field.key, event.target.value)} /> : <input value={form[field.key] || ""} placeholder={field.placeholder} onChange={(event) => update(field.key, event.target.value)} />}</label>)}</div>
    <div className="worksheet-actions"><button type="button" className="worksheet-primary-button" onClick={save}>Salvar plano</button><button type="button" className="worksheet-secondary-button" onClick={copy}>Copiar plano</button>{id && <button type="button" className="worksheet-delete-button" onClick={removeRecord}>Excluir plano</button>}</div>
    {notice && <p className="worksheet-notice" role="status">{notice}</p>}
    <p className="worksheet-disclaimer">Os registros ficam somente neste navegador e não sincronizam entre dispositivos. Nunca armazene senhas, tokens, segredos de webhook ou dados completos de cartão nesta ficha. Só marque a operação como pronta depois de testar o fluxo real.</p>
  </section>;
}
