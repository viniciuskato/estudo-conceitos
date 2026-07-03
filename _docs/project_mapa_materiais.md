# Mapa de Materiais — Mecanismo (medicina/)

Registro de conceitos centrais cobertos por compêndio de MECANISMO (skill `mecanismo`, pasta `medicina/`).
Consultar antes de escrever explicação inline — linkar via `a.cross-link` em vez de reexplicar.

Escopo deste arquivo: apenas `medicina/` (mecanismo). Compêndios de ÁREA (skill `compendio`, pasta `compêndios/`)
têm mapa próprio em `compêndios/compendio_mapa.txt`. Compêndios de SISTEMA (skill `sistema`) têm mapa próprio
em `sistemas/sistema_mapa.txt`. Reescrito em 2026-07-03 — a versão anterior misturava as três skills e
referenciava caminhos que não existem mais (`ia/fundamentos/*`, `ferramentas/*`, `investimentos/` na raiz);
ver `_docs/DEBT.md` para o histórico da correção.

---

## Imunologia (`medicina/imunologia/`) — 13 compêndios ativos

- `orgaos-linfoides.html` — Órgãos e Tecidos Linfoides: primários (medula óssea, timo) vs. secundários (linfonodo, baço, MALT); arquitetura e tráfego linfocitário
- `celulas-sistema-imune.html` — Células do Sistema Imune: linhagens mieloide/linfoide, fenótipos e funções
- `moleculas-sistema-imune.html` — Moléculas do Sistema Imune: receptores, moléculas de adesão, componentes de sinalização
- `imunidade-inata.html` — Imunidade Inata: PRRs, TLRs, barreiras físicas/químicas, resposta inflamatória inicial
- `sistema-complemento.html` — Sistema Complemento: vias clássica, alternativa e das lectinas; convergência em C3
- `mhc-apresentacao-antigenica.html` — MHC e Apresentação Antigênica: MHC I vs. II, processamento antigênico, restrição de MHC
- `anticorpos-imunidade-humoral.html` — Anticorpos e Imunidade Humoral: estrutura de imunoglobulina, classes, ativação de linfócitos B
- `linfocitos-t-diferenciacao.html` — Linfócitos T: Diferenciação e Funções: CD4+ Th vs. CD8+ Tc vs. Treg, seleção tímica
- `resposta-a-patogenos.html` — Resposta Imune a Patógenos: integração inata+adaptativa contra vírus, bactérias, fungos, parasitas
- `hipersensibilidade.html` — Hipersensibilidade: tipos I–IV (Gell e Coombs)
- `vacinas-imunidade-protetora.html` — Vacinas e Imunidade Protetora: tipos de vacina, memória imunológica, adjuvantes
- `citocinas-visao-integradora.html` — Citocinas — Visão Integradora: JAK-STAT, TNF/IL-6/IFN, redes de sinalização
- `respostas-th1-th2-th17.html` — Respostas Th1, Th2 e Th17: polarização de linfócitos T auxiliares, doenças associadas

## Farmacologia (`medicina/farmacologia/`) — 3 compêndios ativos

- `hipertensao_sraa_anti-hipertensivos.html` — Hipertensão, SRAA e Anti-hipertensivos: definição/classificação de HAS, fisiopatologia, cascata molecular do SRAA, IECA, BRA, diuréticos, betabloqueadores, BCC, lógica de escolha terapêutica
- `antiagregantes-anticoagulantes-tromboliticos.html` — Antiagregantes, Anticoagulantes e Trombolíticos: AAS, inibidores P2Y12/GpIIb-IIIa, heparina (HNF/HBPM), varfarina, NOACs, reversão/antídotos, alteplase/tenecteplase
- `antifungicos.html` — Antifúngicos: polienos, azóis, equinocandinas, resistência antifúngica, contexto brasileiro

## Fisiologia (`medicina/fisiologia/`) — 2 compêndios ativos

- `ciclo-cardiaco.html` — Ciclo Cardíaco: potencial de ação ventricular e do nó SA, sistema de condução, acoplamento excitação-contração (CICR), ciclo mecânico (6 fases), pressões/volumes (VDF, VSF, VS, FE, loop PV), ESPVR/E_max, sons cardíacos, débito cardíaco, Frank-Starling, regulação autonômica/humoral, pressão de enchimento sistêmico
- `hipotensao-pos-exercicio-barorreflexo.html` — Hipotensão Pós-Exercício e Controle Barorreflexo: débito cardíaco no exercício, redistribuição de fluxo, vasodilatação cutânea/termorregulação, HPE, arco barorreflexo completo, reflexo de imersão

## Fisiopatologia (`medicina/fisiopatologia/`) — 3 compêndios ativos

- `trombose-e-hemostasia.html` — Trombose e Hemostasia: 4 etapas da hemostasia, endotélio, anticoagulação fisiológica, cascata de coagulação, trombina, fibrinólise, trombose arterial vs. venosa, tríade de Virchow, trombofilias hereditárias, SAF, CID, TEP
- `doencas-circulatorias.html` — Patologia das Doenças Circulatórias: congestão (hiperemia passiva), edema, hemostasia, trombose, embolia, aterosclerose, infarto
- `choque-circulatorio/choque-circulatorio.html` — Choque Circulatório: os 4 tipos (hipovolêmico, distributivo, cardiogênico, obstrutivo) — mecanismos distintos, manifestações sobrepostas; metabolismo anaeróbico e lactato como marcador de hipoperfusão

## Microbiologia (`medicina/microbiologia/`) — 2 compêndios ativos

- `virologia-geral.html` — Virologia Geral: estrutura viral, Classificação de Baltimore, ciclo replicativo, patogênese viral, antivirais
- `micologia-medica.html` — Micologia Médica: biologia e parede celular fúngica, dimorfismo térmico, patogênese, micoses superficiais/subcutâneas/sistêmicas endêmicas/oportunistas, diagnóstico laboratorial

---

## Cross-links prioritários entre subáreas

Dependências frequentes entre compêndios clínicos e básicos — linkar em vez de reexplicar:
- Farmacologia cardiovascular (SRAA, anti-hipertensivos) → `fisiologia/ciclo-cardiaco.html` (débito cardíaco, regulação) e `fisiologia/hipotensao-pos-exercicio-barorreflexo.html` (barorreflexo)
- Antiagregantes/anticoagulantes → `fisiopatologia/trombose-e-hemostasia.html`
- Antifúngicos → `microbiologia/micologia-medica.html` (mecanismos de virulência fúngica)
- Choque circulatório → `fisiopatologia/trombose-e-hemostasia.html` (CID) e `imunologia/` (resposta inflamatória sistêmica)
- Fisiopatologia de doença circulatória → `imunologia/imunidade-inata.html` (inflamação) quando o mecanismo depende de resposta imune
