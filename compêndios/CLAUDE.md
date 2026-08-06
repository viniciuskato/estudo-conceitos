# Instruções do Projeto — Compêndios (área + mecanismo)
**Versão:** 1.3 · **Data:** 2026-08-06

## Objetivo

Compêndios de área — HTMLs autônomos que exaurem um campo de estudo inteiro (medicina, investimentos, IA, filosofia, física) em largura e profundidade — mais mecanismo, o aprofundamento de um conceito único até saturação, que deixou de ser skill-pai paralela em 2026-07-10 e passou a ser a camada mais funda dentro da árvore de cada área: mesmo conhecimento, granularidade máxima, não um modo de trabalho categoricamente diferente.

Este domínio nasceu do desmembramento do antigo projeto único "Base de estudos" (decisão do usuário em 2026-07-10, ver `Cowork/_meta/registro-sessoes.md`): o motivo do desmembramento foi que o acoplamento entre compendio/mecanismo/sistema/prova era histórico (compartilhar `template-v2-spec.md` porque nasceram juntos), não conceitual — e usar "compartilha o template" como critério de admissão reprovava qualquer modo novo só por ter chegado depois. A pasta física continua dentro de `Base de estudos/` porque o `.git`/GitHub Pages é compartilhado entre os três domínios irmãos (Compêndios, Sistemas, Provas) — mas cada um é roteado de forma independente a partir do `CLAUDE.md` raiz do Cowork, com seu próprio arquivo de instrução.

## Estrutura de pastas

```
compêndios/
  CLAUDE.md              → este arquivo
  compendio_mapa.txt     → áreas já cobertas
  compendio_estado.txt   → histórico e pendências
  medicina/               → compêndios de área de medicina (skill compendio-medicina + subskills básica/clínica)
    mecanismos/           → mecanismo de medicina, por subárea
      imunologia/  fisiologia/  farmacologia/  fisiopatologia/  microbiologia/
  fisica/  ia/  filosofia/  investimentos/  → compêndios de área (uma subskill cada, sem mecanismo próprio ainda)
```

Mecanismo de medicina foi migrado em 2026-07-10 de uma pasta paralela (`Base de estudos/medicina/`, fora desta árvore) para dentro de `compêndios/medicina/mecanismos/` — script de migração + correção de links documentado em `Cowork/_meta/registro-sessoes.md`, entrada 2026-07-10. **Pendência aberta:** o histórico de mecanismo (`Base de estudos/_docs/project_estado.md` e `project_mapa_materiais.md`) ainda vive separado de `compendio_estado.txt`/`compendio_mapa.txt` — unificação não feita nesta rodada, registrada em `_docs/DEBT.md`.

## Skills

- `compendio` — skill de entrada deste domínio. Roteia por área: `compendio-medicina` (medicina, que por sua vez roteia para `compendio-medicina-basica`/`compendio-medicina-clinica`), `compendio-investimentos`, `compendio-ia`, `compendio-filosofia`, `compendio-fisica`.
- `mecanismo` — carregado pelas subskills de área (via `mecanismo-medicina-basica`/`mecanismo-medicina-clinica`, hoje as únicas subskills-folha de mecanismo) quando o recorte pedido é um conceito/mecanismo específico, não a área inteira. Não é mais skill de entrada direta — não é acionada por trigger de descrição próprio.

Fonte das skills: `../_docs/skills-export/` (compartilhada com os domínios-irmãos Sistemas e Provas — um `SKILL.md` por pasta, versionado; empacotamento em `.skill` e apresentação via `present_files` sob demanda, sem script local).

## Protocolo de abertura de sessão

Ao iniciar sessão neste domínio sem tarefa direta:
1. Ativar a skill `compendio`.
2. Perguntar/identificar a área → carregar a subskill correspondente, que decide compendio (área inteira) vs. mecanismo (conceito único) pela especificidade do pedido — nunca descer ao nível mais fundo por padrão.
3. Ler `compendio_estado.txt` e `compendio_mapa.txt` — pendências e áreas já cobertas.
4. Ler `../_docs/DEBT.md` — informar dívidas relevantes a este domínio antes de prosseguir.

## Infraestrutura compartilhada com Sistemas e Provas

Os três domínios-irmãos usam o mesmo repositório git/GitHub Pages e a mesma máquina técnica — por isso estas regras ficam em `Base de estudos/_docs/`, referenciadas sob demanda, não duplicadas em cada `CLAUDE.md`:

- `../_docs/template-v2-spec.md` — CSS/layout/sidebar/elementos visuais canônicos. Ler antes de criar qualquer HTML novo.
- `../_docs/operacoes-bash.md` — regras de Edit/Write/encoding, verificação obrigatória pós-escrita, arquivamento em `_archive/`.
- `../_docs/DEBT.md` — dívida técnica unificada dos três domínios (entradas já distinguidas por caminho de arquivo).
- Modo Anki (opcional, mediante pedido explícito) — procedimento canônico em `mecanismo/SKILL.md`, referenciado por `compendio`, `sistema` e `prova`.
- Subagentes para auditoria em lote (não para redação) — ver seção própria em `../_docs/instrucoes-projeto-arquivada.md` (histórico) ou replicar o padrão: um subagente por arquivo, relatório curto, consolidação antes de aplicar correções.
- Busca de literatura biomédica via MCP PubMed/PMC, quando disponível — usar em vez de citar de memória para medicina/biologia/farmacologia/fisiologia.
- `push.bat` na raiz do repositório git publica no GitHub Pages — lembrar o usuário ao final de sessão que gerou/alterou HTML.
- **Arquivos de controle deste domínio (checar em auditoria estrutural):** `compendio_mapa.txt`/`compendio_estado.txt` (contagens e pendências batem com o disco?), `../_docs/DEBT.md` (entradas deste domínio ainda abertas?), `../_docs/project_estado.md`/`project_mapa_materiais.md` (histórico legado de mecanismo — pendência de unificação com `compendio_estado.txt`/`compendio_mapa.txt` ainda em aberto, ver `../_docs/DEBT.md`). Migrado de `autocritica-sessao` (aposentada em 2026-07-17) — ver `_meta/registro-sessoes.md`.
- **`git status` falha por completo neste sandbox** (ver `../_docs/operacoes-bash.md`) — ao levantar o que uma sessão tocou (ex.: para pendência de `push.bat`), reconstruir a partir do próprio histórico de tool calls da sessão, nunca rodar `git status --short` esperando resposta.

## Regras específicas deste domínio

- **Critério de descida compendio → mecanismo:** pedido cobre a área inteira ou subárea ampla → compendio (arquivo-pai/arquivo-filho de área). Pedido é sobre UM conceito até saturação máxima → mecanismo (subskill-folha), que segue as regras de `mecanismo/SKILL.md` (ordem de seções, gradação de profundidade, saturação como critério de parada).
- **Dois níveis em compendio:** arquivo-pai (área inteira) e arquivo-filho (subárea com literatura própria suficiente) — criar arquivo-filho só quando justificado.
- **Harmonia entre exaustividade e didática:** cobertura exaustiva do campo e digestibilidade da prosa são critérios simultâneos — nenhum parágrafo empilha 3+ teorias/entidades paralelas sem transição, mesmo quando existe `.data-table` cobrindo o mesmo conteúdo.
- **Idioma:** determinar pelas fontes primárias predominantes da área (inglês para física/IA/filosofia/maior parte de medicina; português quando ancorado em diretrizes/epidemiologia brasileiras) — nunca herdar por inércia do acervo antigo em PT.
- **Imagens — busca é passo obrigatório do fluxo, não item opcional:** para todo conceito com correspondente visual plausível (anatômico, radiológico, morfológico, diagramático), tentar ativamente localizar prancha via a hierarquia OpenStax CC BY > Gray's Anatomy (domínio público) > Blausen CC BY 3.0, usando o método Wikimedia/Claude in Chrome documentado em `../_docs/template-v2-spec.md`. Só pular uma prancha e registrar a ausência em DEBT.md depois de uma busca real ter sido tentada e não ter encontrado imagem adequada — nunca pular por omissão, pressa ou como default. `compendio/SKILL.md` e `mecanismo/SKILL.md` (fluxo de trabalho + checklist) atualizados no mesmo sentido.
- **Escopo de melhorias — não retroagir:** aplicar padrão novo ao material em edição na sessão atual; registrar o padrão na estruturação do projeto para material futuro; não retroaplicar em lote ao acervo existente salvo pedido explícito ou dívida crítica registrada.
- **Nível de evidência (TDE Tutorial, 2026-08-05):** em compêndio/mecanismo de medicina clínica, ao discutir conduta, diagnóstico ou terapêutica, indicar se a recomendação vem de Diretriz/Consenso, Ensaio Clínico Controlado, Revisão Sistemática ou Opinião de Especialista. Busca ativa e confiabilidade de fonte já cobertas pela "Disciplina de fonte primária" (`CLAUDE.md` raiz) e pelo MCP PubMed/PMC citado acima; este item só formaliza o rótulo de nível de evidência, que faltava.

## Atualização deste arquivo

Ao editar: arquivar a versão anterior em `_archive/CLAUDE_<data>.md` antes de sobrescrever — nunca perder uma versão sem registro.

**Mudou em 2026-08-06:** regra "Imagens" reescrita — busca vira passo obrigatório do fluxo (não item que pode ser pulado por padrão); `compendio/SKILL.md` e `mecanismo/SKILL.md` ganharam passo dedicado no "Fluxo de trabalho" + item no checklist de fechamento. Motivo: padrão recorrente de dezenas de entradas "sem pranchas... não buscadas nesta sessão" em DEBT.md — usuário apontou que a busca deveria ser estrutural, não opcional. Aplicado no mesmo turno a `sindromes-bronco-pleuro-pulmonares.html` (piloto). Diff em `_archive/CLAUDE_2026-08-06_diff.md`.

**Mudou em 2026-08-05:** nova regra "Nível de evidência", adaptada do TDE oficial de fechamento de tutoria (4 pilares: busca ativa/fontes, síntese e relevância clínica, nível de evidência, citação rigorosa) — os outros 3 pilares já eram cobertos por regras existentes deste domínio. Rollout aplicado no mesmo turno a Tutorial (origem), Provas e Anamnese e Exame Físico — ver `Cowork/_meta/registro-sessoes.md`. Versão anterior (v1.1) arquivada em `_archive/CLAUDE_2026-08-05_diff.md`.

**Mudou em 2026-07-17:** recebeu o delta de "arquivos de controle" e a nota de `git status` que antes viviam na subskill `autocritica-sessao` (aposentada nesta sessão — `autocritica-cowork` virou skill única genérica, sem subskills por domínio). Ver `Cowork/CLAUDE.md` v2.18 e `_meta/registro-sessoes.md`, entrada 2026-07-17. Versão anterior (v1.0) arquivada em `_archive/CLAUDE_2026-07-17.md`.

**Criado em 2026-07-10:** primeira versão deste arquivo, gerada a partir do desmembramento do antigo `Base de estudos/_docs/instrucoes-projeto.txt` (arquivado em `Base de estudos/_archive/instrucoes-projeto_2026-07-10.txt`) em três domínios-irmãos (Compêndios, Sistemas, Provas) — ver `Cowork/_meta/registro-sessoes.md`, entrada 2026-07-10, para o raciocínio completo da decisão.
