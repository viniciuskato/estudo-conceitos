# Instruções do Projeto — Sistemas
**Versão:** 1.1 · **Data:** 2026-07-17

## Objetivo

Compêndios de sistema — HTMLs autônomos que mapeiam um artefato ou sistema técnico bounded (automóvel, avião, computador, edificação, motor): seus subsistemas, como cada um funciona e, centralmente, como se integram para produzir o comportamento do todo. Diferente de compêndio de área (largura é a de um campo de conhecimento) e de mecanismo (profundidade de um conceito único): aqui a largura é a do objeto — seus subsistemas —, não a de uma disciplina.

Este domínio nasceu do desmembramento do antigo projeto único "Base de estudos" (decisão do usuário em 2026-07-10, ver `Cowork/_meta/registro-sessoes.md`) em três domínios-irmãos (Compêndios, Sistemas, Provas). A pasta física continua dentro de `Base de estudos/` porque o `.git`/GitHub Pages é compartilhado entre os três — mas é roteada de forma independente a partir do `CLAUDE.md` raiz do Cowork.

## Estrutura de pastas

```
sistemas/
  CLAUDE.md            → este arquivo
  sistema_mapa.txt     → objetos já cobertos
  sistema_estado.txt   → histórico e pendências
  veiculos/            → compêndios de veículos automotivos (skill sistema-veiculos): chassi, motorização, transmissão, suspensão, freios, elétrica
```

## Skill

`sistema` — skill de entrada deste domínio. Roteia por domínio de objeto: `sistema-veiculos` (única subskill hoje). Domínio novo sem subskill → usar a skill de entrada e propor criação da subskill ao final.

Fonte da skill: `../_docs/skills-export/` (compartilhada com os domínios-irmãos Compêndios e Provas).

## Protocolo de abertura de sessão

Ao iniciar sessão neste domínio sem tarefa direta:
1. Ativar a skill `sistema`.
2. Identificar o domínio do objeto → carregar a subskill correspondente.
3. Ler `sistema_estado.txt` e `sistema_mapa.txt` — pendências e objetos já cobertos.
4. Ler `../_docs/DEBT.md` — informar dívidas relevantes a este domínio antes de prosseguir.

## Infraestrutura compartilhada com Compêndios e Provas

Os três domínios-irmãos usam o mesmo repositório git/GitHub Pages e a mesma máquina técnica — por isso estas regras ficam em `Base de estudos/_docs/`, referenciadas sob demanda:

- `../_docs/template-v2-spec.md` — CSS/layout/sidebar/elementos visuais canônicos. Ler antes de criar qualquer HTML novo.
- `../_docs/operacoes-bash.md` — regras de Edit/Write/encoding, verificação obrigatória pós-escrita, arquivamento em `_archive/`.
- `../_docs/DEBT.md` — dívida técnica unificada dos três domínios.
- Modo Anki (opcional, mediante pedido explícito) — procedimento canônico em `../compêndios` via `mecanismo/SKILL.md` (fonte compartilhada por compendio, sistema e prova).
- `push.bat` na raiz do repositório git publica no GitHub Pages — lembrar o usuário ao final de sessão que gerou/alterou HTML.
- **Arquivos de controle deste domínio (checar em auditoria estrutural):** `sistema_mapa.txt`/`sistema_estado.txt` (objetos cobertos e pendências batem com o disco?), `../_docs/DEBT.md` (entradas deste domínio ainda abertas?). Migrado de `autocritica-sessao` (aposentada em 2026-07-17) — ver `_meta/registro-sessoes.md`. Domínio segue dormente (ver `Cowork/CLAUDE.md`) — esta nota vale quando for reativado.
- **`git status` falha por completo neste sandbox** (ver `../_docs/operacoes-bash.md`) — ao levantar o que uma sessão tocou (ex.: para pendência de `push.bat`), reconstruir a partir do próprio histórico de tool calls da sessão, nunca rodar `git status --short` esperando resposta.

## Regras específicas deste domínio

- **Dois níveis:** arquivo-pai (objeto inteiro, ex.: o automóvel como um todo) e arquivo-filho (subsistema com complexidade própria suficiente, ex.: motor de combustão interna) — criar arquivo-filho só quando justificado.
- **Seção obrigatória "Como as partes se integram":** fluxo de energia/força/informação entre subsistemas — é o que distingue sistema de um compêndio de área listando partes soltas. Nunca pular.
- **Não deixar a largura escapar do objeto:** se o material começa a cobrir uma disciplina inteira (ex.: "engenharia mecânica" em vez de "o automóvel"), é caso para o domínio Compêndios, não para Sistemas.
- **Didática:** mesma regra de Compêndios — exaustividade e digestibilidade não competem; nenhum parágrafo empilha 3+ subsistemas/entidades paralelas sem transição, mesmo com `.data-table` cobrindo o mesmo conteúdo.
- **Contexto brasileiro/regulatório:** normas aplicáveis e especificidades de mercado, quando pertinente — omitir se irrelevante.

## Atualização deste arquivo

Ao editar: arquivar a versão anterior em `_archive/CLAUDE_<data>.md` antes de sobrescrever — nunca perder uma versão sem registro.

**Mudou em 2026-07-17:** recebeu o delta de "arquivos de controle" e a nota de `git status` que antes viviam na subskill `autocritica-sessao` (aposentada nesta sessão — `autocritica-cowork` virou skill única genérica, sem subskills por domínio). Ver `Cowork/CLAUDE.md` v2.18 e `_meta/registro-sessoes.md`, entrada 2026-07-17. Versão anterior (v1.0) arquivada em `_archive/CLAUDE_2026-07-17.md`.

**Criado em 2026-07-10:** primeira versão deste arquivo, gerada a partir do desmembramento do antigo `Base de estudos/_docs/instrucoes-projeto.txt` em três domínios-irmãos (Compêndios, Sistemas, Provas) — ver `Cowork/_meta/registro-sessoes.md`, entrada 2026-07-10.
