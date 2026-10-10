"use client";

import { useEffect, useMemo, useState } from "react";

const STORAGE_KEY = "clone-digital-mineracao-fichas-v1";
const emptyRecord = {
  offerName: "",
  domain: "",
  pageUrl: "",
  researchedAt: "",
  country: "Todos",
  adType: "Todos os anúncios",
  adCount: "",
  activeAds: "",
  product: "",
  audience: "",
  promise: "",
  evidence: "",
  doubts: "",
  decision: "Investigar mais",
  reason: "",
  nextStep: "",
};

const fields = [
  ["offerName", "Nome da oferta", "Ex.: Curso de edição"],
  ["domain", "Domínio pesquisado", "exemplo.com"],
  ["pageUrl", "URL da página", "https://..."],
  ["researchedAt", "Data da pesquisa", "Ex.: 10/10/2026"],
  ["adCount", "Quantidade de anúncios encontrados", "Número observado"],
  ["activeAds", "Anúncios ativos confirmados", "Número confirmado"],
  ["product", "O que a página oferece?", "Descreva apenas o que conseguiu observar"],
  ["audience", "Público aparente", "Para quem parece ser a oferta?"],
  ["promise", "Promessa principal", "Qual benefício é comunicado?"],
  ["evidence", "Evidências e padrões observados", "Anote anúncios, datas, criativos e filtros usados"],
  ["doubts", "Dúvidas que ainda precisam ser verificadas", "O que não é possível concluir ainda?"],
  ["reason", "Justificativa da decisão", "Quais fatos sustentam sua escolha?"],
  ["nextStep", "Próxima ação", "Ex.: conferir a página e comparar outra oferta"],
];

export default function MiningWorksheet() {
  const [records, setRecords] = useState([]);
  const [currentId, setCurrentId] = useState("");
  const [form, setForm] = useState(emptyRecord);
  const [ready, setReady] = useState(false);
  const [notice, setNotice] = useState("");

  useEffect(() => {
    try {
      const saved = JSON.parse(window.localStorage.getItem(STORAGE_KEY) || "[]");
      if (Array.isArray(saved)) {
        const valid = saved.filter((item) => item && typeof item.id === "string" && item.data && typeof item.data === "object");
        setRecords(valid);
      }
    } catch {
      setRecords([]);
    }
    setReady(true);
  }, []);

  useEffect(() => {
    if (!ready) return;
    try {
      window.localStorage.setItem(STORAGE_KEY, JSON.stringify(records));
    } catch {
      setNotice("Não foi possível salvar no navegador. Copie a ficha como backup.");
    }
  }, [records, ready]);

  const filledCount = useMemo(
    () => fields.filter(([key]) => String(form[key] || "").trim()).length,
    [form]
  );

  function change(key, value) {
    setForm((previous) => ({ ...previous, [key]: value }));
    setNotice("");
  }

  function newRecord() {
    setCurrentId("");
    setForm({ ...emptyRecord, researchedAt: new Date().toLocaleDateString("pt-BR") });
    setNotice("Nova ficha pronta para preencher.");
  }

  function saveRecord() {
    const name = form.offerName.trim() || form.domain.trim() || "Pesquisa sem nome";
    const id = currentId || `mining-${Date.now()}`;
    const item = { id, name, updatedAt: new Date().toISOString(), data: form };
    setRecords((previous) => {
      const exists = previous.some((record) => record.id === id);
      return exists ? previous.map((record) => (record.id === id ? item : record)) : [item, ...previous];
    });
    setCurrentId(id);
    setNotice("Ficha salva neste navegador.");
  }

  function loadRecord(record) {
    setCurrentId(record.id);
    setForm({ ...emptyRecord, ...record.data });
    setNotice(`Ficha “${record.name}” aberta.`);
  }

  function deleteRecord(id) {
    setRecords((previous) => previous.filter((record) => record.id !== id));
    if (currentId === id) {
      setCurrentId("");
      setForm(emptyRecord);
    }
    setNotice("Ficha removida deste navegador.");
  }

  async function copyRecord() {
    const decision = form.decision || "Não definida";
    const text = [
      "O CLONE DIGITAL — FICHA DE MINERAÇÃO",
      ...fields.map(([key, label]) => `${label}: ${form[key] || "Não preenchido"}`),
      `País pesquisado: ${form.country}`,
      `Tipo de anúncio: ${form.adType}`,
      `Decisão provisória: ${decision}`,
      "",
      "Nota: sinais publicitários não comprovam vendas, lucro ou conversão.",
    ].join("\n");
    try {
      await navigator.clipboard.writeText(text);
      setNotice("Ficha copiada. Você já pode colar em um documento.");
    } catch {
      setNotice("A cópia automática não foi permitida pelo navegador. Selecione e copie os campos manualmente.");
    }
  }

  return (
    <section className="worksheet-card" aria-labelledby="mining-worksheet-title">
      <div className="worksheet-header">
        <div>
          <div className="module-section-eyebrow">FERRAMENTA PRÁTICA</div>
          <h2 id="mining-worksheet-title">Ficha de mineração de ofertas</h2>
          <p>Registre evidências, compare pesquisas e documente por que uma oferta merece atenção. Seus dados ficam salvos neste navegador.</p>
        </div>
        <div className="worksheet-count">{filledCount}/{fields.length}<span>campos preenchidos</span></div>
      </div>

      <div className="worksheet-saved-list">
        <label htmlFor="mining-saved-record">Suas fichas salvas</label>
        <div className="worksheet-saved-controls">
          <select id="mining-saved-record" value={currentId} onChange={(event) => {
            const found = records.find((record) => record.id === event.target.value);
            if (found) loadRecord(found);
            else if (!event.target.value) { setCurrentId(""); setForm(emptyRecord); setNotice(""); }
          }}>
            <option value="">Nova ficha / não selecionada</option>
            {records.map((record) => <option key={record.id} value={record.id}>{record.name}</option>)}
          </select>
          <button type="button" className="worksheet-secondary-button" onClick={newRecord}>Nova ficha</button>
        </div>
      </div>

      <div className="worksheet-form-grid">
        {fields.map(([key, label, placeholder]) => (
          <label key={key} className={["product", "audience", "promise", "evidence", "doubts", "reason", "nextStep"].includes(key) ? "worksheet-field worksheet-field-wide" : "worksheet-field"}>
            <span>{label}</span>
            {["product", "audience", "promise", "evidence", "doubts", "reason", "nextStep"].includes(key) ? (
              <textarea value={form[key]} placeholder={placeholder} rows={key === "evidence" || key === "doubts" ? 3 : 2} onChange={(event) => change(key, event.target.value)} />
            ) : (
              <input value={form[key]} placeholder={placeholder} onChange={(event) => change(key, event.target.value)} />
            )}
          </label>
        ))}
        <label className="worksheet-field">
          <span>País usado na Biblioteca da Meta</span>
          <select value={form.country} onChange={(event) => change("country", event.target.value)}>
            {["Todos", "Brasil", "Estados Unidos", "Outro"].map((value) => <option key={value}>{value}</option>)}
          </select>
        </label>
        <label className="worksheet-field">
          <span>Tipo de anúncio pesquisado</span>
          <select value={form.adType} onChange={(event) => change("adType", event.target.value)}>
            {["Todos os anúncios", "Ativos", "Inativos", "Outro filtro"].map((value) => <option key={value}>{value}</option>)}
          </select>
        </label>
        <label className="worksheet-field worksheet-field-wide">
          <span>Decisão provisória</span>
          <select value={form.decision} onChange={(event) => change("decision", event.target.value)}>
            {["Investigar mais", "Acompanhar", "Comparar com outras ofertas", "Arquivar"].map((value) => <option key={value}>{value}</option>)}
          </select>
        </label>
      </div>

      <div className="worksheet-actions">
        <button type="button" className="worksheet-primary-button" onClick={saveRecord}>Salvar ficha</button>
        <button type="button" className="worksheet-secondary-button" onClick={copyRecord}>Copiar ficha</button>
        {currentId && <button type="button" className="worksheet-delete-button" onClick={() => deleteRecord(currentId)}>Excluir ficha</button>}
      </div>
      {notice && <p className="worksheet-notice" role="status">{notice}</p>}
      <p className="worksheet-disclaimer">A contagem de anúncios é apenas um sinal de atividade publicitária. Não comprova faturamento, lucro, qualidade ou conversão. Evite registrar dados pessoais de terceiros.</p>
    </section>
  );
}
