# Acervo — Material anterior ao modelo atual

Arquivos produzidos antes da estrutura Compêndio de área/Mecanismo ser formalizada.
Preservados para reaproveitamento quando o estudo dessas áreas for retomado.

**Não deletar.** Ao retomar uma área, adaptar o material existente ao modelo atual
em vez de criar do zero.

---

## ia/ — Inteligência Artificial

Criados em 2026-06-25 como compêndios no formato anterior (não são compêndios de área
nem mecanismos no formato atual). Têm profundidade de mecanismo mas estrutura
e CSS do modelo antigo.

### Arquivos

- `ia/fundamentos/introducao-ia.html` — Introdução à IA: hierarquia IA→ML→DL→LLMs,
  treinamento, backpropagation, Transformer, LLMs, alucinação, história (Turing→ChatGPT).
- `ia/fundamentos/ia-para-estudar.html` — IA como ferramenta de estudo: retrieval gap,
  efeito de testagem, espaçamento, ilusão de fluência, modo socrático, Feynman com IA.
- `ia/claude-llm.html` — Claude: Constitutional AI, RLHF, MCP, agentes, ferramentas.
- `ia/instrucoes-skills-agentes.html` — Skills e agentes: system prompt, context window,
  tool use, MCP, orquestrador/sub-agentes, ReAct, prompt injection.
- `ia/instrucoes-projeto-cowork.html` — Instruções de projeto no Cowork: system prompt,
  instruções de projeto, otimização de workflow.

### O que fazer ao retomar

Nota (2026-07-01): o compêndio de área de IA já existe em `compêndios/ia/inteligencia-artificial.html`
(criado 2026-06-30, atualizado ao modelo atual em 2026-07-01) — a subskill `compendio-ia` também já
existe. O passo 1 abaixo está parcialmente superado; falta apenas o passo 2 (mecanismos de IA).

1. ~~Criar compêndio de área de IA~~ — já existe, ver nota acima.
2. Criar `medicina/ia/` (ou pasta equivalente) para os compêndios de mecanismo de IA — subskill `mecanismo-ia` ainda não existe, propor criação ao retomar.
3. Adaptar cada arquivo acima ao template atual (CSS v2, estrutura de seções, IDs de âncora).

---

## automoveis/ — Automóveis

Casos pontuais de pesquisa, não área de estudo sistemático. Sem plano de mecanismo.

### Arquivos

- `automoveis/eficiencia-combustivel-saveiro-nivus-s90.html` — Comparativo de eficiência
  de combustível entre Saveiro, Nivus e S90.
- `automoveis/falha-airbag-nivus-2023.html` — Investigação de falha de airbag no Nivus 2023.

### Avaliação (2026-07-01)

Decisão: manter em `_acervo/` como referência — não promover a `compêndios/automoveis/`.
Os dois arquivos são pesquisas pontuais orientadas a decisão (comparativo de compra,
investigação de defeito específico), não um recorte de área para estudo sistemático —
não há questões centrais, subdivisões ou corpo de literatura que justifiquem um compêndio de área.
Reavaliar apenas se houver decisão explícita de tratar "automóveis" como área contínua
de estudo (ex.: mecânica, engenharia automotiva) em vez de casos pontuais.

---

## docs-legado/ — Instruções e SKILL.md de eras anteriores do projeto

Documentação substituída por versões atuais, preservada por referência histórica — não
apaga o raciocínio por trás de decisões antigas, mas nenhuma instrução ativa do projeto
depende destes arquivos.

### Arquivos

- `instrucoes-atlas-raiz.txt`, `instrucoes-atlas-docs.txt` — instruções da era "Atlas"
  (nome anterior da skill `compendio`), substituídas em 2026-07-01.
- `claude-skills-legado/atlas-SKILL.md`, `claude-skills-legado/mecanismo-SKILL.md` —
  versões anteriores das skills estruturais, de antes da skill `sistema` existir e de
  antes da separação em subskills de subárea.
- `instrucoes-projeto-ia.txt` — instruções da era pré-skill de IA (antes de
  `compendio`/`mecanismo`/`sistema` existirem como skills separadas): descrevia um
  "formato único: compêndio", referenciava `project_estado.md`/`project_mapa_materiais.md`
  como arquivos de IA especificamente, e tinha estrutura de pastas (`ia/fundamentos/`,
  `ia/modelos-linguagem/`) divergente da atual (`compêndios/ia/`). Continha também uma
  cópia própria e desatualizada do procedimento de Anki, restrita a IA — hoje o Anki é
  modo opcional das três skills estruturais, com o texto único do procedimento vivendo em
  `mecanismo/SKILL.md`. Movido para cá em 2026-07-03 (ver `_docs/DEBT.md`).
- `MIGRATION.md` — rastreamento do status de migração ao "Template v2", da era anterior
  à separação em compêndio/mecanismo/sistema. Todo o acervo ativo já foi migrado ao
  modelo atual (ver `_docs/DEBT.md`, sessão de atualização em massa de 2026-07-01); o
  arquivo parou de ser atualizado e ficou com caminhos e status incorretos (ex.: listava
  compêndios de imunologia/farmacologia ainda como "template v1", já corrigidos há muito).
  Movido para cá em 2026-07-03 — o histórico de cada compêndio agora vive em
  `compêndios/compendio_estado.txt`, `_docs/project_estado.md` (mecanismo) e
  `sistemas/sistema_estado.txt` (sistema).
