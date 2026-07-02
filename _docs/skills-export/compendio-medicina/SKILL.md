---
name: compendio-medicina
description: >
  Camada de agrupamento para compêndios de área de medicina. Carregada pela skill
  compendio quando a área pedida é medicina, antes de identificar a subárea específica
  (básica ou clínica) e carregar compendio-medicina-basica ou compendio-medicina-clinica.
  Ative sempre que o usuário pedir compêndio de área de medicina sem especificar de
  imediato se é básica ou clínica, ou quando o material atravessar as duas.
---

# Subskill Compêndio de Área — Medicina (agrupador)

Medicina é uma área única com duas subskills de subárea. Esta skill resolve o roteamento
entre elas e o que lhes é comum — não define estrutura de HTML, checklist nem convenções
de nomenclatura, que continuam em cada subskill de subárea.

## Hierarquia de subskills

| Subárea | Subskill a carregar |
|---------|---------------------|
| Imunologia, fisiologia, bioquímica, microbiologia, anatomia | `compendio-medicina-basica` |
| Farmacologia, fisiopatologia, semiologia, clínica médica | `compendio-medicina-clinica` |
| Ambígua ou atravessa as duas (ex.: farmacologia cardiovascular + fisiologia cardíaca) | Carregar as duas; usar esta skill para a relação entre elas |

## Pasta comum

Todos os compêndios de área de medicina — básica ou clínica — vivem em `compêndios/medicina/`,
uma única pasta sem subdivisão por subárea. Verificar `compêndios/compendio_mapa.txt` antes de criar
um novo, para não duplicar cobertura.

## Relação entre básica e clínica

Mapas de medicina clínica frequentemente pressupõem mecanismos de medicina básica (ex.: farmacologia
cardiovascular pressupõe fisiologia cardíaca; fisiopatologia de choque pressupõe imunologia
inflamatória). Ao mapear uma subárea clínica, linkar via `a.cross-link` para o compêndio de área
básica correspondente em vez de reexplicar — e vice-versa quando um mapa básico tiver desdobramento
clínico direto e já coberto (ex.: imunologia → hipersensibilidade tem correlato terapêutico em
farmacologia).

## Heurística de fontes comum

Ambas as subskills usam o conector MCP PubMed/PMC (quando disponível na sessão) para busca real de
literatura em vez de citação de memória — ver "Busca de literatura biomédica (MCP)" em
`instrucoes-projeto.txt`. A hierarquia específica de fontes (livros-texto canônicos para básica;
guidelines de sociedades médicas para clínica) é definida em cada subskill de subárea, não aqui.

## O que esta skill não faz

Não substitui `compendio-medicina-basica` nem `compendio-medicina-clinica` — sempre carregar a
subskill de subárea correspondente antes de gerar ou revisar o compêndio. Esta skill só resolve
roteamento e contexto compartilhado entre as duas.
