---
name: compendio
description: >
  Skill para criação e revisão de compêndios de área — HTMLs autônomos
  que exaurem um campo de estudo inteiro com profundidade real. Use SEMPRE que o usuário
  mencionar "compêndio de área", quiser cobrir um campo inteiro (medicina,
  investimentos, IA, etc.), ou pedir material denso sobre uma área ampla de estudo.
  Após identificar a área, carregar a subskill correspondente:
  compendio-medicina-basica, compendio-medicina-clinica, compendio-investimentos ou compendio-ia.
---

# Skill Compêndio de Área

O compêndio de área cobre um campo de estudo inteiro em largura e profundidade.
Não substitui livros nem artigos — mas deve ser suficientemente denso para situar o leitor,
desenvolver os conceitos centrais e guiar o estudo com referências anotadas.

**Distinção com a skill `mecanismo`:** o mecanismo aprofunda um conceito único; o compêndio de área
exaure uma área inteira. Ambos referenciam materiais externos; ambos têm profundidade real.

**Critério de sucesso:** o leitor sai com domínio real do campo — sabe o que existe,
como as partes se relacionam, quais são as questões abertas, e o que estudar a seguir.

## Hierarquia de subskills

Após identificar a área solicitada, carregar a subskill correspondente antes de gerar:

| Área | Subskill a carregar |
|------|-------------------|
| Imunologia, fisiologia, bioquímica, microbiologia, anatomia | `compendio-medicina-basica` |
| Farmacologia, fisiopatologia, semiologia, clínica médica | `compendio-medicina-clinica` |
| Investimentos, finanças, economia aplicada | `compendio-investimentos` |
| Inteligência Artificial, machine learning, LLMs | `compendio-ia` |
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
3. O que essa área estuda: definição formal, escopo, limites, distinção com campos adjacentes.
4. Mapa do campo: subdivisões principais com parágrafo descritivo cada. Cards (`.subarea-grid`) para visão rápida; prosa para profundidade. Links para arquivos-filhos onde existirem.
5. Contexto histórico: quando e por que o campo surgiu, marcos fundadores, viragens paradigmáticas. Usar `.hist` para marcos pontuais; prosa para desenvolvimento.
6. Contexto brasileiro: como o campo se desenvolveu/aplica no Brasil. Omitir se irrelevante.
7. Questões centrais: 5–10 perguntas abertas que o campo tenta responder. Não respostas — perguntas genuínas.
8. Ferramentas e métodos: como o campo produz conhecimento. Com densidade real, não apenas listagem.
9. Conexões com outros campos. Usar `a.cross-link` para linkar compêndios existentes.
10. Controvérsias ativas (`.controversia`): disputas genuínas com as duas posições representadas. Nunca resolver artificialmente.
11. Referências anotadas em camadas: "Ponto de entrada" → "Aprofundamento" → "Consulta especializada". Cada referência com tipo, título, autor, ano e anotação justificando a presença.

## Profundidade

- Cada seção deve ter substância real — não apenas nomear conceitos, mas desenvolvê-los.
- Conceitos que têm compêndio próprio em `medicina/` ou outra área: linkar via `a.cross-link`, não reexplicar.
- Referências externas são obrigatórias — o compêndio situa e aprofunda, mas indica onde ir para mais.
- Não há critério de parada por brevidade. O critério é: o campo foi coberto com honestidade intelectual?

## Fluxo de trabalho

1. Identificar área → carregar subskill correspondente.
2. Consultar `compêndios/compendio_estado.txt` e `compêndios/compendio_mapa.txt`.
3. Ler `_docs/template-v2-spec.md` + SKILL.md da subskill antes de escrever qualquer HTML.
4. Gerar HTML na subpasta temática em kebab-case dentro de `compêndios/`.
5. Verificação bash obrigatória após qualquer escrita de HTML:
   - (a) fecha com `</body></html>`
   - (b) `wc -l` compatível com o esperado
   - (c) sem `const const` / `var var`
   - (d) acentuação PT-BR intacta: `grep -c "ã\|ç\|é" > 0`
   - (e) sem artefatos: `grep -iw "placeholder\|TODO\|FIXME\|debug\|rascunho"` vazio
6. Verificação visual (novos arquivos e reescritas ≥30%): abrir no Chrome via Claude in Chrome.
7. Atualizar `compêndios/compendio_mapa.txt` na mesma operação.
8. Registrar em `_docs/DEBT.md` toda inconsistência não corrigida.
9. GitHub: lembrar o usuário de rodar `push.bat` na raiz.

## Eficiência operacional

- Edit: nunca >~150 linhas por bloco `new_string`. Backup antes de editar HTML.
- Write: arquivo novo ou reescrita completa <300 linhas.
- Python: conteúdo com acentos PT-BR. Nunca `echo` ou heredoc bash.
- HTML novo >300 linhas: Write estrutura inicial → verificar → Edit por seções → verificar.
- Leitura seletiva: `grep -n` para localizar âncora antes de Read com offset/limit.
- Verificação preditiva: antes de Edit >80 linhas, calcular linhas esperadas. Após o Edit, `wc -l` e comparar.

## Checklist antes de fechar o compêndio de área

- [ ] A pergunta motivadora está desenvolvida ao longo do texto?
- [ ] Cada subárea tem profundidade real, não apenas uma frase?
- [ ] As referências têm anotação justificando sua presença?
- [ ] As controvérsias ativas têm as duas posições representadas sem resolução artificial?
- [ ] Links `cross-link` para compêndios existentes inseridos onde pertinente?
- [ ] Campo "Última revisão" atualizado?
- [ ] `compêndios/compendio_mapa.txt` e `_docs/DEBT.md` atualizados?

## O que não fazer

- Não ser superficial — o compêndio de área tem profundidade real, não apenas orientação.
- Não usar Anki — exclusivo da skill `mecanismo`.
- Não criar arquivo-filho sem justificativa clara de complexidade própria.
- Não resolver artificialmente controvérsias ativas.
- Não omitir referências por medo de recomendar material longo — o leitor precisa saber o que existe.

## Encerramento de sessão

Ao final de sessão substantiva, chamar a skill `autocritica-sessao`.
Sinal: "terminamos", "pode fechar", "acabou", "sessão encerrada".
