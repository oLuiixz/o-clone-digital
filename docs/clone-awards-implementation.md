# Clone Awards — implementação por etapas

## Decisões confirmadas
- Nome: **Clone Awards**.
- Temporadas trimestrais com datas e prazos administráveis.
- Uma única trilha por aluno em cada temporada. Trocar de trilha exige confirmação explícita e reinicia a pontuação competitiva da temporada; o histórico permanece para auditoria.
- 15 níveis por trilha; mesma quantidade de desafios e mesma pontuação para níveis equivalentes.
- Teto exato de 15.000 XP por trilha completa.
- XP somente após aprovação administrativa da evidência, calculado no servidor.
- A primeira venda/conversão é uma conquista especial separada, não requisito para concluir o nível 15.
- Ranking da temporada separado do histórico permanente do aluno.
- Prêmios configuráveis, sem valores definidos. Revisar regras legais antes do lançamento público.

## Modelo inicial de pontuação
10 desafios por nível (150 desafios por trilha; 750 no total nas cinco trilhas). Cada desafio do mesmo nível vale igual em todas as trilhas. Valores por nível: 30, 40, 50, ... 170 XP. Soma dos valores de níveis = 1.500; multiplicado por 10 desafios = 15.000 XP por trilha. A ativação da temporada deve validar que contagem e pontuação são equivalentes entre trilhas.

## Trilhas iniciais
1. Negócio Dark — materiais próprios/licenciados e respeito aos direitos de terceiros.
2. Revenda de Streaming — somente ofertas e serviços com autorização legítima de revenda.
3. Venda de sites de e-commerce para clientes.
4. Criar um e-commerce próprio.
5. Venda de sites criados com IA.

## Princípios técnicos
- Nunca aceitar XP calculado pelo navegador.
- Aprovação e lançamento no ledger devem ser atômicos e idempotentes.
- Trocas de trilha e decisões de revisão são registradas em log de auditoria.
- Evidências são conteúdo não confiável; não executar arquivos nem renderizar HTML arbitrário.
- Temporadas encerradas congelam pontuação, resolvem pendências no prazo publicado e preservam resultado final/Hall da Fama.
- Migration manual, após backup; não aplicar automaticamente em produção.
- APIs de aluno usam getCurrentMember(); APIs administrativas usam isAdminRequest().

## Próximas etapas
1. Revisar migration e integrar ao fluxo de deploy documentado.
2. Implementar camada de domínio/API com validações e operações atômicas.
3. Catálogo de 750 desafios gerado em `db/seeds/clone_awards_750_challenges.sql` (5 trilhas × 15 níveis × 10 desafios), com evidências e XP equivalente por nível. Revisar a qualidade pedagógica antes de ativar.
4. Implementar UI do aluno e painel administrativo no visual atual.
5. Testar pontuação, trocas de trilha, submissões duplicadas, acesso inativo, temporadas e permissões antes de abrir PR para revisão.
