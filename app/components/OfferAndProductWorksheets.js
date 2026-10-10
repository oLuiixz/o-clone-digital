"use client";

import { useEffect, useMemo, useState } from "react";

function PracticalWorksheet({ storageKey, eyebrow, title, description, fields, decisionLabel, decisions, disclaimer }) {
  const [records, setRecords] = useState([]);
  const [currentId, setCurrentId] = useState("");
  const [form, setForm] = useState(() => Object.fromEntries(fields.map((field) => [field.key, field.defaultValue || ""])));
  const [ready, setReady] = useState(false);
  const [notice, setNotice] = useState("");

  useEffect(() => {
    try {
      const saved = JSON.parse(window.localStorage.getItem(storageKey) || "[]");
      if (Array.isArray(saved)) setRecords(saved.filter((item) => item && typeof item.id === "string" && item.data && typeof item.data === "object"));
    } catch {
      setRecords([]);
    }
    setReady(true);
  }, [storageKey]);

  useEffect(() => {
    if (!ready) return;
    try {
      window.localStorage.setItem(storageKey, JSON.stringify(records));
    } catch {
      setNotice("O navegador não conseguiu salvar. Copie sua ficha como backup.");
    }
  }, [records, ready, storageKey]);

  const filled = useMemo(() => fields.filter((field) => String(form[field.key] || "").trim()).length, [fields, form]);
  const initialForm = () => Object.fromEntries(fields.map((field) => [field.key, field.defaultValue || ""]));

  function update(key, value) {
    setForm((current) => ({ ...current, [key]: value }));
    setNotice("");
  }

  function newRecord() {
    setCurrentId("");
    setForm(initialForm());
    setNotice("Nova ficha pronta para preencher.");
  }

  function save() {
    const nameField = fields.find((field) => field.nameField) || fields[0];
    const name = String(form[nameField.key] || "").trim() || "Ficha sem título";
    const id = currentId || `worksheet-${Date.now()}`;
    const record = { id, name, updatedAt: new Date().toISOString(), data: form };
    setRecords((items) => items.some((item) => item.id === id) ? items.map((item) => item.id === id ? record : item) : [record, ...items]);
    setCurrentId(id);
    setNotice("Ficha salva neste navegador.");
  }

  function openRecord(id) {
    const record = records.find((item) => item.id === id);
    if (!record) {
      setCurrentId("");
      setForm(initialForm());
      return;
    }
    setCurrentId(id);
    setForm({ ...initialForm(), ...record.data });
    setNotice(`Ficha “${record.name}” aberta.`);
  }

  function removeRecord() {
    setRecords((items) => items.filter((item) => item.id !== currentId));
    setCurrentId("");
    setForm(initialForm());
    setNotice("Ficha excluída deste navegador.");
  }

  async function copy() {
    const text = [
      `O CLONE DIGITAL — ${title.toUpperCase()}`,
      ...fields.map((field) => `${field.label}: ${form[field.key] || "Não preenchido"}`),
      "",
      disclaimer,
    ].join("\\n");
    try {
      await navigator.clipboard.writeText(text);
      setNotice("Ficha copiada para a área de transferência.");
    } catch {
      setNotice("A cópia automática não foi permitida. Copie os campos manualmente.");
    }
  }

  return (
    <section className="worksheet-card" aria-label={title}>
      <div className="worksheet-header">
        <div>
          <div className="module-section-eyebrow">{eyebrow}</div>
          <h2>{title}</h2>
          <p>{description}</p>
        </div>
        <div className="worksheet-count">{filled}/{fields.length}<span>campos preenchidos</span></div>
      </div>
      <div className="worksheet-saved-list">
        <label htmlFor={storageKey + "-saved"}>Fichas salvas</label>
        <div className="worksheet-saved-controls">
          <select id={storageKey + "-saved"} value={currentId} onChange={(event) => openRecord(event.target.value)}>
            <option value="">Nova ficha / não selecionada</option>
            {records.map((record) => <option key={record.id} value={record.id}>{record.name}</option>)}
          </select>
          <button type="button" className="worksheet-secondary-button" onClick={newRecord}>Nova ficha</button>
        </div>
      </div>
      <div className="worksheet-form-grid">
        {fields.map((field) => (
          <label key={field.key} className={field.wide ? "worksheet-field worksheet-field-wide" : "worksheet-field"}>
            <span>{field.label}</span>
            {field.options ? (
              <select value={form[field.key] || ""} onChange={(event) => update(field.key, event.target.value)}>
                {field.options.map((option) => <option key={option} value={option}>{option}</option>)}
              </select>
            ) : field.multiline ? (
              <textarea rows={field.rows || 3} value={form[field.key] || ""} placeholder={field.placeholder || ""} onChange={(event) => update(field.key, event.target.value)} />
            ) : (
              <input type={field.type || "text"} value={form[field.key] || ""} placeholder={field.placeholder || ""} onChange={(event) => update(field.key, event.target.value)} />
            )}
          </label>
        ))}
        {decisions && <label className="worksheet-field worksheet-field-wide"><span>{decisionLabel}</span><select value={form.__decision || decisions[0]} onChange={(event) => update("__decision", event.target.value)}>{decisions.map((option) => <option key={option}>{option}</option>)}</select></label>}
      </div>
      <div className="worksheet-actions">
        <button type="button" className="worksheet-primary-button" onClick={save}>Salvar ficha</button>
        <button type="button" className="worksheet-secondary-button" onClick={copy}>Copiar ficha</button>
        {currentId && <button type="button" className="worksheet-delete-button" onClick={removeRecord}>Excluir ficha</button>}
      </div>
      {notice && <p className="worksheet-notice" role="status">{notice}</p>}
      <p className="worksheet-disclaimer">{disclaimer} Seus registros ficam apenas neste navegador; não são sincronizados entre dispositivos.</p>
    </section>
  );
}

const analysisFields = [
  { key: "offerName", label: "Nome da oferta", placeholder: "Nome para reconhecer a oferta", nameField: true },
  { key: "url", label: "URL da página analisada", placeholder: "https://...", wide: true },
  { key: "date", label: "Data da análise", placeholder: "DD/MM/AAAA" },
  { key: "source", label: "Fontes consultadas", placeholder: "Página, anúncios, avaliações..." },
  { key: "audience", label: "Público e situação", placeholder: "Quem parece ter esse problema ou desejo?", multiline: true, wide: true },
  { key: "problem", label: "Problema ou desejo central", placeholder: "O que a oferta tenta resolver?", multiline: true },
  { key: "solution", label: "Mecanismo ou solução apresentada", placeholder: "Como o produto diz que funciona?", multiline: true },
  { key: "promise", label: "Promessa principal", placeholder: "Qual resultado é comunicado?", multiline: true },
  { key: "deliverables", label: "O que o cliente recebe", placeholder: "Aulas, arquivos, serviço, suporte...", multiline: true },
  { key: "price", label: "Preço e condições observadas", placeholder: "Preço, parcelas, garantia e observações", multiline: true },
  { key: "proof", label: "Provas e credibilidade", placeholder: "Demonstrações verificáveis, autoria, exemplos...", multiline: true },
  { key: "creative", label: "Padrões nos anúncios e criativos", placeholder: "Ganchos, formatos, ângulos e chamadas...", multiline: true },
  { key: "strengths", label: "Pontos fortes observáveis", placeholder: "O que está claro ou bem apresentado?", multiline: true },
  { key: "risks", label: "Fragilidades e riscos", placeholder: "O que está confuso, sem prova ou pouco transparente?", multiline: true },
  { key: "gaps", label: "Oportunidades de diferenciação", placeholder: "Como criar algo próprio, útil e distinto?", multiline: true, wide: true },
  { key: "unknowns", label: "O que ainda não sabemos", placeholder: "Vendas, conversão, margem e dados não públicos...", multiline: true, wide: true },
];

const productFields = [
  { key: "productName", label: "Nome provisório do produto", placeholder: "Nome simples e fácil de entender", nameField: true },
  { key: "format", label: "Formato", options: ["E-book ou guia", "Curso em vídeo", "Templates e arquivos", "Comunidade ou acompanhamento", "Serviço", "Outro"] },
  { key: "audience", label: "Para quem é", placeholder: "Descreva uma pessoa e seu contexto", multiline: true, wide: true },
  { key: "problem", label: "Problema específico que resolve", placeholder: "Evite tentar resolver tudo de uma vez", multiline: true, wide: true },
  { key: "outcome", label: "Resultado realista esperado", placeholder: "O que a pessoa poderá fazer ou entender?", multiline: true, wide: true },
  { key: "method", label: "Seu método ou abordagem própria", placeholder: "Quais etapas ajudam a chegar ao resultado?", multiline: true, wide: true },
  { key: "contents", label: "Conteúdo e entregáveis", placeholder: "Liste módulos, arquivos, suporte e materiais", multiline: true, wide: true },
  { key: "minimum", label: "Versão mínima que já entrega valor", placeholder: "O que precisa estar pronto na primeira versão?", multiline: true },
  { key: "notIncluded", label: "O que não está incluído", placeholder: "Limites claros da oferta", multiline: true },
  { key: "proof", label: "Como validar utilidade e qualidade", placeholder: "Teste com usuários, exemplos, revisão...", multiline: true },
  { key: "price", label: "Hipótese de preço e justificativa", placeholder: "Registre uma hipótese, não uma certeza" },
  { key: "delivery", label: "Como será entregue", placeholder: "Área de membros, arquivo, e-mail...", multiline: true },
  { key: "support", label: "Suporte e limites de atendimento", placeholder: "Canal, prazo e escopo", multiline: true },
  { key: "nextStep", label: "Próxima ação concreta", placeholder: "Qual é o menor próximo passo?", multiline: true, wide: true },
];

export function OfferAnalysisWorksheet() {
  return <PracticalWorksheet
    storageKey="clone-digital-analise-ofertas-v1"
    eyebrow="FERRAMENTA PRÁTICA"
    title="Matriz de análise de oferta"
    description="Compare a comunicação, o produto e as evidências antes de decidir o que estudar mais. Separe observações de hipóteses."
    fields={analysisFields}
    decisionLabel="Conclusão provisória"
    decisions={["Investigar mais", "Boa referência de comunicação", "Há lacunas a explorar", "Não priorizar agora"]}
    disclaimer="Análise de página e anúncios não revela, por si só, vendas, conversão ou lucro. Use apenas evidências observáveis e não copie materiais protegidos."
  />;
}

export function ProductBuilderWorksheet() {
  return <PracticalWorksheet
    storageKey="clone-digital-estrutura-produto-v1"
    eyebrow="FERRAMENTA PRÁTICA"
    title="Blueprint do seu produto"
    description="Transforme uma oportunidade em uma proposta própria: público, problema, resultado, método, entregáveis e primeira versão."
    fields={productFields}
    decisionLabel="Estado da ideia"
    decisions={["Explorando o problema", "Validando com pessoas", "Planejando a primeira versão", "Pronto para produzir", "Precisa ser redefinido"]}
    disclaimer="Descreva benefícios realistas e entregáveis que você pode cumprir. A hipótese de preço precisa considerar custos, taxas, impostos e suporte."
  />;
}
