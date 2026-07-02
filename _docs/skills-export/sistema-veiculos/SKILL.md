---
name: sistema-veiculos
description: >
  Contexto epistêmico para criação e revisão de compêndios de sistema de veículos
  automotivos: chassi, motorização (combustão, híbrida, elétrica), transmissão,
  suspensão, freios, direção, sistema elétrico/eletrônico, carroceria e segurança.
  Carregada pela skill sistema quando o domínio é um veículo automotivo. Ative sempre
  que o usuário pedir compêndio de sistema de carro, automóvel, motor, chassi,
  transmissão ou qualquer subsistema automotivo.
---

# Subskill Sistema — Veículos Automotivos

Contexto específico para compêndios de sistema de veículos automotivos.
As regras gerais de formato, fluxo e verificação estão na skill `sistema`.
Esta subskill fornece o contexto epistêmico do domínio.

## Subsistemas cobertos

- **Chassi e estrutura** — chassi de longarinas, monobloco (unibody), gaiola de
  segurança, materiais estruturais (aço, alumínio, fibra de carbono)
- **Motorização** — motor de combustão interna (ciclo Otto, ciclo Diesel), motor
  elétrico, sistemas híbridos (série, paralelo, série-paralelo)
- **Transmissão** — manual, automática (planetária, CVT, dupla embreagem), tração
  (dianteira, traseira, integral)
- **Suspensão** — geometria (McPherson, duplo A, multilink), molas, amortecedores,
  suspensão ativa
- **Freios** — a disco, a tambor, ABS, EBD, freio regenerativo (veículos
  elétricos/híbridos)
- **Direção** — sistemas mecânico, hidráulico, elétrico (EPS), geometria de
  esterçamento (Ackermann)
- **Sistema elétrico/eletrônico** — bateria, alternador/gerador, ECU, barramento CAN,
  sensores e atuadores
- **Carroceria e aerodinâmica** — coeficiente de arrasto, downforce, materiais de
  carroceria
- **Segurança** — airbags, cintos pré-tensionados, ADAS (frenagem autônoma de
  emergência, controle de estabilidade)

## Material existente no projeto

Nenhum compêndio de sistema de veículos criado até o momento.

## Heurística de fontes

Hierarquia epistêmica para engenharia automotiva:

- **Manuais técnicos de referência**: *Bosch Automotive Handbook* — referência-padrão
  da indústria, cobre praticamente todos os subsistemas; *Automotive Engineering
  Fundamentals* (Stone & Ball) — fundamentos com formalismo.
- **Normas técnicas**: SAE International (Society of Automotive Engineers) — papers e
  normas técnicas (J-standards); ISO para normas internacionais de segurança e emissões.
- **Órgãos regulatórios**: CONTRAN e DENATRAN para normas brasileiras (categorização,
  inspeção, emissões PROCONVE); NHTSA (EUA) e Euro NCAP/Latin NCAP para testes de
  segurança e colisão.
- **Manuais de serviço de fabricante**: para especificações reais de sistemas
  específicos — usar como exemplo concreto, não como fonte teórica geral.
- **Divulgação técnica de qualidade**: canais e publicações que desenvolvem o mecanismo
  real (não apenas descrevem o produto) — usar como complemento didático, nunca como
  única fonte.
- **Evitar**: material de marketing de fabricante travestido de explicação técnica,
  fóruns de entusiastas sem verificação cruzada, comparações de desempenho sem
  metodologia declarada.

## Idioma

Literatura-fonte predominantemente anglófona (Bosch Handbook, SAE, NHTSA) → material em
inglês (`lang="en"`), com tooltips `.term`/`.term-rich` (tradução PT) e sidebar bilíngue
`.sl-pt`, seguindo a regra de idioma do `template-v2-spec.md`. Seções ancoradas em
normas brasileiras (CONTRAN, PROCONVE, INMETRO) entram como subseção em português
dentro do arquivo em inglês — mesmo padrão usado em medicina para contexto brasileiro
dentro de compêndio em inglês. Confirmar com o usuário antes de gerar se houver dúvida
sobre o recorte de fontes do material específico.

## Convenções da área

- Siglas por extenso na primeira ocorrência: "Electronic Control Unit (ECU)",
  "Continuously Variable Transmission (CVT)".
- Sempre que um subsistema tiver variantes concorrentes (ex.: McPherson vs. duplo A;
  CVT vs. dupla embreagem), apresentar o trade-off de engenharia — não só nomear as
  opções.
- Controvérsias ativas típicas da área: motor a combustão vs. elétrico (transição
  energética, densidade energética, infraestrutura), direção autônoma (níveis SAE 0–5,
  responsabilidade legal, confiabilidade em condições adversas), eletrificação vs. custo
  e autonomia no mercado brasileiro.

## Checklist adicional para veículos

- [ ] Trade-offs de engenharia explicitados para subsistemas com variantes concorrentes?
- [ ] Normas brasileiras (CONTRAN/PROCONVE) tratadas como subseção, não substituindo a
      fonte técnica internacional predominante?
- [ ] Idioma confirmado com o usuário antes da geração, não assumido por inércia do
      acervo PT existente?
- [ ] Controvérsias ativas (combustão vs. elétrico, autonomia) representadas sem
      resolução artificial?
