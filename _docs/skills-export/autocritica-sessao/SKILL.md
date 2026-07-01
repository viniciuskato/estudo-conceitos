---
name: autocritica-sessao
description: "Executa autocrítica pós-sessão e aplica melhorias em instrucoes-projeto.txt. Ativar quando o usuário disser \"terminamos\", \"pode fechar\", \"acabou\" ou perguntar sobre melhorias ao final de uma sessão de estudo."
---

Descrição
Executa uma passagem crítica sobre o que aconteceu na sessão atual e recomenda melhorias das instruções, focando em dar a melhor resposta possível para o objetivo dado no começo das instruções. Pode ser identificação de funções não usadas ou edição do texto das instruções. Deve ser chamada ao final de qualquer sessão de trabalho — especialmente após geração de HTML, revisão ou modos de estudo.

Gatilho
Ativar quando o usuário disser "terminamos", "pode fechar", "acabou" ou similar. Também ativar se o usuário perguntar "tem alguma melhoria?" ao final de uma sessão.

Protocolo

Passo 1 — Avaliar as instruções em relação ao objetivo da sessão
Reler o objetivo declarado no início de instrucoes-projeto.txt. Depois revisar mentalmente o que ocorreu na sessão e perguntar: as instruções atuais permitiriam atingir esse objetivo da melhor forma possível?

Inspecionar também o próprio SKILL.md da autocritica-sessao (localizado em _docs/skills-export/autocritica-sessao/SKILL.md): o protocolo da skill em si tem gaps? Alguma etapa foi pulada, precisou de correção manual, ou gerou fricção nesta sessão?

Para cada ponto de melhoria identificado, responder:

O que aconteceu ou deixou de acontecer? (fato objetivo)
Por que aconteceu? (instrução ausente, ambígua, mal posicionada, ou função não usada?)
Já está nas instruções? (verificar via bash)
O que mudar? (nova regra, reformulação, remoção de função não usada, ou reposicionamento)

Categorias a inspecionar obrigatoriamente:

Funções/seções não usadas: havia partes das instruções que nunca foram acionadas? São necessárias para o objetivo?
Texto ambíguo ou incompleto: alguma instrução gerou comportamento inesperado ou precisou de correção manual?
Etapas puladas ou fora de ordem: o fluxo definido foi seguido? Se não, por quê?
Alinhamento com o objetivo: cada regra nas instruções serve diretamente ao objetivo declarado?
Princípio de entrega: o usuário teve que pedir melhorias após receber o material? Se sim, o que nas instruções deveria garantir isso proativamente?
Qualquer fricção que exigiu workaround manual

Passo 2 — Verificar o que já está nas instruções
Localizar o arquivo de instruções via bash (o path do session ID muda a cada sessão):
bash: find /sessions -name "instrucoes-projeto.txt" 2>/dev/null | head -1
Depois usar esse path para grep:
bash: INSTR=$(find /sessions -name "instrucoes-projeto.txt" 2>/dev/null | head -1)
grep -n "TERMO_RELEVANTE" "$INSTR"

Se já está e foi ignorado: a instrução é ambígua ou está mal posicionada → reformular ou mover.
Se não está: adicionar.
Se está mas é redundante com outra regra: consolidar.

Passo 2.5 — Classificar destino e apresentar mudanças para aprovação
Para cada melhoria identificada, classificar ANTES de propor:
(a) Regra operacional transversal (como editar arquivos, verificar integridade, workflows bash) → destino: instrucoes-projeto.txt
(b) Conhecimento do artefato (padrões de HTML, CSS, comportamento de sidebar, estrutura de seções) → destino: skill relevante ou template-v2-spec.md

ANTES do AskUserQuestion: apresentar cada melhoria em prosa, numerada, com "Causa:" (por que aconteceu) e "Consequência:" (o efeito de não corrigir) explícitos — não pular direto para a pergunta técnica.
OBRIGATÓRIO em seguida: apresentar todas as mudanças propostas ao usuário via AskUserQuestion (multiSelect: true), com uma opção por mudança. Descrever em cada opção: o que aconteceu (fato), o que vai mudar, e em qual arquivo será aplicado.
Aplicar SOMENTE as mudanças aprovadas. Se nenhuma for aprovada, encerrar sem alterar arquivos.

Passo 3 — Aplicar mudanças aprovadas
instrucoes-projeto.txt normalmente cabe bem abaixo do limite de 200 linhas do Edit tool: preferir Read (para obter o texto exato) + Edit tool diretamente no caminho do usuário (ex.: C:\...\_docs\instrucoes-projeto.txt), em vez de python3 via bash. Motivo: essa pasta é sincronizada via OneDrive e o bash pode ler uma versão desatualizada/cortada do arquivo (confirmado numa sessão real: bash reportou menos linhas do que o arquivo realmente tinha) — o Edit tool não passa por esse cache. Reservar python3+bash para esse arquivo apenas se ele já tiver passado de ~200 linhas e a edição for grande demais para o Edit tool.

Verificar após cada mudança usando Read (não bash tail/wc -l, pelo mesmo motivo do cache do OneDrive):
Read com offset perto do fim do arquivo para confirmar que o texto novo está lá e nada foi cortado.

Se o SKILL.md da autocritica-sessao também tiver mudanças aprovadas: editar via Read + Edit tool, mesma lógica acima. Lembrar o usuário de reempacotar com empacotar_skills.py e reinstalar a skill.

Passo 4 — Reportar ao usuário
Formato obrigatório:
**Autocrítica da sessão — [data]**

Objetivo das instruções: [objetivo declarado]
Melhorias aplicadas: N

1. [Ponto de melhoria] → [O que mudou]
2. ...

Instruções atualizadas em `_docs/instrucoes-projeto.txt`. Após reportar, exibir o conteúdo completo do arquivo no chat para que o usuário possa copiar diretamente nas configurações do projeto (Project Instructions) sem precisar abrir o arquivo manualmente.
Se nenhuma melhoria for encontrada: reportar explicitamente "Nenhuma melhoria identificada — instruções sem alteração."

Antes de montar o checklist, rodar `git status --short` para ver EXATAMENTE o que a sessão tocou — nunca listar pendências de memória. Regras para o item de reempacotamento:
- `instrucoes-projeto.txt` é Project Instructions, NÃO uma skill — editá-lo nunca gera reempacotamento. Sua única pendência é o usuário copiá-lo nas Project Instructions.
- Só incluir o item de reempacotar/reinstalar se algum `_docs/skills-export/<skill>/SKILL.md` foi editado NESTA sessão (confirmar pelo `git status --short`).
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
O foco é sempre o objetivo declarado nas instruções: cada mudança deve aproximar as instruções desse objetivo.
Nunca reportar "nenhuma melhoria" sem ter verificado ativamente cada categoria do Passo 1.
Não reformular instruções que funcionaram bem só para "melhorar o estilo" — mudanças devem ter origem em gap real.
Antes do AskUserQuestion, sempre apresentar as melhorias em prosa numerada com "Causa:"/"Consequência:" explícitos (Passo 2.5) — nunca pular direto para a pergunta técnica.