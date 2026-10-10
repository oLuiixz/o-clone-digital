"use client";

import { useEffect, useMemo, useState } from "react";

const fields = [
  { key: "product", label: "Nome do produto", placeholder: "Nome provisório", wide: false },
  { key: "audience", label: "Público indicado", placeholder: "Para quem é e em qual situação?", wide: false, multiline: true },
  { key: "problem", label: "Problema ou desejo principal", placeholder: "Descreva com clareza, sem exagerar a dor.", wide: true, multiline: true },
  { key: "outcome", label: "Benefício realista", placeholder: "O que a pessoa poderá aprender, fazer ou obter?", wide: true, multiline: true },
  { key: "headline", label: "Título principal da página", placeholder: "Explique o valor central de forma específica.", wide: true },
  { key: "subheadline", label: "Subtítulo", placeholder: "Contextualize para quem é e o que oferece.", wide: true, multiline: true },
  { key: "mechanism", label: "Como a solução funciona", placeholder: "Etapas, método ou abordagem própria.", wide: true, multiline: true },
  { key: "deliverables", label: "Entregáveis concretos", placeholder: "Módulos, arquivos, aulas, suporte e formato.", wide: true, multiline: true },
  { key: "proof", label: "Demonstração ou prova disponível", placeholder: "Exemplos reais e autorizados; se não houver, registre isso.", wide: true, multiline: true },
  { key: "objections", label: "Dúvidas e respostas", placeholder: "Acesso, requisitos, suporte, limitações, reembolso...", wide: true, multiline: true },
  { key: "price", label: "Preço e condições confirmados", placeholder: "Preço total, parcelas, taxas relevantes e política aplicável.", wide: true, multiline: true },
  { key: "cta", label: "Texto do botão e destino", placeholder: "Ex.: Ver oferta completa → checkout correto", wide: false },
  { key: "faq", label: "Perguntas frequentes", placeholder: "Liste perguntas reais e respostas diretas.", wide: true, multiline: true },
  { key: "vslHook", label: "Abertura da VSL", placeholder: "Apresente o assunto e para quem é relevante.", wide: true, multiline: true },
  { key: "vslContext", label: "Contexto e problema da VSL", placeholder: "Situação reconhecível, sem dramatização artificial.", wide: true, multiline: true },
  { key: "vslMethod", label: "Método e demonstração da VSL", placeholder: "Explique como funciona e mostre algo real.", wide: true, multiline: true },
  { key: "vslOffer", label: "Entrega, condições e chamada da VSL", placeholder: "O que recebe, preço, limites, dúvidas e próximo passo.", wide: true, multiline: true },
  { key: "pending", label: "Pendências antes de publicar", placeholder: "Provas a validar, links, políticas, revisão mobile...", wide: true, multiline: true },
];

const STORAGE_KEY = "clone-digital-pagina-vendas-vsl-v1";

export default function SalesPageBuilderWorksheet() {
  const [records, setRecords] = useState([]);
  const [currentId, setCurrentId] = useState("");
  const [form, setForm] = useState({});
  const [ready, setReady] = useState(false);
  const [notice, setNotice] = useState("");
  const blank = () => Object.fromEntries(fields.map((field) => [field.key, ""]));

  useEffect(() => {
    try {
      const saved = JSON.parse(window.localStorage.getItem(STORAGE_KEY) || "[]");
      if (Array.isArray(saved)) setRecords(saved.filter((item) => item && typeof item.id === "string" && item.data));
    } catch { setRecords([]); }
    setForm(blank());
    setReady(true);
  }, []);

  useEffect(() => {
    if (!ready) return;
    try { window.localStorage.setItem(STORAGE_KEY, JSON.stringify(records)); }
    catch { setNotice("Não foi possível salvar no navegador. Copie a ficha como backup."); }
  }, [records, ready]);

  const filled = useMemo(() => fields.filter((field) => String(form[field.key] || "").trim()).length, [form]);

  function update(key, value) {
    setForm((old) => ({ ...old, [key]: value }));
    setNotice("");
  }
  function newRecord() {
    setCurrentId("");
    setForm(blank());
    setNotice("Nova ficha pronta para preencher.");
  }
  function save() {
    const name = String(form.product || "").trim() || "Página/VSL sem título";
    const id = currentId || `sales-worksheet-${Date.now()}`;
    const record = { id, name, updatedAt: new Date().toISOString(), data: form };
    setRecords((old) => old.some((item) => item.id === id) ? old.map((item) => item.id === id ? record : item) : [record, ...old]);
    setCurrentId(id);
    setNotice("Ficha salva neste navegador.");
  }
  function openRecord(id) {
    const item = records.find((record) => record.id === id);
    setCurrentId(item ? id : "");
    setForm(item ? { ...blank(), ...item.data } : blank());
    setNotice(item ? `Ficha “${item.name}” aberta.` : "");
  }
  function removeRecord() {
    setRecords((old) => old.filter((item) => item.id !== currentId));
    newRecord();
    setNotice("Ficha excluída deste navegador.");
  }
  async function copy() {
    const output = ["O CLONE DIGITAL — PLANEJADOR DE PÁGINA E VSL", ...fields.map((field) => `${field.label}: ${form[field.key] || "Não preenchido"}`), "", "Use apenas alegações verificáveis, materiais autorizados e condições verdadeiras."].join("\n");
    try {
      await navigator.clipboard.writeText(output);
      setNotice("Ficha copiada para a área de transferência.");
    } catch { setNotice("Cópia automática indisponível. Você pode copiar os campos manualmente."); }
  }

  return (
    <section className="worksheet-card" aria-label="Planejador de página de vendas e VSL">
      <div className="worksheet-header">
        <div><div className="module-section-eyebrow">FERRAMENTA PRÁTICA</div><h2>Construtor de página de vendas e VSL</h2><p>Organize os argumentos e o roteiro antes de escrever ou gravar. A ferramenta ajuda a estruturar a mensagem, não cria provas nem garante conversões.</p></div>
        <div className="worksheet-count">{filled}/{fields.length}<span>campos preenchidos</span></div>
      </div>
      <div className="worksheet-saved-list">
        <label htmlFor="sales-vsl-saved">Fichas salvas</label>
        <div className="worksheet-saved-controls">
          <select id="sales-vsl-saved" value={currentId} onChange={(event) => openRecord(event.target.value)}>
            <option value="">Nova ficha / não selecionada</option>
            {records.map((item) => <option key={item.id} value={item.id}>{item.name}</option>)}
          </select>
          <button type="button" className="worksheet-secondary-button" onClick={newRecord}>Nova ficha</button>
        </div>
      </div>
      <div className="worksheet-form-grid">
        {fields.map((field) => <label key={field.key} className={field.wide ? "worksheet-field worksheet-field-wide" : "worksheet-field"}>
          <span>{field.label}</span>
          {field.multiline ? <textarea rows={3} value={form[field.key] || ""} placeholder={field.placeholder} onChange={(event) => update(field.key, event.target.value)} /> : <input value={form[field.key] || ""} placeholder={field.placeholder} onChange={(event) => update(field.key, event.target.value)} />}
        </label>)}
      </div>
      <div className="worksheet-actions">
        <button type="button" className="worksheet-primary-button" onClick={save}>Salvar ficha</button>
        <button type="button" className="worksheet-secondary-button" onClick={copy}>Copiar ficha</button>
        {currentId && <button type="button" className="worksheet-delete-button" onClick={removeRecord}>Excluir ficha</button>}
      </div>
      {notice && <p className="worksheet-notice" role="status">{notice}</p>}
      <p className="worksheet-disclaimer">Os registros ficam apenas neste navegador e não sincronizam entre dispositivos. Não invente depoimentos, números, escassez, garantias ou resultados; confirme preço, entregáveis, links e políticas antes de publicar.</p>
    </section>
  );
}
