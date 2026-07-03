---
name: autocritica-sessao
description: "Subskill de autocritica-cowork, escopada ao projeto Base de estudos. Executa autocrítica pós-sessão e aplica melhorias em instrucoes-projeto.txt. Carregada pela skill-pai autocritica-cowork quando a sessão pertence a este projeto (compêndios, mecanismos, sistemas, provas); também ativa diretamente quando o usuário disser \"terminamos\", \"pode fechar\", \"acabou\" ou perguntar sobre melhorias ao final de uma sessão já claramente dentro de Base de estudos. Avaliação de fronteira entre projetos Cowork (fundir/desmembrar) e onboarding de projeto Cowork novo são responsabilidade da skill-pai autocritica-cowork, não desta subskill."
---

Descrição
Executa uma passagem crítica sobre o que aconteceu na sessão atual e recomenda melhorias das instruções, focando em dar a melhor resposta possível para o objetivo dado no começo das instruções. Pode ser identificação de funções não usadas ou edição do texto das instruções. Deve ser chamada ao final de qualquer sessão de trabalho — especialmente após geração de HTML, revisão ou modos de estudo. É subskill de `autocritica-cowork`: quando essa skill-pai identifica que a sessão pertence a Base de estudos, carrega esta subskill para a auditoria profunda específica do projeto. Avaliação de fronteira entre projetos Cowork e abertura de projeto novo não são mais escopo desta skill — ver `autocritica-cowork`.

Gatilho
Ativar quando o usuário disser "terminamos", "pode fechar", "acabou" ou similar. Também ativar se o usuário perguntar "tem alguma melhoria?" ao final de uma sessão. Também pode ser carregada diretamente pela skill-pai `autocritica-cowork` ao fechar qualquer sessão que pertença a este projeto.

Protocolo

Passo 1 — Avaliar as instruções, o estado atual do projeto e a sessão em relação ao objetivo
Reler o propósito do modo de trabalho ativado na sessão (compendio/mecanismo/sistema/prova — ver "A distinção principal" no início de instrucoes-projeto.txt) e revisar mentalmente o que a sessão de fato produziu ou tentou produzir. Perguntar: as instruções atuais permitiriam atingir esse propósito da melhor forma possível?

Levantar também o estado ATUAL do projeto relevante à sessão — não só o texto das instruções: subskills existentes na área tocada, ferramentas disponíveis (subagentes via Agent tool, MCPs conectados na sessão), arquivos irmãos na mesma subpasta, itens pertinentes em DEBT.md. Comparar esse estado real com o que a sessão efetivamente usou — isso é distinto de checar o texto das instruções: um recurso pode existir no projeto e nunca ter sido mencionado em instrucoes-projeto.txt.

Inspecionar também o próprio SKILL.md da autocritica-sessao (localizado em _docs/skills-export/autocritica-sessao/SKILL.md): o protocolo da skill em si tem gaps? Alguma etapa foi pulada, precisou de correção manual, ou gerou fricção nesta sessão?

Para cada ponto de melhoria identificado, responder:

O que aconteceu ou deixou de acontecer? (fato objetivo)
Por que aconteceu? (instrução ausente, ambígua, mal posicionada, função não usada, ou recurso do projeto disponível mas não acionado?)
Já está nas instruções? (verificar via bash)
O que mudar? (nova regra, reformulação, remoção de função não usada, reposicionamento, ou uso mais proativo de um recurso já existente?)

Categorias a inspecionar obrigatoriamente:

Funções/seções não usadas: havia partes das instruções que nunca foram acionadas? São necessárias para o objetivo?
Ferramentas e recursos do projeto não usados: havia subagente, MCP, subskill, script ou arquivo já disponível no projeto que teria melhorado a sessão e não foi acionado? (checar contra o estado atual do projeto, não de memória)
Texto ambíguo ou incompleto: alguma instrução gerou comportamento inesperado ou precisou de correção manual?
Etapas puladas ou fora de ordem: o fluxo definido foi seguido? Se não, por quê?
Alinhamento com o objetivo: cada regra nas instruções serve diretamente ao propósito do modo de trabalho ativado?
Crescimento estrutural desorganizado: alguma regra em instrucoes-projeto.txt é específica demais para uma skill/subárea pontual (só relevante em certos momentos, não em toda mensagem) e deveria ter migrado para o SKILL.md correspondente em vez de continuar acumulada ali? O arquivo ganhou redundância, repetição entre seções, ou perda de enxutez a ponto de prejudicar a eficiência de leitura no início de cada sessão?
Princípio de entrega: o usuário teve que pedir melhorias após receber o material? Se sim, o que nas instruções deveria garantir isso proativamente?
Qualquer fricção que exigiu workaround manual
Auditoria estrutural leve: os arquivos de controle referenciados ou tocados nesta sessão (ver detalhamento abaixo) batem com o estado real do disco?
Padrões entre sessões (memória): o tipo de gap encontrado nesta sessão já apareceu em sessões anteriores, segundo os arquivos de memória? (ver detalhamento abaixo)

Fronteira entre projetos Cowork (fundir/desmembrar/abertura de projeto novo) não é mais avaliada por esta subskill — é responsabilidade da skill-pai `autocritica-cowork`, que executa essa avaliação sempre, independentemente de esta subskill ter sido carregada.

Auditoria estrutural — leve por padrão, completa sob pedido
Em toda sessão, mesmo sem pedido explícito: checar se os arquivos de controle relevantes à ÁREA TOCADA nesta sessão — contagens em `instrucoes-projeto.txt`, entradas pertinentes em `_docs/DEBT.md`, `compêndios/compendio_mapa.txt`/`compendio_estado.txt`, `sistemas/sistema_mapa.txt`/`sistema_estado.txt`, `_docs/project_estado.md`/`project_mapa_materiais.md`, seção "Material existente no projeto" da subskill carregada — ainda refletem o estado real do disco. Usar `ls`/`find`/Grep pontuais (arquivo citado existe? contagem bate?). Este escopo leve é obrigatório em toda sessão, mesmo quando nenhuma melhoria de conteúdo for encontrada.
Uma varredura COMPLETA do projeto (todos os SKILL.md, todos os mapas/estados, toda a memória) só roda mediante pedido explícito do usuário ("revise tudo", "sem pontas soltas" ou equivalente) — não é etapa automática de todo fechamento, por custo de tokens. Ao rodar a varredura completa: despachar um subagente por SKILL.md ou por subpasta de meta-documentação (mesma lógica de "Subagentes para auditoria em lote" em `instrucoes-projeto.txt`, hoje escrita só para compêndios HTML — vale também para arquivos de instrução/skill), cada um retornando um relatório curto para consolidar antes de aplicar correções.

Padrões entre sessões (memória)
Ler `MEMORY.md` e os arquivos `feedback_*`/`project_*` relevantes à área tocada nesta sessão. Se o mesmo TIPO de gap (não uma correção pontual específica já registrada — isso é coberto por "Reincidência de correção" em `instrucoes-projeto.txt`) aparecer em ≥2 registros de memória de sessões diferentes, tratar como sinal de requisito estrutural novo — propor no Passo 2.5 como melhoria de instrução/skill, não apenas anotar de novo em memória.

Passo 2 — Verificar o que já está nas instruções
Usar a ferramenta Grep diretamente no caminho Windows real do arquivo (ex.: C:\...\_docs\instrucoes-projeto.txt) — não bash `find`/`grep`. Motivo: bash lê essa pasta pelo cache do OneDrive/sandbox, que pode retornar conteúdo desatualizado ou sinalizar falsamente o arquivo como binário (confirmado numa sessão real: `grep` via bash reportou "binary file matches" em vez do texto, no mesmo arquivo que a ferramenta Grep leu normalmente). Mesma razão pela qual o Passo 3 já usa Read/Edit em vez de bash para editar o arquivo — aplicar aqui também.
Grep { pattern: "TERMO_RELEVANTE", path: "<caminho completo do instrucoes-projeto.txt>" }

Se já está e foi ignorado: a instrução é ambígua ou está mal posicionada → reformular ou mover.
Se não está: adicionar.
Se está mas é redundante com outra regra: consolidar.

Passo 2.5 — Classificar destino e apresentar mudanças para aprovação
Para cada melhoria identificada, classificar ANTES de propor:
(a) Dispatch de skills, protocolo de abertura de sessão, ou regra cross-cutting que precisa estar carregada em toda mensagem → destino: instrucoes-projeto.txt
(b) Mecânica de edição de arquivo/bash, verificação pós-escrita de HTML, workflows de arquivamento (relevante só nesses momentos específicos, não em toda mensagem) → destino: _docs/operacoes-bash.md
(c) Conhecimento do artefato (padrões de HTML, CSS, comportamento de sidebar, estrutura de seções) → destino: skill relevante ou template-v2-spec.md
(d) Regra hoje em instrucoes-projeto.txt por acúmulo histórico, mas específica de uma área/skill e não necessária em toda mensagem → destino: mover para o SKILL.md da área correspondente (remover de instrucoes-projeto.txt ao mover, não duplicar em ambos)

ANTES do AskUserQuestion: apresentar cada melhoria em prosa, numerada, com "Causa:" (por que aconteceu) e "Consequência:" (o efeito de não corrigir) explícitos — não pular direto para a pergunta técnica.
OBRIGATÓRIO em seguida: apresentar todas as mudanças propostas ao usuário via AskUserQuestion (multiSelect: true), com uma opção por mudança. Descrever em cada opção: o que aconteceu (fato), o que vai mudar, e em qual arquivo será aplicado.
Aplicar SOMENTE as mudanças aprovadas. Se nenhuma for aprovada, encerrar sem alterar arquivos.

Passo 3 — Aplicar mudanças aprovadas
A mesma lógica Read (para obter o texto exato) + Edit tool diretamente no caminho do usuário — nunca python3 via bash para ler ou verificar — vale para QUALQUER arquivo de destino classificado no Passo 2.5: instrucoes-projeto.txt, _docs/operacoes-bash.md, _docs/template-v2-spec.md, ou o SKILL.md de qualquer skill (autocritica-sessao ou outra, ex. compendio/SKILL.md). Motivo: essa pasta é sincronizada via OneDrive e o bash pode ler/escrever uma versão desatualizada ou cortada de qualquer arquivo nela (confirmado numa sessão real com instrucoes-projeto.txt) — o Edit tool não passa por esse cache. Reservar python3+bash apenas se o arquivo já tiver passado de ~200 linhas e a edição for grande demais para o Edit tool.

Verificar após cada mudança usando Read (não bash tail/wc -l, pelo mesmo motivo do cache do OneDrive):
Read com offset perto do fim do arquivo para confirmar que o texto novo está lá e nada foi cortado.

Se algum SKILL.md foi editado (autocritica-sessao ou outra skill): empacotar a skill correspondente — nomeada explicitamente — e apresentá-la via `mcp__cowork__present_files` como parte do Passo 4, para o usuário instalar com um clique em "Save skill".

Passo 4 — Reportar ao usuário
O checklist de pendências abaixo (recopiar instruções / reempacotar skill / push.bat) não é exclusivo desta skill: `_docs/operacoes-bash.md` (seção "GitHub") torna esse checklist obrigatório em QUALQUER sessão que edite `instrucoes-projeto.txt`, um `SKILL.md` ou `template-v2-spec.md`/`operacoes-bash.md`, mesmo sem o gatilho de `autocritica-sessao`. Esta seção define o formato exato a seguir nos dois casos.
Formato obrigatório:
**Autocrítica da sessão — [data]**

Objetivo das instruções: [objetivo declarado]
Falhas de execução desta sessão: [lista curta de desvios do processo prescrito nesta sessão — verificações puladas, workarounds, subskill que deveria ter sido carregada e não foi — ou "nenhuma"; reportar sempre esta linha, mesmo quando nenhuma melhoria de instrução resultar disso]
Auditoria estrutural leve: [achado de divergência entre arquivo de controle e disco, ou "sem divergências"; reportar sempre esta linha — é obrigatória em toda sessão por definição (ver Passo 1), então precisa aparecer mesmo quando o resultado é limpo]
Melhorias aplicadas: N

1. [Ponto de melhoria] → [O que mudou]
2. ...

Para cada arquivo efetivamente editado nesta sessão, nomeá-lo explicitamente — ex.: "Atualizado em `_docs/instrucoes-projeto.txt`" e/ou "Atualizado em `_docs/operacoes-bash.md`" e/ou "Atualizado em `compendio/SKILL.md`" — nunca fixar a frase em instrucoes-projeto.txt quando o destino real foi outro arquivo (ver Passo 2.5 para a classificação de destino). Após reportar, chamar `mcp__cowork__present_files` com o(s) caminho(s) do(s) arquivo(s) editado(s) para que apareçam como cards no painel lateral do Cowork — instrucoes-projeto.txt é o único que o usuário copia direto para Project Instructions; os demais (operacoes-bash.md, template-v2-spec.md, SKILL.md) já estão salvos no lugar certo, o card serve para conferência. NUNCA colar o conteúdo de nenhum arquivo (inteiro ou trecho longo) em bloco de texto na resposta do chat — nem "para facilitar", nem porque o arquivo é curto.
Se nenhuma melhoria for encontrada: reportar explicitamente "Nenhuma melhoria identificada — instruções sem alteração."

Antes de montar o checklist, reconstruir EXATAMENTE o que a sessão tocou a partir do próprio histórico de tool calls desta sessão (arquivos lidos/editados/criados) — NÃO rodar `git status --short`: comandos git falham por completo neste sandbox (ver _docs/operacoes-bash.md, seção "Verificação bash obrigatória"), então a chamada seria desperdiçada. Nunca listar pendências de memória (sessões anteriores) como se fossem desta sessão. Regras para o item de empacotamento:
- `instrucoes-projeto.txt` é Project Instructions, NÃO uma skill — editá-lo nunca gera empacotamento. Sua única pendência é o usuário copiá-lo nas Project Instructions.
- Só empacotar/apresentar se algum `_docs/skills-export/<skill>/SKILL.md` foi editado NESTA sessão (confirmar pelo histórico de edições da própria sessão, não por git). Fazer isso ANTES de fechar a resposta, não deixar como pendência do usuário.
- NOMEAR cada skill afetada (ex.: `compendio`, `autocritica-sessao`) ao apresentar — nunca um card genérico sem dizer qual skill é. Se esta sessão editou o próprio SKILL.md da autocritica-sessao, empacotá-la e apresentá-la também.

Sempre encerrar com checklist de pendências do usuário. Modelo (incluir apenas os itens que se aplicam à sessão atual, com as skills nomeadas):
- [ ] Copiar instrucoes-projeto.txt nas configurações do projeto (Project Instructions)
- [ ] Clicar "Save skill" nos cards apresentados para cada skill editada NESTA sessão — nomear cada uma (ex.: `autocritica-sessao`). (Omitir este item inteiro se nenhum SKILL.md foi editado na sessão.)
- [ ] Rodar `push.bat` na raiz para sincronizar com o GitHub
Incluir apenas os itens que se aplicam à sessão atual.

Regras da skill

Nunca pular o Passo 1 mesmo que a sessão pareça ter corrido bem — melhorias sutis existem.
Nunca aplicar mudanças sem aprovação via AskUserQuestion (Passo 2.5) — sem exceções.
O foco é sempre o propósito do modo de trabalho ativado na sessão (compendio/mecanismo/sistema/prova) e a distinção principal entre eles: cada mudança deve aproximar as instruções desse propósito.
Nunca reportar "nenhuma melhoria" sem ter verificado ativamente cada categoria do Passo 1 — incluindo a checagem de ferramentas/recursos do projeto não usados, não só o texto das instruções.
Não reformular instruções que funcionaram bem só para "melhorar o estilo" — mudanças devem ter origem em gap real.
Antes do AskUserQuestion, sempre apresentar as melhorias em prosa numerada com "Causa:"/"Consequência:" explícitos (Passo 2.5) — nunca pular direto para a pergunta técnica.
Nunca colar o conteúdo de nenhum arquivo editado (instrucoes-projeto.txt, operacoes-bash.md, template-v2-spec.md ou qualquer SKILL.md) em bloco de texto no chat ao final da sessão — sempre `mcp__cowork__present_files` (ver Passo 4). Esta regra já tinha sido corrigida por feedback do usuário e reincidiu numa sessão porque só estava implícita no Passo 4; agora está redundante aqui para não depender de uma única menção.