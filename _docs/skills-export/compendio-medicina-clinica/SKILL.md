---
name: compendio-medicina-clinica
description: >
  Contexto epistêmico para criação e revisão de compêndios de área de medicina clínica:
  farmacologia, fisiopatologia, semiologia, clínica médica e especialidades. Carregada
  pela skill compendio quando o tema pertence a essas áreas. Ative sempre que o usuário
  pedir compêndio de área de farmacologia, fisiopatologia, semiologia ou clínica médica.
---

# Subskill Compêndio de Área — Medicina Clínica

Contexto específico para mapas de campo das disciplinas clínicas da medicina.
As regras gerais de formato, fluxo e verificação estão na skill `compendio` (compêndio de área).
Esta subskill fornece o contexto epistêmico da área.

## Subáreas cobertas

- **Farmacologia** — mecanismos de ação, farmacocinética, farmacodinâmica, classes terapêuticas
- **Fisiopatologia** — mecanismos de doença, alterações funcionais e estruturais
- **Semiologia** — sinais, sintomas, raciocínio diagnóstico, exame físico
- **Clínica médica** — abordagem de doenças sistêmicas, diagnóstico diferencial, conduta

## Pastas de mecanismos correspondentes

Quando o mapa referenciar um mecanismo já existente, procurar em:
- `medicina/farmacologia/` — anti-hipertensivos, antiagregantes, antifúngicos
- `medicina/fisiopatologia/` — trombose, doenças circulatórias, choque

## Relação com medicina básica

Mapas de medicina clínica frequentemente dependem de mecanismos de medicina básica.
Ao mencionar um mecanismo básico (ex.: ativação de plaquetas, resposta inflamatória),
linkar para o compêndio correspondente em `medicina/imunologia/` ou `medicina/fisiologia/`
em vez de reexplicar. O mapa clínico é orientador — não duplica o básico.

## Heurística de fontes

Hierarquia epistêmica para medicina clínica:

- **Guidelines de sociedades médicas** (peso máximo para conduta): AHA/ACC (cardiologia), WHO, Ministério da Saúde (protocolos brasileiros), CFM. São a referência primária para recomendações terapêuticas.
- **Revisões sistemáticas e meta-análises**: Cochrane, PubMed — para eficácia de intervenções e evidência de tratamento.
- **Livros-texto canônicos**: Goodman & Gilman (Farmacologia), Robbins (Patologia/Fisiopatologia), Harrison (Clínica Médica). Para mecanismos e apresentação de doenças.
- **Artigos de referência**: quando uma descoberta clínica tem trial fundador (ex.: HOPE para IECA em HAS, ISIS-2 para AAS no IAM), citá-lo.
- **Evitar**: protocolos desatualizados, fontes sem grau de evidência explícito para condutas.

## Convenções da área

- Nomenclatura: CID-10 para doenças quando relevante, DCI (Denominação Comum Internacional) para fármacos seguida do nome comercial entre parênteses na primeira ocorrência.
- Graus de recomendação: quando mencionar conduta, indicar nível de evidência (A/B/C ou I/II/III) se disponível.
- Siglas: por extenso na primeira ocorrência — "insuficiência cardíaca (IC)", "pressão arterial (PA)".
- Controvérsias comuns: metas de PA em diferentes populações, indicações de anticoagulação, limites de diagnóstico por biomarcadores.
- Contexto brasileiro: prevalência de HAS, DM, doença de Chagas, hanseníase; sistema SUS e disponibilidade de fármacos na RENAME; portarias do Ministério da Saúde quando relevantes.

## Checklist adicional para medicina clínica

- [ ] Mecanismo fisiopatológico mencionado (não apenas descrição clínica)?
- [ ] Grau de evidência indicado para recomendações terapêuticas?
- [ ] Links para compêndios de mecanismo básico correspondentes?
- [ ] Contexto brasileiro (epidemiologia, SUS, RENAME) incluído quando relevante?
- [ ] Guidelines mais recentes consultados (verificar ano da última atualização)?
