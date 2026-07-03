---
name: autocritica-sessao
description: "Executa autocrítica pós-sessão e aplica melhorias em instrucoes-projeto.txt. Ativar quando o usuário disser \"terminamos\", \"pode fechar\", \"acabou\" ou perguntar sobre melhorias ao final de uma sessão de estudo. Também cobre avaliação de fusão/desmembramento entre projetos Cowork (incluindo áreas já existentes que cresceram demais) e onboarding de projeto Cowork novo — ativar quando o usuário pedir para revisar a estrutura dos projetos Cowork, perguntar se vale fundir ou desmembrar algo, ou começar um projeto novo descrevendo uma ideia pela primeira vez."
---

Descrição
Executa uma passagem crítica sobre o que aconteceu na sessão atual e recomenda melhorias das instruções, focando em dar a melhor resposta possível para o objetivo dado no começo das instruções. Pode ser identificação de funções não usadas ou edição do texto das instruções. Deve ser chamada ao final de qualquer sessão de trabalho — especialmente após geração de HTML, revisão ou modos de estudo.

Gatilho
Ativar quando o usuário disser "terminamos", "pode fechar", "acabou" ou similar. Também ativar se o usuário perguntar "tem alguma melhoria?" ao final de uma sessão. Também ativar, fora do fechamento de sessão, quando o usuário pedir avaliação da fronteira entre projetos Cowork — ex.: "revê a estrutura dos projetos Cowork", "vale fundir X com Y?", "organize os projetos hierarquicamente" (ver seção "Lente entre-projetos Cowork" abaixo). Também ativar no início de um projeto Cowork novo — pasta com poucos ou nenhum arquivo, sem CLAUDE.md/instrucoes-projeto.md próprio, e o usuário descrevendo uma ideia ou objetivo pela primeira vez (ver "Abertura de projeto Cowork novo" abaixo) — antes de gerar qualquer conteúdo ou escrever a instrução do projeto.

Abertura de projeto Cowork novo — antes de qualquer conteúdo
Quando a sessão ocorre numa pasta Cowork que aparenta ser um projeto novo e o usuário descreve uma ideia/objetivo pela primeira vez, aplicar a "Lente entre-projetos Cowork" (ver abaixo) em modo completo ANTES de gerar qualquer arquivo de conteúdo ou de instrução. Isso depende de o projeto novo ter acesso (mount) à raiz Cowork ou às pastas-irmãs relevantes — sem esse acesso, avaliar com base só no que o usuário descrever verbalmente e sinalizar a limitação, sem inventar conteúdo de projetos que não pode ler.
Passos: (1) listar as pastas-irmãs em Cowork/ e ler o arquivo de instruções de cada uma relevante ao domínio descrito; (2) aplicar os três critérios da "Lente entre-projetos Cowork" para decidir se a ideia nova se encaixa como skill-pai/subskill de um projeto já existente (Base de estudos ou outro) ou justifica projeto separado; (3) apresentar a avaliação em prosa (o que a ideia é, com o que se parece, por que fundir ou separar) e só depois perguntar a decisão via AskUserQuestion — nunca pular direto para a pergunta técnica (mesmo padrão do Passo 2.5 abaixo).
Se a decisão for fundir: não criar arquivo de instruções no projeto novo. Se o destino for Base de estudos, seguir "Criação de skill-pai nova"/"Criação de subskill nova" de `instrucoes-projeto.txt` (a ideia vira skill-pai/subskill, com SKILL.md carregado sob demanda). Se o destino for outro projeto Cowork sem sistema de skills próprio, integrar diretamente na estrutura de pastas e no arquivo de instruções já existente desse projeto — sem inventar uma hierarquia de skill que ele não usa.
Se a decisão for manter separado: propor uma instrução inicial de projeto (CLAUDE.md ou instrucoes-projeto.md) coerente com o padrão de nível de detalhe e formato já observado nos projetos-irmãos existentes — não um texto genérico do zero. Perguntar objetivo, formato de entrega esperado e convenções específicas do domínio antes de escrever a versão completa; apresentar o rascunho para aprovação antes de salvar.
Nunca escrever o arquivo de instruções do projeto novo sem antes ter feito essa avaliação, mesmo que o usuário já tenha nomeado a pasta e pareça pronto para começar direto.

Protocolo

Passo 1 — Avaliar as instruções, o estado atual do projeto e a sessão em relação ao objetivo
Reler o propósito do modo de trabalho ativado na sessão (compendio/mecanismo/sistema/prova — ver "A distinção principal" no início de instrucoes-projeto.txt) e revisar mentalmente o que a sessão de fato produziu ou tentou produzir. Perguntar: as instruções atuais permitiriam atingir esse propósito da melhor forma possível?

Levantar também o estado ATUAL do projeto relevante à sessão — não só o texto das instruções: subskills existentes na área tocada, ferramentas disponíveis (subagentes via Agent tool, MCPs conectados na sessão, scripts como empacotar_skills.py), arquivos irmãos na mesma subpasta, itens pertinentes em DEBT.md. Comparar esse estado real com o que a sessão efetivamente usou — isso é distinto de checar o texto das instruções: um recurso pode existir no projeto e nunca ter sido mencionado em instrucoes-projeto.txt.

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
Fronteira entre projetos Cowork: o que esta sessão criou ou tocou deveria ter sido roteado para outra pasta Cowork (ou vice-versa), existe uma pasta Cowork irmã com propósito redundante ao que esta sessão cobriu, ou a área tocada já cresceu o suficiente para justificar um desmembramento (nova subskill-agrupadora, skill-pai nova, ou projeto Cowork separado)? (ver "Lente entre-projetos Cowork" abaixo)

Auditoria estrutural — leve por padrão, completa sob pedido
Em toda sessão, mesmo sem pedido explícito: checar se os arquivos de controle relevantes à ÁREA TOCADA nesta sessão — contagens em `instrucoes-projeto.txt`, entradas pertinentes em `_docs/DEBT.md`, `compêndios/compendio_mapa.txt`/`compendio_estado.txt`, `sistemas/sistema_mapa.txt`/`sistema_estado.txt`, `_docs/project_estado.md`/`project_mapa_materiais.md`, seção "Material existente no projeto" da subskill carregada — ainda refletem o estado real do disco. Usar `ls`/`find`/Grep pontuais (arquivo citado existe? contagem bate?). Este escopo leve é obrigatório em toda sessão, mesmo quando nenhuma melhoria de conteúdo for encontrada.
Uma varredura COMPLETA do projeto (todos os SKILL.md, todos os mapas/estados, toda a memória) só roda mediante pedido explícito do usuário ("revise tudo", "sem pontas soltas" ou equivalente) — não é etapa automática de todo fechamento, por custo de tokens. Ao rodar a varredura completa: despachar um subagente por SKILL.md ou por subpasta de meta-documentação (mesma lógica de "Subagentes para auditoria em lote" em `instrucoes-projeto.txt`, hoje escrita só para compêndios HTML — vale também para arquivos de instrução/skill), cada um retornando um relatório curto para consolidar antes de aplicar correções.

Padrões entre sessões (memória)
Ler `MEMORY.md` e os arquivos `feedback_*`/`project_*` relevantes à área tocada nesta sessão. Se o mesmo TIPO de gap (não uma correção pontual específica já registrada — isso é coberto por "Reincidência de correção" em `instrucoes-projeto.txt`) aparecer em ≥2 registros de memória de sessões diferentes, tratar como sinal de requisito estrutural novo — propor no Passo 2.5 como melhoria de instrução/skill, não apenas anotar de novo em memória.

Lente entre-projetos Cowork — bidirecional (fundir e desmembrar), leve por padrão, completa sob pedido
Toda pasta Cowork enxerga as pastas-irmãs sob a mesma raiz (Cowork/) pelo mesmo mount desta sessão — não é preciso trocar de projeto para ler o arquivo de instruções ou o conteúdo de outro. Isso torna possível avaliar, de dentro de qualquer projeto, se a fronteira entre projetos Cowork está bem desenhada — nos dois sentidos: projetos/áreas que deveriam se fundir, e projetos/áreas que já cresceram o suficiente para justificar um desmembramento. Crescimento e aumento de complexidade são a tendência natural de qualquer área ativa — o que hoje é uma subskill enxuta pode, com o tempo, acumular volume ou heterogeneidade de propósito a ponto de merecer uma subskill-agrupadora nova, uma skill-pai nova, ou até um projeto Cowork separado (precedente já ocorrido: `compendio-medicina` foi inserida entre `compendio` e as subskills de medicina quando a amplitude da área cresceu).
Leve (todo fechamento de sessão): dois sinais, não só um. Fusão — esta sessão criou um domínio, skill-pai ou subskill nova, ou o usuário mencionou/trabalhou com conteúdo que lembra o propósito de outra pasta Cowork? Desmembramento — a subskill/skill-pai/área tocada nesta sessão já acumula volume ou heterogeneidade de propósito (SKILL.md longo cobrindo sub-temas cada vez mais distintos, subpasta com muitos arquivos sem subdivisão, ou instrucoes-projeto.txt ganhando regras específicas demais de uma área — ver bullet "Crescimento estrutural desorganizado" acima) a ponto de já valer a pena dividir? Em ambos os casos, sinalizar a possibilidade em uma frase — não abrir arquivos de outra pasta nem propor fusão/desmembramento em detalhe sem pedido explícito.
Completa (só sob pedido explícito — ver Gatilho): listar as pastas-irmãs em Cowork/ (find/ls, não abrir arquivo por arquivo sem necessidade) e, para o sentido de fusão, ler o arquivo de instruções de cada uma (CLAUDE.md ou instrucoes-projeto.md/.txt equivalente); para o sentido de desmembramento, revisar as subskills/skill-pais/projetos já maduros do próprio Base de estudos (contagem de arquivos em compendio_mapa.txt/sistema_mapa.txt/prova_mapa.txt, tamanho e heterogeneidade dos SKILL.md em _docs/skills-export/). Aplicar os mesmos três critérios nos dois sentidos: (a) a área ainda representa UM propósito coerente e comparável ao paradigma de uma skill-pai existente (compendio/mecanismo/sistema/prova), ou já cobre 2+ propósitos crescentemente distintos (fusão) / um deliverable pontual-dados ao vivo de terceiro que nunca se encaixou nesse paradigma (fusão) / uma única subskill que na prática já cobre sub-domínios que mereceriam subskills-folha próprias (desmembramento)? (b) o formato de saída é compatível entre as partes (HTML autônomo de estudo vs. docx/pptx/planilha/script)? (c) a mudança de fato reduz o que fica carregado sempre por mensagem, ou só reorganiza sem ganho? Fundir só compensa quando o domínio vira skill-pai/subskill nova (detalhe carregado sob demanda via SKILL.md), nunca quando o conteúdo entraria direto em instrucoes-projeto.txt (sempre carregado). Desmembrar só compensa quando move regra hiper-específica do corpo sempre-carregado para um SKILL.md carregado sob demanda, ou quando o SKILL.md de uma subskill ficou grande/heterogêneo demais para carregar de uma vez só — nunca quando só cria mais pastas sem mudar o que é lido a cada mensagem.
Para cada área avaliada, recomendar Fundir (como skill-pai ou subskill nova, seguindo "Criação de skill-pai nova"/"Criação de subskill nova" em instrucoes-projeto.txt), Desmembrar (mesmo processo, na direção inversa: nova subskill-agrupadora/subskill-folha a partir de uma área que cresceu, ou um projeto Cowork novo a partir de uma parte que se tornou heterogênea demais para o projeto atual) ou Manter como está, com justificativa curta — nunca decidir por conta própria nem executar fusão/desmembramento/remoção de arquivos sem confirmação explícita do usuário via AskUserQuestion (mesmo princípio de instrucoes-projeto.txt para deleção fora do projeto atual). A recomendação em si não edita instrucoes-projeto.txt — se aprovada, dispara o processo completo de "Criação de skill-pai nova"/"Criação de subskill nova" como tarefa separada, não um item do Passo 3 desta skill.
(Incidente que originou esta seção: sessão de 2026-07-03 identificou o projeto Cowork "Estudo para prova" como redundante com a skill `prova` já existente — conteúdo migrado, pasta de origem removida mediante confirmação do usuário. Na mesma sessão, o usuário pediu avaliação de todos os projetos Cowork quanto a fundir ou desmembrar, que essa lente fosse incorporada à autocritica-sessao para uso recorrente, e — sinalizando que crescimento tende a aumentar complexidade — que a mesma lente também vigiasse projetos/áreas já existentes quanto à necessidade futura de desmembramento, não só triasse chegadas novas.)

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

Se algum SKILL.md foi editado (autocritica-sessao ou outra skill): lembrar o usuário de reempacotar com empacotar_skills.py e reinstalar a skill correspondente — nomeada explicitamente (ver Passo 4).

Passo 4 — Reportar ao usuário
O checklist de pendências abaixo (recopiar instruções / reempacotar skill / push.bat) não é exclusivo desta skill: `_docs/operacoes-bash.md` (seção "GitHub") torna esse checklist obrigatório em QUALQUER sessão que edite `instrucoes-projeto.txt`, um `SKILL.md` ou `template-v2-spec.md`/`operacoes-bash.md`, mesmo sem o gatilho de `autocritica-sessao`. Esta seção define o formato exato a seguir nos dois casos.
Formato obrigatório:
**Autocrítica da sessão — [data]**

Objetivo das instruções: [objetivo declarado]
Falhas de execução desta sessão: [lista curta de desvios do processo prescrito nesta sessão — verificações puladas, workarounds, subskill que deveria ter sido carregada e não foi — ou "nenhuma"; reportar sempre esta linha, mesmo quando nenhuma melhoria de instrução resultar disso]
Auditoria estrutural leve: [achado de divergência entre arquivo de controle e disco, ou "sem divergências"; reportar sempre esta linha — é obrigatória em toda sessão por definição (ver Passo 1), então precisa aparecer mesmo quando o resultado é limpo]
Sinal entre-projetos (leve): [sinalização de possível fusão ou desmembramento, ou "nenhum sinal"; reportar sempre esta linha pelo mesmo motivo — os dois sinais (fusão/desmembramento) são obrigatórios em todo fechamento por definição (ver "Lente entre-projetos Cowork")]
Melhorias aplicadas: N

1. [Ponto de melhoria] → [O que mudou]
2. ...

Para cada arquivo efetivamente editado nesta sessão, nomeá-lo explicitamente — ex.: "Atualizado em `_docs/instrucoes-projeto.txt`" e/ou "Atualizado em `_docs/operacoes-bash.md`" e/ou "Atualizado em `compendio/SKILL.md`" — nunca fixar a frase em instrucoes-projeto.txt quando o destino real foi outro arquivo (ver Passo 2.5 para a classificação de destino). Após reportar, chamar `mcp__cowork__present_files` com o(s) caminho(s) do(s) arquivo(s) editado(s) para que apareçam como cards no painel lateral do Cowork — instrucoes-projeto.txt é o único que o usuário copia direto para Project Instructions; os demais (operacoes-bash.md, template-v2-spec.md, SKILL.md) já estão salvos no lugar certo, o card serve para conferência. NUNCA colar o conteúdo de nenhum arquivo (inteiro ou trecho longo) em bloco de texto na resposta do chat — nem "para facilitar", nem porque o arquivo é curto.
Se nenhuma melhoria for encontrada: reportar explicitamente "Nenhuma melhoria identificada — instruções sem alteração."

Antes de montar o checklist, reconstruir EXATAMENTE o que a sessão tocou a partir do próprio histórico de tool calls desta sessão (arquivos lidos/editados/criados) — NÃO rodar `git status --short`: comandos git falham por completo neste sandbox (ver _docs/operacoes-bash.md, seção "Verificação bash obrigatória"), então a chamada seria desperdiçada. Nunca listar pendências de memória (sessões anteriores) como se fossem desta sessão. Regras para o item de reempacotamento:
- `instrucoes-projeto.txt` é Project Instructions, NÃO uma skill — editá-lo nunca gera reempacotamento. Sua única pendência é o usuário copiá-lo nas Project Instructions.
- Só incluir o item de reempacotar/reinstalar se algum `_docs/skills-export/<skill>/SKILL.md` foi editado NESTA sessão (confirmar pelo histórico de edições da própria sessão, não por git).
- Quando incluir, NOMEAR cada skill afetada (ex.: `compendio`, `autocritica-sessao`) — nunca escrever "skills modificadas" genericamente. Se esta sessão editou o próprio SKILL.md da autocritica-sessao, incluí-la nominalmente.
- Não confundir pendências antigas de reempacotamento (de sessões anteriores, no DEBT.md) com o que ESTA sessão modificou — se mencionar as antigas, rotulá-las como "pendência anterior (não desta sessão)".

Sempre encerrar com checklist de pendências do usuário. Modelo (incluir apenas os itens que se aplicam à sessão atual, com as skills nomeadas):
- [ ] Copiar instrucoes-projeto.txt nas configurações do projeto (Project Instructions)
- [ ] Reempacotar e reinstalar as skills editadas NESTA sessão — nomear cada uma (ex.: `autocritica-sessao`): `python empacotar_skills.py` em `_docs/skills-export/` + Settings > Capabilities > Skills. (Omitir este item inteiro se nenhum SKILL.md foi editado na sessão.)
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
Fusão ou desmembramento de projeto/área Cowork (ver "Lente entre-projetos Cowork") é sempre recomendação, nunca execução automática — apagar, mover ou reescrever arquivos de outra pasta Cowork exige confirmação explícita do usuário via AskUserQuestion antes de qualquer ação, mesmo quando a redundância ou o crescimento parecerem óbvios.