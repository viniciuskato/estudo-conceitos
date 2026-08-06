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

## produtos/ — Estudo de produtos e comparativo de produtos

Renomeado de `automoveis/` em 2026-07-09 (auditoria raio-x-cowork) — o recorte real nunca foi
"carros" especificamente, é pesquisa orientada a produto/decisão de compra em geral. Automóveis
continuam sendo o único caso concreto até agora, mas a pasta deixa de presumir isso pelo nome.
Duas ramificações paralelas que se intercambiam — estudar um produto isoladamente pode gerar
material que alimenta um comparativo depois; um comparativo pode motivar aprofundar um produto
específico que se destacou nele:

- `produtos/estudo/` — aprofundamento de **um** produto específico (defeito, funcionamento,
  característica pontual) — não é comparação entre alternativas.
- `produtos/comparativo/` — comparação **entre** dois ou mais produtos concorrentes, orientada
  a decisão de compra.

Casos pontuais de pesquisa, não área de estudo sistemático (não confundir com `sistema-veiculos`,
que cobre o funcionamento técnico de veículos como sistema — chassi, motorização, transmissão —
independente de decisão de compra). Sem plano de mecanismo.

### Arquivos

- `produtos/estudo/falha-airbag-nivus-2023.html` — Investigação de falha de airbag no Nivus 2023
  (produto único, não comparativo).
- `produtos/comparativo/eficiencia-combustivel-saveiro-nivus-s90.html` — Comparativo de eficiência
  de combustível entre Saveiro, Nivus e S90.
- `produtos/comparativo/Comparativo_Cambios_2026.html` — Comparativo de câmbios de SUVs cupê
  compactos, Brasil 2026. Movido de `Cowork/` raiz (estava órfão, sem roteamento) em 2026-07-09.
- `produtos/comparativo/Comparativo_SUVs_Cupe_2026.html` e `.md` — Comparativo de SUVs/crossovers
  cupê compactos (Nivus vs. Fastback), Brasil, julho/2026. Mesma origem e mesma data de migração
  do item acima.

### Avaliação (2026-07-01, revisada em 2026-07-09)

Decisão original (01/07): manter em `_acervo/` como referência — não promover a compêndio de área.
Os arquivos são pesquisas pontuais orientadas a decisão (comparativo de compra, investigação de
defeito específico), não um recorte de área para estudo sistemático — não há questões centrais,
subdivisões ou corpo de literatura que justifiquem um compêndio de área. Essa avaliação permanece
válida após a ampliação de escopo em 09/07 (ainda é só a categoria "carro" dentro de "produtos" —
nenhum outro tipo de produto apareceu ainda). Reavaliar promoção para domínio próprio (fora de
`_acervo/`) apenas se o padrão se repetir com outra categoria de produto (ex.: eletrônicos,
eletrodomésticos) — ver `_docs/DEBT.md`.

---

## farmacologia/ — Material didático pré-modelo (anti-inflamatórios, anti-histamínicos, antibacterianos)

Movido em 2026-07-09 (auditoria raio-x-cowork, revisão da fronteira Cowork↔Dados) de `Dados/Medicina/Estudos próprios/Material_Didatico_Farmacologia.html` — formato de documento para impressão (capa, índice, "mapa mental"), anterior ao modelo Compêndio/Mecanismo, não os três compêndios de farmacologia já ativos em `medicina/farmacologia/` (antiagregantes/anticoagulantes/trombolíticos, antifúngicos, hipertensão/SRAA/anti-hipertensivos).

### Arquivos

- `farmacologia/Material_Didatico_Farmacologia.html` — cobre anti-inflamatórios, anti-histamínicos e antibacterianos: temas que **não** se sobrepõem aos três compêndios de farmacologia já existentes (confirmado por comparação de títulos/seções nesta sessão) — gap real de conteúdo, não duplicata.

### O que fazer ao retomar

Conteúdo confirmado como gap, não overlap — mas ainda no formato/estilo antigo (impressão, sem CSS/estrutura do `template-v2-spec.md`). Ao retomar farmacologia: usar este arquivo como fonte de conteúdo (não reescrever do zero) e adaptar ao modelo atual de `mecanismo-medicina-clinica` — provavelmente 3 arquivos novos em `medicina/farmacologia/` (um por classe: anti-inflamatórios, anti-histamínicos, antibacterianos), seguindo a mesma convenção dos três já existentes. Registrado também em `_docs/DEBT.md`.

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
