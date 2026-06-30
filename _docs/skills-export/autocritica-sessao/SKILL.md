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

OBRIGATÓRIO antes de escrever qualquer arquivo: apresentar todas as mudanças propostas ao usuário via AskUserQuestion (multiSelect: true), com uma opção por mudança. Descrever em cada opção: o que aconteceu (fato), o que vai mudar, e em qual arquivo será aplicado.
Aplicar SOMENTE as mudanças aprovadas. Se nenhuma for aprovada, encerrar sem alterar arquivos.

Passo 3 — Aplicar mudanças aprovadas
Usar python3 para edições (mais seguro que sed para strings com caracteres especiais, e mais seguro que Edit para arquivos >200 linhas):

python3 - << 'PYEOF'
path = "/sessions/.../instrucoes-projeto.txt"  # obter via find
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()
content = content.replace('texto antigo', 'texto novo')
with open(path, 'w', encoding='utf-8') as f:
    f.write(content)
print("OK - linhas:", content.count('\n') + 1)
PYEOF

Verificar após cada mudança:
bash: INSTR=$(find /sessions -name "instrucoes-projeto.txt" 2>/dev/null | head -1)
tail -5 "$INSTR" && wc -l "$INSTR"

Se o SKILL.md da autocritica-sessao também tiver mudanças aprovadas: editar _docs/skills-export/autocritica-sessao/SKILL.md via python3. Lembrar o usuário de reempacotar com empacotar_skills.py e reinstalar a skill.

Passo 4 — Reportar ao usuário
Formato obrigatório:
**Autocrítica da sessão — [data]**

Objetivo das instruções: [objetivo declarado]
Melhorias aplicadas: N

1. [Ponto de melhoria] → [O que mudou]
2. ...

Instruções atualizadas em `_docs/instrucoes-projeto.txt`. Após reportar, exibir o conteúdo completo do arquivo no chat para que o usuário possa copiar diretamente nas configurações do projeto (Project Instructions) sem precisar abrir o arquivo manualmente.
Se nenhuma melhoria for encontrada: reportar explicitamente "Nenhuma melhoria identificada — instruções sem alteração."

Sempre encerrar com checklist de pendências do usuário, por exemplo:
- [ ] Copiar instrucoes-projeto.txt nas configurações do projeto (Project Instructions)
- [ ] Reempacotar skills modificadas: `python empacotar_skills.py` em `_docs/skills-export/`
- [ ] Reinstalar ski