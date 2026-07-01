---
name: mecanismo-medicina-basica
description: >
  Contexto epistêmico para criação, revisão e estudo (Anki) de compêndios de mecanismo
  das ciências básicas da medicina: imunologia, fisiologia, bioquímica e microbiologia.
  Carregada pela skill mecanismo quando o tema pertence a essas áreas. Ative sempre
  que o usuário quiser aprofundar um mecanismo de imunologia, fisiologia, bioquímica
  ou microbiologia, ou fazer sessão Anki sobre esses compêndios.
---

# Subskill Mecanismo — Medicina Básica

Contexto específico para compêndios de mecanismo das ciências básicas.
As regras gerais de formato, fluxo, estrutura de seções e modo Anki estão na skill `mecanismo`.
Esta subskill fornece o contexto epistêmico da área.

## Subáreas e pastas

- `medicina/imunologia/` — 10 compêndios ativos (imunidade inata, adaptativa, complemento, MHC, anticorpos, linfócitos T, Th1/Th2/Th17, vacinas, citocinas, hipersensibilidade, resposta a patógenos, células, órgãos linfoides, moléculas)
- `medicina/fisiologia/` — hipotensão pós-exercício e barorreflexo
- `medicina/microbiologia/` — virologia geral, micologia médica

## Heurística de fontes

- **Abbas & Lichtman — Imunologia Celular e Molecular**: referência primária para imunologia. Nomenclatura, mecanismos e classificações devem seguir esta obra.
- **Guyton & Hall — Tratado de Fisiologia Médica**: referência primária para fisiologia. Para mecanismos cardiovasculares, renais, neurais.
- **Murray — Bioquímica Ilustrada** e **Lehninger — Princípios de Bioquímica**: referências para vias metabólicas e bioquímica.
- **Murray — Microbiologia Médica** e **Jawetz — Microbiologia Médica**: referências para microbiologia.
- **Artigos seminais**: Janeway (PRRs e imunidade inata), Medzhitov (toll-like receptors), Mosmann & Coffman (Th1/Th2) — citar na nota histórica quando o mecanismo tem paper fundador.
- **Periódicos de revisão**: Nature Reviews Immunology, Annual Review of Physiology, Physiological Reviews — para mecanismos atualizados e controvérsias.
- **Conector MCP PubMed/PMC** (quando disponível na sessão): usar para confirmar/localizar o artigo seminal ou a revisão citada na nota histórica, com PMID/DOI real, em vez de citar de memória. Se não conectado, sinalizar ao usuário e manter a citação apoiada nos livros-texto acima.

## Convenções e armadilhas da área

- **Nomenclatura de citocinas**: IL-1α vs. IL-1β, TNF-α, IFN-γ — sempre com símbolo grego correto.
- **Linfócitos**: CD4+ Th vs. CD8+ Tc vs. Treg vs. Th17 — distinção rigorosa, nunca generalizar como "linfócito T".
- **Complemento**: vias clássica, alternativa e das lectinas têm pontos de convergência mas mecanismos de ativação distintos — não amalgamar.
- **Fisiologia cardiovascular**: barorreflexo e controle autonômico têm latência diferente do controle hormonal (RAAS) — distinguir temporalidade.
- **Microbiologia**: distinguir claramente virulência de patogenicidade; mecanismos de resistência antifúngica diferem dos bacterianos.

## Cross-links prioritários entre compêndios existentes

Antes de escrever explicação inline, verificar se já existe compêndio:
- Ativação de linfócitos T → `medicina/imunologia/linfocitos-t-diferenciacao.html`
- Sistema complemento → `medicina/imunologia/sistema-complemento.html`
- Anticorpos e imunidade humoral → `medicina/imunologia/anticorpos-imunidade-humoral.html`
- MHC e apresentação antigênica → `medicina/imunologia/mhc-apresentacao-antigenica.html`
- Hipersensibilidade → `medicina/imunologia/hipersensibilidade.html`
- Citocinas → `medicina/imunologia/citocinas-visao-integradora.html`
- Barorreflexo → `medicina/fisiologia/hipotensao-pos-exercicio-barorreflexo.html`

## Checklist adicional para medicina básica

- [ ] Nomenclatura molecular padronizada (siglas de citocinas, receptores, células)?
- [ ] Mecanismo celular/molecular saturado antes de avançar para implicações clínicas?
- [ ] Cross-links para compêndios de imunologia existentes verificados?
- [ ] Nota histórica presente para mecanismos com paper fundador relevante?
- [ ] Limites do modelo (.kbox) presentes após frameworks centrais?
