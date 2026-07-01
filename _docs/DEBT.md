# Dívida Técnica — Estudo de Conceitos

Arquivo rastreado pelo Git. Toda inconsistência identificada mas não corrigida na sessão deve ser registrada aqui — nunca deixar silenciosa.

**Formato de entrada:**
```
- [ ] `caminho/arquivo.html` — descrição do problema (YYYY-MM-DD)
```

Ao corrigir: marcar `[x]` e mover para a seção **Resolvida** com data de resolução.

---

## Pendente

- [ ] `_docs/instrucoes-atlas.txt` e `instrucoes-atlas.txt` (raiz, cópia duplicada e ligeiramente divergente) — documentos legados de uma fase anterior do projeto (Atlas como "mapa orientador" raso, sem saturação), conflitam com o modelo atual de compêndio de área (profundidade real, "exaure a área"). Referenciam estrutura de pastas antiga (`atlas/` em vez de `compêndios/`) e nome de skill antigo (`atlas`, agora `compendio`). Avaliar arquivar ambos em `_acervo/` com nota no LEIA-ME.md ou remover — `instrucoes-projeto.txt` já cobre esse conteúdo de forma atualizada (2026-07-01)
- [ ] `.claude/skills/atlas/` e `.claude/skills/mecanismo/` (dentro de "Base de estudos") — cópia local legada e superada de uma versão anterior das skills (2 arquivos SKILL.md simples, sem a hierarquia de subskills atual). Não é a fonte usada pelo sistema de skills atual (`_docs/skills-export/`). Avaliar remover essa pasta `.claude/` para evitar confusão futura (2026-07-01)

- [ ] `compêndios/ia/inteligencia-artificial.html` — verificação visual no Chrome pendente (Claude-in-Chrome não navega de chrome://newtab para file://; verificação estrutural OK: 442 linhas, sidebar, progress bar, acentuação PT-BR, sem artefatos) (2026-06-30)

- [x] `compêndios/medicina/cardiologia-anatomia.html` — verificação visual confirmada no Chrome via surge.sh: pranchas Gray's Anatomy renderizando corretamente sem filtro, layout OK (2026-06-30)
- [ ] `compêndios/medicina/` — criar compêndios futuros de cardiologia: fisiologia cardíaca, semiologia, valvopatias, IC, HAS, ECG, coronariopatias, arritmias (2026-06-30)
- [ ] `index.html` — reescrever para refletir estrutura atual (compêndios/mecanismo); index antigo ainda mostra organização anterior (2026-06-30)

- [ ] `investimentos/fundamentos-investimentos.html` — adicionar cross-links para futuros compêndios de economia quando criados: inflação, juros reais, política monetária do Banco Central (conceitos mencionados inline sem material dedicado no projeto) (2026-06-22)
- [ ] `investimentos/fundamentos-investimentos.html` — conceitos mencionados por nome sem mecanismo desenvolvido que podem virar seções futuras: *factor zoo* (proliferação de fatores em Fama-French), paradoxo de Grossman-Stiglitz (limites da eficiência), limites da arbitragem (Shleifer-Vishny) (2026-06-22)

- [ ] `medicina/imunologia/celulas-sistema-imune.html`, `imunidade-inata.html`, `hipersensibilidade.html`, `linfocitos-t-diferenciacao.html`, `mhc-apresentacao-antigenica.html` — editados na atualização em massa de 2026-07-01 sem backup prévio em `_archive/` (correções pontuais sob pressão de tempo, não reescrita ≥30% isolada). Se necessário reconstituir o estado anterior, usar histórico do Git. (2026-07-01)
- [ ] `compêndios/investimentos/fundamentos-investimentos.html` — atualizado ao modelo atual (16 tabelas convertidas para `.data-table`, JS de destaque da sidebar corrigido para scroll-based) mas sem `td-label` por linha nas tabelas (aplicado nos demais compêndios da sessão) — puramente cosmético, pendente se for feita nova revisão do arquivo (2026-07-01)
- [ ] `compêndios/ia/inteligencia-artificial.html` — verificação visual no Chrome ainda pendente (arquivo sem tabelas/pranchas; apenas JS de sidebar corrigido nesta sessão) (2026-07-01)
- [ ] Diversos compêndios de imunologia/farmacologia/fisiopatologia atualizados nesta sessão (ver Resolvida) sem pranchas Gray's/OpenStax adicionadas — conteúdo predominantemente molecular/farmacológico sem imagem CC apropriada encontrada; reavaliar se novo material visual (ex. diagramas de via) ficar disponível (2026-07-01)

---

## Resolvida

- [x] Atualização em massa ao modelo atual (2026-07-01) — todos os compêndios pré-existentes revisados: sidebar scroll-based (substituindo `IntersectionObserver` para `.active`), tabelas convertidas para `.data-table`, chip de "Última revisão" atualizado. Tier A (imunologia × 9 + hipertensão-SRAA + trombose-hemostasia): tratamento completo (CSS+tabelas+JS+pranchas Gray's/OpenStax onde aplicável). Tier B (choque-circulatorio): completo com pranchas. Tier C (virologia, micologia, antifúngicos, antiagregantes/anticoagulantes, doenças circulatórias, citocinas, Th1/Th2/Th17, vacinas): tabelas + JS, sem pranchas novas (conteúdo molecular/farmacológico). Tier D (compêndios de área IA e investimentos): JS de sidebar corrigido; investimentos com 16 tabelas convertidas. `medicina/imunologia/index.html` e `_acervo/automoveis` avaliados e mantidos fora do escopo (templates/formatos distintos — ver notas). (2026-07-01)
- [x] `_acervo/automoveis/` — avaliado: mantido como referência em `_acervo/`, não promovido a compêndio de área (pesquisas pontuais, não campo de estudo sistemático) (2026-07-01)
- [x] `investimentos/fundamentos-investimentos.html` — 9 itens de dívida técnica registrados e resolvidos na sessão de 2026-06-22: célula Tabela 12 truncada; referência Yearbook 2024 ausente; Tabela 15B sem fonte; numeração de tabelas com colisão (1–16 agora sequencial); #bazin promovido a section; ordem CAPM → objetivo-pessoal; fórmula de Gordon formalizada; colchão de liquidez desenvolvido; pergunta motivadora reformulada. (2026-06-22)
- [x] `medicina/fisiologia/ciclo-cardiaco.html` — verificação visual confirmada via preview do Cowork (2026-06-30)
- [x] `compêndios/medicina/cardiologia-anatomia.html` — compêndio de anatomia cardíaca criado: câmaras, valvas, grandes vasos, coronárias, sistema de condução, pericárdio, topografia, parede cardíaca (2026-06-30)
- [x] `compêndios/medicina/cardiologia-anatomia.html` — verificação visual confirmada no Chrome via surge.sh: pranchas Gray's Anatomy renderizando corretamente sem filtro, layout OK (2026-06-30)
- [x] `atlas-ia` (skill) — empacotada com emp