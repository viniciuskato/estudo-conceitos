---
name: mecanismo-medicina-clinica
description: >
  Contexto epistêmico para criação, revisão e estudo (Anki) de compêndios de mecanismo
  de medicina clínica: farmacologia, fisiopatologia, semiologia e clínica médica.
  Subskill-folha carregada por `compendio-medicina-clinica` quando o pedido é sobre um
  mecanismo específico dessas áreas (não a área inteira) — não mais carregada por uma
  skill `mecanismo` de entrada direta. Ative sempre que o usuário quiser aprofundar um
  mecanismo de farmacologia, fisiopatologia ou clínica médica, ou fazer sessão Anki sobre
  esses compêndios.
---

# Subskill Mecanismo — Medicina Clínica

Contexto específico para compêndios de mecanismo das disciplinas clínicas.
As regras gerais de formato, fluxo, estrutura de seções e modo Anki estão em `mecanismo/SKILL.md`
(arquivo de referência compartilhado, não mais skill de entrada direta — ver reenquadramento lá).
Esta subskill fornece o contexto epistêmico da área.

## Subáreas e pastas

- `compêndios/medicina/mecanismos/farmacologia/` — 3 compêndios ativos:
  - `hipertensao_sraa_anti-hipertensivos.html` — SRAA, IECA, BRA, BCC, diuréticos, betabloqueadores
  - `antiagregantes-anticoagulantes-tromboliticos.html` — AAS, clopidogrel, heparina, warfarina, NOACs, tPA
  - `antifungicos.html` — azóis, polienos, equinocandinas, alilaminas
- `compêndios/medicina/mecanismos/fisiopatologia/` — 3 compêndios ativos:
  - `trombose-e-hemostasia.html`
  - `doencas-circulatorias.html`
  - `choque-circulatorio/choque-circulatorio.html`
- `compêndios/medicina/mecanismos/semiologia/` — 1 compêndio ativo:
  - `sindromes-bronco-pleuro-pulmonares.html` — IPPA torácico, síndromes brônquicas (asma, DPOC, bronquiectasias), parenquimatosas (condensação, atelectasia, enfisema, congestão passiva, cavitação), pleurais (derrame, pneumotórax) e diafragmáticas/mediastínicas (SVCS)

## Relação com medicina básica

Compêndios clínicos dependem de mecanismos básicos já cobertos. Antes de escrever
explicação inline sobre imunologia, fisiologia ou bioquímica, verificar se existe
compêndio em `compêndios/medicina/mecanismos/imunologia/` ou
`compêndios/medicina/mecanismos/fisiologia/` e linkar.

Exemplos de dependências frequentes:
- Farmacologia cardiovascular → fisiologia do barorreflexo, SRAA
- Anticoagulantes/antiagregantes → hemostasia e trombose
- Antifúngicos → mecanismos de virulência fúngica (micologia)

## Heurística de fontes

- **Goodman & Gilman — As Bases Farmacológicas da Terapêutica**: referência primária para farmacologia. Mecanismo de ação, farmacocinética e interações devem seguir esta obra.
- **Robbins — Patologia**: referência para fisiopatologia e mecanismos de doença.
- **Guidelines de sociedades** (peso máximo para conduta): AHA/ACC, ESC (European Society of Cardiology), WHO, Ministério da Saúde / CONITEC — para recomendações terapêuticas.
- **Trials clínicos de referência**: HOPE (ramipril), ONTARGET (telmisartan), PLATO (ticagrelor), ISIS-2 (AAS) — citar quando o mecanismo tem evidência clínica seminal.
- **RENAME** (Relação Nacional de Medicamentos Essenciais): verificar disponibilidade no SUS para fármacos com relevância para o contexto brasileiro.
- **Conector MCP PubMed/PMC** (quando disponível na sessão): usar para localizar o trial clínico real (PMID/DOI) por trás de uma citação de evidência, em vez de citar de memória. Não cobre guidelines de sociedades nem RENAME. Se não conectado, sinalizar ao usuário e seguir a hierarquia de fontes normalmente.

## Convenções e armadilhas da área

- **Farmacologia**: sempre distinguir farmacocinética (o que o organismo faz com o fármaco: absorção, distribuição, metabolismo, excreção) de farmacodinâmica (o que o fármaco faz no organismo: mecanismo de ação, curva dose-efeito).
- **DCI obrigatória**: usar Denominação Comum Internacional — "enalapril", não "Vasotec". Nome comercial entre parênteses na primeira ocorrência se relevante.
- **Interações medicamentosas**: ao descrever um fármaco, mencionar as interações clinicamente relevantes — não apenas o mecanismo isolado.
- **Fisiopatologia**: distinguir causa (etiologia) de mecanismo (fisiopatologia) de manifestação (clínica). Os três níveis são diferentes e devem ser articulados separadamente.
- **Choque**: os 4 tipos (hipovolêmico, distributivo, cardiogênico, obstrutivo) têm mecanismos distintos mas manifestações sobrepostas — manter clareza entre eles.
- **Grau de evidência**: ao mencionar conduta, indicar se é recomendação Classe I/IIa/IIb ou equivalente da diretriz correspondente.

## Cross-links prioritários entre compêndios existentes

- Hemostasia e trombose → `compêndios/medicina/mecanismos/fisiopatologia/trombose-e-hemostasia.html`
- Doenças circulatórias → `compêndios/medicina/mecanismos/fisiopatologia/doencas-circulatorias.html`
- Choque circulatório → `compêndios/medicina/mecanismos/fisiopatologia/choque-circulatorio/choque-circulatorio.html`
- Anti-hipertensivos/SRAA → `compêndios/medicina/mecanismos/farmacologia/hipertensao_sraa_anti-hipertensivos.html`
- Antiagregantes/anticoagulantes → `compêndios/medicina/mecanismos/farmacologia/antiagregantes-anticoagulantes-tromboliticos.html`
- Antifúngicos → `compêndios/medicina/mecanismos/farmacologia/antifungicos.html`
- Síndromes bronco-pleuro-pulmonares (semiologia respiratória) → `compêndios/medicina/mecanismos/semiologia/sindromes-bronco-pleuro-pulmonares.html`

## Checklist adicional para medicina clínica

- [ ] Farmacocinética e farmacodinâmica distinguidas explicitamente (para farmacologia)?
- [ ] DCI usada como nomenclatura primária?
- [ ] Interações medicamentosas clinicamente relevantes mencionadas?
- [ ] Grau de evidência indicado para recomendações terapêuticas?
- [ ] Cross-links para compêndios de básica correspondentes inseridos?
- [ ] Contexto brasileiro (RENAME, epidemiologia, SUS) incluído quando relevante?
