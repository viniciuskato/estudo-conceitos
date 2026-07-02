---
name: sistema
description: >
  Skill para criação e revisão de compêndios de sistema — HTMLs autônomos que mapeiam
  um artefato ou sistema técnico bounded (não uma área de conhecimento inteira, não um
  mecanismo único): seus subsistemas, como cada um funciona e como se integram. Use
  SEMPRE que o usuário quiser estudar um objeto técnico complexo com múltiplas partes
  interdependentes (automóvel, avião, computador, edificação, motor) — quando o recorte
  é o objeto, não a disciplina que o estuda nem um mecanismo isolado dentro dele. Após
  identificar o domínio, carregar a subskill correspondente: sistema-veiculos
  (automóveis, motores, chassi, transmissão, suspensão, freios, elétrica automotiva).
---

# Skill Sistema

O compêndio de sistema mapeia um artefato ou sistema técnico bounded — não uma área de
conhecimento inteira, não um mecanismo único. Cobre os subsistemas que o compõem, como
cada um funciona, e como se integram para produzir o comportamento do todo.

**Distinção com `compendio` e `mecanismo`:**
- `compendio` cobre uma área de conhecimento inteira (um campo acadêmico com literatura,
  subdivisões, debates) — a largura é a do campo.
- `mecanismo` aprofunda um conceito ou processo único até ele ser explicável sem
  referência externa — a profundidade é de um único mecanismo.
- `sistema` mapeia um artefato técnico bounded — a largura é a do objeto (seus
  subsistemas), não a de uma disciplina; a profundidade cobre cada subsistema e,
  centralmente, **como as partes se integram** (fluxo de energia, força ou informação
  entre elas). Isso é o que distingue sistema de um compêndio de área: o objeto é o
  recorte, não o campo que o estuda.

**Critério de sucesso:** o leitor sai entendendo como o objeto funciona como um todo —
não apenas o que cada parte faz isoladamente, mas por que elas precisam interagir daquela
forma para o sistema operar.

## Hierarquia de subskills

Após identificar o domínio solicitado, carregar a subskill correspondente antes de gerar:

| Domínio | Subskill a carregar |
|---------|---------------------|
| Veículos automotivos (chassi, motorização, transmissão, suspensão, freios, elétrica) | `sistema-veiculos` |
| Domínio novo sem subskill | Usar esta skill e propor criação da subskill ao final |

## Protocolo de abertura de sessão

Ao iniciar sem tarefa direta:
1. Ler `sistemas/sistema_estado.txt` — pendências e histórico.
2. Ler `sistemas/sistema_mapa.txt` — objetos já cobertos.
3. Se houver dívida em `_docs/DEBT.md`, informar antes de prosseguir.

## Pré-geração

Antes de gerar compêndio de sistema novo, perguntar (via AskUserQuestion):
- Qual é o ponto de partida atual (zero, superficial, prévio específico)?
- Há algum recorte relevante (ex.: só motorização, ou o objeto inteiro)?

Nunca perguntar sobre formato.

## Formato

Cada compêndio de sistema é um arquivo HTML seguindo o `template-v2-spec.md`
(`_docs/template-v2-spec.md`). **Ler o template-v2-spec.md antes de criar qualquer HTML
novo.** A subskill de domínio define o que adaptar ou omitir do template.

**A referência é sempre o `template-v2-spec.md` — nunca um arquivo HTML específico.**
O spec evolui; um compêndio existente pode estar desatualizado em relação a ele. Ao usar
um compêndio existente como base estrutural (copiar e editar), verificar se ele reflete
o spec atual antes de replicar seus padrões — se divergir, seguir o spec, não o arquivo
antigo.

**Dois níveis:**
- **Arquivo-pai** (objeto): cobre o sistema inteiro (ex.: o automóvel como um todo).
- **Arquivo-filho** (subsistema): aprofundamento de um subsistema com complexidade
  própria suficiente (ex.: motor de combustão interna). Criar somente quando justificado.

## Estrutura do arquivo-pai (ordem obrigatória)

1. Cabeçalho (`doc-header`): título, `doc-meta`, chips (tempo de leitura, última revisão).
2. Pergunta motivadora (`.pergunta`): uma frase que captura o problema central que o
   sistema resolve (ex.: como converter energia química em movimento controlado e seguro).
3. O que é este sistema: função geral, limites do objeto (o que está dentro/fora do
   escopo), distinção com sistemas adjacentes.
4. Mapa de subsistemas: subsistemas principais com parágrafo descritivo cada. Cards
   (`.subarea-grid`) para visão rápida; prosa para profundidade. Links para
   arquivos-filhos onde existirem.
5. Como as partes se integram: fluxo de energia/força/informação entre subsistemas — a
   seção que distingue sistema de compêndio de área. Não é só "o que existe", é "como se
   conecta" para o todo funcionar.
6. Contexto histórico: evolução do artefato, marcos de engenharia, viragens (ex.:
   combustão → híbrido → elétrico).
7. Contexto brasileiro/regulatório: normas aplicáveis, especificidades de mercado.
   Omitir se irrelevante.
8. Questões centrais / desafios de engenharia: trade-offs, limitações físicas,
   problemas em aberto. Não respostas — desafios genuínos.
9. Ferramentas e métodos: como se projeta, testa e diagnostica esse sistema.
10. Conexões com outros sistemas ou campos. Usar `a.cross-link` para linkar compêndios
    existentes.
11. Controvérsias ativas (`.controversia`): disputas genuínas de engenharia ou mercado
    com as duas posições representadas. Nunca resolver artificialmente.
12. Referências anotadas em camadas: "Ponto de entrada" → "Aprofundamento" → "Consulta
    especializada". Cada referência com tipo, título, autor, ano e anotação justificando
    a presença.

## Profundidade

- Cada subsistema deve ter substância real — não apenas nomeado, mas desenvolvido.
- A seção "Como as partes se integram" não é opcional: é o núcleo que diferencia sistema
  de um compêndio de área listando partes soltas.
- Subsistemas que têm compêndio próprio: linkar via `a.cross-link`, não reexplicar.
- Referências externas são obrigatórias.

## Didática

Mesma regra de `compendio`: exaustividade e didática não competem. Um parágrafo por
ideia; nenhum parágrafo empilha 3+ subsistemas/mecanismos paralelos na mesma frase
corrida sem transição — mesmo quando existe uma `.data-table` cobrindo o mesmo conteúdo
(tabela e prosa cumprem papéis diferentes).

## Modo Anki (opcional)

Qualquer compêndio de sistema pode receber sessão de revisão com questões (Anki),
mediante pedido explícito do usuário — não é etapa automática de fechamento. Procedimento
completo (Fase 1 triagem por múltipla escolha; Fase 2 aprofundamento discursivo nos
erros; registro em `anki/`): ver seção "Modo Anki" em `mecanismo/SKILL.md`.

## Fluxo de trabalho

1. Identificar domínio → carregar subskill correspondente.
2. Consultar `sistemas/sistema_estado.txt` e `sistemas/sistema_mapa.txt`.
3. Ler `_docs/template-v2-spec.md` + SKILL.md da subskill antes de escrever qualquer HTML.
4. Gerar HTML na subpasta temática em kebab-case dentro de `sistemas/`.
5. Verificação bash obrigatória após qualquer escrita de HTML:
   - (a) fecha com `</body></html>`
   - (b) `wc -l` compatível com o esperado
   - (c) sem `const const` / `var var`
   - (d) acentuação PT-BR intacta (se material em português): `grep -c "ã\|ç\|é" > 0`
   - (e) sem artefatos: `grep -iw "placeholder\|TODO\|FIXME\|debug\|rascunho"` vazio
6. Verificação visual (novos arquivos e reescritas ≥30%): abrir no Chrome via Claude in Chrome.
7. Atualizar `sistemas/sistema_mapa.txt` na mesma operação.
8. Registrar em `_docs/DEBT.md` toda inconsistência não corrigida.
9. GitHub: lembrar o usuário de rodar `push.bat` na raiz.

## Eficiência operacional

- Edit: nunca >~150 linhas por bloco `new_string`. Backup antes de editar HTML.
- Write: arquivo novo ou reescrita completa <300 linhas.
- Python: conteúdo com acentos PT-BR. Nunca `echo` ou heredoc bash.
- HTML novo >300 linhas: Write estrutura inicial → verificar → Edit por seções → verificar.
- Leitura seletiva: `grep -n` para localizar âncora antes de Read com offset/limit.
- Verificação preditiva: antes de Edit >80 linhas, calcular linhas esperadas. Após o
  Edit, `wc -l` e comparar.

## Checklist antes de fechar o compêndio de sistema

Vale tanto para gerar um compêndio novo quanto para revisar um existente.

- [ ] A pergunta motivadora está desenvolvida ao longo do texto?
- [ ] Cada subsistema tem profundidade real, não apenas uma frase?
- [ ] A seção "Como as partes se integram" cobre o fluxo entre TODOS os subsistemas
      mapeados, não só um subconjunto?
- [ ] As referências têm anotação justificando sua presença?
- [ ] As controvérsias ativas têm as duas posições representadas sem resolução artificial?
- [ ] Links `cross-link` para compêndios existentes inseridos onde pertinente?
- [ ] Campo "Última revisão" atualizado?
- [ ] `sistemas/sistema_mapa.txt` e `_docs/DEBT.md` atualizados?
- [ ] Nenhum parágrafo empilha 3+ subsistemas/entidades paralelas sem transição?

## O que não fazer

- Não deixar a largura escapar do objeto — se o material começa a cobrir uma disciplina
  inteira (ex.: "engenharia mecânica" em vez de "o automóvel"), é caso para `compendio`,
  não para `sistema`.
- Não pular a seção "Como as partes se integram" — sem ela, sistema vira só uma lista de
  partes soltas, que é o que compêndio de área já faz melhor para campos inteiros.
- Não iniciar modo Anki sem pedido explícito do usuário — é opcional, não etapa automática.
- Não criar arquivo-filho sem justificativa clara de complexidade própria.
- Não resolver artificialmente controvérsias ativas.

## Encerramento de sessão

Ao final de sessão substantiva, chamar a skill `autocritica-sessao`.
Sinal: "terminamos", "pode fechar", "acabou", "sessão encerrada".
