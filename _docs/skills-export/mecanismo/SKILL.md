---
name: mecanismo
description: >
  Skill para criação, revisão e estudo (modo Anki) de compêndios de mecanismos —
  HTMLs autônomos que cobrem um conceito até o mecanismo ser explicável sem referência
  externa. Use SEMPRE que o usuário quiser aprofundar um conceito específico de medicina
  (imunologia, farmacologia, fisiologia, fisiopatologia, microbiologia) ou fazer sessão
  de revisão com questões (Anki) sobre um compêndio existente. Após identificar a área,
  carregar a subskill correspondente: mecanismo-medicina-basica ou mecanismo-medicina-clinica.
---

# Skill Mecanismo

Compêndios de mecanismos são HTMLs autônomos que cobrem um tema até ele ser explicável
sem referência externa. Integram: contexto histórico, definição formal, mecanismo detalhado,
bloco de código quando aplicável, implicações práticas e discussão.

## Hierarquia de subskills

Após identificar a área solicitada, carregar a subskill correspondente antes de gerar:

| Área | Subskill a carregar |
|------|-------------------|
| Imunologia, fisiologia, bioquímica, microbiologia | `mecanismo-medicina-basica` |
| Farmacologia, fisiopatologia, semiologia, clínica médica | `mecanismo-medicina-clinica` |
| Área nova sem subskill | Usar esta skill e propor criação da subskill ao final |

**Criar nova subskill sob demanda:** quando uma área nova for solicitada, gerar o compêndio com esta skill e propor criação da subskill correspondente ao final da sessão.

## Protocolo de abertura de sessão

Ao iniciar sem tarefa direta:
1. Ler `_docs/project_estado.md` — pendências e histórico.
2. Ler `_docs/project_mapa_materiais.md` — conceitos já cobertos.
3. Se houver dívida crítica em `_docs/DEBT.md`, informar antes de prosseguir.

## Pré-geração

Antes de gerar compêndio novo, perguntar: o que motivou o tema, onde o usuário já se situa e se há aplicação prática em mente. Nunca perguntar sobre formato. Se o tema for autoevidente, gerar direto.

## Estrutura de pastas

```
medicina/
  imunologia/      → mecanismo-medicina-basica
  fisiologia/      → mecanismo-medicina-basica
  microbiologia/   → mecanismo-medicina-basica
  farmacologia/    → mecanismo-medicina-clinica
  fisiopatologia/  → mecanismo-medicina-clinica
anki/              → sessões e erros do Anki
```

## Ordem das seções (obrigatória)

Cabeçalho (h1 + meta + chips) → Pergunta motivadora → Painel de dependências → Fundamentos necessários → Conceitos-chave → [conteúdo principal] → Implementação (código, quando aplicável) → Conexões → Perguntas em aberto → Discussão → Leituras recomendadas → Referências.

## Regras de conteúdo

- Partir sempre do porquê antes do o quê.
- Padrão histórico distribuído: `.hist` antes de cada conceito central.
- Gradação de profundidade: (1) mecanismo central — saturação total; (2) conceitos de suporte — parágrafo + definição; (3) menções contextuais — apenas nomeadas com cross-link.
- Cross-links: `<a class="cross-link" href="../caminho/arquivo.html#id-secao">termo</a>`. Verificar `_docs/project_mapa_materiais.md` antes de escrever explicação inline.
- Criticidade universal: após qualquer framework central, `.kbox "Limites do modelo"`.
- Controvérsias genuínas: `.kbox "Controvérsia"` com as duas posições. Nunca resolver artificialmente.
- Saturação: critério de parada = nenhum conceito mencionado sem mecanismo desenvolvido.
- Siglas por extenso na primeira ocorrência. Termos em inglês em itálico + tradução.

## Seção Implementação

Presente quando o conceito tiver código relevante. Ausente em temas puramente conceituais.
- Python, apenas stdlib ou numpy/torch.
- Código comentado nas partes não-óbvias.
- Bloco em `<pre><code class="language-python">` com highlight.js.
- Código é suplemento, não atalho.

## Convenção de IDs de âncoras

kebab-case sem acentos: `id="fundamentos"`, `id="conceitos-chave"`, `id="implementacao"`, `id="perguntas-abertas"`, `id="discussao"`, `id="referencias"`.

## Fluxo de trabalho

1. Identificar área → carregar subskill correspondente.
2. Consultar `_docs/project_estado.md` e `_docs/project_mapa_materiais.md`.
3. Gerar HTML na subpasta temática em kebab-case.
4. Verificação bash obrigatória após qualquer escrita de HTML:
   - (a) fecha com `</body></html>`
   - (b) `wc -l` compatível com o esperado
   - (c) sem `const const` / `var var`
   - (d) acentuação PT-BR intacta: `grep -c "ã\|ç\|é" > 0`
   - (e) sem artefatos: `grep -iw "placeholder\|TODO\|FIXME\|debug\|rascunho"` vazio
5. Verificação visual (novos compêndios e reescritas ≥30%): abrir no Chrome via Claude in Chrome.
6. Rodar grep nos demais HTMLs antes de fechar — nunca corrigir só o arquivo em foco.
7. Atualizar `index.html`, `_docs/MIGRATION.md` (se aplicável), `_docs/DEBT.md` e `_docs/project_mapa_materiais.md`.
8. GitHub: lembrar o usuário de rodar `push.bat` na raiz.

## Eficiência operacional

- Edit: nunca >~150 linhas por bloco `new_string`. Backup antes de editar HTML.
- Write: arquivo novo ou reescrita completa <300 linhas.
- Python: conteúdo com acentos PT-BR. Nunca `echo` ou heredoc bash.
- sed: substituições pontuais em arquivos >500 linhas.
- HTML novo >300 linhas: Write estrutura inicial → verificar → Python escreve restante → `cat >>` → verificar.
- Leitura seletiva: `grep -n` para localizar âncora antes de Read com offset/limit.
- Verificação preditiva: antes de Edit >80 linhas, calcular linhas esperadas. Após o Edit, `wc -l` e comparar.

## Checklist de saturação

- [ ] Todo conceito mencionado por nome tem mecanismo desenvolvido?
- [ ] A pergunta motivadora está fechada na Discussão?
- [ ] Há ≥2 perguntas em aberto genuinamente não resolvidas?
- [ ] Limites do modelo marcados em `.kbox`?
- [ ] Cross-links apontam para âncoras de seção específica?
- [ ] Cross-links verificáveis (IDs de destino existem)?
- [ ] Campo "Última revisão" atualizado?
- [ ] `index.html`, `_docs/MIGRATION.md` e `_docs/DEBT.md` atualizados?

## Modo Anki

### Fase 1 — Triagem por múltipla escolha
1. Verificar `anki/anki_[material].json` — carregar para retomar.
2. Verificar `_docs/DEBT.md` — aplicar pendências antes de iniciar.
3. Gerar questões cobrindo todo o material. Cada seção deve ter ao menos uma; conceitos centrais devem ter mais.
4. Apresentar uma questão por vez, 5 alternativas (A–E), distratores plausíveis. Nunca revelar antes da tentativa.
5. Acertou → dominada, avançar. Errou → registrar, retomar na Fase 2.

### Fase 2 — Aprofundamento discursivo nos erros
6. Listar conceitos errados e iniciar questões discursivas apenas para eles.
7. Uma pergunta aberta por vez. Se parcial: pista antes de revelar.
8. Classificar: "dominada" (exige articulação do mecanismo), "parcial" ou "não soube". Parcial e não soube retomados após 3–5 questões novas.

### Encerramento do Anki
9. Síntese dos pontos fracos + seção a revisar.
10. Atualizar `anki/anki_[material].json`.
11. Criar/atualizar `anki/erros_[material].md`:
```
=== [Conceito] ===
- Pergunta: ...
- Raciocínio usado: ...
- Erro: ...
- Correto: ...
```

## Qualidade de entrega

Ciclo interno antes de apresentar: "há algo a melhorar?" → se sim, aplicar e repetir → encerrar só quando a resposta honesta for "não encontro nada".

## Encerramento de sessão

Ao final de sessão substantiva, chamar a skill `autocritica-sessao`.
Sinal: "terminamos", "pode fechar", "acabou", "sessão encerrada".
