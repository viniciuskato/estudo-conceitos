Objetivo do projeto: compreensão profunda de conceitos de qualquer área do conhecimento.

## Formato único: compêndio

Todo material do projeto é um **compêndio** — documento de estudo que cobre um tema até o mecanismo ser explicável sem referência externa, integrando história intelectual, definição formal, mecanismo, implicação clínica e discussão abstrata num único HTML autônomo. Não há outros formatos: materiais que parecem fichas técnicas ou comparativos práticos devem ser tratados como compêndios — o objetivo do projeto é sempre compreensão profunda, não consulta pontual. Migrar para compêndio quando o material piloto (`trombose-e-hemostasia.html`) estiver consolidado.

**Postura de evolução:** agir como organismo em adaptação contínua. Correções pontuais e padrões claros: incorporar silenciosamente. Mudanças sistêmicas ou de intenção ambígua: propor ao usuário antes de incorporar. Nunca esperar o usuário perceber. Quando o usuário aprovar ou sugerir uma regra nova de comportamento, avaliar imediatamente se ela pertence a estas instruções — e aplicar sem esperar solicitação explícita.

## Fonte de verdade das instruções

`instrucoes-projeto.md` na raiz do repositório é a fonte de verdade. A memory (`project_instrucoes_operacionais.md`) é uma cópia de trabalho para acesso rápido — deve ser sincronizada após qualquer atualização das instruções. Em caso de divergência, o arquivo do repositório prevalece.

## Troca de sessão

Antes de iniciar qualquer tarefa nova e bem delimitada (novo compêndio, migração de material, modo Anki, reescrita de instruções), avisar o usuário para abrir uma sessão nova — nunca executar primeiro.

**Formato obrigatório do aviso — aviso e frase de retomada são inseparáveis e automáticos:**

> "Recomendo abrir uma sessão nova antes — [motivo em uma linha]. Quer continuar aqui mesmo assim?"

A frase de retomada vem **em bloco de código** (com botão de cópia nativo), sem instrução extra:

```
Continue a migração de imunologia para template v2. Próximo é M10 — hipersensibilidade.html.
```

A frase de retomada deve ser gerada automaticamente, sem o usuário pedir. Nunca emitir o aviso sem ela. Nunca usar aspas ou prosa — sempre bloco de código.

Sinais de "tarefa nova": novo HTML, migração de material para template v2, início de modo Anki, geração de arquivo de instruções do zero.
Sinais de "iteração" (não trocar): ajuste pontual em arquivo já trabalhado na sessão, correção de bug, resposta a dúvida conceitual.

**Frase de retomada para atualização de instruções** — quando a sessão cair no meio de uma atualização, indicar módulos já aplicados e pendentes:

```
Aplique os módulos restantes nas instruções operacionais. Já aplicados: H, E, M. Faltam: B, C, A.
```

**Exceção crítica — não avisar quando:** a primeira mensagem da sessão já é uma tarefa direta e bem delimitada — qualquer instrução de ação imediata (ex: "Atualize o compêndio de X", "Continue a migração de X", "Crie o compêndio de Y", "Próximo é M10"). Se a sessão acabou de abrir e a primeira mensagem é uma tarefa, o usuário já tomou a decisão de abrir uma sessão nova — executar diretamente, sem avisar.

## Protocolo de primeira abertura de sessão

Ao iniciar qualquer sessão, antes de qualquer trabalho substantivo:

1. Ler [[project-estado]] para verificar pendências, dívida técnica e status de migração.
2. Ler [[project-mapa-materiais]] para mapear dependências e evitar reexplicar conceitos cobertos.
3. Se houver dívida técnica crítica registrada em `DEBT.md`, informar o usuário antes de prosseguir — nunca silenciosamente acumular.

Este protocolo não se aplica quando a primeira mensagem já é uma tarefa direta — nesse caso, executar e só informar pendências críticas ao final.

## Pré-geração: questionamento de pertinência

Antes de gerar qualquer compêndio novo, fazer **no máximo uma pergunta composta** para calibrar o material — e só se a resposta mudar materialmente o documento. Perguntar: o que motivou o tema e onde você já se situa nele? (motivação específica: disciplina, caso clínico, prova? lacuna declarada: o que já sabe? conexão desejada: algum compêndio existente para referenciar?)

Nunca perguntar sobre: formato (sempre compêndio), livros (já conhecidos), profundidade (sempre máxima). Se o tema e contexto forem autoevidentese, pular direto para a geração.

## Fluxo de trabalho

1. Se houver arquivo anexado, lê-lo integralmente antes de qualquer geração.
2. Consultar [[project-mapa-materiais]] para identificar conceitos já cobertos — linkar em vez de reexplicar.
3. Consultar [[project-estado]] para verificar livros com badge confirmado e status de migração do material.
4. Gerar o HTML completo na subpasta temática em kebab-case. Criar a subpasta se não existir.
5. **Critério arquivar vs. editar:** sobrescrever (com archive) quando a mudança afeta ≥30% do conteúdo ou altera estrutura de seções; editar no lugar quando é correção pontual, adição de parágrafo ou fix de bug. Em caso de sobrescrita, arquivar em `_archive/` com sufixo de data antes de qualquer escrita.
6. **Verificação obrigatória após qualquer escrita ou reescrita de HTML:** confirmar via bash que (a) o arquivo fecha com `</body>` e `</html>`; (b) o bloco `<script>` do toggle sidebar está presente (`sessionStorage`); (c) a contagem de linhas é compatível com o conteúdo esperado; (d) não há erros de sintaxe JS óbvios — checar `const const`, `var var`, declarações duplicadas com `grep "const const\|var var"`; (e) acentuação PT-BR intacta — `grep -c "ã\|ç\|é\|ê\|ó\|ô\|í\|ú\|à"` deve retornar valor > 0. Se qualquer verificação falhar, corrigir antes de prosseguir.
7. **Verificação visual (opcional mas recomendada para novos compêndios):** após verificação bash, abrir o arquivo no Chrome via Claude in Chrome (`navigate` → `get_page_text` ou screenshot) para confirmar renderização — sidebar visível, barra de progresso, acentuação correta no browser. Executar especialmente quando há mudança de CSS ou estrutura nova.
8. **Verificação de padrão antes de concluir correção:** ao identificar erro recorrente (ex: acentuação corrompida, elemento CSS ausente), rodar grep nos demais HTMLs antes de marcar a tarefa como concluída — nunca corrigir apenas o arquivo em foco.
9. Atualizar `index.html` na raiz na mesma operação — nunca como etapa posterior. Ver seção **Formato do index.html** abaixo.
10. Atualizar `MIGRATION.md` se o status de migração do material mudar.
11. Atualizar `DEBT.md` com qualquer inconsistência identificada mas não corrigida na sessão.
12. Atualizar [[project-mapa-materiais]] com os conceitos centrais do novo material.
13. **Sincronização com GitHub — passo obrigatório:** ao concluir qualquer material ou atualização significativa, rodar `push.bat` na raiz da pasta do projeto (duplo clique). O script faz `git add -A && git commit && git push` para `https://github.com/viniciuskato/estudo-conceitos`. Lembrar o usuário explicitamente — não assumir que ele fará sem aviso.

## Checklist de saturação

Antes de fechar qualquer compêndio, responder mentalmente:

- [ ] Todo conceito mencionado por nome tem mecanismo desenvolvido (não apenas citado)?
- [ ] A pergunta motivadora está explicitamente fechada na Discussão?
- [ ] Há pelo menos 3 perguntas em aberto genuinamente não resolvidas na literatura?
- [ ] Os limites do modelo principal estão marcados em `.kbox`?
- [ ] Cross-links apontam para âncoras de seção específica (não topo do arquivo)?
- [ ] O campo "Última revisão" no cabeçalho está com a data atual?
- [ ] `index.html` e `MIGRATION.md` foram atualizados?
- [ ] `DEBT.md` está limpo ou atualizado com pendências desta sessão?

Se qualquer item falhar: corrigir antes de marcar o compêndio como concluído.

## Eficiência operacional

Regras para evitar truncamentos, retrabalho e consumo desnecessário de tokens.

**Granularidade de edição (regra crítica):** nunca inserir mais de ~150 linhas em um único bloco `new_string` da ferramenta `Edit`. Seções longas devem ser inseridas em operações sequenciais — inserir um bloco, verificar, inserir o próximo. Após qualquer inserção acima de 80 linhas, executar `wc -l` + `tail -5` antes de prosseguir. Violação desta regra é a principal causa de truncamentos silenciosos.

**Estratégia Edit vs Write vs append:**
- `Edit` → para substituições pontuais e inserções de até ~150 linhas. Ferramenta padrão.
- `Write` → apenas para criação de arquivo novo ou reescrita completa deliberada de arquivo pequeno (<300 linhas). Nunca usar para arquivos grandes existentes — reescreve o arquivo inteiro e descarta histórico de edições.
- `bash append` (`echo/cat >>`) → para adicionar conteúdo ao final de arquivo já verificado como íntegro. Útil quando `Edit` atingiu o limite de payload e o conteúdo precisa ser completado. Sempre verificar após o append.

**Verificação imediata após Write ou Edit longo:** após qualquer chamada `Write` — mesmo em arquivo novo — executar imediatamente `wc -l` + `tail -5` + verificar fechamento correto. `Write` pode truncar silenciosamente se o conteúdo exceder o payload. O mesmo vale para `Edit` que insira bloco >20 linhas — executar `tail -5` antes de prosseguir. Nunca assumir que o arquivo está íntegro sem verificar.

**Estratégia de blocos para arquivos criados do zero (>150 linhas):** nunca tentar criar arquivo grande com um único `Write`. Fluxo obrigatório: (1) `Write` com cabeçalho e estrutura inicial (~100–150 linhas); (2) verificar integridade; (3) `Edit` ou `bash append` para cada bloco subsequente de até ~150 linhas; (4) verificar após cada bloco. Crescimento incremental verificado é mais seguro do que Write monolítico.

**Protocolo de recuperação de falha — Write truncado:** se `tail -5` revelar que o arquivo termina antes de `</body></html>`, não tentar corrigir com append cego. Fluxo: (1) `head -n N` para identificar o ponto de truncamento exato; (2) avaliar se o conteúdo restante cabe em um `Edit` (<150 linhas) — se sim, inserir com `Edit`; (3) se não couber, deletar o arquivo truncado, recriar com `Write` até o ponto seguro, depois continuar com blocos incrementais. Append cego sobre arquivo truncado produz HTML inválido.

**Verificação de duplicação após append em arquivos .md com blocos de código:** ao usar `bash append` em arquivos Markdown que contêm blocos de código (` ``` `), verificar com `grep -n '^\`\`\`' arquivo.md | tail -10` que os delimitadores de código estão balanceados após o append. Append pode duplicar o delimitador de fechamento se o arquivo já terminava com ` ``` `.

**Verificação incremental:** verificar integridade do arquivo após cada etapa de edição significativa, não apenas no final. Padrão mínimo após cada bloco inserido: `wc -l` (contagem compatível com o esperado) + `tail -5` (arquivo não está truncado). Verificação completa (fecha `</body></html>`, `sessionStorage` presente, sem JS duplicado) apenas ao concluir a sessão de edição.

**Leitura seletiva:** em qualquer arquivo >150 linhas, identificar a âncora de edição com `grep -n` antes de usar `Read` com `offset` e `limit`. Nunca reler o arquivo inteiro a cada etapa — grep primeiro, Read seletivo depois. Ler o arquivo inteiro é permitido apenas na abertura da sessão ou quando o contexto completo for estritamente necessário.

**Planejamento de inserção:** antes de inserir seção longa, dividir mentalmente em blocos temáticos independentes e executar um por vez. Exemplo: CAPM como bloco 1 → verificar → finanças comportamentais como bloco 2 → verificar → etc. Nunca agrupar seções não relacionadas em um único `new_string`.

## Ordem das seções (obrigatória)

Cabeçalho (h1 + meta + chips) → Pergunta motivadora → Painel de dependências → Fundamentos necessários → Conceitos-chave → [conteúdo principal] → Conexões → Perguntas em aberto → Discussão → Leituras recomendadas → Referências ABNT.

A sidebar reflete essa ordem: grupo "Conteúdo" começa com Fundamentos necessários; grupo "Revisão" contém Perguntas em aberto, Discussão, Leituras recomendadas e Referências ABNT.

## Convenção de IDs de âncoras

Todo `<section>` deve ter `id` em kebab-case derivado do título da seção, em português sem acentos. Regras:

- Letras minúsculas, sem acentos, palavras separadas por hífen
- Prefixo de grupo quando ambíguo: `sec-`, `fund-`, etc. — não obrigatório se o ID já for único
- Exemplos canônicos: `id="fundamentos"`, `id="conceitos-chave"`, `id="cascata-coagulacao"`, `id="imunidade-inata"`, `id="perguntas-abertas"`, `id="discussao"`, `id="leituras"`, `id="referencias"`
- Cross-links devem apontar para esses IDs: `href="../caminho/arquivo.html#cascata-coagulacao"`
- Ao criar novo compêndio: definir IDs antes de escrever cross-links — garantir que o ID exista no arquivo alvo antes de linkar

## Formato do index.html

O `index.html` na raiz é o portal do projeto. Estrutura obrigatória de cada entrada:

```html
<a class="card" href="caminho/relativo/arquivo.html">
  <div class="card-area">Área · Subárea</div>
  <div class="card-title">Título do Compêndio</div>
  <div class="card-meta">~X min · Última revisão: YYYY-MM-DD</div>
</a>
```

Entradas agrupadas por área (medicina, investimentos, automóveis...). Ordem dentro de cada grupo: mais recente primeiro. Ao adicionar novo compêndio: inserir card no grupo correto, nunca ao final do arquivo sem verificar o agrupamento.

## Template v2 — especificação completa

### Paleta C
```css
:root{
  --bg:#111010;--bg2:#1a1919;--bg3:#222121;--border:#333131;
  --text:#e2ddd6;--muted:#9e9890;
  --ac:#d4924a;--ac2:#c0604a;--ac2bg:#2a1810;
  --font-body:'Source Serif 4',Georgia,serif;
  --font-ui:'Inter',system-ui,sans-serif;
}
```
Fontes via Google Fonts: Source Serif 4 (corpo 16px, line-height 1.78) + Inter (interface).

### Layout
- `#sidebar`: `width:280px`, sticky, `height:100vh`, `overflow:hidden`, `display:flex; flex-direction:column`, `transition:width .25s`
- `#sidebar.collapsed`: `width:44px`
- `#s-toggle`: fora do `.s-inner`, sempre visível mesmo colapsado
- `.s-inner`: `flex:1; overflow-y:auto; width:280px`
- `#content`: `flex:1; padding:52px 72px 120px; transition:padding .25s`
- `.prose`: `max-width:88ch; margin:0 auto; transition:max-width .25s`
- `#body-wrap.sidebar-collapsed #content`: `padding:52px 100px 120px`
- `#body-wrap.sidebar-collapsed .prose`: `max-width:114ch`

### Sidebar colapsável
- Botão `#toggle-btn` dentro de `#s-toggle`, fora do `.s-inner` — nunca some ao colapsar
- Estado persistido em `sessionStorage('sidebar-collapsed')`
- Colapsar: `sidebar.classList.add('collapsed')` + `bodyWrap.classList.add('sidebar-collapsed')`
- `.s-logo`, `.s-group`, `a.sl` recebem `opacity:0; pointer-events:none` quando colapsado

### Barra de progresso
- `#progress-bar`: `position:fixed; top:0; left:0; height:2px; background:var(--ac); z-index:100`
- Atualizada via evento `scroll` passivo: `width = scrollTop/(scrollHeight-clientHeight)*100+'%'`

### Highlight de seção ativa
- Segundo `IntersectionObserver` com `rootMargin:'-20% 0px -70% 0px'`
- Seção visível recebe `.in-view` → `section.in-view > h2 { color:var(--ac); transition:color .3s }`
- Primeiro observer destaca `.active` na sidebar

### Mobile (`max-width:900px`)
- Sidebar `display:none` por padrão, `display:block` quando `.open`
- `#mob-bar` visível com botão ☰; `#s-toggle` oculto
- `#content`: `padding:24px 20px 80px`; `.ck-grid`: `repeat(2,1fr)`

### Print
- Fundo branco, texto preto, sidebar e âncoras ocultas, URLs após links

## Cabeçalho de cada compêndio

```html
<div class="doc-header">
  <h1>Título</h1>
  <p class="doc-meta">Área · Subárea · Instituição · Ano · Fonte</p>
  <div class="doc-chips">
    <span class="chip">⏱ <b>~X min</b> de leitura</span>
    <span class="chip">📋 Pré-requisitos: <b>...</b></span>
    <span class="chip">🔗 Depende de: <b>...</b></span>
    <span class="chip">📍 Área: <b>...</b></span>
    <span class="chip">🗓 Última revisão: <b>YYYY-MM-DD</b></span>
  </div>
</div>
```

O chip "Última revisão" deve ser atualizado toda vez que o compêndio for editado substantivamente (não apenas correção de typo). Formato da data: `YYYY-MM-DD`.

## Pergunta motivadora (obrigatória)

Antes dos Fundamentos necessários. Pergunta clínica/científica concreta que o conteúdo vai responder — gera ancoragem cognitiva e tensão intelectual antes de qualquer conceito formal. **A pergunta deve ser fechada ao final do compêndio** — na seção Discussão ou em parágrafo explícito após o conteúdo principal, articulando a resposta com os conceitos desenvolvidos.

```html
<div class="pergunta">
  <div class="plabel">Pergunta motivadora</div>
  <p>...</p>
</div>
```

## Painel de dependências (obrigatório)

Logo após a pergunta motivadora. Três colunas: (1) materiais que este compêndio usa; (2) pré-requisitos externos; (3) materiais futuros que dependem deste. Preencher com base em [[project-mapa-materiais]].

```html
<div class="dep-panel">
  <div class="dep-label">Mapa de dependências</div>
  <div class="dep-row">
    <div class="dep-group">
      <div class="dgt">Este compêndio usa</div>
      <a class="dep-item" href="...">Material X</a>
    </div>
    <div class="dep-group">
      <div class="dgt">Leia antes se necessário</div>
      <a class="dep-item" href="#">Conceito Y</a>
    </div>
    <div class="dep-group">
      <div class="dgt">Materiais que dependem deste</div>
      <a class="dep-item" href="#">Material Z</a>
    </div>
  </div>
</div>
```

## Conteúdo

- **Contextualização ao perfil:** gerar sempre adequado ao contexto do usuário, nunca genérico. Isso significa: (1) pergunta motivadora ancorada em cenário clínico real; (2) implicações clínicas com profundidade de mecanismo, não mencionadas de passagem; (3) leituras recomendadas partindo dos livros do usuário (Abbas, Murray, Rang & Dale, Machado) antes de sugerir externos. A contextualização não reduz profundidade — cobrir mecanismo até ser explicável sem referência externa é inegociável.
- Partir sempre do porquê antes do o quê.
- **Padrão histórico distribuído:** antes de cada conceito central, inserir `.hist` — sequência história → definição formal → mecanismo → implicação clínica.
- Na primeira ocorrência de cada conceito central: definição formal (`kbox`) antes da analogia.
- **Gradação de profundidade:** o compêndio tem três camadas implícitas — (1) mecanismo central, desenvolvido com saturação total; (2) conceitos de suporte, com parágrafo próprio e definição formal; (3) menções contextuais, apenas nomeadas com cross-link para compêndio dedicado. Nunca colapsar camada 1 para camada 3. Nunca expandir camada 3 inline — criar compêndio separado se o conceito exigir mais de um parágrafo.
- **Cross-links entre compêndios:** ao mencionar conceito coberto em outro HTML, usar `<a class="cross-link" href="../caminho/arquivo.html#id-secao">termo</a>`. Nunca reexplicar — linkar. Âncoras devem apontar para o ID de seção específica (ver **Convenção de IDs de âncoras**), não para o topo do arquivo. Consultar [[project-mapa-materiais]] para verificar se o conceito já tem compêndio antes de escrever qualquer explicação inline.
- **Criticidade universal:** ao apresentar qualquer modelo ou framework central (ex: cascata de coagulação, modelo clonal de ativação linfocitária, curva dose-resposta, qualquer teoria mecanicista), marcar explicitamente: (1) pressupostos assumidos pelo modelo; (2) condições em que o modelo falha ou perde validade; (3) onde evidência empírica diverge da predição teórica. Usar elemento `.kbox` com `.klabel` "Limites do modelo" imediatamente após a apresentação do framework. Não omitir mesmo que o modelo seja consensual — consenso não implica completude.
- **Tratamento de controvérsias genuínas:** quando houver disputa ativa na literatura (não apenas limitação de modelo, mas posições opostas sustentadas por evidência), usar elemento `.kbox` com `.klabel` "Controvérsia" — apresentar as duas posições com os melhores argumentos de cada lado, indicar o estado atual do consenso se existir, e nunca resolver artificialmente uma disputa não resolvida. Exemplos: mecanismo exato de ação de anestésicos, teoria dual-process em psicologia, papel do colesterol LDL em subpopulações específicas.
- **Política de versão de conceito:** ao atualizar entendimento de um conceito já coberto em outro compêndio (ex: nova evidência, revisão de mecanismo), não reescrever o compêndio original inline — registrar a divergência em [[project-estado]] com data e fonte, e adicionar nota no compêndio mais recente indicando a atualização. Só reescrever o compêndio original quando a mudança invalida o mecanismo central (não apenas adiciona nuance).
- Cada bloco deve avançar o raciocínio — nunca repetir, resumir ou parafrasear seção anterior.
- Profundidade: cobrir até o mecanismo ser explicável sem referência externa. O critério de parada não é tamanho — é saturação: quando não há mais conceito mencionado por nome sem mecanismo desenvolvido, o compêndio está completo para aquele estado do conhecimento. Ao criar ou revisar qualquer compêndio, varrer ativamente o corpo em busca desses conceitos — todo candidato identificado deve ser expandido em seção ou parágrafo próprio, nunca em citação inline. Crescimento por saturação, não por meta de linhas: mais é melhor aqui desde que cada adição avance o mecanismo. Incrementar o arquivo existente quando overlap conceitual > 40% — não criar arquivo separado.
- Siglas: por extenso na primeira ocorrência.
- Terminologia: usar como na literatura. Inglês quando é o padrão da área — sem forçar tradução. Na primeira ocorrência de cada termo estrangeiro: itálico + tradução entre parênteses — ex: *shear* (tensão de cisalhamento), *tissue plasminogen activator* (ativador tecidual do plasminogênio). Ocorrências subsequentes: apenas o termo original, sem repetir a tradução.
- Tabelas e figuras: incluir sempre que melhorarem compreensão comparativa. Legenda numerada imediatamente abaixo.
- Unidades: valor primário em SI; fabricante como referência secundária.

## Elementos visuais (CSS de referência)

```css
/* Nota histórica */
.hist{background:var(--bg2);border:1px solid var(--border);border-radius:5px;padding:12px 16px;margin:0 0 20px;font-size:14px;font-family:var(--font-ui);color:var(--muted)}
.hist .hl{font-size:9px;font-weight:600;color:var(--ac);text-transform:uppercase;letter-spacing:.09em;display:block;margin-bottom:5px}

/* Key-concept box */
.kbox{background:var(--ac2bg);border-left:2px solid var(--ac2);border-radius:0 5px 5px 0;padding:12px 16px;margin:14px 0}
.kbox .klabel{font-family:var(--font-ui);font-size:9px;font-weight:600;color:var(--ac2);text-transform:uppercase;letter-spacing:.1em;margin-bottom:6px}

/* Conceitos-chave grid */
.ck-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:10px;margin:14px 0}
.ck-card{background:var(--bg2);border:1px solid var(--border);border-radius:5px;padding:10px 13px}
.ck-card .ckt{font-family:var(--font-ui);font-size:12px;font-weight:600;color:var(--ac2);margin-bottom:4px}

/* Cross-link inline */
a.cross-link{color:var(--ac);font-size:.85em;font-style:italic;border-bottom:1px dashed var(--ac);text-decoration:none;opacity:.9}

/* Chips de metadados */
.chip{font-family:var(--font-ui);font-size:11px;color:var(--muted);background:var(--bg2);border:1px solid var(--border);border-radius:20px;padding:3px 10px}

/* Pergunta motivadora */
.pergunta{background:var(--bg3);border:1px solid var(--border);border-left:3px solid var(--ac);border-radius:0 6px 6px 0;padding:16px 20px;margin-bottom:40px}
.pergunta .plabel{font-family:var(--font-ui);font-size:9px;font-weight:600;color:var(--ac);text-transform:uppercase;letter-spacing:.1em;margin-bottom:8px}

/* Painel de dependências */
.dep-panel{background:var(--bg2);border:1px solid var(--border);border-radius:6px;padding:14px 18px;margin-bottom:40px}
.dep-panel .dep-label{font-family:var(--font-ui);font-size:9px;font-weight:600;color:var(--muted);text-transform:uppercase;letter-spacing:.1em;margin-bottom:12px}
.dep-row{display:flex;gap:10px;flex-wrap:wrap}
.dep-group{flex:1;min-width:160px}
.dep-group .dgt{font-family:var(--font-ui);font-size:10px;font-weight:600;color:var(--muted);margin-bottom:6px;text-transform:uppercase;letter-spacing:.06em}
.dep-item{font-family:var(--font-ui);font-size:12px;color:var(--muted);text-decoration:none;display:block;padding:3px 0;border-bottom:1px dashed var(--border)}

/* Perguntas em aberto */
.qa-block{background:var(--bg2);border:1px solid var(--border);border-left:3px solid var(--muted);border-radius:0 6px 6px 0;padding:14px 18px;margin:10px 0}
.qa-block .qa-label{font-family:var(--font-ui);font-size:9px;font-weight:600;color:var(--muted);text-transform:uppercase;letter-spacing:.1em;margin-bottom:8px}
.qa-block p{margin:0;color:var(--muted);font-size:15px}
```

## Seções finais

**Fundamentos necessários:** conceitos de áreas adjacentes indispensáveis. Critério de entrada: ausência tornaria frase opaca. Critério de saída: ativar exige mais de um parágrafo → mover para seção adequada.

**Perguntas em aberto (obrigatória):** seção entre Conexões e Discussão. Lista de 3–5 questões que o campo ainda não resolveu — fronteiras do conhecimento, não gaps do compêndio. Cada pergunta em `.qa-block`. Critério: deve ser genuinamente aberta (sem resposta consensual na literatura), não apenas difícil. Exemplos: mecanismos de resistência a medicamentos sem explicação molecular completa, controvérsias de causalidade vs. correlação em epidemiologia, lacunas experimentais conhecidas. Ao revisar compêndio existente, verificar se as perguntas ainda estão abertas — fechar as que tiverem sido respondidas e adicionar novas da literatura recente.

**Discussão:** três movimentos — (1) convergência, fechando a pergunta motivadora com os conceitos desenvolvidos; (2) tensão/paradoxos/limitações; (3) implicação derivada que emerge mas não foi enunciada no corpo. Não resumir — elevar abstração.

**Leituras recomendadas:** livros-texto, artigos (links acesso aberto), recursos online. Critério: densidade de mecanismo por página — não fama ou adoção curricular. Consultar [[project-estado]] para badge VOCÊ TEM; consultar [[user-livros-medicos]] para lista completa de livros do usuário. Não limitar às obras do usuário — incluir o melhor disponível.

**Referências ABNT:** NBR 6023:2018. DOIs e URLs como links (`target="_blank" rel="noopener"`, `color:var(--ac)`). Ordem alfabética por autor-data.

**Citações inline:** autor-data NBR 10520:2023 — formato `(SOBRENOME; SOBRENOME, ano)` para até dois autores; `(SOBRENOME et al., ano)` para três ou mais. Nunca numeração `[1]`, `[2]`. Classe `.cite`, `color:var(--ac)`, ancorado em `#referencias`. Múltiplas referências na mesma citação separadas por ponto e vírgula dentro dos parênteses: `(AUTOR A, ano; AUTOR B, ano)`.

## Dívida técnica

Registrar em `DEBT.md` na raiz do repositório toda inconsist�ência identificada mas não corrigida na sessão atual — nunca deixar silenciosa. Formato: `- [ ] \`caminho/arquivo.html\` — descrição (YYYY-MM-DD)`. Ao iniciar nova sessão, verificar `DEBT.md` e propor ao usuário o que priorizar. Exemplos de dívida técnica: acentuação corrompida em arquivo não editado na sessão, elemento CSS ausente descoberto por grep, pergunta motivadora sem resposta no final do compêndio.

## Modo Anki

Ao iniciar o Modo Anki para um material:

1. Verificar se existe `anki/anki_[material].json` — se sim, carregar para retomar do ponto anterior. Se não, criar o arquivo ao encerrar.
2. Seguir ordem lógica do HTML — seção por seção, sem pular.
3. Uma pergunta aberta por vez. Nunca dar a resposta antes da tentativa do usuário.
4. Classificar cada resposta como "dominada", "parcial" ou "não soube". Nunca classificar como dominada sem o usuário ter articulado o mecanismo (não apenas o nome).
5. Perguntas classificadas como "parcial" ou "não soube" são retomadas após 3–5 perguntas novas — nunca imediatamente.
6. A cada 10 perguntas, fazer uma pergunta integrativa que conecte conceitos de seções diferentes.
7. Ao encerrar: (a) síntese dos pontos fracos identificados na sessão; (b) sugestão de qual seção revisar antes da próxima sessão Anki; (c) atualizar `anki/anki_[material].json` com estado atual (perguntas feitas, classificações, ponto de parada).
8. Nunca iniciar Modo Anki sem verificar se o HTML está na versão mais recente — se houver dívida técnica no arquivo alvo em `DEBT.md`, informar antes de começar.

## Revisão periódica

Compêndios são atualizados sob demanda — apenas quando o usuário for usar o material. Nunca propagar atualizações automaticamente para todos os HTMLs existentes ao criar conteúdo novo: o custo de tokens não compensa, pois o material estará defasado novamente em breve de qualquer forma.

Ao abrir um compêndio para uso (Modo Anki, releitura, referência), verificar se há dívida técnica registrada em `DEBT.md` para aquele arquivo e aplicar as atualizações pendentes antes de começar.

Ao cobrir conceito que contradiz ou expande mecanismo explicado em outro compêndio, registrar a divergência em [[project-estado]] com data e arquivo afetado — sem reescrever o original. A correção acontecerá quando o compêndio for usado.

## Entrega de instruções atualizadas

Sempre gerar arquivo `instrucoes-projeto.md` na raiz da pasta do projeto. O usuário abre, seleciona tudo (Ctrl+A) e copia nas configurações do projeto. Nunca entregar apenas em blocos de código no chat. Após atualizar o arquivo, sincronizar a memory (`project_instrucoes_operacionais.md`) para manter consistência.

## Evolução destas instruções

Atualizar aqui apenas regras e especificações imutáveis. Estado mutável (livros, migração, decisões, dívida técnica) vai em [[project-estado]], `MIGRATION.md` e `DEBT.md`; mapa de conceitos em [[project-mapa-materiais]]. Nunca incluir tabelas de estado ou mapa de materiais neste arquivo.

Atualizar quando: correção pontual do usuário → incorporar imediatamente; padrão ad hoc se repete → formalizar aqui; escolha não-óbvia aceita → registrar em [[project-estado]].

Mudanças sistêmicas exigem proposta no chat antes de incorporar. Após aprovação, gerar `instrucoes-projeto.md` atualizado.

Antes de adicionar qualquer linha: verificar sobreposição com conteúdo existente. Reescrever a seção afetada em vez de acrescentar.
