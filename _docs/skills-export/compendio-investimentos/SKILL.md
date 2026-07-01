---
name: compendio-investimentos
description: >
  Contexto epistêmico para criação e revisão de compêndios de área de investimentos e
  finanças: renda fixa, renda variável, fundos, derivativos, economia aplicada,
  finanças comportamentais. Carregada pela skill compendio quando o tema pertence a
  essa área. Ative sempre que o usuário pedir compêndio de área de investimentos,
  finanças pessoais, mercado financeiro ou economia aplicada a investimentos.
---

# Subskill Compêndio de Área — Investimentos

Contexto específico para mapas de campo de investimentos e finanças.
As regras gerais de formato, fluxo e verificação estão na skill `compendio` (compêndio de área).
Esta subskill fornece o contexto epistêmico da área.

## Subáreas cobertas

- **Renda fixa** — Tesouro Direto, CDB, LCI/LCA, debêntures, precificação de títulos
- **Renda variável** — ações, FIIs, ETFs, análise fundamentalista e técnica
- **Fundos** — estrutura, tipos, taxas, benchmark, gestão ativa vs. passiva
- **Derivativos** — opções, futuros, hedge, alavancagem
- **Economia aplicada** — juros reais, inflação, câmbio, política monetária, ciclos econômicos
- **Finanças comportamentais** — vieses cognitivos, heurísticas, decisão sob incerteza

## Material existente no projeto

- `compêndios/investimentos/fundamentos-investimentos.html` — mapa geral já criado
  - Cobre: risco/retorno, diversificação, CAPM, Fama-French, eficiência de mercado, finanças comportamentais, renda fixa vs. variável, método Bazin
  - Dívida técnica pendente: cross-links para inflação, juros reais, política monetária (ver `_docs/DEBT.md`)

## Heurística de fontes

Hierarquia epistêmica para investimentos:

- **Papers empíricos seminais** (peso máximo para teoria): Markowitz (1952) — portfólio; Fama (1970) — eficiência de mercado; Fama & French (1992/1993) — fatores; Shiller — CAPE e avaliação. São âncoras teóricas inegociáveis.
- **Relatórios de organismos internacionais**: BIS, FMI, Banco Mundial — para dados macroeconômicos e tendências estruturais.
- **Banco Central do Brasil**: Relatório de Inflação, Relatório de Estabilidade Financeira, notas do COPOM — para contexto brasileiro.
- **Livros-texto universitários**: Brealey, Myers & Allen (Finanças Corporativas); Bodie, Kane & Marcus (Investimentos); Damodaran (Avaliação). Para fundamentos e metodologia.
- **Fontes de dados**: B3, Tesouro Nacional, CVM, IBGE — para dados primários brasileiros.
- **Evitar**: análises de influenciadores sem embasamento acadêmico, previsões de curto prazo sem fundamento, fontes com conflito de interesse não declarado.

## Convenções da área

- Siglas: por extenso na primeira ocorrência — "Índice Nacional de Preços ao Consumidor Amplo (IPCA)", "Taxa Selic Over (Selic)".
- Taxas: sempre indicar se nominal ou real, se ao ano ou ao mês.
- Contexto brasileiro obrigatório: o mercado brasileiro tem especificidades relevantes — tributação (IOF, IR sobre ganhos), regulação (CVM, BACEN), instrumentos específicos (LCI/LCA isentos, Tesouro IPCA+), concentração em renda fixa por histórico de juros altos.
- Controvérsias ativas: eficiência de mercado no Brasil, validade do CAPM em mercados emergentes, gestão ativa vs. passiva em contexto brasileiro, papel do Fator Valor em períodos recentes.

## Checklist adicional para investimentos

- [ ] Distinção entre teoria e prática brasileira feita explicitamente?
- [ ] Contexto de juros e inflação brasileiros incluído quando relevante?
- [ ] Fontes primárias (papers, relatórios BCB) referenciadas para afirmações teóricas?
- [ ] Conflitos de interesse de fontes sinalizados quando pertinente?
- [ ] Dívida técnica de cross-links (DEBT.md) verificada antes de fechar?
