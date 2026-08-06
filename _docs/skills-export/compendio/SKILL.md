---
name: compendio
description: >
  Skill para criação e revisão de compêndios de área — HTMLs autônomos
  que exaurem um campo de estudo inteiro com profundidade real, incluindo o modo
  `mecanismo` (aprofundamento de um conceito único até saturação) como sua camada mais
  funda. Use SEMPRE que o usuário mencionar "compêndio de área", quiser cobrir um campo
  inteiro (medicina, investimentos, IA, física, etc.), pedir material denso sobre uma
  área ampla de estudo, OU quiser aprofundar um mecanismo/conceito específico dentro de
  uma dessas áreas. Após identificar a área, carregar a subskill correspondente:
  compendio-medicina (medicina, que por sua vez carrega compendio-medicina-basica ou
  compendio-medicina-clinica), compendio-investimentos, compendio-ia, compendio-filosofia
  ou compendio-fisica. Se o recorte pedido for um mecanismo específico (não a área
  inteira), a subskill de área desce mais um nível até mecanismo-medicina-basica ou
  mecanismo-medicina-clinica.
---

# Skill Compêndio de Área (inclui mecanismo como camada mais funda)

O compêndio de área cobre um campo de estudo inteiro em largura e profundidade.
Não substitui livros nem artigos — mas deve ser suficientemente denso para situar o leitor,
desenvolver os conceitos centrais e guiar o estudo com referências anotadas.

**Reenquadramento (2026-07-10):** `mecanismo` deixou de ser skill-pai paralela — é o modo
de escrita mais profundo dentro desta mesma árvore, carregado quando o recorte pedido é
um conceito/mecanismo único dentro da área, não a área inteira. Fisicamente, o conteúdo de
mecanismo vive em `compêndios/<área>/mecanismos/<subárea>/`, dentro da árvore de compêndio
da área correspondente. As regras de formato específicas do modo mecanismo (ordem de
seções, saturação, Modo Anki canônico) continuam documentadas em `mecanismo/SKILL.md` —
esta skill só decide QUANDO descer até lá.

**Critério de descida — largura da área vs. profundidade de um ponto:** se o pedido cobre
a área inteira ou uma subárea ampla, gerar como compêndio de área (este arquivo + subskill
de área). Se o pedido é sobre UM conceito/processo específico até saturação máxima
("aprofundar X até entender o mecanismo por completo"), carregar a subskill-folha de
mecanismo correspondente (`mecanismo-medicina-basica`/`mecanismo-medicina-clinica`) — que
por sua vez segue as regras gerais de `mecanismo/SKILL.md`.

**Critério de sucesso:** o leitor sai com domínio real do campo — sabe o que existe,
como as partes se relacionam, quais são as questões abertas, e o que estudar a seguir.

## Hierarquia de subskills

Após identificar a área solicitada, carregar a subskill correspondente antes de gerar:

| Área | Subskill a carregar |
|------|-------------------|
| Medicina (imunologia, fisiologia, bioquímica, microbiologia, anatomia, farmacologia, fisiopatologia, semiologia, clínica médica) | `compendio-medicina` (que roteia para `compendio-medicina-basica` ou `compendio-medicina-clinica`) |
| Investimentos, finanças, economia aplicada | `compendio-investimentos` |
| Inteligência Artificial, machine learning, LLMs | `compendio-ia` |
| Filosofia, epistemologia, metafísica, ética, lógica | `compendio-filosofia` |
| Física, mecânica, termodinâmica, eletromagnetismo, quântica, relatividade | `compendio-fisica` |
| Área nova sem subskill | Usar esta skill e propor criação da subskill ao final |

## Protocolo de abertura de sessão

Ao iniciar sem tarefa direta:
1. Ler `compêndios/compendio_estado.txt` — pendências e histórico.
2. Ler `compêndios/compendio_mapa.txt` — áreas já cobertas.
3. Se houver dívida em `_docs/DEBT.md`, informar antes de prosseguir.

## Pré-geração

Antes de gerar compêndio de área novo, perguntar (via AskUserQuestion):
- Qual é o ponto de partida atual (zero, superficial, prévio específico)?
- Há algum recorte temático relevante, ou cobre o campo inteiro?

Nunca perguntar sobre formato.

## Formato

Cada compêndio de área é um arquivo HTML seguindo o `template-v2-spec.md` (`_docs/template-v2-spec.md`).
**Ler o template-v2-spec.md antes de criar qualquer HTML novo.**
A subskill de área define o que adaptar ou omitir do template.

**A referência é sempre o `template-v2-spec.md` — nunca um arquivo HTML específico.** O spec evolui; um compêndio existente pode estar desatualizado em relação a ele. Ao usar um compêndio existente como base estrutural (copiar e editar), verificar se ele reflete o spec atual antes de replicar seus padrões — se divergir, seguir o spec, não o arquivo antigo.

**Dois níveis:**
- **Arquivo-pai** (área): cobre o campo inteiro.
- **Arquivo-filho** (subárea): aprofundamento de uma subdivisão com literatura e questões próprias suficientes. Criar somente quando justificado.

## Estrutura do arquivo-pai (ordem obrigatória)

1. Cabeçalho (`doc-header`): título, `doc-meta`, chips (tempo de leitura, última revisão).
2. Pergunta motivadora (`.pergunta`): uma frase que captura o problema central do campo.
3. Painel de dependências (`.dep-panel`): obrigatório mesmo no arquivo-pai (ver `template-v2-spec.md`). Num arquivo-pai "partida zero" (sem pré-requisito real), as colunas "Este compêndio usa" e "Leia antes se necessário" podem ficar vazias/com nota explícita de ausência — a seção continua presente. A coluna "Materiais que dependem deste" lista os arquivos-filhos e compêndios de mecanismo que pressupõem este mapa (ex.: os já cross-linkados no corpo do texto).
4. O que essa área estuda: definição formal, escopo, limites, distinção com campos adjacentes.
5. Mapa do campo: subdivisões principais com parágrafo descritivo cada. Cards (`.subarea-grid`) para visão rápida; prosa para profundidade. Links para arquivos-filhos onde existirem.
6. Contexto histórico: quando e por que o campo surgiu, marcos fundadores, viragens paradigmáticas. Usar `.hist` para marcos pontuais; prosa para desenvolvimento.
7. Contexto brasileiro: como o campo se desenvolveu/aplica no Brasil. Omitir se irrelevante.
8. Questões centrais: 5–10 perguntas abertas que o campo tenta responder. Não respostas — perguntas genuínas.
9. Ferramentas e métodos: como o campo produz conhecimento. Com densidade real, não apenas listagem.
10. Conexões com outros campos. Usar `a.cross-link` para linkar compêndios existentes.
11. Controvérsias ativas (`.controversia`): disputas genuínas com as duas posições representadas. Nunca resolver artificialmente.
12. Referências anotadas em camadas: "Ponto de entrada" → "Aprofundamento" → "Consulta especializada". Cada referência com tipo, título, autor, ano e anotação justificando a presença.

## Profundidade

- Cada seção deve ter substância real — não apenas nomear conceitos, mas desenvolvê-los.
- Conceitos que têm compêndio próprio em `medicina/` ou outra área: linkar via `a.cross-link`, não reexplicar.
- Referências externas são obrigatórias — o compêndio situa e aprofunda, mas indica onde ir para mais.
- Não há critério de parada por brevidade. O critério é: o campo foi coberto com honestidade intelectual?

## Didática

Exaustividade e didática não competem — devem ser buscadas em harmonia. Cobrir o campo por inteiro não justifica prosa que empilha várias teorias, autores ou entidades paralelas na mesma frase corrida (sinal de alerta: ≥3 entidades nomeadas num único parágrafo, cada uma com definição+crítica, sem transição). Preferir um parágrafo por ideia, com o nome em negrito no início — padrão que já funciona bem em "Ferramentas e métodos". Isso vale mesmo quando existe uma `.data-table` cobrindo o mesmo conteúdo: tabela e prosa cumprem papéis diferentes (tabela = comparação rápida; prosa = uma ideia de cada vez), uma não substitui a outra. Ao revisar um compêndio existente, auditar esse padrão proativamente como parte da revisão — não só ao criar um novo.

## Fluxo de trabalho

1. Identificar área → carregar subskill correspondente.
2. Consultar `compêndios/compendio_estado.txt` e `compêndios/compendio_mapa.txt`.
3. Ler `_docs/template-v2-spec.md` + SKILL.md da subskill antes de escrever qualquer HTML.
4. Gerar HTML na subpasta temática em kebab-case dentro de `compêndios/`.
5. **Buscar imagens pertinentes — passo obrigatório, não opcional:** para cada conceito com correspondente visual plausível (anatômico, radiológico, morfológico, diagramático), tentar ativamente localizar prancha via a hierarquia de `_docs/template-v2-spec.md` ("Fontes de imagens": OpenStax > Gray's > Blausen) e o método Wikimedia/Claude in Chrome documentado ali (navigate+get_page_text na página `File:`, hash MD5 para URL direta, navigate+screenshot para confirmar). Só pular uma prancha e registrar a ausência em `_docs/DEBT.md` depois de uma busca real ter sido tentada e não ter encontrado imagem adequada — nunca pular por omissão/pressa.
6. Verificação bash obrigatória após qualquer escrita de HTML:
   - (a) fecha com `</body></html>`
   - (b) `wc -l` compatível com o esperado
   - (c) sem `const const` / `var var`
   - (d) acentuação PT-BR intacta: `grep -c "ã\|ç\|é" > 0`
   - (e) sem artefatos: `grep -iw "placeholder\|TODO\|FIXME\|debug\|rascunho"` vazio
7. Verificação visual (novos arquivos e reescritas ≥30%): abrir no Chrome via Claude in Chrome.
8. Atualizar `compêndios/compendio_mapa.txt` na mesma operação.
9. Registrar em `_docs/DEBT.md` toda inconsistência não corrigida.
10. GitHub: lembrar o usuário de rodar `push.bat` na raiz.

## Eficiência operacional

- Edit: nunca >~150 linhas por bloco `new_string`. Backup antes de editar HTML.
- Write: arquivo novo ou reescrita completa <300 linhas.
- Python: conteúdo com acentos PT-BR. Nunca `echo` ou heredoc bash.
- HTML novo >300 linhas: Write estrutura inicial → verificar → Edit por seções → verificar.
- Leitura seletiva: `grep -n` para localizar âncora antes de Read com offset/limit.
- Verificação preditiva: antes de Edit >80 linhas, calcular linhas esperadas. Após o Edit, `wc -l` e comparar.

## Modo Anki (opcional)

Qualquer compêndio de área pode receber sessão de revisão com questões (Anki), mediante
pedido explícito do usuário — não é etapa automática de fechamento nem exclusividade de
outra skill. Procedimento completo (Fase 1 triagem por múltipla escolha; Fase 2
aprofundamento discursivo nos erros; registro em `anki/`): ver seção "Modo Anki" em
`mecanismo/SKILL.md`.

## Checklist antes de fechar o compêndio de área

Vale tanto para gerar um compêndio novo quanto para revisar um existente — ao revisar, reconferir proativamente todos os itens abaixo, sem esperar que o usuário peça (mesmo espírito da "Auditoria visual proativa" em instrucoes-projeto.txt, aplicado ao conteúdo, não só ao visual).

- [ ] A pergunta motivadora está desenvolvida ao longo do texto?
- [ ] Painel de dependências presente (mesmo que com colunas vazias/nota explícita num arquivo-pai partida-zero)?
- [ ] Cada subárea tem profundidade real, não apenas uma frase? Conferir cada card do "Mapa do campo" contra o corpo do texto: todo conceito nomeado no card (não só o card como um todo) precisa ter desenvolvimento correspondente — um card pode prometer 4 conceitos e desenvolver só 2, o que já falha este item mesmo com o restante do compêndio bem coberto.
- [ ] As referências têm anotação justificando sua presença?
- [ ] As controvérsias ativas têm as duas posições representadas sem resolução artificial?
- [ ] Links `cross-link` para compêndios existentes inseridos onde pertinente?
- [ ] Campo "Última revisão" atualizado?
- [ ] `compêndios/compendio_mapa.txt` e `_docs/DEBT.md` atualizados?
- [ ] Nenhum parágrafo empilha 3+ teorias/entidades paralelas sem transição (um parágrafo por ideia)?
- [ ] Busca de imagens efetivamente tentada para os conceitos com correspondente visual plausível — não apenas pulada por padrão?

## O que não fazer

- Não ser superficial — o compêndio de área tem profundidade real, não apenas orientação.
- Não iniciar modo Anki sem pedido explícito do usuário — é opcional, não etapa automática de fechamento.
- Não criar arquivo-filho sem justificativa clara de complexidade própria.
- Não resolver artificialmente controvérsias ativas.
- Não omitir referências por medo de recomendar material longo — o leitor precisa saber o que existe.

## Encerramento de sessão

Ao final de sessão substantiva, chamar a skill `autocritica-sessao`.
Sinal: "terminamos", "pode fechar", "acabou", "sessão encerrada".
