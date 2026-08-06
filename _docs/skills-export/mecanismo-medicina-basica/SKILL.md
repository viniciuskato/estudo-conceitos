---
name: mecanismo-medicina-basica
description: >
  Contexto epistêmico para criação, revisão e estudo (Anki) de compêndios de mecanismo
  das ciências básicas da medicina: imunologia, fisiologia, bioquímica e microbiologia.
  Subskill-folha carregada por `compendio-medicina-basica` quando o pedido é sobre um
  mecanismo específico dessas áreas (não a área inteira) — não mais carregada por uma
  skill `mecanismo` de entrada direta. Ative sempre que o usuário quiser aprofundar um
  mecanismo de imunologia, fisiologia, bioquímica ou microbiologia, ou fazer sessão Anki
  sobre esses compêndios.
---

# Subskill Mecanismo — Medicina Básica

Contexto específico para compêndios de mecanismo das ciências básicas.
As regras gerais de formato, fluxo, estrutura de seções e modo Anki estão em `mecanismo/SKILL.md`
(arquivo de referência compartilhado, não mais skill de entrada direta — ver reenquadramento lá).
Esta subskill fornece o contexto epistêmico da área.

## Subáreas e pastas

- `compêndios/medicina/mecanismos/imunologia/` — 13 compêndios ativos (órgãos e tecidos linfoides, células, moléculas, imunidade inata, sistema complemento, MHC/apresentação antigênica, anticorpos/imunidade humoral, linfócitos T/diferenciação, resposta a patógenos, hipersensibilidade, vacinas/imunidade protetora, citocinas, Th1/Th2/Th17)
- `compêndios/medicina/mecanismos/fisiologia/` — 2 compêndios ativos: ciclo cardíaco (potenciais de ação, ciclo mecânico, Frank-Starling, regulação); hipotensão pós-exercício e barorreflexo
- `compêndios/medicina/mecanismos/microbiologia/` — virologia geral, micologia médica

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
- Ativação de linfócitos T → `compêndios/medicina/mecanismos/imunologia/linfocitos-t-diferenciacao.html`
- Sistema complemento → `compêndios/medicina/mecanismos/imunologia/sistema-complemento.html`
- Anticorpos e imunidade humoral → `compêndios/medicina/mecanismos/imunologia/anticorpos-imunidade-humoral.html`
- MHC e apresentação antigênica → `compêndios/medicina/mecanismos/imunologia/mhc-apresentacao-antigenica.html`
- Hipersensibilidade → `compêndios/medicina/mecanismos/imunologia/hipersensibilidade.html`
- Citocinas → `compêndios/medicina/mecanismos/imunologia/citocinas-visao-integradora.html`
- Barorreflexo → `compêndios/medicina/mecanismos/fisiologia/hipotensao-pos-exercicio-barorreflexo.html`
- Ciclo cardíaco, potenciais de ação, Frank-Starling → `compêndios/medicina/mecanismos/fisiologia/ciclo-cardiaco.html`

## Checklist adicional para medicina básica

- [ ] Nomenclatura molecular padronizada (siglas de citocinas, receptores, células)?
- [ ] Mecanismo celular/molecular saturado antes de avançar para implicações clínicas?
- [ ] Cross-links para compêndios de imunologia existentes verificados?
- [ ] Nota histórica presente para mecanismos com paper fundador relevante?
- [ ] Limites do modelo (.kbox) presentes após frameworks centrais?
