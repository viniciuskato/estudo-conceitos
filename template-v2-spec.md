# Template v2 — Especificação completa

Referência canônica para criação de novos compêndios HTML. Consultar este arquivo ao iniciar qualquer novo HTML.

---

## Paleta C

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

---

## Layout

- `#sidebar`: `width:280px`, sticky, `height:100vh`, `overflow:hidden`, `display:flex; flex-direction:column`, `transition:width .25s`
- `#sidebar.collapsed`: `width:44px`
- `#s-toggle`: fora do `.s-inner`, sempre visível mesmo colapsado
- `.s-inner`: `flex:1; overflow-y:auto; width:280px`
- `#content`: `flex:1; padding:52px 72px 120px; transition:padding .25s`
- `.prose`: `max-width:88ch; margin:0 auto; transition:max-width .25s`
- `#body-wrap.sidebar-collapsed #content`: `padding:52px 100px 120px`
- `#body-wrap.sidebar-collapsed .prose`: `max-width:114ch`

---

## Sidebar colapsável

- Botão `#toggle-btn` dentro de `#s-toggle`, fora do `.s-inner` — nunca some ao colapsar
- Estado persistido em `sessionStorage('sidebar-collapsed')`
- Colapsar: `sidebar.classList.add('collapsed')` + `bodyWrap.classList.add('sidebar-collapsed')`
- `.s-logo`, `.s-group`, `a.sl` recebem `opacity:0; pointer-events:none` quando colapsado

---

## Barra de progresso

- `#progress-bar`: `position:fixed; top:0; left:0; height:2px; background:var(--ac); z-index:100`
- Atualizada via evento `scroll` passivo: `width = scrollTop/(scrollHeight-clientHeight)*100+'%'`

---

## Highlight de seção ativa

- Segundo `IntersectionObserver` com `rootMargin:'-20% 0px -70% 0px'`
- Seção visível recebe `.in-view` → `section.in-view > h2 { color:var(--ac); transition:color .3s }`
- Primeiro observer destaca `.active` na sidebar

---

## Mobile (`max-width:900px`)

- Sidebar `display:none` por padrão, `display:block` quando `.open`
- `#mob-bar` visível com botão ☰; `#s-toggle` oculto
- `#content`: `padding:24px 20px 80px`; `.ck-grid`: `repeat(2,1fr)`

---

## Print

- Fundo branco, texto preto, sidebar e âncoras ocultas, URLs após links

---

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

---

## Pergunta motivadora (obrigatória)

Antes dos Fundamentos necessários. Pergunta clínica/científica concreta que o conteúdo vai responder — gera ancoragem cognitiva e tensão intelectual antes de qualquer conceito formal. **A pergunta deve ser fechada ao final do compêndio** — na seção Discussão ou em parágrafo explícito após o conteúdo principal, articulando a resposta com os conceitos desenvolvidos.

```html
<div class="pergunta">
  <div class="plabel">Pergunta motivadora</div>
  <p>...</p>
</div>
```

---

## Painel de dependências (obrigatório)

Logo após a pergunta motivadora. Três colunas: (1) materiais que este compêndio usa; (2) pré-requisitos externos; (3) materiais futuros que dependem deste. Preencher com base em `project_mapa_materiais.md`.

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

---

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

---

## Seções finais

**Fundamentos necessários:** conceitos de áreas adjacentes indispensáveis. Critério de entrada: ausência tornaria frase opaca. Critério de saída: ativar exige mais de um parágrafo → mover para seção adequada.

**Perguntas em aberto (obrigatória):** seção entre Conexões e Discussão. Lista de 3–5 questões que o campo ainda não resolveu — fronteiras do conhecimento, não gaps do compêndio. Cada pergunta em `.qa-block`. Critério: deve ser genuinamente aberta (sem resposta consensual na literatura), não apenas difícil. Ao revisar compêndio existente, verificar se as perguntas ainda estão abertas — fechar as que tiverem sido respondidas e adicionar novas da literatura recente.

**Discussão:** três movimentos — (1) convergência, fechando a pergunta motivadora com os conceitos desenvolvidos; (2) tensão/paradoxos/limitações; (3) implicação derivada que emerge mas não foi enunciada no corpo. Não resumir — elevar abstração.

**Leituras recomendadas:** livros-texto, artigos (links acesso aberto), recursos online. Critério: densidade de mecanismo por página — não fama ou adoção curricular. Consultar `project_estado.md` para badge VOCÊ TEM; consultar `user_livros_medicos.md` para lista completa. Não limitar às obras do usuário — incluir o melhor disponível.

**Referências ABNT:** NBR 6023:2018. DOIs e URLs como links (`target="_blank" rel="noopener"`, `color:var(--ac)`). Ordem alfabética por autor-data.

**Citações inline:** autor-data NBR 10520:2023 — formato `(SOBRENOME; SOBRENOME, ano)` para até dois autores; `(SOBRENOME et al., ano)` para três ou mais. Nunca numeração `[1]`, `[2]`. Classe `.cite`, `color:var(--ac)`, ancorado em `#referencias`. Múltiplas referências na mesma citação separadas por ponto e vírgula: `(AUTOR A, ano; AUTOR B, ano)`.
