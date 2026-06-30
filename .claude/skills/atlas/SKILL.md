---
name: atlas
description: "Ativa o modo Atlas — geração e manutenção de mapas de campo. Usar quando o objetivo é orientar, mapear uma área de conhecimento ou responder 'o que existe aqui e por onde começo'. NÃO usar para aprofundar mecanismos."
---

## Objetivo do Atlas

O Atlas é o mapa, não a lupa. Cada arquivo responde: o que essa área estuda? Como se subdivide? Quais são as questões centrais? Por onde começar? Critério de sucesso: o leitor consegue abrir o material original sem se perder.

## Estrutura de pastas

Mapas ficam em `atlas/<área>/`. Ex: `atlas/medicina/`, `atlas/filosofia/`. Arquivos de estado em `atlas/atlas_mapa.txt` e `atlas/atlas_estado.txt`.

## Protocolo de abertura

1. Ler `atlas/atlas_estado.txt` — pendências e histórico.
2. Ler `atlas/atlas_mapa.txt` — áreas já cobertas.
3. Verificar `_docs/DEBT.md` — dívidas abertas.

## Pré-geração

Perguntar antes de gerar mapa novo:
- O que motivou o interesse nessa área?
- Ponto de partida (zero / superficial / conhecimento prévio específico)?
- Algum recorte temático ou temporal?

Se o tema for autoevidente e o contexto claro, gerar direto.

## Dois níveis de arquivo

**Arquivo-pai** — mapa aéreo do campo inteiro (ex: imunologia, macroeconomia).
**Arquivo-filho** — aprofundamento de uma subárea quando ela tiver complexidade, literatura e questões próprias suficientes. Criar só quando justificado.

## Estrutura obrigatória do arquivo-pai

1. Cabeçalho: título, chips de subáreas, tempo de leitura, data de revisão.
2. Pergunta orientadora: uma frase que captura o problema central do campo.
3. O que essa área estuda: definição formal + escopo + o que está fora.
4. Mapa do campo: subdivisões com uma frase cada. Links para arquivos-filhos e para mecanismos correspondentes quando existirem.
5. Contexto histórico: marcos, figuras fundadoras — distribuído, não em bloco único.
6. Contexto brasileiro: quando relevante. Omitir ou reduzir a uma frase quando não for.
7. Questões centrais: 5–10 perguntas que o campo tenta responder. Perguntas, não respostas.
8. Ferramentas e métodos: como o campo produz conhecimento.
9. Conexões com outros campos.
10. Controvérsias ativas: duas posições sustentadas por evidência. Nunca resolver artificialmente.
11. Por onde começar: roteiro de entrada.
12. Referências anotadas.

## Estrutura do arquivo-filho

1. Cabeçalho + link de volta para o pai.
2. O que esta subárea estuda (1–2 parágrafos).
3. Mapa interno: conceitos e relações.
4. Contexto histórico da subárea.
5. Questões centrais da subárea.
6. Conexões com outras subáreas e campos externos.
7. Referências anotadas.

## Referências anotadas

Organizar em camadas: **Ponto de entrada → Aprofundamento → Consulta especializada**.

Cada referência: tipo, título, autor, ano, uma linha de anotação explicando por que está aqui. Hierarquia epistêmica por domínio:
- Medicina clínica: guidelines (AHA, WHO, CFM) > revisões sistemáticas > livros-texto.
- Ciências básicas: livros-texto canônicos + artigos seminais + revisões recentes.
- Filosofia: textos primários + comentadores canônicos + SEP/IEP.
- Economia: papers empíricos + relatórios de bancos centrais + livros-texto.
- História: fontes primárias + historiografia revisada + obras de síntese.

## Profundidade

- Conceito por nome: uma frase + link para mecanismo se existir. Nunca desenvolver inline.
- Critério de parada: leitor consegue abrir o material original sem se perder? Se sim, pronto.

## O que não fazer

- Não saturar mecanismos — papel da skill `mecanismo`.
- Não usar Anki — exclusivo dos mecanismos.
- Não criar arquivo-filho sem justificativa clara.
- Não resolver artificialmente controvérsias ativas.

## Fluxo de trabalho

1. Consultar `atlas/atlas_estado.txt` e `atlas/atlas_mapa.txt`.
2. Gerar HTML em `atlas/<área>/nome-kebab-case.html`.
3. Arquivar quando mudança ≥30% (`_archive/` + sufixo de data); editar no lugar para correções pontuais.
4. Verificação bash (ver regras compartilhadas nas instruções do projeto).
5. Verificação visual em novos mapas e reescritas ≥30%.
6. Atualizar `atlas/index.html` e `atlas/atlas_mapa.txt`.
7. Registrar dívidas em `_docs/DEBT.md`.
8. Lembrar o usuário de rodar `push.bat`.

## Checklist antes de fechar

- [ ] Pergunta orientadora respondida ao longo do texto?
- [ ] Cada subárea tem ao menos uma frase descritiva?
- [ ] Referências têm anotação justificando presença?
- [ ] Controvérsias com as duas posições representadas?
- [ ] Links para mecanismos inseridos onde existirem?
- [ ] Leitor consegue abrir o material original sem se perder?
- [ ] Campo "Última revisão" atualizado?
- [ ] `atlas/index.html`, `atlas/atlas_mapa.txt` e `_docs/DEBT.md` atualizados?
