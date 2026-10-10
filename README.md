# O Clone Digital

> **Encontre. Analise. Estruture. Teste.**

Documento mestre do projeto. Registra a visão inicial, ideias, escopo previsto e próximas etapas. Será atualizado conforme novas decisões forem tomadas.

## Status técnico de autenticação e pagamentos (10/10/2026)

- O banco tem a migração inicial de produtos, pedidos, eventos e permissões em `db/migrations/001_paid_access.sql`.
- A migração `db/migrations/002_auth_and_payment_providers.sql` adiciona a estrutura de contas, tokens de ativação/recuperação, sessões e mapeamento de produtos por provedor.
- **As migrações são arquivos no GitHub; não foram aplicadas ao banco de produção.**
- O endpoint Cakto existente ainda precisa de revisão e teste real com payloads oficiais antes de liberar acesso.
- O endpoint SyncPay e a autenticação ainda precisam ser implementados e testados. A existência de tabelas não significa que login ou liberação automática já funcionem.
- A regra definida: o e-mail usado no login deve corresponder ao e-mail da compra confirmada; ativação por link seguro enviado para esse e-mail.
- Não configurar vendas reais até concluir assinatura dos webhooks, idempotência, status de reembolso/chargeback, bloqueio server-side dos módulos e testes ponta a ponta.

## Próximas etapas técnicas
1. Revisar o webhook Cakto contra os payloads e status oficiais e testar idempotência.
2. Implementar o webhook SyncPay com validação de assinatura conforme a especificação oficial e mapeamento próprio de produto.
3. Implementar ativação por e-mail, criação de senha, login, recuperação e sessões seguras.
4. Proteger o painel e as rotas de módulos no servidor, verificando permissões ativas.
5. Configurar as variáveis de ambiente na Vercel e aplicar as migrações ao banco com acesso restrito.
6. Executar testes de aprovação, duplicação, compra nas duas plataformas, e-mail divergente, reembolso e chargeback.

## Visão do projeto

**O Clone Digital** é um webapp educacional organizado por módulos, pensado para ajudar iniciantes a percorrer o processo de pesquisa de ofertas até a preparação e publicação do primeiro anúncio de uma oferta própria baseada em referências estudadas.

A aplicação web já contém sete módulos de conteúdo, exercícios, checklists e fichas práticas com armazenamento local no navegador. A autenticação, o bloqueio de conteúdo pago, a sincronização entre dispositivos e a liberação automática por pagamento ainda não estão concluídos.

## Decisões confirmadas
- Fonte central do projeto: repositório GitHub `oLuiixz/o-clone-digital`, branch `main`.
- Checkout a integrar: Cakto e SyncPay.
- O acesso do aluno será associado ao e-mail da compra aprovada.
- O cliente deverá ativar a conta por link enviado ao e-mail da compra e definir sua própria senha.
- O domínio inicial será o domínio gratuito da Vercel.
