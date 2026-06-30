---
name: mecanismo-medicina-clinica
description: >
  Contexto epistêmico para criação, revisão e estudo (Anki) de compêndios de mecanismo
  de medicina clínica: farmacologia, fisiopatologia, semiologia e clínica médica.
  Carregada pela skill mecanismo quando o tema pertence a essas áreas. Ative sempre
  que o usuário quiser aprofundar um mecanismo de farmacologia, fisiopatologia ou
  clínica médica, ou fazer sessão Anki sobre esses compêndios.
---

# Subskill Mecanismo — Medicina Clínica

Contexto específico para compêndios de mecanismo das disciplinas clínicas.
As regras gerais de formato, fluxo, estrutura de seções e modo Anki estão na skill `mecanismo`.
Esta subskill fornece o contexto epistêmico da área.

## Subáreas e pastas

- `medicina/farmacologia/` — 3 compêndios ativos:
  - `hipertensao_sraa_anti-hipertensivos.html` — SRAA, IECA, BRA, BCC, diuréticos, betabloqueadores
  - `antiagregantes-anticoagulantes-tromboliticos.html` — AAS, clopidogrel, heparina, warfarina, NOACs, tPA
  - `antifungicos.html` — azóis, polienos, equinocandinas, alilaminas
- `medicina/fisiopatologia/` — 3 compêndios ativos:
  - `trombose-e-hemostasia.html`
  - `doencas-circulatorias.html`
  - `choque-circulatorio/choque-circulatorio.html`

## Relação com medicina básica

Compêndios clínicos dependem de mecanismos básicos já cobertos. Antes de escrever
explicação inline sobre imunologia, fisiologia ou bioquímica, verificar se existe
compêndio em `medicina/imunologia/` ou `medicina/fisiologia/` e linkar.

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

## Convenções e armadilhas da área

- **Farmacologia**: sempre distinguir farmacocinética (o que o organismo faz com o fármaco: absorção, distribuição, metabolismo, excreção) de farmacodinâmica (o que o fármaco faz no organismo: mecanismo de ação, curva dose-efeito).
- **DCI obrigatória**: usar Denominação Comum Internacional — "enalapril", não "Vasotec". Nome comercial entre parênteses na primeira ocorrência se relevante.
- **Interações medicamentosas**: ao descrever um fármaco, mencionar as interações clinicamente relevantes — não apenas o mecanismo isolado.
- **Fisiopatologia**: distinguir causa (etiologia) de mecanismo (fisiopatologia) de manifestação (clínica). Os três níveis são diferentes e devem ser articulados separadamente.
- **Choque**: os 4 tipos (hipovolêmico, distributivo, cardiogênico, obstrutivo) têm mecanismos distintos mas manifestações sobrepostas — manter clareza entre eles.
- **Grau de evidência**: ao mencionar conduta, indicar se é recomendação Classe I/IIa/IIb ou equivalente da diretriz correspondente.

## Cross-links prioritários entre compêndios existentes

- Hemostasia e trombose → `medicina/fisiopatologia/trombose-e-hemostasia.html`
- Doenças circulatórias → `medicina/fisiopatologia/doencas-circulatorias.html`
- Choque circulatório → `medicina/fisiopatologia/choque-circulatorio/choque-circulatorio.html`
- Anti-hipertensivos/SRAA → `medicina/farmacologia/hipertensao_sraa_anti-hipertensivos.html`
- Antiagregantes/anticoagulantes → `medicina/farmacologia/antiagregantes-anticoagulantes-tromboliticos.html`
- Antifúngicos → `medicina/farmacologia/antifungicos.html`

## Checklist adicional para medicina clínica

- [ ] Farmacocinética e farmacodinâmica distinguidas explicitamente (para farmacologia)?
- [ ] DCI usada como nomenclatura primária?
- [ ] Interações medicamentosas clinicamente relevantes mencionadas?
- [ ] Grau de evidência indicado para recomendações terapêuticas?
- [ ] Cross-links para compêndios de básica correspondentes inseridos?
- [ ] Contexto brasileiro (RENAME, epidemiologia, SUS) incluído quando relevante?
