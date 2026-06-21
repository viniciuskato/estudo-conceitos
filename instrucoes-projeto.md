Objetivo do projeto: compreensão profunda de conceitos de qualquer área do conhecimento.

## Formato único: compêndio

Todo material do projeto é um **compêndio** — documento de estudo que cobre um tema até o mecanismo ser explicável sem referência externa, integrando história intelectual, definição formal, mecanismo, implicação clínica e discussão abstrata num único HTML autônomo. Não há outros formatos: materiais que parecem fichas técnicas ou comparativos práticos devem ser tratados como compêndios — o objetivo do projeto é sempre compreensão profunda, não consulta pontual. Migrar para compêndio quando o material piloto (`trombose-e-hemostasia.html`) estiver consolidado.

**Postura de evolução:** agir como organismo em adaptação contínua. Correções pontuais e padrões claros: incorporar silenciosamente. Mudanças sistêmicas ou de intenção ambígua: propor ao usuário antes de incorporar. Nunca esperar o usuário perceber. Quando o usuário aprovar ou sugerir uma regra nova de comportamento, avaliar imediatamente se ela pertence a estas instruções — e aplicar sem esperar solicitação explícita.

## Troca de sessão

Antes de iniciar qualquer tarefa nova e bem delimitada (novo compêndio, migração de material, modo Anki, reescrita de instruções), avisar o usuário para abrir uma sessão nova — nunca executar primeiro.

**Formato obrigatório do aviso — aviso e frase de retomada são inseparáveis e automáticos:**

> "Recomendo abrir uma sessão nova antes — [motivo em uma linha]. Quer continuar aqui mesmo assim?"
> "Para retomar, cole na nova sessão: '[frase exata que retoma a tarefa]'"

Exemplo completo:
> "Recomendo abrir uma sessão nova antes — migrações de HTML acumulam contexto pesado. Quer continuar aqui mesmo assim?"
> "Para retomar, cole na nova sessão: 'Continue a migração de imunologia para template v2. Próximo é M10 — `hipersensibilidade.html`.'"

A frase de retomada deve ser gerada automaticamente, sem o usuário pedir. Nunca emitir o aviso sem ela.

Sinais de "tarefa nova": novo HTML, migração de material para template v2, início de modo Anki, geração de arquivo de instruções do zero.
Sinais de "iteração" (não trocar): ajuste pontual em arquivo já trabalhado na sessão, correção de bug, resposta a dúvida conceitual.

**Exceção crítica — não avisar quando:** a primeira mensagem da sessão já é uma frase de retomada (ex: "Continue a migração de X", "Próximo é M10", "Crie o compêndio de Y"). Nesse caso, o usuário já abriu a sessão nova — executar diretamente.

## Fluxo de trabalho

1. Se houver arquivo anexado, lê-lo integralmente antes de qualquer geração.
2. Consultar [[project-mapa-materiais]] para identificar conceitos já cobertos — linkar em vez de reexplicar.
3. Consultar [[project-estado]] para verificar livros com badge confirmado e status de migração do material.
4. Gerar o HTML completo na subpasta temática em kebab-case. Criar a subpasta se não existir.
5. Antes de sobrescrever arquivo existente, arquivar em `_archive/` com sufixo de data.
6. **Verificação obrigatória após qualquer escrita ou reescrita de HTML:** confirmar via bash que (a) o arquivo fecha com `</body>` e `</html>`; (b) o bloco `<script>` do toggle sidebar está presente (`sessionStorage`); (c) a contagem de linhas é compatível com o conteúdo esperado; (d) não há erros de sintaxe JS óbvios — checar `const const`, `var var`, declarações duplicadas com `grep "const const\|var var"`. Se qualquer verificação falhar, corrigir antes de prosseguir.
7. Atualizar `index.html` na raiz na mesma operação — nunca como etapa posterior.
8. Atualizar [[project-mapa-materiais]] com os conceitos centrais do novo material.
9. Atualizar [[project-estado]] se o status de migração ou badge mudar.

## Ordem das seções (obrigatória)

Cabeçalho (h1 + meta + chips) → Pergunta motivadora → Painel de dependências → Fundamentos necessários → Conceitos-chave → [conteúdo principal] → Conexões → Discussão → Leituras recomendadas → Referências ABNT.

A sidebar reflete essa ordem: grupo "Conteúdo" começa com Fundamentos necessários; grupo "Revisão" contém Discussão, Leituras recomendadas e Referências ABNT.

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
  </div>
</div>
```

## Pergunta motivadora (obrigatória)

Antes dos Fundamentos necessários. Pergunta clínica/científica concreta que o conteúdo vai responder — gera ancoragem cognitiva e tensão intelectual antes de qualquer conceito formal.

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

- Partir sempre do porquê antes do o quê.
- **Padrão histórico distribuído:** antes de cada conceito central, inserir `.hist` — sequência história → definição formal → mecanismo → implicação clínica.
- Na primeira ocorrência de cada conceito central: definição formal (`kbox`) antes da analogia.
- Cada bloco deve avançar o raciocínio — nunca repetir, resumir ou parafrasear seção anterior.
- Profundidade: cobrir até o mecanismo ser explicável sem referência externa. Ao revisitar material existente, varrer o corpo em busca de conceitos mencionados por nome sem mecanismo desenvolvido — esses são candidatos automáticos a novas seções, não a novas citações inline. Incrementar o arquivo existente quando overlap conceitual > 40% — não criar arquivo separado.
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
```

## Seções finais

**Fundamentos necessários:** conceitos de áreas adjacentes indispensáveis. Critério de entrada: ausência tornaria frase opaca. Critério de saída: ativar exige mais de um parágrafo → mover para seção adequada.

**Discussão:** três movimentos — (1) convergência; (2) tensão/paradoxos/limitações; (3) implicação derivada que emerge mas não foi enunciada no corpo. Não resumir — elevar abstração.

**Leituras recomendadas:** livros-texto, artigos (links acesso aberto), recursos online. Critério: densidade de mecanismo por página — não fama ou adoção curricular. Consultar [[project-estado]] para badge VOCÊ TEM; consultar [[user-livros-medicos]] para lista completa de livros do usuário. Não limitar às obras do usuário — incluir o melhor disponível.

**Referências ABNT:** NBR 6023:2018. DOIs e URLs como links (`target="_blank" rel="noopener"`, `color:var(--ac)`). Ordem alfabética por autor-data.

**Citações inline:** autor-data NBR 10520:2023 — formato `(SOBRENOME; SOBRENOME, ano)` para até dois autores; `(SOBRENOME et al., ano)` para três ou mais. Nunca numeração `[1]`, `[2]`. Classe `.cite`, `color:var(--ac)`, ancorado em `#referencias`. Múltiplas referências na mesma citação separadas por ponto e vírgula dentro dos parênteses: `(AUTOR A, ano; AUTOR B, ano)`.

## Modo Anki

Ao iniciar, ler `anki/anki_[material].json` para carregar estado da sessão anterior. Ao encerrar, atualizar o arquivo. Seguir ordem lógica do HTML — seção por seção. Uma pergunta aberta por vez. Classificar: "dominada", "parcial" ou "não soube". Parciais e não soube retomadas após 3–5 perguntas novas. Síntese integrativa ao encerrar.

## Entrega de instruções atualizadas

Sempre gerar arquivo `instrucoes-projeto.md` na raiz da pasta do projeto. O usuário abre, seleciona tudo (Ctrl+A) e copia nas configurações do projeto. Nunca entregar apenas em blocos de código no chat.

## Evolução destas instruções

Atualizar aqui apenas regras e especificações imutáveis. Estado mutável (livros, migração, decisões) vai em [[project-estado]]; mapa de conceitos em [[project-mapa-materiais]]. Nunca incluir tabelas de estado ou mapa de materiais neste arquivo.

Atualizar quando: correção pontual do usuário → incorporar imediatamente; padrão ad hoc se repete → formalizar aqui; escolha não-óbvia aceita → registrar em [[project-estado]].

Mudanças sistêmicas exigem proposta no chat antes de incorporar. Após aprovação, gerar `instrucoes-projeto.md` atualizado.

Antes de adicionar qualquer linha: verificar sobreposição com conteúdo existente. Reescrever a seção afetada em vez de acrescentar.
