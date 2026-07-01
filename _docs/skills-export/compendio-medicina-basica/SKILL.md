---
name: compendio-medicina-basica
description: >
  Contexto epistêmico para criação e revisão de compêndios de área de medicina básica:
  imunologia, fisiologia, bioquímica, microbiologia e anatomia. Carregada pela skill
  compendio quando o tema pertence a essas áreas. Ative sempre que o usuário pedir compêndio
  de área de imunologia, fisiologia, microbiologia, bioquímica ou anatomia.
---

# Subskill Compêndio de Área — Medicina Básica

Contexto específico para mapas de campo das ciências básicas da medicina.
As regras gerais de formato, fluxo e verificação estão na skill `compendio` (compêndio de área).
Esta subskill fornece o contexto epistêmico da área.

## Subáreas cobertas

- **Imunologia** — sistema imune inato e adaptativo, células, moléculas, órgãos linfoides
- **Fisiologia** — funcionamento de sistemas orgânicos (cardiovascular, renal, respiratório, nervoso...)
- **Bioquímica** — metabolismo, enzimas, vias metabólicas, biomoléculas
- **Microbiologia** — virologia, bacteriologia, micologia, parasitologia
- **Anatomia** — estrutura macroscópica, topografia, relações entre estruturas

## Pastas de mecanismos correspondentes

Quando o mapa referenciar um mecanismo já existente, procurar em:
- `medicina/imunologia/` — 10+ compêndios de imunologia
- `medicina/fisiologia/` — compêndios de fisiologia
- `medicina/microbiologia/` — virologia, micologia

## Heurística de fontes

Hierarquia epistêmica para medicina básica:

- **Livros-texto canônicos** (peso máximo): Abbas & Lichtman (Imunologia), Guyton & Hall (Fisiologia), Murray (Bioquímica), Murray (Microbiologia), Moore (Anatomia). São a referência primária — usar como âncora de qualquer afirmação mecanicista.
- **Revisões em periódicos de referência**: Nature Reviews Immunology, Physiological Reviews, Annual Review of Biochemistry. Para atualizações e controvérsias ativas.
- **Artigos seminais**: quando um mecanismo tem paper fundador conhecido (ex.: Janeway sobre PRRs, Medzhitov sobre toll-like receptors), citá-lo na nota histórica.
- **Evitar**: sites de resumo, apostilas sem autoria, Wikipedia como fonte primária.
- **Conector MCP PubMed/PMC** (quando disponível na sessão): usar para busca real de artigos — seminais, revisões recentes, verificação de PMID/DOI — em vez de citar de memória. Cobre medicina, biologia, bioquímica, microbiologia, fisiologia; não cobre economia, CS ou humanas. Se o conector não estiver conectado, seguir a hierarquia acima normalmente e sinalizar ao usuário que a busca automatizada não está disponível nesta sessão.

## Convenções da área

- Nomenclatura: usar terminologia IUPAC para bioquímica, nomenclatura anatômica internacional (Terminologia Anatomica) para anatomia, notação padrão para citocinas (IL-1, TNF-α, etc.).
- Siglas: por extenso na primeira ocorrência — "linfócito T auxiliar (Th)", "fator de necrose tumoral (TNF)".
- Controvérsias comuns na área: fronteiras entre imunidade inata e adaptativa, papel de células NK, modelos de ativação de linfócitos T (sinal 1/2/3 vs. modelos alternativos).
- Contexto brasileiro relevante: epidemiologia de doenças infecciosas no Brasil (dengue, leishmaniose, tuberculose) quando pertinente à microbiologia; diferenças populacionais em HLA para imunologia.

## Checklist adicional para medicina básica

- [ ] Mecanismo celular e molecular desenvolvido, não apenas descrição funcional?
- [ ] Contexto clínico mencionado quando o mecanismo básico tem implicação direta?
- [ ] Links para compêndios de mecanismo em `medicina/` onde existirem?
- [ ] Nomenclatura padronizada (siglas, nomes de moléculas)?
