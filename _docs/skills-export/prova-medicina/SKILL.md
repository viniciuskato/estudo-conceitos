---
name: prova-medicina
description: >
  Contexto epistêmico para criação, revisão e estudo (Anki, simulado, véspera) de material
  de prova de disciplinas de medicina: ciências básicas e clínica cruzadas em uma mesma
  prova, semiologia, epidemiologia/saúde coletiva e metodologia de pesquisa em saúde.
  Carregada pela skill prova quando o domínio é uma disciplina de curso de medicina. Ative
  sempre que o usuário pedir material de prova, edital ou plano de ensino de uma matéria
  médica, ou sessão Anki/simulado/véspera sobre um desses materiais.
---

# Subskill Prova — Medicina

Contexto específico para material de prova de disciplinas de medicina. As regras gerais
de formato, fluxo, ciclo de automelhora e modos de estudo estão na skill `prova`. Esta
subskill fornece o contexto epistêmico do domínio.

**Diferença em relação a `mecanismo-medicina-basica`/`mecanismo-medicina-clinica`:** uma
mesma prova de curso frequentemente cruza ciências básicas e clínica na mesma avaliação
(ex.: imunologia + farmacologia + fisiopatologia numa única prova de "Agressão e Defesa"),
e cobre disciplinas que as subskills de mecanismo não tratam (epidemiologia/saúde
coletiva, metodologia de pesquisa em saúde, semiologia). Por isso `prova-medicina` não se
divide em básica/clínica como `mecanismo` — o recorte real é a disciplina do curso, não a
camada epistemológica da medicina.

## Subáreas cobertas

- **Ciências básicas e clínica cruzadas** — disciplinas integradoras do curso que combinam
  imunologia, microbiologia, farmacologia e fisiopatologia numa mesma avaliação (ex.:
  agressão e defesa, infectologia integrada).
- **Semiologia** — exame físico geral, propedêutica por sistema (cardiovascular,
  pulmonar), síndromes clínicas, registro do achado.
- **Epidemiologia e saúde coletiva** — vigilância epidemiológica e sanitária, transição
  demográfica e epidemiológica, DANTs, epidemiologia clínica e medicina baseada em
  evidências, métodos diagnósticos (sensibilidade/especificidade, curva ROC, valores
  preditivos).
- **Metodologia de pesquisa em saúde** — seleção de tema, tipos de estudo, análise crítica
  de artigo científico, estrutura de projeto de pesquisa, escrita acadêmica em saúde. Não é
  conteúdo clínico, mas entra no mesmo domínio por pertencer ao mesmo curso e à mesma
  lógica de prova bounded por edital.

## Material existente no projeto

Migrado do projeto Cowork "Estudo para prova" (sistema paralelo que reimplementava o mesmo
propósito desta skill de forma independente — ver `_docs/DEBT.md` para o registro da
fusão):

- `provas/medicina/agressao-defesa.html` — fungos patogênicos e antifúngicos, virologia
  geral e antivirais, resposta imune contra fungos/vírus, vacinas, hemostasia/trombose/
  embolia/infarto/aterosclerose, farmacologia da trombose e dos hipolipemiantes, reparo
  tecidual
- `provas/medicina/epidemiologia.html` — introdução à epidemiologia, doenças transmissíveis,
  vigilância epidemiológica/sanitária, transição demográfica e DANTs, epidemiologia clínica
  e MBE, métodos diagnósticos
- `provas/medicina/pesquisa-em-saude.html` — seleção de temas, tipos de estudo, análise
  crítica de artigo, projeto de pesquisa, escrita acadêmica
- `provas/medicina/semiologia.html` — exame físico geral, propedêutica cardiovascular e
  pulmonar, síndromes pleuropulmonares, registro de achados

**Pendência registrada em `_docs/DEBT.md`:** os 4 arquivos foram migrados preservando o
template original do projeto de origem (não o `template-v2-spec.md` desta base) — alinhar
ao spec canônico (CSS, sidebar, `.term`/tooltips se aplicável) é geração/reescrita de
conteúdo significativa. Recomendação (não requisito): Opus + Esforço Alto tende a dar mais
qualidade nesse tipo de reescrita; a decisão de modelo é sempre do usuário, o trabalho pode
ser feito em Sonnet se for essa a preferência.

## Heurística de fontes

Livros físicos disponíveis (prioridade sobre busca externa quando o material do professor
cobre só o resultado, não o mecanismo):

- **Farmacologia** → Rang & Dale's Pharmacology (10ª ed.)
- **Microbiologia** → Murray Medical Microbiology (10ª ed.)
- **Imunologia** → Abbas Cellular and Molecular Immunology (11ª ed.)
- **Neuroanatomia** → Machado, Neuroanatomia Funcional (4ª ed.)
- **Metodologia científica** → Marconi & Lakatos
- **Outras áreas clínicas e epidemiologia** → WebSearch, priorizando acesso aberto e
  diretrizes/epidemiologia brasileiras (DATASUS, Ministério da Saúde, sociedades médicas)
- **Conector MCP PubMed/PMC** (quando disponível): usar para localizar referências reais em
  vez de citar de memória — cobre farmacologia, microbiologia, imunologia; não cobre
  epidemiologia de vigilância brasileira nem metodologia de pesquisa (esses continuam via
  busca web e diretrizes oficiais)

Tópico sem cobertura no material do professor: buscar nas referências acima e incluir com
`.hist`. Se inacessível, marcar `✗ Falta` no mapa de cobertura e avisar o usuário — nunca
omitir silenciosamente.

## Convenções e armadilhas da área

- **Cruzamento básica/clínica na mesma seção**: quando a prova integra imunologia e
  farmacologia (ex.: resposta imune antifúngica → antifúngicos), seguir a ordem didática
  patologia/mecanismo antes de farmacologia — nunca introduzir a droga antes do processo
  que ela trata.
- **Semiologia**: distinguir achado normal de variante normal de achado patológico em
  cada etapa do exame físico; a técnica de exame (como fazer) é tão importante quanto o
  significado do achado (o que significa).
- **Epidemiologia**: não confundir incidência com prevalência, nem risco relativo com odds
  ratio — armadilha recorrente em prova. Vigilância epidemiológica (doença já instalada) vs.
  sanitária (fatores de risco/ambiente) são sistemas distintos, frequentemente confundidos.
- **Metodologia de pesquisa**: tipos de estudo (observacional vs. experimental, transversal
  vs. longitudinal) têm critérios de desenho que definem o nível de evidência — não é
  taxonomia decorável sem entender o desenho subjacente.

## Cross-links prioritários

Antes de escrever explicação inline, verificar se já existe compêndio ou mecanismo em
`compêndios/` ou `medicina/` (skills compendio/mecanismo) cobrindo o mesmo conceito com
profundidade maior — linkar via `a.cross-link` em vez de reexplicar, já que material de
prova não precisa reconstruir do zero um mecanismo já saturado em outro material do
projeto.

## Checklist adicional para medicina

- [ ] Seções que cruzam básica e clínica seguem a ordem patologia/mecanismo → farmacologia?
- [ ] Semiologia distingue técnica de exame de significado do achado?
- [ ] Epidemiologia não confunde incidência/prevalência nem risco relativo/odds ratio?
- [ ] Cross-links para compêndios/mecanismos existentes verificados antes de reexplicar?
- [ ] Livros físicos disponíveis (Rang & Dale, Murray, Abbas, Machado, Marconi & Lakatos)
  citados nas Leituras recomendadas quando pertinente?
