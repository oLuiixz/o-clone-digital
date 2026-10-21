-- Clone Awards challenge catalog: 750 practical challenges, idempotent seed.
-- 5 tracks x 15 levels x 10 challenges. XP by level = 30 + (level - 1) * 10 per challenge.
-- Run manually after migration 004, in a reviewed environment.

INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,1,'Pesquisa e direção','Escolha o foco e entenda o mercado'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,2,'Público e problema','Identifique quem compra e qual problema resolve'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,3,'Oferta e diferenciação','Defina uma proposta de valor clara'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,4,'Planejamento financeiro','Estime custos, preço e viabilidade'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,5,'Ferramentas e preparação','Organize os recursos necessários'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,6,'Primeira versão','Construa a primeira versão funcional'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,7,'Qualidade e experiência','Revise clareza, usabilidade e confiança'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,8,'Processo operacional','Documente como executar e entregar'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,9,'Teste com pessoas','Colete feedback real e registre aprendizados'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,10,'Ajustes e validação','Corrija os pontos mais importantes'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,11,'Prospecção e aquisição','Prepare canais para alcançar potenciais clientes'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,12,'Abordagem e diagnóstico','Converse com potenciais clientes e entenda necessidades'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,13,'Proposta e objeções','Apresente valor, escopo e responda dúvidas'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,14,'Conversão e entrega','Pratique o fechamento e organize a entrega'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,15,'Análise e próximos passos','Avalie resultados e defina a próxima melhoria'
FROM clone_awards_tracks WHERE slug='negocio-dark'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,1,'Pesquisa e direção','Escolha o foco e entenda o mercado'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,2,'Público e problema','Identifique quem compra e qual problema resolve'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,3,'Oferta e diferenciação','Defina uma proposta de valor clara'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,4,'Planejamento financeiro','Estime custos, preço e viabilidade'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,5,'Ferramentas e preparação','Organize os recursos necessários'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,6,'Primeira versão','Construa a primeira versão funcional'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,7,'Qualidade e experiência','Revise clareza, usabilidade e confiança'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,8,'Processo operacional','Documente como executar e entregar'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,9,'Teste com pessoas','Colete feedback real e registre aprendizados'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,10,'Ajustes e validação','Corrija os pontos mais importantes'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,11,'Prospecção e aquisição','Prepare canais para alcançar potenciais clientes'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,12,'Abordagem e diagnóstico','Converse com potenciais clientes e entenda necessidades'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,13,'Proposta e objeções','Apresente valor, escopo e responda dúvidas'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,14,'Conversão e entrega','Pratique o fechamento e organize a entrega'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,15,'Análise e próximos passos','Avalie resultados e defina a próxima melhoria'
FROM clone_awards_tracks WHERE slug='revenda-streaming'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,1,'Pesquisa e direção','Escolha o foco e entenda o mercado'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,2,'Público e problema','Identifique quem compra e qual problema resolve'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,3,'Oferta e diferenciação','Defina uma proposta de valor clara'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,4,'Planejamento financeiro','Estime custos, preço e viabilidade'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,5,'Ferramentas e preparação','Organize os recursos necessários'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,6,'Primeira versão','Construa a primeira versão funcional'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,7,'Qualidade e experiência','Revise clareza, usabilidade e confiança'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,8,'Processo operacional','Documente como executar e entregar'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,9,'Teste com pessoas','Colete feedback real e registre aprendizados'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,10,'Ajustes e validação','Corrija os pontos mais importantes'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,11,'Prospecção e aquisição','Prepare canais para alcançar potenciais clientes'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,12,'Abordagem e diagnóstico','Converse com potenciais clientes e entenda necessidades'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,13,'Proposta e objeções','Apresente valor, escopo e responda dúvidas'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,14,'Conversão e entrega','Pratique o fechamento e organize a entrega'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,15,'Análise e próximos passos','Avalie resultados e defina a próxima melhoria'
FROM clone_awards_tracks WHERE slug='venda-sites-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,1,'Pesquisa e direção','Escolha o foco e entenda o mercado'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,2,'Público e problema','Identifique quem compra e qual problema resolve'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,3,'Oferta e diferenciação','Defina uma proposta de valor clara'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,4,'Planejamento financeiro','Estime custos, preço e viabilidade'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,5,'Ferramentas e preparação','Organize os recursos necessários'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,6,'Primeira versão','Construa a primeira versão funcional'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,7,'Qualidade e experiência','Revise clareza, usabilidade e confiança'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,8,'Processo operacional','Documente como executar e entregar'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,9,'Teste com pessoas','Colete feedback real e registre aprendizados'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,10,'Ajustes e validação','Corrija os pontos mais importantes'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,11,'Prospecção e aquisição','Prepare canais para alcançar potenciais clientes'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,12,'Abordagem e diagnóstico','Converse com potenciais clientes e entenda necessidades'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,13,'Proposta e objeções','Apresente valor, escopo e responda dúvidas'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,14,'Conversão e entrega','Pratique o fechamento e organize a entrega'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,15,'Análise e próximos passos','Avalie resultados e defina a próxima melhoria'
FROM clone_awards_tracks WHERE slug='criar-ecommerce'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,1,'Pesquisa e direção','Escolha o foco e entenda o mercado'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,2,'Público e problema','Identifique quem compra e qual problema resolve'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,3,'Oferta e diferenciação','Defina uma proposta de valor clara'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,4,'Planejamento financeiro','Estime custos, preço e viabilidade'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,5,'Ferramentas e preparação','Organize os recursos necessários'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,6,'Primeira versão','Construa a primeira versão funcional'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,7,'Qualidade e experiência','Revise clareza, usabilidade e confiança'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,8,'Processo operacional','Documente como executar e entregar'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,9,'Teste com pessoas','Colete feedback real e registre aprendizados'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,10,'Ajustes e validação','Corrija os pontos mais importantes'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,11,'Prospecção e aquisição','Prepare canais para alcançar potenciais clientes'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,12,'Abordagem e diagnóstico','Converse com potenciais clientes e entenda necessidades'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,13,'Proposta e objeções','Apresente valor, escopo e responda dúvidas'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,14,'Conversão e entrega','Pratique o fechamento e organize a entrega'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;
INSERT INTO clone_awards_levels(track_id,level_number,title,description)
SELECT id,15,'Análise e próximos passos','Avalie resultados e defina a próxima melhoria'
FROM clone_awards_tracks WHERE slug='sites-com-ia'
ON CONFLICT(track_id,level_number) DO UPDATE SET title=EXCLUDED.title,description=EXCLUDED.description;

INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l01-c01','Pesquise oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 1. Pesquise oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',30,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l01-c02','Defina público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 1. Defina público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',30,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l01-c03','Compare proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 1. Compare proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',30,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l01-c04','Documente página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 1. Documente página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',30,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l01-c05','Monte criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 1. Monte criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',30,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l01-c06','Teste funil — etapa 06','Execute uma atividade prática de negócio dark no nível 1. Teste funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',30,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l01-c07','Revise mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 1. Revise mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',30,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l01-c08','Valide métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 1. Valide métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',30,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l01-c09','Apresente objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 1. Apresente objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',30,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l01-c10','Analise plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 1. Analise plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',30,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l02-c01','Defina oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 2. Defina oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',40,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l02-c02','Compare público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 2. Compare público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',40,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l02-c03','Documente proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 2. Documente proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',40,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l02-c04','Monte página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 2. Monte página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',40,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l02-c05','Teste criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 2. Teste criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',40,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l02-c06','Revise funil — etapa 06','Execute uma atividade prática de negócio dark no nível 2. Revise funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',40,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l02-c07','Valide mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 2. Valide mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',40,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l02-c08','Apresente métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 2. Apresente métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',40,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l02-c09','Analise objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 2. Analise objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',40,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l02-c10','Pesquise plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 2. Pesquise plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',40,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l03-c01','Compare oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 3. Compare oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',50,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l03-c02','Documente público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 3. Documente público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',50,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l03-c03','Monte proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 3. Monte proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',50,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l03-c04','Teste página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 3. Teste página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',50,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l03-c05','Revise criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 3. Revise criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',50,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l03-c06','Valide funil — etapa 06','Execute uma atividade prática de negócio dark no nível 3. Valide funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',50,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l03-c07','Apresente mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 3. Apresente mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',50,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l03-c08','Analise métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 3. Analise métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',50,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l03-c09','Pesquise objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 3. Pesquise objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',50,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l03-c10','Defina plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 3. Defina plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',50,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l04-c01','Documente oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 4. Documente oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',60,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l04-c02','Monte público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 4. Monte público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',60,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l04-c03','Teste proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 4. Teste proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',60,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l04-c04','Revise página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 4. Revise página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',60,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l04-c05','Valide criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 4. Valide criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',60,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l04-c06','Apresente funil — etapa 06','Execute uma atividade prática de negócio dark no nível 4. Apresente funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',60,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l04-c07','Analise mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 4. Analise mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',60,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l04-c08','Pesquise métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 4. Pesquise métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',60,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l04-c09','Defina objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 4. Defina objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',60,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l04-c10','Compare plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 4. Compare plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',60,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l05-c01','Monte oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 5. Monte oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',70,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l05-c02','Teste público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 5. Teste público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',70,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l05-c03','Revise proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 5. Revise proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',70,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l05-c04','Valide página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 5. Valide página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',70,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l05-c05','Apresente criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 5. Apresente criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',70,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l05-c06','Analise funil — etapa 06','Execute uma atividade prática de negócio dark no nível 5. Analise funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',70,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l05-c07','Pesquise mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 5. Pesquise mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',70,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l05-c08','Defina métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 5. Defina métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',70,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l05-c09','Compare objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 5. Compare objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',70,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l05-c10','Documente plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 5. Documente plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',70,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l06-c01','Teste oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 6. Teste oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',80,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l06-c02','Revise público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 6. Revise público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',80,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l06-c03','Valide proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 6. Valide proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',80,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l06-c04','Apresente página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 6. Apresente página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',80,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l06-c05','Analise criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 6. Analise criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',80,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l06-c06','Pesquise funil — etapa 06','Execute uma atividade prática de negócio dark no nível 6. Pesquise funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',80,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l06-c07','Defina mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 6. Defina mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',80,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l06-c08','Compare métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 6. Compare métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',80,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l06-c09','Documente objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 6. Documente objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',80,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l06-c10','Monte plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 6. Monte plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',80,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l07-c01','Revise oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 7. Revise oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',90,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l07-c02','Valide público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 7. Valide público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',90,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l07-c03','Apresente proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 7. Apresente proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',90,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l07-c04','Analise página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 7. Analise página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',90,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l07-c05','Pesquise criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 7. Pesquise criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',90,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l07-c06','Defina funil — etapa 06','Execute uma atividade prática de negócio dark no nível 7. Defina funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',90,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l07-c07','Compare mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 7. Compare mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',90,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l07-c08','Documente métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 7. Documente métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',90,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l07-c09','Monte objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 7. Monte objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',90,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l07-c10','Teste plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 7. Teste plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',90,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l08-c01','Valide oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 8. Valide oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',100,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l08-c02','Apresente público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 8. Apresente público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',100,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l08-c03','Analise proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 8. Analise proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',100,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l08-c04','Pesquise página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 8. Pesquise página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',100,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l08-c05','Defina criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 8. Defina criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',100,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l08-c06','Compare funil — etapa 06','Execute uma atividade prática de negócio dark no nível 8. Compare funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',100,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l08-c07','Documente mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 8. Documente mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',100,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l08-c08','Monte métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 8. Monte métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',100,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l08-c09','Teste objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 8. Teste objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',100,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l08-c10','Revise plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 8. Revise plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',100,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l09-c01','Apresente oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 9. Apresente oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',110,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l09-c02','Analise público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 9. Analise público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',110,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l09-c03','Pesquise proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 9. Pesquise proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',110,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l09-c04','Defina página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 9. Defina página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',110,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l09-c05','Compare criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 9. Compare criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',110,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l09-c06','Documente funil — etapa 06','Execute uma atividade prática de negócio dark no nível 9. Documente funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',110,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l09-c07','Monte mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 9. Monte mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',110,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l09-c08','Teste métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 9. Teste métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',110,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l09-c09','Revise objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 9. Revise objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',110,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l09-c10','Valide plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 9. Valide plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',110,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l10-c01','Analise oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 10. Analise oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',120,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l10-c02','Pesquise público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 10. Pesquise público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',120,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l10-c03','Defina proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 10. Defina proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',120,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l10-c04','Compare página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 10. Compare página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',120,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l10-c05','Documente criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 10. Documente criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',120,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l10-c06','Monte funil — etapa 06','Execute uma atividade prática de negócio dark no nível 10. Monte funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',120,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l10-c07','Teste mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 10. Teste mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',120,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l10-c08','Revise métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 10. Revise métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',120,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l10-c09','Valide objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 10. Valide objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',120,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l10-c10','Apresente plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 10. Apresente plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',120,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l11-c01','Pesquise oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 11. Pesquise oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',130,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l11-c02','Defina público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 11. Defina público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',130,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l11-c03','Compare proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 11. Compare proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',130,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l11-c04','Documente página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 11. Documente página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',130,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l11-c05','Monte criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 11. Monte criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',130,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l11-c06','Teste funil — etapa 06','Execute uma atividade prática de negócio dark no nível 11. Teste funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',130,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l11-c07','Revise mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 11. Revise mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',130,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l11-c08','Valide métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 11. Valide métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',130,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l11-c09','Apresente objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 11. Apresente objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',130,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l11-c10','Analise plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 11. Analise plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',130,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l12-c01','Defina oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 12. Defina oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',140,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l12-c02','Compare público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 12. Compare público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',140,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l12-c03','Documente proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 12. Documente proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',140,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l12-c04','Monte página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 12. Monte página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',140,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l12-c05','Teste criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 12. Teste criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',140,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l12-c06','Revise funil — etapa 06','Execute uma atividade prática de negócio dark no nível 12. Revise funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',140,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l12-c07','Valide mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 12. Valide mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',140,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l12-c08','Apresente métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 12. Apresente métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',140,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l12-c09','Analise objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 12. Analise objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',140,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l12-c10','Pesquise plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 12. Pesquise plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',140,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l13-c01','Compare oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 13. Compare oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',150,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l13-c02','Documente público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 13. Documente público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',150,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l13-c03','Monte proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 13. Monte proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',150,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l13-c04','Teste página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 13. Teste página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',150,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l13-c05','Revise criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 13. Revise criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',150,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l13-c06','Valide funil — etapa 06','Execute uma atividade prática de negócio dark no nível 13. Valide funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',150,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l13-c07','Apresente mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 13. Apresente mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',150,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l13-c08','Analise métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 13. Analise métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',150,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l13-c09','Pesquise objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 13. Pesquise objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',150,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l13-c10','Defina plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 13. Defina plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',150,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l14-c01','Documente oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 14. Documente oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',160,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l14-c02','Monte público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 14. Monte público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',160,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l14-c03','Teste proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 14. Teste proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',160,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l14-c04','Revise página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 14. Revise página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',160,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l14-c05','Valide criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 14. Valide criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',160,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l14-c06','Apresente funil — etapa 06','Execute uma atividade prática de negócio dark no nível 14. Apresente funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',160,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l14-c07','Analise mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 14. Analise mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',160,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l14-c08','Pesquise métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 14. Pesquise métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',160,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l14-c09','Defina objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 14. Defina objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',160,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l14-c10','Compare plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 14. Compare plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',160,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l15-c01','Monte oferta — etapa 01','Execute uma atividade prática de negócio dark no nível 15. Monte oferta e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: respeitando direitos autorais.',170,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l15-c02','Teste público-alvo — etapa 02','Execute uma atividade prática de negócio dark no nível 15. Teste público-alvo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',170,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l15-c03','Revise proposta de valor — etapa 03','Execute uma atividade prática de negócio dark no nível 15. Revise proposta de valor e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',170,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l15-c04','Valide página de apresentação — etapa 04','Execute uma atividade prática de negócio dark no nível 15. Valide página de apresentação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',170,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l15-c05','Apresente criativo — etapa 05','Execute uma atividade prática de negócio dark no nível 15. Apresente criativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',170,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l15-c06','Analise funil — etapa 06','Execute uma atividade prática de negócio dark no nível 15. Analise funil e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',170,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l15-c07','Pesquise mensagem de abordagem — etapa 07','Execute uma atividade prática de negócio dark no nível 15. Pesquise mensagem de abordagem e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',170,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l15-c08','Defina métrica de conversão — etapa 08','Execute uma atividade prática de negócio dark no nível 15. Defina métrica de conversão e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',170,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l15-c09','Compare objeção — etapa 09','Execute uma atividade prática de negócio dark no nível 15. Compare objeção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',170,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'negocio-dark-l15-c10','Documente plano de escala — etapa 10','Execute uma atividade prática de negócio dark no nível 15. Documente plano de escala e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',170,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='negocio-dark'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l01-c01','Pesquise fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 1. Pesquise fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',30,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l01-c02','Defina catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 1. Defina catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',30,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l01-c03','Compare perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 1. Compare perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',30,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l01-c04','Documente proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 1. Documente proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',30,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l01-c05','Monte fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 1. Monte fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',30,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l01-c06','Teste material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 1. Teste material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',30,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l01-c07','Revise processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 1. Revise processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',30,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l01-c08','Valide controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 1. Valide controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',30,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l01-c09','Apresente política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 1. Apresente política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',30,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l01-c10','Analise relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 1. Analise relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',30,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l02-c01','Defina fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 2. Defina fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',40,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l02-c02','Compare catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 2. Compare catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',40,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l02-c03','Documente perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 2. Documente perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',40,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l02-c04','Monte proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 2. Monte proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',40,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l02-c05','Teste fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 2. Teste fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',40,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l02-c06','Revise material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 2. Revise material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',40,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l02-c07','Valide processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 2. Valide processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',40,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l02-c08','Apresente controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 2. Apresente controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',40,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l02-c09','Analise política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 2. Analise política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',40,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l02-c10','Pesquise relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 2. Pesquise relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',40,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l03-c01','Compare fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 3. Compare fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',50,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l03-c02','Documente catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 3. Documente catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',50,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l03-c03','Monte perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 3. Monte perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',50,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l03-c04','Teste proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 3. Teste proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',50,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l03-c05','Revise fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 3. Revise fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',50,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l03-c06','Valide material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 3. Valide material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',50,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l03-c07','Apresente processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 3. Apresente processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',50,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l03-c08','Analise controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 3. Analise controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',50,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l03-c09','Pesquise política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 3. Pesquise política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',50,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l03-c10','Defina relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 3. Defina relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',50,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l04-c01','Documente fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 4. Documente fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',60,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l04-c02','Monte catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 4. Monte catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',60,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l04-c03','Teste perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 4. Teste perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',60,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l04-c04','Revise proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 4. Revise proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',60,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l04-c05','Valide fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 4. Valide fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',60,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l04-c06','Apresente material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 4. Apresente material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',60,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l04-c07','Analise processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 4. Analise processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',60,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l04-c08','Pesquise controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 4. Pesquise controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',60,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l04-c09','Defina política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 4. Defina política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',60,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l04-c10','Compare relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 4. Compare relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',60,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l05-c01','Monte fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 5. Monte fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',70,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l05-c02','Teste catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 5. Teste catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',70,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l05-c03','Revise perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 5. Revise perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',70,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l05-c04','Valide proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 5. Valide proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',70,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l05-c05','Apresente fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 5. Apresente fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',70,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l05-c06','Analise material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 5. Analise material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',70,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l05-c07','Pesquise processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 5. Pesquise processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',70,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l05-c08','Defina controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 5. Defina controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',70,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l05-c09','Compare política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 5. Compare política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',70,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l05-c10','Documente relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 5. Documente relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',70,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l06-c01','Teste fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 6. Teste fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',80,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l06-c02','Revise catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 6. Revise catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',80,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l06-c03','Valide perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 6. Valide perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',80,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l06-c04','Apresente proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 6. Apresente proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',80,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l06-c05','Analise fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 6. Analise fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',80,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l06-c06','Pesquise material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 6. Pesquise material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',80,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l06-c07','Defina processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 6. Defina processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',80,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l06-c08','Compare controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 6. Compare controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',80,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l06-c09','Documente política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 6. Documente política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',80,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l06-c10','Monte relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 6. Monte relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',80,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l07-c01','Revise fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 7. Revise fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',90,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l07-c02','Valide catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 7. Valide catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',90,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l07-c03','Apresente perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 7. Apresente perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',90,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l07-c04','Analise proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 7. Analise proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',90,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l07-c05','Pesquise fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 7. Pesquise fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',90,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l07-c06','Defina material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 7. Defina material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',90,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l07-c07','Compare processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 7. Compare processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',90,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l07-c08','Documente controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 7. Documente controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',90,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l07-c09','Monte política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 7. Monte política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',90,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l07-c10','Teste relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 7. Teste relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',90,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l08-c01','Valide fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 8. Valide fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',100,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l08-c02','Apresente catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 8. Apresente catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',100,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l08-c03','Analise perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 8. Analise perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',100,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l08-c04','Pesquise proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 8. Pesquise proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',100,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l08-c05','Defina fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 8. Defina fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',100,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l08-c06','Compare material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 8. Compare material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',100,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l08-c07','Documente processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 8. Documente processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',100,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l08-c08','Monte controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 8. Monte controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',100,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l08-c09','Teste política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 8. Teste política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',100,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l08-c10','Revise relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 8. Revise relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',100,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l09-c01','Apresente fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 9. Apresente fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',110,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l09-c02','Analise catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 9. Analise catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',110,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l09-c03','Pesquise perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 9. Pesquise perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',110,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l09-c04','Defina proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 9. Defina proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',110,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l09-c05','Compare fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 9. Compare fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',110,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l09-c06','Documente material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 9. Documente material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',110,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l09-c07','Monte processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 9. Monte processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',110,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l09-c08','Teste controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 9. Teste controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',110,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l09-c09','Revise política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 9. Revise política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',110,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l09-c10','Valide relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 9. Valide relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',110,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l10-c01','Analise fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 10. Analise fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',120,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l10-c02','Pesquise catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 10. Pesquise catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',120,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l10-c03','Defina perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 10. Defina perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',120,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l10-c04','Compare proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 10. Compare proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',120,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l10-c05','Documente fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 10. Documente fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',120,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l10-c06','Monte material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 10. Monte material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',120,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l10-c07','Teste processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 10. Teste processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',120,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l10-c08','Revise controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 10. Revise controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',120,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l10-c09','Valide política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 10. Valide política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',120,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l10-c10','Apresente relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 10. Apresente relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',120,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l11-c01','Pesquise fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 11. Pesquise fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',130,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l11-c02','Defina catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 11. Defina catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',130,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l11-c03','Compare perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 11. Compare perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',130,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l11-c04','Documente proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 11. Documente proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',130,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l11-c05','Monte fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 11. Monte fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',130,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l11-c06','Teste material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 11. Teste material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',130,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l11-c07','Revise processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 11. Revise processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',130,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l11-c08','Valide controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 11. Valide controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',130,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l11-c09','Apresente política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 11. Apresente política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',130,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l11-c10','Analise relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 11. Analise relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',130,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l12-c01','Defina fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 12. Defina fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',140,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l12-c02','Compare catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 12. Compare catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',140,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l12-c03','Documente perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 12. Documente perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',140,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l12-c04','Monte proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 12. Monte proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',140,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l12-c05','Teste fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 12. Teste fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',140,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l12-c06','Revise material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 12. Revise material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',140,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l12-c07','Valide processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 12. Valide processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',140,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l12-c08','Apresente controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 12. Apresente controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',140,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l12-c09','Analise política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 12. Analise política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',140,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l12-c10','Pesquise relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 12. Pesquise relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',140,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l13-c01','Compare fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 13. Compare fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',150,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l13-c02','Documente catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 13. Documente catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',150,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l13-c03','Monte perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 13. Monte perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',150,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l13-c04','Teste proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 13. Teste proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',150,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l13-c05','Revise fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 13. Revise fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',150,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l13-c06','Valide material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 13. Valide material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',150,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l13-c07','Apresente processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 13. Apresente processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',150,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l13-c08','Analise controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 13. Analise controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',150,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l13-c09','Pesquise política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 13. Pesquise política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',150,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l13-c10','Defina relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 13. Defina relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',150,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l14-c01','Documente fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 14. Documente fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',160,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l14-c02','Monte catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 14. Monte catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',160,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l14-c03','Teste perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 14. Teste perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',160,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l14-c04','Revise proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 14. Revise proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',160,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l14-c05','Valide fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 14. Valide fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',160,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l14-c06','Apresente material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 14. Apresente material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',160,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l14-c07','Analise processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 14. Analise processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',160,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l14-c08','Pesquise controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 14. Pesquise controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',160,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l14-c09','Defina política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 14. Defina política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',160,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l14-c10','Compare relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 14. Compare relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',160,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l15-c01','Monte fornecedor autorizado — etapa 01','Execute uma atividade prática de revenda de streaming no nível 15. Monte fornecedor autorizado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com preços transparentes.',170,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l15-c02','Teste catálogo de planos — etapa 02','Execute uma atividade prática de revenda de streaming no nível 15. Teste catálogo de planos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fluxo de atendimento.',170,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l15-c03','Revise perfil de cliente — etapa 03','Execute uma atividade prática de revenda de streaming no nível 15. Revise perfil de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',170,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l15-c04','Valide proposta comercial — etapa 04','Execute uma atividade prática de revenda de streaming no nível 15. Valide proposta comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',170,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l15-c05','Apresente fluxo de atendimento — etapa 05','Execute uma atividade prática de revenda de streaming no nível 15. Apresente fluxo de atendimento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',170,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l15-c06','Analise material de divulgação — etapa 06','Execute uma atividade prática de revenda de streaming no nível 15. Analise material de divulgação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',170,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l15-c07','Pesquise processo de suporte — etapa 07','Execute uma atividade prática de revenda de streaming no nível 15. Pesquise processo de suporte e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com autorização documentada.',170,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l15-c08','Defina controle de renovação — etapa 08','Execute uma atividade prática de revenda de streaming no nível 15. Defina controle de renovação e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',170,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l15-c09','Compare política de reembolso — etapa 09','Execute uma atividade prática de revenda de streaming no nível 15. Compare política de reembolso e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',170,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'revenda-streaming-l15-c10','Documente relatório de retenção — etapa 10','Execute uma atividade prática de revenda de streaming no nível 15. Documente relatório de retenção e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem promessas enganosas.',170,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='revenda-streaming'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l01-c01','Pesquise nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 1. Pesquise nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',30,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l01-c02','Defina briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 1. Defina briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',30,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l01-c03','Compare proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 1. Compare proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',30,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l01-c04','Documente mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 1. Documente mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',30,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l01-c05','Monte wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 1. Monte wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',30,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l01-c06','Teste catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 1. Teste catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',30,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l01-c07','Revise checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 1. Revise checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',30,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l01-c08','Valide plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 1. Valide plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',30,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l01-c09','Apresente prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 1. Apresente prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',30,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l01-c10','Analise portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 1. Analise portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',30,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l02-c01','Defina nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 2. Defina nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',40,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l02-c02','Compare briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 2. Compare briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',40,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l02-c03','Documente proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 2. Documente proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',40,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l02-c04','Monte mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 2. Monte mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',40,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l02-c05','Teste wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 2. Teste wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',40,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l02-c06','Revise catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 2. Revise catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',40,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l02-c07','Valide checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 2. Valide checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',40,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l02-c08','Apresente plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 2. Apresente plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',40,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l02-c09','Analise prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 2. Analise prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',40,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l02-c10','Pesquise portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 2. Pesquise portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',40,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l03-c01','Compare nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 3. Compare nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',50,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l03-c02','Documente briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 3. Documente briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',50,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l03-c03','Monte proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 3. Monte proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',50,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l03-c04','Teste mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 3. Teste mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',50,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l03-c05','Revise wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 3. Revise wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',50,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l03-c06','Valide catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 3. Valide catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',50,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l03-c07','Apresente checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 3. Apresente checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',50,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l03-c08','Analise plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 3. Analise plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',50,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l03-c09','Pesquise prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 3. Pesquise prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',50,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l03-c10','Defina portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 3. Defina portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',50,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l04-c01','Documente nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 4. Documente nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',60,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l04-c02','Monte briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 4. Monte briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',60,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l04-c03','Teste proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 4. Teste proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',60,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l04-c04','Revise mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 4. Revise mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',60,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l04-c05','Valide wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 4. Valide wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',60,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l04-c06','Apresente catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 4. Apresente catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',60,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l04-c07','Analise checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 4. Analise checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',60,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l04-c08','Pesquise plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 4. Pesquise plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',60,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l04-c09','Defina prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 4. Defina prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',60,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l04-c10','Compare portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 4. Compare portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',60,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l05-c01','Monte nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 5. Monte nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',70,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l05-c02','Teste briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 5. Teste briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',70,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l05-c03','Revise proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 5. Revise proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',70,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l05-c04','Valide mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 5. Valide mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',70,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l05-c05','Apresente wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 5. Apresente wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',70,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l05-c06','Analise catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 5. Analise catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',70,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l05-c07','Pesquise checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 5. Pesquise checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',70,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l05-c08','Defina plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 5. Defina plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',70,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l05-c09','Compare prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 5. Compare prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',70,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l05-c10','Documente portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 5. Documente portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',70,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l06-c01','Teste nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 6. Teste nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',80,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l06-c02','Revise briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 6. Revise briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',80,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l06-c03','Valide proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 6. Valide proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',80,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l06-c04','Apresente mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 6. Apresente mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',80,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l06-c05','Analise wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 6. Analise wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',80,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l06-c06','Pesquise catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 6. Pesquise catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',80,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l06-c07','Defina checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 6. Defina checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',80,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l06-c08','Compare plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 6. Compare plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',80,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l06-c09','Documente prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 6. Documente prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',80,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l06-c10','Monte portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 6. Monte portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',80,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l07-c01','Revise nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 7. Revise nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',90,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l07-c02','Valide briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 7. Valide briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',90,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l07-c03','Apresente proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 7. Apresente proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',90,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l07-c04','Analise mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 7. Analise mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',90,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l07-c05','Pesquise wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 7. Pesquise wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',90,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l07-c06','Defina catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 7. Defina catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',90,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l07-c07','Compare checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 7. Compare checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',90,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l07-c08','Documente plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 7. Documente plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',90,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l07-c09','Monte prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 7. Monte prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',90,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l07-c10','Teste portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 7. Teste portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',90,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l08-c01','Valide nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 8. Valide nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',100,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l08-c02','Apresente briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 8. Apresente briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',100,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l08-c03','Analise proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 8. Analise proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',100,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l08-c04','Pesquise mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 8. Pesquise mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',100,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l08-c05','Defina wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 8. Defina wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',100,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l08-c06','Compare catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 8. Compare catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',100,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l08-c07','Documente checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 8. Documente checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',100,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l08-c08','Monte plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 8. Monte plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',100,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l08-c09','Teste prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 8. Teste prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',100,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l08-c10','Revise portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 8. Revise portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',100,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l09-c01','Apresente nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 9. Apresente nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',110,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l09-c02','Analise briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 9. Analise briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',110,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l09-c03','Pesquise proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 9. Pesquise proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',110,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l09-c04','Defina mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 9. Defina mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',110,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l09-c05','Compare wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 9. Compare wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',110,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l09-c06','Documente catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 9. Documente catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',110,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l09-c07','Monte checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 9. Monte checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',110,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l09-c08','Teste plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 9. Teste plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',110,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l09-c09','Revise prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 9. Revise prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',110,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l09-c10','Valide portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 9. Valide portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',110,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l10-c01','Analise nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 10. Analise nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',120,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l10-c02','Pesquise briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 10. Pesquise briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',120,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l10-c03','Defina proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 10. Defina proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',120,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l10-c04','Compare mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 10. Compare mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',120,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l10-c05','Documente wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 10. Documente wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',120,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l10-c06','Monte catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 10. Monte catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',120,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l10-c07','Teste checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 10. Teste checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',120,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l10-c08','Revise plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 10. Revise plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',120,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l10-c09','Valide prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 10. Valide prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',120,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l10-c10','Apresente portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 10. Apresente portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',120,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l11-c01','Pesquise nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 11. Pesquise nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',130,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l11-c02','Defina briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 11. Defina briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',130,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l11-c03','Compare proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 11. Compare proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',130,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l11-c04','Documente mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 11. Documente mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',130,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l11-c05','Monte wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 11. Monte wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',130,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l11-c06','Teste catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 11. Teste catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',130,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l11-c07','Revise checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 11. Revise checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',130,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l11-c08','Valide plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 11. Valide plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',130,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l11-c09','Apresente prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 11. Apresente prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',130,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l11-c10','Analise portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 11. Analise portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',130,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l12-c01','Defina nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 12. Defina nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',140,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l12-c02','Compare briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 12. Compare briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',140,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l12-c03','Documente proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 12. Documente proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',140,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l12-c04','Monte mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 12. Monte mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',140,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l12-c05','Teste wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 12. Teste wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',140,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l12-c06','Revise catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 12. Revise catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',140,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l12-c07','Valide checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 12. Valide checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',140,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l12-c08','Apresente plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 12. Apresente plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',140,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l12-c09','Analise prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 12. Analise prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',140,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l12-c10','Pesquise portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 12. Pesquise portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',140,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l13-c01','Compare nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 13. Compare nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',150,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l13-c02','Documente briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 13. Documente briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',150,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l13-c03','Monte proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 13. Monte proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',150,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l13-c04','Teste mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 13. Teste mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',150,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l13-c05','Revise wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 13. Revise wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',150,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l13-c06','Valide catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 13. Valide catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',150,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l13-c07','Apresente checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 13. Apresente checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',150,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l13-c08','Analise plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 13. Analise plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',150,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l13-c09','Pesquise prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 13. Pesquise prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',150,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l13-c10','Defina portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 13. Defina portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',150,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l14-c01','Documente nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 14. Documente nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',160,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l14-c02','Monte briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 14. Monte briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',160,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l14-c03','Teste proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 14. Teste proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',160,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l14-c04','Revise mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 14. Revise mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',160,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l14-c05','Valide wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 14. Valide wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',160,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l14-c06','Apresente catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 14. Apresente catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',160,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l14-c07','Analise checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 14. Analise checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',160,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l14-c08','Pesquise plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 14. Pesquise plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',160,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l14-c09','Defina prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 14. Defina prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',160,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l14-c10','Compare portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 14. Compare portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',160,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l15-c01','Monte nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites de e-commerce no nível 15. Monte nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',170,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l15-c02','Teste briefing comercial — etapa 02','Execute uma atividade prática de venda de sites de e-commerce no nível 15. Teste briefing comercial e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com hipótese mensurável.',170,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l15-c03','Revise proposta de site — etapa 03','Execute uma atividade prática de venda de sites de e-commerce no nível 15. Revise proposta de site e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',170,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l15-c04','Valide mapa de páginas — etapa 04','Execute uma atividade prática de venda de sites de e-commerce no nível 15. Valide mapa de páginas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',170,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l15-c05','Apresente wireframe — etapa 05','Execute uma atividade prática de venda de sites de e-commerce no nível 15. Apresente wireframe e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',170,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l15-c06','Analise catálogo demonstrativo — etapa 06','Execute uma atividade prática de venda de sites de e-commerce no nível 15. Analise catálogo demonstrativo e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',170,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l15-c07','Pesquise checkout de teste — etapa 07','Execute uma atividade prática de venda de sites de e-commerce no nível 15. Pesquise checkout de teste e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com escopo e prazo.',170,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l15-c08','Defina plano de entrega — etapa 08','Execute uma atividade prática de venda de sites de e-commerce no nível 15. Defina plano de entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',170,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l15-c09','Compare prospecção de lojista — etapa 09','Execute uma atividade prática de venda de sites de e-commerce no nível 15. Compare prospecção de lojista e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',170,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'venda-sites-ecommerce-l15-c10','Documente portfólio de projeto — etapa 10','Execute uma atividade prática de venda de sites de e-commerce no nível 15. Documente portfólio de projeto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com demonstração navegável.',170,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='venda-sites-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l01-c01','Pesquise nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 1. Pesquise nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',30,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l01-c02','Defina perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 1. Defina perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',30,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l01-c03','Compare seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 1. Compare seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',30,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l01-c04','Documente estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 1. Documente estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',30,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l01-c05','Monte identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 1. Monte identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',30,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l01-c06','Teste página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 1. Teste página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',30,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l01-c07','Revise logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 1. Revise logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',30,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l01-c08','Valide política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 1. Valide política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',30,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l01-c09','Apresente campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 1. Apresente campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',30,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l01-c10','Analise painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 1. Analise painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',30,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l02-c01','Defina nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 2. Defina nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',40,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l02-c02','Compare perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 2. Compare perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',40,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l02-c03','Documente seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 2. Documente seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',40,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l02-c04','Monte estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 2. Monte estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',40,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l02-c05','Teste identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 2. Teste identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',40,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l02-c06','Revise página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 2. Revise página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',40,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l02-c07','Valide logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 2. Valide logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',40,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l02-c08','Apresente política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 2. Apresente política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',40,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l02-c09','Analise campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 2. Analise campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',40,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l02-c10','Pesquise painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 2. Pesquise painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',40,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l03-c01','Compare nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 3. Compare nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',50,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l03-c02','Documente perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 3. Documente perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',50,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l03-c03','Monte seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 3. Monte seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',50,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l03-c04','Teste estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 3. Teste estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',50,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l03-c05','Revise identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 3. Revise identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',50,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l03-c06','Valide página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 3. Valide página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',50,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l03-c07','Apresente logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 3. Apresente logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',50,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l03-c08','Analise política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 3. Analise política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',50,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l03-c09','Pesquise campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 3. Pesquise campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',50,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l03-c10','Defina painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 3. Defina painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',50,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l04-c01','Documente nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 4. Documente nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',60,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l04-c02','Monte perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 4. Monte perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',60,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l04-c03','Teste seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 4. Teste seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',60,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l04-c04','Revise estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 4. Revise estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',60,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l04-c05','Valide identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 4. Valide identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',60,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l04-c06','Apresente página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 4. Apresente página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',60,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l04-c07','Analise logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 4. Analise logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',60,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l04-c08','Pesquise política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 4. Pesquise política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',60,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l04-c09','Defina campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 4. Defina campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',60,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l04-c10','Compare painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 4. Compare painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',60,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l05-c01','Monte nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 5. Monte nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',70,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l05-c02','Teste perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 5. Teste perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',70,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l05-c03','Revise seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 5. Revise seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',70,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l05-c04','Valide estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 5. Valide estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',70,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l05-c05','Apresente identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 5. Apresente identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',70,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l05-c06','Analise página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 5. Analise página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',70,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l05-c07','Pesquise logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 5. Pesquise logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',70,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l05-c08','Defina política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 5. Defina política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',70,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l05-c09','Compare campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 5. Compare campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',70,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l05-c10','Documente painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 5. Documente painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',70,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l06-c01','Teste nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 6. Teste nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',80,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l06-c02','Revise perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 6. Revise perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',80,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l06-c03','Valide seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 6. Valide seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',80,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l06-c04','Apresente estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 6. Apresente estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',80,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l06-c05','Analise identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 6. Analise identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',80,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l06-c06','Pesquise página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 6. Pesquise página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',80,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l06-c07','Defina logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 6. Defina logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',80,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l06-c08','Compare política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 6. Compare política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',80,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l06-c09','Documente campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 6. Documente campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',80,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l06-c10','Monte painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 6. Monte painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',80,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l07-c01','Revise nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 7. Revise nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',90,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l07-c02','Valide perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 7. Valide perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',90,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l07-c03','Apresente seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 7. Apresente seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',90,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l07-c04','Analise estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 7. Analise estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',90,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l07-c05','Pesquise identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 7. Pesquise identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',90,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l07-c06','Defina página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 7. Defina página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',90,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l07-c07','Compare logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 7. Compare logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',90,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l07-c08','Documente política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 7. Documente política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',90,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l07-c09','Monte campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 7. Monte campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',90,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l07-c10','Teste painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 7. Teste painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',90,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l08-c01','Valide nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 8. Valide nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',100,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l08-c02','Apresente perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 8. Apresente perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',100,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l08-c03','Analise seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 8. Analise seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',100,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l08-c04','Pesquise estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 8. Pesquise estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',100,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l08-c05','Defina identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 8. Defina identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',100,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l08-c06','Compare página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 8. Compare página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',100,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l08-c07','Documente logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 8. Documente logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',100,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l08-c08','Monte política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 8. Monte política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',100,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l08-c09','Teste campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 8. Teste campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',100,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l08-c10','Revise painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 8. Revise painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',100,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l09-c01','Apresente nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 9. Apresente nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',110,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l09-c02','Analise perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 9. Analise perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',110,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l09-c03','Pesquise seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 9. Pesquise seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',110,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l09-c04','Defina estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 9. Defina estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',110,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l09-c05','Compare identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 9. Compare identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',110,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l09-c06','Documente página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 9. Documente página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',110,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l09-c07','Monte logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 9. Monte logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',110,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l09-c08','Teste política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 9. Teste política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',110,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l09-c09','Revise campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 9. Revise campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',110,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l09-c10','Valide painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 9. Valide painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',110,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l10-c01','Analise nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 10. Analise nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',120,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l10-c02','Pesquise perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 10. Pesquise perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',120,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l10-c03','Defina seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 10. Defina seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',120,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l10-c04','Compare estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 10. Compare estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',120,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l10-c05','Documente identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 10. Documente identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',120,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l10-c06','Monte página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 10. Monte página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',120,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l10-c07','Teste logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 10. Teste logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',120,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l10-c08','Revise política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 10. Revise política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',120,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l10-c09','Valide campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 10. Valide campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',120,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l10-c10','Apresente painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 10. Apresente painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',120,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l11-c01','Pesquise nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 11. Pesquise nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',130,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l11-c02','Defina perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 11. Defina perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',130,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l11-c03','Compare seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 11. Compare seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',130,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l11-c04','Documente estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 11. Documente estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',130,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l11-c05','Monte identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 11. Monte identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',130,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l11-c06','Teste página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 11. Teste página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',130,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l11-c07','Revise logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 11. Revise logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',130,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l11-c08','Valide política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 11. Valide política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',130,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l11-c09','Apresente campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 11. Apresente campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',130,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l11-c10','Analise painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 11. Analise painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',130,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l12-c01','Defina nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 12. Defina nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',140,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l12-c02','Compare perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 12. Compare perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',140,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l12-c03','Documente seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 12. Documente seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',140,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l12-c04','Monte estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 12. Monte estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',140,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l12-c05','Teste identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 12. Teste identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',140,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l12-c06','Revise página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 12. Revise página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',140,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l12-c07','Valide logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 12. Valide logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',140,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l12-c08','Apresente política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 12. Apresente política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',140,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l12-c09','Analise campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 12. Analise campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',140,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l12-c10','Pesquise painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 12. Pesquise painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',140,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l13-c01','Compare nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 13. Compare nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',150,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l13-c02','Documente perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 13. Documente perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',150,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l13-c03','Monte seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 13. Monte seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',150,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l13-c04','Teste estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 13. Teste estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',150,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l13-c05','Revise identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 13. Revise identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',150,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l13-c06','Valide página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 13. Valide página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',150,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l13-c07','Apresente logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 13. Apresente logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',150,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l13-c08','Analise política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 13. Analise política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',150,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l13-c09','Pesquise campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 13. Pesquise campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',150,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l13-c10','Defina painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 13. Defina painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',150,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l14-c01','Documente nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 14. Documente nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',160,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l14-c02','Monte perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 14. Monte perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',160,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l14-c03','Teste seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 14. Teste seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',160,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l14-c04','Revise estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 14. Revise estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',160,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l14-c05','Valide identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 14. Valide identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',160,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l14-c06','Apresente página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 14. Apresente página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',160,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l14-c07','Analise logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 14. Analise logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',160,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l14-c08','Pesquise política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 14. Pesquise política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',160,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l14-c09','Defina campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 14. Defina campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',160,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l14-c10','Compare painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 14. Compare painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',160,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l15-c01','Monte nicho de mercado — etapa 01','Execute uma atividade prática de criar um e-commerce no nível 15. Monte nicho de mercado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com custos estimados.',170,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l15-c02','Teste perfil de comprador — etapa 02','Execute uma atividade prática de criar um e-commerce no nível 15. Teste perfil de comprador e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de execução.',170,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l15-c03','Revise seleção de produtos — etapa 03','Execute uma atividade prática de criar um e-commerce no nível 15. Revise seleção de produtos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',170,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l15-c04','Valide estrutura de custos — etapa 04','Execute uma atividade prática de criar um e-commerce no nível 15. Valide estrutura de custos e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com plano de melhoria.',170,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l15-c05','Apresente identidade da loja — etapa 05','Execute uma atividade prática de criar um e-commerce no nível 15. Apresente identidade da loja e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',170,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l15-c06','Analise página de produto — etapa 06','Execute uma atividade prática de criar um e-commerce no nível 15. Analise página de produto e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',170,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l15-c07','Pesquise logística e entrega — etapa 07','Execute uma atividade prática de criar um e-commerce no nível 15. Pesquise logística e entrega e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',170,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l15-c08','Defina política de troca — etapa 08','Execute uma atividade prática de criar um e-commerce no nível 15. Defina política de troca e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',170,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l15-c09','Compare campanha de lançamento — etapa 09','Execute uma atividade prática de criar um e-commerce no nível 15. Compare campanha de lançamento e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',170,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'criar-ecommerce-l15-c10','Documente painel de métricas — etapa 10','Execute uma atividade prática de criar um e-commerce no nível 15. Documente painel de métricas e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com teste registrado.',170,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='criar-ecommerce'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l01-c01','Pesquise nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 1. Pesquise nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',30,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l01-c02','Defina briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 1. Defina briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',30,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l01-c03','Compare prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 1. Compare prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',30,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l01-c04','Documente protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 1. Documente protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',30,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l01-c05','Monte sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 1. Monte sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',30,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l01-c06','Teste conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 1. Teste conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',30,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l01-c07','Revise versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 1. Revise versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',30,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l01-c08','Valide checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 1. Valide checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',30,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l01-c09','Apresente demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 1. Apresente demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',30,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l01-c10','Analise proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 1. Analise proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',30,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=1
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l02-c01','Defina nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 2. Defina nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',40,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l02-c02','Compare briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 2. Compare briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',40,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l02-c03','Documente prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 2. Documente prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',40,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l02-c04','Monte protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 2. Monte protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',40,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l02-c05','Teste sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 2. Teste sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',40,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l02-c06','Revise conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 2. Revise conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',40,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l02-c07','Valide versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 2. Valide versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',40,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l02-c08','Apresente checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 2. Apresente checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',40,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l02-c09','Analise demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 2. Analise demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',40,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l02-c10','Pesquise proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 2. Pesquise proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',40,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=2
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l03-c01','Compare nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 3. Compare nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',50,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l03-c02','Documente briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 3. Documente briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',50,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l03-c03','Monte prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 3. Monte prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',50,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l03-c04','Teste protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 3. Teste protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',50,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l03-c05','Revise sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 3. Revise sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',50,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l03-c06','Valide conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 3. Valide conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',50,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l03-c07','Apresente versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 3. Apresente versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',50,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l03-c08','Analise checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 3. Analise checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',50,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l03-c09','Pesquise demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 3. Pesquise demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',50,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l03-c10','Defina proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 3. Defina proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',50,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=3
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l04-c01','Documente nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 4. Documente nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',60,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l04-c02','Monte briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 4. Monte briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',60,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l04-c03','Teste prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 4. Teste prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',60,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l04-c04','Revise protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 4. Revise protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',60,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l04-c05','Valide sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 4. Valide sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',60,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l04-c06','Apresente conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 4. Apresente conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',60,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l04-c07','Analise versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 4. Analise versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',60,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l04-c08','Pesquise checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 4. Pesquise checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',60,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l04-c09','Defina demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 4. Defina demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',60,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l04-c10','Compare proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 4. Compare proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',60,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=4
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l05-c01','Monte nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 5. Monte nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',70,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l05-c02','Teste briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 5. Teste briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',70,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l05-c03','Revise prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 5. Revise prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',70,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l05-c04','Valide protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 5. Valide protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',70,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l05-c05','Apresente sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 5. Apresente sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',70,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l05-c06','Analise conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 5. Analise conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',70,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l05-c07','Pesquise versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 5. Pesquise versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',70,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l05-c08','Defina checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 5. Defina checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',70,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l05-c09','Compare demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 5. Compare demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',70,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l05-c10','Documente proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 5. Documente proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',70,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=5
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l06-c01','Teste nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 6. Teste nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',80,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l06-c02','Revise briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 6. Revise briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',80,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l06-c03','Valide prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 6. Valide prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',80,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l06-c04','Apresente protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 6. Apresente protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',80,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l06-c05','Analise sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 6. Analise sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',80,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l06-c06','Pesquise conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 6. Pesquise conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',80,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l06-c07','Defina versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 6. Defina versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',80,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l06-c08','Compare checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 6. Compare checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',80,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l06-c09','Documente demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 6. Documente demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',80,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l06-c10','Monte proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 6. Monte proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',80,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=6
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l07-c01','Revise nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 7. Revise nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',90,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l07-c02','Valide briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 7. Valide briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',90,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l07-c03','Apresente prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 7. Apresente prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',90,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l07-c04','Analise protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 7. Analise protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',90,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l07-c05','Pesquise sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 7. Pesquise sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',90,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l07-c06','Defina conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 7. Defina conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',90,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l07-c07','Compare versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 7. Compare versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',90,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l07-c08','Documente checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 7. Documente checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',90,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l07-c09','Monte demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 7. Monte demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',90,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l07-c10','Teste proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 7. Teste proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',90,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=7
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l08-c01','Valide nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 8. Valide nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',100,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l08-c02','Apresente briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 8. Apresente briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',100,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l08-c03','Analise prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 8. Analise prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',100,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l08-c04','Pesquise protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 8. Pesquise protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',100,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l08-c05','Defina sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 8. Defina sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',100,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l08-c06','Compare conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 8. Compare conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',100,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l08-c07','Documente versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 8. Documente versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',100,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l08-c08','Monte checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 8. Monte checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',100,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l08-c09','Teste demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 8. Teste demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',100,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l08-c10','Revise proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 8. Revise proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',100,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=8
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l09-c01','Apresente nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 9. Apresente nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',110,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l09-c02','Analise briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 9. Analise briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',110,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l09-c03','Pesquise prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 9. Pesquise prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',110,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l09-c04','Defina protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 9. Defina protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',110,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l09-c05','Compare sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 9. Compare sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',110,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l09-c06','Documente conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 9. Documente conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',110,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l09-c07','Monte versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 9. Monte versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',110,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l09-c08','Teste checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 9. Teste checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',110,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l09-c09','Revise demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 9. Revise demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',110,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l09-c10','Valide proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 9. Valide proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',110,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=9
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l10-c01','Analise nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 10. Analise nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',120,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l10-c02','Pesquise briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 10. Pesquise briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',120,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l10-c03','Defina prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 10. Defina prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',120,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l10-c04','Compare protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 10. Compare protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',120,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l10-c05','Documente sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 10. Documente sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',120,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l10-c06','Monte conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 10. Monte conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',120,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l10-c07','Teste versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 10. Teste versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',120,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l10-c08','Revise checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 10. Revise checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',120,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l10-c09','Valide demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 10. Valide demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',120,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l10-c10','Apresente proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 10. Apresente proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',120,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=10
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l11-c01','Pesquise nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 11. Pesquise nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',130,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l11-c02','Defina briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 11. Defina briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',130,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l11-c03','Compare prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 11. Compare prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',130,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l11-c04','Documente protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 11. Documente protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',130,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l11-c05','Monte sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 11. Monte sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',130,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l11-c06','Teste conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 11. Teste conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',130,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l11-c07','Revise versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 11. Revise versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',130,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l11-c08','Valide checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 11. Valide checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',130,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l11-c09','Apresente demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 11. Apresente demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',130,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l11-c10','Analise proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 11. Analise proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',130,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=11
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l12-c01','Defina nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 12. Defina nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',140,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l12-c02','Compare briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 12. Compare briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',140,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l12-c03','Documente prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 12. Documente prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',140,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l12-c04','Monte protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 12. Monte protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',140,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l12-c05','Teste sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 12. Teste sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',140,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l12-c06','Revise conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 12. Revise conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',140,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l12-c07','Valide versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 12. Valide versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',140,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l12-c08','Apresente checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 12. Apresente checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',140,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l12-c09','Analise demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 12. Analise demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',140,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l12-c10','Pesquise proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 12. Pesquise proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',140,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=12
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l13-c01','Compare nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 13. Compare nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',150,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l13-c02','Documente briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 13. Documente briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',150,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l13-c03','Monte prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 13. Monte prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',150,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l13-c04','Teste protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 13. Teste protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',150,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l13-c05','Revise sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 13. Revise sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',150,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l13-c06','Valide conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 13. Valide conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',150,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l13-c07','Apresente versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 13. Apresente versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',150,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l13-c08','Analise checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 13. Analise checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',150,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l13-c09','Pesquise demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 13. Pesquise demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',150,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l13-c10','Defina proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 13. Defina proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',150,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=13
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l14-c01','Documente nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 14. Documente nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',160,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l14-c02','Monte briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 14. Monte briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',160,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l14-c03','Teste prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 14. Teste prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',160,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l14-c04','Revise protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 14. Revise protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',160,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l14-c05','Valide sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 14. Valide sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',160,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l14-c06','Apresente conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 14. Apresente conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',160,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l14-c07','Analise versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 14. Analise versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',160,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l14-c08','Pesquise checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 14. Pesquise checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',160,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l14-c09','Defina demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 14. Defina demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',160,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l14-c10','Compare proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 14. Compare proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',160,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=14
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l15-c01','Monte nicho de cliente — etapa 01','Execute uma atividade prática de venda de sites criados com ia no nível 15. Monte nicho de cliente e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: sem dados inventados.',170,1,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l15-c02','Teste briefing assistido por IA — etapa 02','Execute uma atividade prática de venda de sites criados com ia no nível 15. Teste briefing assistido por IA e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com checklist de qualidade.',170,2,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l15-c03','Revise prompt de estrutura — etapa 03','Execute uma atividade prática de venda de sites criados com ia no nível 15. Revise prompt de estrutura e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com indicadores definidos.',170,3,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l15-c04','Valide protótipo de página — etapa 04','Execute uma atividade prática de venda de sites criados com ia no nível 15. Valide protótipo de página e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com evidências próprias.',170,4,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l15-c05','Apresente sistema visual — etapa 05','Execute uma atividade prática de venda de sites criados com ia no nível 15. Apresente sistema visual e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com feedback registrado.',170,5,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l15-c06','Analise conteúdo revisado — etapa 06','Execute uma atividade prática de venda de sites criados com ia no nível 15. Analise conteúdo revisado e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com próximos passos.',170,6,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l15-c07','Pesquise versão responsiva — etapa 07','Execute uma atividade prática de venda de sites criados com ia no nível 15. Pesquise versão responsiva e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com fontes verificáveis.',170,7,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l15-c08','Defina checagem de acessibilidade — etapa 08','Execute uma atividade prática de venda de sites criados com ia no nível 15. Defina checagem de acessibilidade e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com critérios objetivos.',170,8,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l15-c09','Compare demonstração de portfólio — etapa 09','Execute uma atividade prática de venda de sites criados com ia no nível 15. Compare demonstração de portfólio e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: em um documento claro.',170,9,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
INSERT INTO clone_awards_challenges(track_id,level_id,challenge_key,title,instructions,evidence_requirements,xp,sort_order,is_active)
SELECT t.id,l.id,'sites-com-ia-l15-c10','Documente proposta de serviço — etapa 10','Execute uma atividade prática de venda de sites criados com ia no nível 15. Documente proposta de serviço e registre a decisão tomada, o motivo e a próxima ação. Inclua um exemplo aplicável ao seu projeto; evite apenas copiar material pronto.','Envie um link ou relato com: 1) o trabalho realizado; 2) a evidência do resultado; 3) o que aprendeu; 4) a próxima ação. Critério de qualidade: com revisão humana.',170,10,true
FROM clone_awards_tracks t JOIN clone_awards_levels l ON l.track_id=t.id AND l.level_number=15
WHERE t.slug='sites-com-ia'
ON CONFLICT(track_id,challenge_key) DO UPDATE SET level_id=EXCLUDED.level_id,title=EXCLUDED.title,instructions=EXCLUDED.instructions,evidence_requirements=EXCLUDED.evidence_requirements,xp=EXCLUDED.xp,sort_order=EXCLUDED.sort_order,is_active=true;
