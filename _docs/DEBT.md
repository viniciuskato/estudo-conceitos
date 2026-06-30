# Dívida Técnica — Estudo de Conceitos

Arquivo rastreado pelo Git. Toda inconsistência identificada mas não corrigida na sessão deve ser registrada aqui — nunca deixar silenciosa.

**Formato de entrada:**
```
- [ ] `caminho/arquivo.html` — descrição do problema (YYYY-MM-DD)
```

Ao corrigir: marcar `[x]` e mover para a seção **Resolvida** com data de resolução.

---

## Pendente

- [ ] `atlas/ia/inteligencia-artificial.html` — verificação visual no Chrome pendente (Claude-in-Chrome não navega de chrome://newtab para file://; verificação estrutural OK: 442 linhas, sidebar, progress bar, acentuação PT-BR, sem artefatos) (2026-06-30)

- [x] `atlas/medicina/cardiologia-anatomia.html` — verificação visual confirmada no Chrome via surge.sh: pranchas Gray's Anatomy renderizando corretamente sem filtro, layout OK (2026-06-30)
- [ ] `atlas/medicina/` — criar compêndios futuros de cardiologia: fisiologia cardíaca, semiologia, valvopatias, IC, HAS, ECG, coronariopatias, arritmias (2026-06-30)
- [ ] `index.html` — reescrever para refletir estrutura atual (atlas/mecanismo); index antigo ainda mostra organização anterior (2026-06-30)

- [ ] `investimentos/fundamentos-investimentos.html` — adicionar cross-links para futuros compêndios de economia quando criados: inflação, juros reais, política monetária do Banco Central (conceitos mencionados inline sem material dedicado no projeto) (2026-06-22)
- [ ] `investimentos/fundamentos-investimentos.html` — conceitos mencionados por nome sem mecanismo desenvolvido que podem virar seções futuras: *factor zoo* (proliferação de fatores em Fama-French), paradoxo de Grossman-Stiglitz (limites da eficiência), limites da arbitragem (Shleifer-Vishny) (2026-06-22)

---

## Resolvida

- [x] `investimentos/fundamentos-investimentos.html` — 9 itens de dívida técnica registrados e resolvidos na sessão de 2026-06-22: célula Tabela 12 truncada; referência Yearbook 2024 ausente; Tabela 15B sem fonte; numeração de tabelas com colisão (1–16 agora sequencial); #bazin promovido a section; ordem CAPM → objetivo-pessoal; fórmula de Gordon formalizada; colchão de liquidez desenvolvido; pergunta motivadora reformulada. (2026-06-22)
- [x] `medicina/fisiologia/ciclo-cardiaco.html` — verificação visual confirmada via preview do Cowork (2026-06-30)
- [x] `atlas/medicina/cardiologia-anatomia.html` — compêndio de anatomia cardíaca criado: câmaras, valvas, grandes vasos, coronárias, sistema de condução, pericárdio, topografia, parede cardíaca (2026-06-30)
- [x] `atlas/medicina/cardiologia-anatomia.html` — verificação visual confirmada no Chrome via surge.sh: pranchas Gray's Anatomy renderizando corretamente sem filtro, layout OK (2026-06-30)
- [x] `atlas-ia` (skill) — empacotada com empacotar_skills.py (atlas-ia.skill gerado em _docs/skills-export/); reinstalar via Settings > Capabilities > Skills (2026-06-30)
- [x] `atlas/atlas_mapa.txt` — 5 entradas inexistentes removidas (claude-llm, instrucoes-projeto-cowork, instrucoes-skills-agentes, fundamentos/introducao-ia, fundamentos/ia-para-estudar); apenas inteligencia-artificial.html existe na pasta (2026-06-30)
- [x] `index.html` — reescrito: estrutura atual (atlas/mecanismo), 3 abas (Todos, Atlas, Mecanismos), 22 materiais linkados corretamente (2026-06-30)
