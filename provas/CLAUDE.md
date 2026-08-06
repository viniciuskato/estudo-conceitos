# Instruções do Projeto — Provas
**Versão:** 1.2 · **Data:** 2026-08-05

## Objetivo

Material de preparação para provas teóricas — HTMLs com escopo FECHADO pelo plano de ensino/edital de uma disciplina específica (com data de prova definida), não pela exaustividade do campo. Diferente de compêndio de área (sem limite externo de escopo) e de mecanismo (saturação de um conceito único): aqui o critério de parada é o edital, e a profundidade é a suficiente para responder à prova com segurança e entender o porquê, não decorar o o quê. É o único dos três domínios com aparato próprio de avaliação embutido no ciclo regular: mapa de cobertura contra o edital, caso-âncora por seção, pegadinhas em contexto, e os modos Anki/simulado/véspera como parte regular do fluxo — não um extra opcional.

Este domínio nasceu do desmembramento do antigo projeto único "Base de estudos" (decisão do usuário em 2026-07-10, ver `Cowork/_meta/registro-sessoes.md`) em três domínios-irmãos (Compêndios, Sistemas, Provas). A pasta física continua dentro de `Base de estudos/` porque o `.git`/GitHub Pages é compartilhado entre os três — mas é roteada de forma independente a partir do `CLAUDE.md` raiz do Cowork.

## Estrutura de pastas

```
provas/
  CLAUDE.md          → este arquivo
  prova_mapa.txt     → disciplinas/editais já cobertos
  prova_estado.txt   → histórico e pendências
  medicina/          → material de prova de disciplinas de medicina (skill prova-medicina)
    _cache/          → cache de conteúdo processado por matéria (evita reler PDFs)
    [materia].html                → material principal (versão final)
    [materia]-vespera.html        → gerado na véspera, não substitui o principal
```

## Skill

`prova` — skill de entrada deste domínio. Roteia por domínio: `prova-medicina` (única subskill hoje, cobrindo ciências básicas, clínica, semiologia, epidemiologia/saúde coletiva, metodologia de pesquisa em saúde). Domínio novo sem subskill → usar a skill de entrada e propor criação da subskill ao final.

Fonte da skill: `../_docs/skills-export/` (compartilhada com os domínios-irmãos Compêndios e Sistemas).

## Protocolo de abertura de sessão

Ao iniciar sessão neste domínio sem tarefa direta:
1. Ativar a skill `prova`.
2. Identificar o domínio/disciplina → carregar a subskill correspondente.
3. Ler o plano de ensino/edital → mapear escopo fechado → validar exclusões com o usuário via AskUserQuestion antes de gerar.
4. Ler `prova_estado.txt` e `prova_mapa.txt` — pendências e disciplinas já cobertas.
5. Ler `../_docs/DEBT.md` — informar dívidas relevantes a este domínio antes de prosseguir.

## Infraestrutura compartilhada com Compêndios e Sistemas

Os três domínios-irmãos usam o mesmo repositório git/GitHub Pages e a mesma máquina técnica — por isso estas regras ficam em `Base de estudos/_docs/`, referenciadas sob demanda:

- `../_docs/template-v2-spec.md` — CSS/layout/sidebar/elementos visuais canônicos. Ler antes de criar qualquer HTML novo. Prova adiciona elementos estruturais próprios sobre essa base: mapa de cobertura, caso-âncora, pegadinhas em contexto, banner de escopo parcial, guia de estudo no cabeçalho — ver `prova/SKILL.md`.
- `../_docs/operacoes-bash.md` — regras de Edit/Write/encoding, verificação obrigatória pós-escrita, arquivamento em `_archive/`.
- `../_docs/DEBT.md` — dívida técnica unificada dos três domínios.
- Modo Anki/simulado/véspera — procedimento canônico (incluindo o protocolo de véspera) em `mecanismo/SKILL.md`, referenciado por `prova`. Aqui, diferente dos outros domínios, é parte regular do ciclo, não um extra opcional.
- `push.bat` na raiz do repositório git publica no GitHub Pages — lembrar o usuário ao final de sessão que gerou/alterou HTML.
- **Arquivos de controle deste domínio (checar em auditoria estrutural):** `prova_mapa.txt`/`prova_estado.txt` (disciplinas/editais e pendências batem com o disco?), `../_docs/DEBT.md` (entradas deste domínio ainda abertas?). Migrado de `autocritica-sessao` (aposentada em 2026-07-17) — ver `_meta/registro-sessoes.md`.
- **`git status` falha por completo neste sandbox** (ver `../_docs/operacoes-bash.md`) — ao levantar o que uma sessão tocou (ex.: para pendência de `push.bat`), reconstruir a partir do próprio histórico de tool calls da sessão, nunca rodar `git status --short` esperando resposta.

## Regras específicas deste domínio

- **Dois requisitos inegociáveis, peso igual:** cobertura (todo tópico do edital presente) e didática (o leitor entende o porquê, não decora o quê).
- **Princípio de entrega — a primeira resposta deve ser a definitiva:** ciclo de automelhora obrigatório até convergência real (nenhuma melhoria identificável), não um número fixo de iterações.
- **Escopo real vs. plano de ensino:** o plano de ensino pode listar tópicos não efetivamente cobrados — tratar como ponto de partida, validar exclusões com o usuário antes de gerar, nunca deletar conteúdo já gerado quando um tópico for excluído depois (usar banner de escopo parcial).
- **Cache de conteúdo:** verificar `provas/<domínio>/_cache/[matéria]-conteudo.md` antes de reler arquivos originais; criar/atualizar antes de apresentar o HTML.
- **Hierarquia de fontes:** material do professor > institucional > referências externas — hierarquia detalhada na subskill de domínio (ex.: `prova-medicina`).
- **Nível de evidência (TDE Tutorial, 2026-08-05):** toda conduta, diagnóstico ou terapêutica discutida indica se a base é Diretriz/Consenso, Ensaio Clínico Controlado, Revisão Sistemática ou Opinião de Especialista — complementa a "Hierarquia de fontes" acima sem substituí-la: hierarquia diz de onde veio o dado, nível de evidência diz quão forte é o dado clínico em si.

## Atualização deste arquivo

Ao editar: arquivar a versão anterior em `_archive/CLAUDE_<data>.md` antes de sobrescrever — nunca perder uma versão sem registro.

**Mudou em 2026-08-05:** nova regra "Nível de evidência", adaptada do TDE oficial de fechamento de tutoria (4 pilares: busca ativa/fontes, síntese e relevância clínica, nível de evidência, citação rigorosa) — busca/fontes já coberto pela "Hierarquia de fontes" existente. Rollout aplicado no mesmo turno a Tutorial (origem), Compêndios e Anamnese e Exame Físico — ver `Cowork/_meta/registro-sessoes.md`. Versão anterior (v1.1) arquivada em `_archive/CLAUDE_2026-08-05_diff.md`.

**Mudou em 2026-07-17:** recebeu o delta de "arquivos de controle" e a nota de `git status` que antes viviam na subskill `autocritica-sessao` (aposentada nesta sessão — `autocritica-cowork` virou skill única genérica, sem subskills por domínio). Ver `Cowork/CLAUDE.md` v2.18 e `_meta/registro-sessoes.md`, entrada 2026-07-17. Versão anterior (v1.0) arquivada em `_archive/CLAUDE_2026-07-17.md`.

**Criado em 2026-07-10:** primeira versão deste arquivo, gerada a partir do desmembramento do antigo `Base de estudos/_docs/instrucoes-projeto.txt` em três domínios-irmãos (Compêndios, Sistemas, Provas) — ver `Cowork/_meta/registro-sessoes.md`, entrada 2026-07-10.
