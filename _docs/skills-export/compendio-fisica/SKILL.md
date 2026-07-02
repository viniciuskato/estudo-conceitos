---
name: compendio-fisica
description: >
  Contexto epistêmico para criação e revisão de compêndios de área de física:
  mecânica clássica, termodinâmica, eletromagnetismo, óptica e ondas, mecânica
  quântica, relatividade, física de partículas, matéria condensada, astrofísica
  e cosmologia. Carregada pela skill compendio quando o tema pertence a essa
  área. Ative sempre que o usuário pedir compêndio de área de física, mecânica,
  termodinâmica, eletromagnetismo, óptica, física quântica, relatividade ou
  cosmologia.
---

# Subskill Compêndio de Área — Física

Contexto específico para mapas de campo de física.
As regras gerais de formato, fluxo e verificação estão na skill `compendio` (compêndio de área).
Esta subskill fornece o contexto epistêmico da área.

## Subáreas cobertas

- **Mecânica clássica** — cinemática, dinâmica newtoniana, formulações lagrangiana e hamiltoniana, mecânica celeste
- **Termodinâmica e mecânica estatística** — leis da termodinâmica, entropia, ensembles estatísticos, transições de fase
- **Eletromagnetismo** — eletrostática, magnetismo, indução, equações de Maxwell, ondas eletromagnéticas
- **Óptica e ondas** — óptica geométrica e ondulatória, interferência, difração, polarização
- **Mecânica quântica** — princípios, equação de Schrödinger, spin, física atômica e molecular, interpretações
- **Relatividade** — restrita (espaço-tempo, transformações de Lorentz) e geral (curvatura, gravitação)
- **Física de partículas e teoria quântica de campos** — modelo padrão, interações fundamentais
- **Matéria condensada** — estrutura cristalina, semicondutores, supercondutividade, transições de fase
- **Astrofísica e cosmologia** — estrutura e evolução estelar, big bang, matéria e energia escura

## Material existente no projeto

Nenhum compêndio de física criado até o momento.

## Heurística de fontes

Hierarquia epistêmica para física — o formalismo matemático é parte inseparável da fonte, não um adendo:

- **Artigos fundadores** (peso máximo, sempre situar o resultado no artigo original): Newton (*Principia*, 1687); Maxwell (1865, teoria dinâmica do campo eletromagnético); Einstein (1905 — efeito fotoelétrico, relatividade restrita, movimento browniano; 1915 — relatividade geral); Planck (1900, quantização da radiação de corpo negro); Schrödinger (1926) e Heisenberg (1925) — formulações da mecânica quântica.
- **Livros-texto canônicos**: Halliday, Resnick & Walker (*Fundamentals of Physics*) — introdutório; *The Feynman Lectures on Physics* — desenvolvimento conceitual raro, bom para intuição física; Griffiths (*Introduction to Electrodynamics*, *Introduction to Quantum Mechanics*) — graduação; Kittel & Kroemer (*Thermal Physics*); Sakurai (*Modern Quantum Mechanics*) e Jackson (*Classical Electrodynamics*) — pós-graduação; Landau & Lifshitz (*Course of Theoretical Physics*) — referência avançada de rigor máximo.
- **Fontes de acesso aberto**: arXiv.org (seções physics, quant-ph, gr-qc, hep-th) para pesquisa atual; Physical Review (APS) — padrão-ouro de revisão por pares; INSPIRE-HEP para física de partículas e altas energias.
- **Dados e constantes de referência**: CODATA para constantes físicas fundamentais; NIST para dados de referência; observatórios e experimentos (LIGO, telescópio espacial Planck, IceCube) para dados observacionais recentes em astrofísica e física de partículas.
- **Evitar**: divulgação sem base matemática (perde precisão nos limites de validade de cada teoria), alegações de "teoria de tudo" sem revisão por pares, extrapolação de mecânica quântica para misticismo ou autoajuda ("quantum woo").

## Convenções da área

- Apresentar sempre a formulação matemática central junto da descrição conceitual — física exige o formalismo, não só a intuição verbal. Notação vetorial em negrito, unidades SI explicitadas.
- Ordens de grandeza situadas com exemplos concretos de escala (ex.: comparar energia de ligação atômica com energia de ligação nuclear ao introduzir escalas de energia).
- Quando um fenômeno tem tratamento tanto clássico quanto quântico/relativístico, explicitar a relação entre os dois regimes (ex.: mecânica newtoniana como limite de baixa velocidade da relatividade restrita; mecânica clássica como limite de número quântico grande).
- Controvérsias ativas típicas da área: interpretações da mecânica quântica (Copenhague vs. Muitos-Mundos vs. Bohmiana vs. QBism — o que a função de onda representa), física além do Modelo Padrão (supersimetria vs. teoria de cordas vs. gravidade quântica em loop), a seta termodinâmica do tempo (reversibilidade microscópica vs. irreversibilidade macroscópica — problema de Boltzmann), matéria escura vs. modificações da gravidade (MOND) para as curvas de rotação galácticas, determinismo vs. indeterminismo genuíno na aleatoriedade quântica (variáveis ocultas).

## Checklist adicional para física

- [ ] Formalismo matemático central apresentado junto da descrição conceitual, não apenas em prosa?
- [ ] Unidades e ordens de grandeza explicitadas com exemplos concretos de escala?
- [ ] Relação entre regime clássico e quântico/relativístico esclarecida quando o fenômeno admite os dois tratamentos?
- [ ] Controvérsias representadas com as posições reais em disputa, sem resolução artificial?
- [ ] Fontes incluem tanto textos canônicos (Feynman, Griffiths, Landau) quanto literatura primária (arXiv, Physical Review)?
