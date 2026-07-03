---
name: prova
description: >
  Skill para criação, revisão e estudo (Anki, simulado, véspera) de material de preparação
  para provas teóricas — HTMLs autônomos com escopo FECHADO pelo plano de ensino/edital da
  disciplina, não pela exaustividade do campo. Use SEMPRE que o usuário mencionar "prova",
  "edital", "plano de ensino", quiser preparar-se para uma avaliação específica com data
  definida, ou pedir revisão/véspera/simulado de um material de prova já existente. Após
  identificar o domínio, carregar a subskill correspondente: prova-medicina.
---

# Skill Prova

Material de prova cobre exatamente o que o plano de ensino ou edital exige — nem mais,
nem menos. Diferente de um compêndio de área, não existe critério de exaustividade do
campo; diferente de um mecanismo, não existe critério de profundidade máxima de um único
conceito. O critério de parada é o edital, e a profundidade é a suficiente para responder
à prova com segurança e entender o porquê, não decorar o o quê.

**Distinção com as demais skills-pai:**
- `compendio` exaure o campo inteiro, sem limite externo de escopo.
- `mecanismo` aprofunda um conceito único até saturação total.
- `sistema` mapeia um artefato técnico bounded e seus subsistemas.
- `prova` é bounded por um recorte **externo e temporário** (o edital de uma disciplina
  específica, com data de prova) — cobertura fechada, profundidade suficiente. É a única
  das quatro skills com aparato próprio de avaliação embutido no ciclo: mapa de cobertura
  contra o edital, caso-âncora por seção, pegadinhas em contexto, e os modos Anki/simulado/
  véspera como parte regular do fluxo (não um extra opcional acessório).

**Dois requisitos inegociáveis, com peso igual:**
1. **Cobertura** — todo tópico do edital está presente.
2. **Didática** — o leitor entende o *porquê*, não apenas decora o *o quê*.

**Princípio de entrega — a primeira resposta deve ser a definitiva:** todo material de
prova deve ser produzido como se fosse a única oportunidade de entrega. Teste prático: se
o usuário perguntar "há alguma lacuna?" logo após receber o HTML, a resposta honesta deve
ser "não encontro nada". Ver "Ciclo de automelhora" abaixo.

## Hierarquia de subskills

| Domínio | Subskill a carregar |
|---|---|
| Provas de disciplinas de medicina (ciências básicas, clínica, semiologia, epidemiologia/saúde coletiva, metodologia de pesquisa em saúde) | `prova-medicina` |
| Domínio novo sem subskill | Usar esta skill e propor criação da subskill ao final |

## Protocolo de abertura de sessão

Ao iniciar sem tarefa direta:
1. Ler `provas/prova_estado.txt` — pendências e histórico.
2. Ler `provas/prova_mapa.txt` — disciplinas/editais já cobertos.
3. Se houver dívida crítica em `_docs/DEBT.md`, informar antes de prosseguir.

## Pré-geração

Antes de gerar material novo, perguntar via AskUserQuestion:
- Qual o plano de ensino/edital da disciplina (arquivo do professor)?
- Há tópico confirmado pelo professor como fora da prova?
- Há data de prova definida? (prioriza triagem de véspera e Anki)

Nunca perguntar sobre formato.

## Formato

Cada material de prova é um HTML seguindo `_docs/template-v2-spec.md` (CSS/layout/sidebar
canônicos — ler antes de criar qualquer HTML novo) mais os seguintes elementos
estruturais **específicos desta skill** (não compartilhados com compendio/mecanismo/sistema):

- **Mapa de cobertura** (`.coverage-table`): tabela obrigatória logo após o cabeçalho,
  com colunas Tópico / Cobertura no HTML (✓ Completo, ~ Parcial, ✗ Falta) / Domínio (Anki).
- **Caso-âncora**: cenário clínico ou aplicado de 2–3 linhas no início de cada seção,
  usado como fio condutor; fecha com `.caso-resposta` conectando mecanismo ao caso em
  2–3 frases.
- **Pegadinhas em contexto** (`.trap-box`): dentro da seção onde o conceito confuso é
  ensinado, não só numa seção final de revisão.
- **Banner de escopo parcial**: se um tópico for excluído da prova após o HTML já gerado,
  marcar `status-parcial` no mapa de cobertura + banner (`border-left-color:#e05a5a;
  background:#1a1010`) no início da seção afetada — nunca deletar o conteúdo.
- **Guia de estudo no cabeçalho**: 3–4 linhas indicando como usar o material conforme o
  tempo disponível até a prova.

## Ordem das seções (obrigatória)

Cabeçalho (h1 + meta + chips + guia de estudo) → Mapa de cobertura → Fundamentos
necessários → [conteúdo principal, em ordem didática — ver abaixo] → Pegadinhas
consolidadas (revisão rápida, não local primário) → Conceitos-chave → Leituras
recomendadas → Referências.

**Ordem didática do conteúdo principal:** seguir a ordem mais didática, não a do edital
nem a cronológica das aulas — fundamento antes de aplicação, agrupamento por lógica
interna, do simples ao complexo dentro de cada grupo. A subskill de domínio detalha
convenções específicas (ex.: patologia antes de farmacologia, em `prova-medicina`).

## Escopo real vs. plano de ensino

O plano de ensino pode conter tópicos não efetivamente cobrados. Tratar como ponto de
partida, não verdade absoluta — validar exclusões com o usuário antes de gerar (ver
Pré-geração). Se a exclusão vier de fonte informal (grupo de turma, aviso verbal),
mencionar isso no banner de escopo parcial.

## Fluxo de trabalho

1. Identificar domínio → carregar subskill correspondente.
2. Ler o plano de ensino/edital → mapear escopo fechado → validar exclusões com o
   usuário (Pré-geração).
3. Consultar `provas/prova_estado.txt` e `provas/prova_mapa.txt`.
4. Mapear e ler integralmente os arquivos relevantes (material do professor >
   institucional > referências externas — hierarquia detalhada na subskill de domínio).
5. Calibração de fonte: o material cobre o mecanismo (porquê) ou só o resultado (o quê)?
   Se só o o quê, buscar o mecanismo nas referências de prioridade da subskill de domínio.
6. Cache de conteúdo: verificar `provas/<dominio>/_cache/[materia]-conteudo.md`. Se existe
   e está atualizado, usar como fonte primária em vez de reler os arquivos originais. Criar
   ou atualizar o cache logo após a leitura (ou após qualquer revisão que altere conteúdo),
   **antes** de apresentar o HTML ao usuário.
7. Ler `_docs/template-v2-spec.md` + este SKILL.md + SKILL.md da subskill de domínio antes
   de escrever qualquer HTML.
8. Gerar HTML em `provas/<dominio>/[materia].html`.
9. Verificação bash obrigatória após qualquer escrita de HTML:
   - (a) fecha com `</body></html>`
   - (b) `wc -l` compatível com o esperado
   - (c) sem `const const` / `var var`
   - (d) acentuação PT-BR intacta: `grep -c "ã\|ç\|é" > 0`
   - (e) sem artefatos: `grep -iw "placeholder\|TODO\|FIXME\|debug\|rascunho"` vazio
10. Ciclo de automelhora (obrigatório, ver seção própria abaixo) até convergência real.
11. Verificação visual (material novo e reescritas ≥30%): abrir no Chrome via Claude in
    Chrome.
12. Atualizar `provas/prova_mapa.txt`, o cache de conteúdo e `index.html`.
13. Registrar em `_docs/DEBT.md` toda inconsistência não corrigida.
14. GitHub: lembrar o usuário de rodar `push.bat` na raiz.

## Ciclo de automelhora (obrigatório até convergência)

Critério de parada único: completar uma passagem inteira sem identificar nenhum ponto de
melhora — não há número fixo de iterações.

Por seção, verificar (didática tem prioridade máxima): o mecanismo parte do porquê para o
o quê? Há saltos de raciocínio sem "porque"? Prosa encadeada ou lista sem conectivo? Termos
técnicos com função clínica/aplicada imediata? O caso-âncora tem `.caso-resposta` explícito
conectando mecanismo e caso? Pegadinhas embutidas na seção onde o conceito confuso é
ensinado? Gradação de importância clara (núcleo duro vs. detalhe)?

Entre seções: transição natural, conceitos tardios já introduzidos antes, sidebar refletindo
a ordem real do conteúdo.

Teste de convergência real: "se o usuário perguntar agora se há algo a melhorar, tenho
resposta?" Se sim, o ciclo não encerrou. Ao encerrar, reportar no chat quantas iterações e
o que foi corrigido em cada uma.

## Revisão de documento existente

Usar quando o usuário pedir para revisar, atualizar ou incorporar material novo a um HTML
de prova já entregue.

1. Perguntar (AskUserQuestion) o tipo de revisão: Didática / Cobertura / Conteúdo novo /
   Correção pontual / Completa. Se não especificado, assumir Completa e avisar no chat.
2. Verificar cache antes de reler o HTML ou os arquivos originais.
3. Backup obrigatório antes de qualquer edição: `cp arquivo.html arquivo.html.bak`.
4. Executar a revisão conforme o escopo definido — Didática aplica o Ciclo de automelhora
   seção por seção; Cobertura compara a estrutura com o edital e atualiza o mapa de
   cobertura; Conteúdo novo segue a regra abaixo; Correção pontual edita só o trecho
   identificado, checando impacto em seções vizinhas.
5. Verificação bash obrigatória (mesma lista do Fluxo de trabalho) após a edição.
6. Atualizar o cache de conteúdo antes de apresentar o arquivo revisado.
7. Reportar no chat o que foi alterado, em quais seções, e por quê — uma linha por mudança
   significativa.

**Incorporação de material novo:** se o conteúdo novo altera mais de ~30% do HTML, propor
versão nova (arquivar a antiga em `_archive/` com sufixo de data); se altera menos,
incorporar seguindo a ordem didática — nunca apender ao final.

## Modos de estudo

**Anki** — ver seção "Modo Anki" em `mecanismo/SKILL.md` (procedimento canônico
compartilhado pelas quatro skills-pai, incluindo o protocolo de véspera). Antes de iniciar,
verificar que o HTML está na versão final (não rascunho) e, se houver data de prova,
priorizar tópicos com menor cobertura e maior peso.

**Simulado** — 5–10 questões de múltipla escolha. Ativar quando o usuário pedir ou faltarem
≤5 dias para a prova. Distratores plausíveis: erro real de mecanismo, inversão de etapas,
troca de conceito/entidade próxima, generalização indevida. A correção explica por que cada
distrator está errado.

**Véspera** — gerar `provas/<dominio>/[materia]-vespera.html` com triagem cirúrgica dos
tópicos de menor domínio (ver protocolo de véspera em `mecanismo/SKILL.md`). Não substitui
o material principal.

## Estrutura de pastas

```
provas/
  prova_mapa.txt      → disciplinas/editais já cobertos
  prova_estado.txt    → histórico e pendências
  <dominio>/          → ex.: medicina/ (skill prova + subskill prova-medicina)
    _cache/           → cache de conteúdo processado por matéria (evita reler PDFs)
      [materia]-conteudo.md
    [materia].html               → material principal (versão final)
    [materia]-vespera.html       → gerado na véspera, não substitui o principal
anki/                 → sessões e erros do Anki (compartilhado com as demais skills)
```

## Checklist antes de fechar o material de prova

- [ ] Todo tópico do edital tem seção correspondente no mapa de cobertura?
- [ ] Cada seção principal tem caso-âncora com `.caso-resposta` ao final?
- [ ] Pegadinhas embutidas nas seções onde os conceitos confusos são ensinados (não só na
  seção final)?
- [ ] Gradação de importância marcada (núcleo duro vs. detalhe)?
- [ ] Ciclo de automelhora rodado até convergência (nenhuma melhoria identificável)?
- [ ] Cache de conteúdo criado/atualizado antes da entrega?
- [ ] `provas/prova_mapa.txt` e `_docs/DEBT.md` atualizados?
- [ ] Campo "Última revisão" atualizado?

## O que não fazer

- Não buscar exaustividade além do edital — isso é escopo de `compendio`, não de `prova`.
- Não pular o mapa de cobertura nem apender pegadinhas só numa seção final.
- Não iniciar Anki/simulado sem pedido explícito do usuário.
- Não gerar sem antes validar com o usuário quais tópicos o professor confirmou como fora
  da prova.
- Não apagar conteúdo quando um tópico for excluído após a geração — usar o banner de
  escopo parcial.

## Encerramento de sessão

Ao final de sessão substantiva, chamar a skill `autocritica-sessao`.
Sinal: "terminamos", "pode fechar", "acabou", "sessão encerrada".
