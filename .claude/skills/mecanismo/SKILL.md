---
name: mecanismo
description: "Ativa o modo Mecanismo — geração e estudo aprofundado de um conceito ou processo específico. Usar quando o objetivo é entender como algo funciona, com saturação total do mecanismo. Inclui modo Anki para revisão."
---

## Objetivo

Cada arquivo de mecanismo cobre um tema até ele ser explicável sem referência externa, integrando história intelectual, definição formal, mecanismo detalhado e discussão. Critério de parada: nenhum conceito mencionado por nome sem mecanismo desenvolvido.

## Estrutura de pastas

Mecanismos ficam nas pastas temáticas da raiz: `medicina/imunologia/`, `medicina/farmacologia/`, etc. Anki em `anki/`.

## Protocolo de abertura

1. Ler `_docs/project_estado.md` — pendências e dívida técnica.
2. Ler `_docs/project_mapa_materiais.md` — mecanismos já cobertos.
3. Verificar `_docs/DEBT.md` — dívidas abertas, aplicar antes de prosseguir.

## Pré-geração

Perguntar antes de gerar mecanismo novo: o que motivou o tema e onde você já se situa nele? Se o tema for autoevidente, gerar direto.

## Ordem obrigatória das seções

Cabeçalho (h1 + meta + chips) → Pergunta motivadora → Painel de dependências → Fundamentos necessários → Conceitos-chave → [conteúdo principal] → Conexões → Perguntas em aberto → Discussão → Leituras recomendadas → Referências ABNT.

## Conteúdo

- **Pergunta motivadora**: ancorada em cenário clínico real.
- **Padrão histórico distribuído**: `.hist` antes de cada conceito central — história → definição formal → mecanismo → implicação clínica.
- **Gradação de profundidade**: (1) mecanismo central — saturação total; (2) conceitos de suporte — parágrafo + definição formal; (3) menções contextuais — apenas nomeadas com cross-link.
- **Cross-links**: `<a class="cross-link" href="../caminho/arquivo.html#id-secao">termo</a>`. Nunca reexplicar — linkar. Verificar `_docs/project_mapa_materiais.md` antes de escrever explicação inline.
- **Limites do modelo**: `.kbox "Limites do modelo"` após qualquer framework central — pressupostos assumidos, condições de falha, divergências empíricas.
- **Controvérsias genuínas**: `.kbox "Controvérsia"` com as duas posições e estado atual do consenso. Nunca resolver artificialmente.
- Partir sempre do porquê antes do o quê.
- Cada bloco deve avançar o raciocínio — nunca repetir ou resumir seção anterior.
- Siglas por extenso na primeira ocorrência. Termos estrangeiros em itálico + tradução na primeira ocorrência.
- Tabelas e figuras quando melhorarem compreensão comparativa. Legenda numerada imediatamente abaixo.

## Consulta ao PubMed

Antes de fechar mecanismo novo ou reescrita ≥30%: buscar revisões sistemáticas ou meta-análises recentes (3–5 anos) sobre o mecanismo central. Identificar controvérsias ativas e enriquecer "Perguntas em aberto". Registrar DOIs nas Referências ABNT.

## Leituras

Partir dos livros do usuário (Abbas, Murray, Rang & Dale, Machado) antes de sugerir externos.

## Convenção de IDs de âncoras

`id` em kebab-case sem acentos. Exemplos: `id="fundamentos"`, `id="conceitos-chave"`, `id="perguntas-abertas"`, `id="discussao"`, `id="referencias"`. Cross-links: `href="../caminho/arquivo.html#id-secao"`.

## Fluxo de trabalho

1. Consultar `_docs/project_estado.md` e `_docs/project_mapa_materiais.md`.
2. Gerar HTML em `medicina/<subárea>/nome-kebab-case.html`.
3. Arquivar quando mudança ≥30% (`_archive/` + sufixo de data); editar no lugar para correções pontuais.
4. Verificação bash (ver regras compartilhadas nas instruções do projeto).
5. Verificação visual em novos mecanismos e reescritas ≥30%.
6. Atualizar `index.html`, `_docs/MIGRATION.md` se aplicável.
7. Atualizar `_docs/project_mapa_materiais.md` com conceitos centrais do novo material.
8. Registrar dívidas em `_docs/DEBT.md`.
9. Lembrar o usuário de rodar `push.bat`.

## Checklist de saturação

- [ ] Todo conceito mencionado por nome tem mecanismo desenvolvido?
- [ ] A pergunta motivadora está fechada na Discussão?
- [ ] Há ≥3 perguntas em aberto genuinamente não resolvidas na literatura?
- [ ] Limites do modelo marcados em `.kbox`?
- [ ] Cross-links apontam para âncoras de seção específica?
- [ ] Cross-links verificáveis? (IDs de destino existem nos HTMLs alvo)
- [ ] Campo "Última revisão" atualizado?
- [ ] `index.html`, `_docs/MIGRATION.md` e `_docs/DEBT.md` atualizados?

---

## Modo Anki

Ativar quando o usuário pedir revisão de um mecanismo já gerado. **Nunca usar Anki para mapas do Atlas.**

### Fase 1 — Triagem por múltipla escolha

1. Verificar se existe `anki/anki_[material].json` — carregar para retomar. Criar ao encerrar se não existir.
2. Verificar `_docs/DEBT.md` — aplicar pendências do arquivo alvo antes de iniciar.
3. Gerar questões de múltipla escolha cobrindo todo o material. Cada seção do HTML deve ter ao menos uma questão; conceitos centrais (camada 1) devem ter mais.
4. Apresentar uma questão por vez, com 5 alternativas (A–E), sempre com distratores. Nunca revelar a resposta antes da tentativa.
5. Classificar cada questão: acertou → registrar como dominada e avançar; errou → registrar e retomar na Fase 2.

### Fase 2 — Aprofundamento discursivo nos erros

6. Ao concluir a triagem, listar conceitos errados e iniciar questões discursivas apenas para eles.
7. Para cada conceito errado: uma pergunta aberta por vez. Se resposta parcial: oferecer pista antes de revelar.
8. Classificar: "dominada" (exige articulação do mecanismo, não só o nome), "parcial" ou "não soube". "Parcial" e "não soube" retomados após 3–5 questões novas.

### Encerramento do Anki

9. Síntese dos pontos fracos + seção a revisar.
10. Atualizar `anki/anki_[material].json` com novo estado da sessão.
11. Criar/atualizar `anki/erros_[material].md`:

```
=== [Conceito] ===
- Pergunta: ...
- Raciocínio usado: ...
- Erro: ...
- Correto: ...
```
