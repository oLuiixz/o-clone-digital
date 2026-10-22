# Checkout próprio para afiliados — integração SyncPay

Esta branch mantém a experiência de checkout isolada da `main`. A tela em `/checkout/afiliado` é apenas a camada visual inicial; o botão de pagamento permanece bloqueado deliberadamente até que a API e os webhooks sejam configurados e testados.

## O que já existe nesta branch

- Página responsiva inicial de checkout próprio.
- Endpoint isolado de webhook para tratar somente comissões: `/api/webhooks/syncpay-affiliate`.
- O webhook isolado não cria pedidos nem libera/revoga acesso; isso continua sendo responsabilidade do webhook principal.
- A tela não coleta número/CVV do cartão. Para cartão, precisamos usar tokenização oficial da SyncPay.

## O que falta antes de habilitar pagamentos

1. Configurar credenciais de API da SyncPay no ambiente Preview da Vercel (nunca no GitHub nem nesta conversa).
2. Confirmar com a SyncPay que a conta está autorizada para API e que o IP de saída da aplicação está liberado, se a allowlist for exigida.
3. Decidir o modo de comissão:
   - **Split automático:** o endpoint Pix documenta `split: [{ percentage, user_id }]`; `user_id` corresponde ao identificador de conta/cliente SyncPay do recebedor. Cada afiliado que receber split precisa ter o identificador válido e estar apto a receber. O fluxo de cartão tem tokenização própria e exige validação separada.
   - **Comissão registrada para repasse posterior:** não enviar split na cobrança; registrar comissão após pagamento confirmado e tratar repasse em fluxo separado.
4. Criar um webhook do tipo de evento compatível com a cobrança criada pela API. Não presumir que o payload do cash-in legado é igual ao evento `transaction.updated`; validar o contrato e assinatura do evento escolhido antes de apontar produção.
5. Testar criação, duplicidade, pagamento, estorno e chargeback em ambiente autorizado/teste. Não gerar cobrança real até aprovação explícita.

## Variáveis de ambiente necessárias (Preview primeiro)

- `SYNCPAY_CLIENT_ID`
- `SYNCPAY_CLIENT_SECRET`
- `SYNCPAY_API_TOKEN` (somente se a integração atual realmente usar token estático; preferir obter/cachear o access token documentado)
- `SYNCPAY_PRODUCT_ID`
- `SYNCPAY_AFFILIATE_WEBHOOK_SECRET` — segredo retornado uma única vez ao criar o webhook específico de afiliados.
- `DATABASE_URL`

Não enviar valores secretos por chat. Cadastre-os em Vercel → Project → Settings → Environment Variables, selecionando somente Preview durante os testes.

## Referências oficiais consultadas

- API pública SyncPay: `https://syncpay.apidog.io/`
- Pix Cash-in: `https://syncpay.apidog.io/solicita%C3%A7%C3%A3o-de-dep%C3%B3sito-via-pix-18075879e0`
- Cartão: `https://syncpay.apidog.io/cobrar-no-cart%C3%A3o-41590299e0`
- Webhooks: `https://syncpay.apidog.io/criar-webhook-41858912e0`

A API de cartão exige tokenização; nunca receber ou guardar PAN/CVV no backend do O Clone Digital. Não habilitar produção até concluir os testes.
