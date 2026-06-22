# Estrutura Exportável — Projeto Estudo de Conceitos

> Documento gerado em 2026-06-22 para transferência ao projeto "Trabalhos genéricos".  
> Importar o que for relevante ao propósito do projeto receptor.

---

## 1. Filosofia central

O projeto é organizado em torno de um único formato: o **compêndio**. A premissa é que material de estudo deve cobrir um tema até que o mecanismo seja explicável sem referência externa — integrando história intelectual, definição formal, mecanismo, implicação prática e discussão abstrata num único arquivo HTML autônomo.

Princípios que guiam qualquer decisão de conteúdo:

- **Partir do porquê antes do o quê** — contextualização e motivação antes de qualquer definição formal.
- **Saturação como critério de parada** — não existe meta de linhas; o material está completo quando não há conceito mencionado por nome sem mecanismo desenvolvido.
- **Criticidade universal** — todo modelo central deve ter seus pressupostos, falhas e divergências com a evidência empírica marcados explicitamente.
- **Cross-links em vez de reexplicação** — conceitos cobertos em outro documento são linkados, nunca reexplicados inline.
- **Gradação de profundidade** — camada 1 (mecanismo central, saturação total), camada 2 (conceitos de suporte, parágrafo próprio), camada 3 (menções contextuais, apenas nomeadas com link).

---

## 2. Estrutura de um documento (ordem obrigatória)

```
Cabeçalho (h1 + metadados + chips)
Pergunta motivadora
Painel de dependências
Fundamentos necessários
Conceitos-chave (grid visual)
[Conteúdo principal — seções específicas do tema]
Conexões
Perguntas em aberto
Discussão
Leituras recomendadas
Referências ABNT
```

### 2.1 Cabeçalho

```html
<div class="doc-header">
  <h1>Título</h1>
  <p class="doc-meta">Área · Subárea · Fonte · Ano</p>
  <div class="doc-chips">
    <span class="chip">⏱ <b>~X min</b> de leitura</span>
    <span class="chip">📋 Pré-requisitos: <b>...</b></span>
    <span class="chip">🔗 Depende de: <b>...</b></span>
    <span class="chip">📍 Área: <b>...</b></span>
    <span class="chip">🗓 Última revisão: <b>YYYY-MM-DD</b></span>
  </div>
</div>
```

### 2.2 Pergunta motivadora

Pergunta concreta que o conteúdo vai responder — gera ancoragem antes de qualquer conceito formal. **Deve ser fechada na seção Discussão.**

```html
<div class="pergunta">
  <div class="plabel">Pergunta motivadora</div>
  <p>...</p>
</div>
```

### 2.3 Painel de dependências

Três colunas: (1) materiais que este documento usa; (2) pré-requisitos externos; (3) materiais futuros que dependem deste.

```html
<div class="dep-panel">
  <div class="dep-label">Mapa de dependências</div>
  <div class="dep-row">
    <div class="dep-group">
      <div class="dgt">Este documento usa</div>
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

### 2.4 Seções finais obrigatórias

**Perguntas em aberto** — 3–5 questões genuinamente não resolvidas na literatura/campo (não gaps do documento). Cada pergunta em `.qa-block`.

**Discussão** — três movimentos: (1) convergência, fechando a pergunta motivadora; (2) tensão/paradoxos/limitações; (3) implicação derivada que emerge mas não foi enunciada no corpo. Não resumir — elevar abstração.

---

## 3. Template visual (HTML autônomo)

### 3.1 Paleta de cores

```css
:root {
  --bg:    #111010;
  --bg2:   #1a1919;
  --bg3:   #222121;
  --border:#333131;
  --text:  #e2ddd6;
  --muted: #9e9890;
  --ac:    #d4924a;   /* âmbar — destaque principal */
  --ac2:   #c0604a;   /* terracota — kbox / conceitos-chave */
  --ac2bg: #2a1810;   /* fundo kbox */
  --font-body: 'Source Serif 4', Georgia, serif;
  --font-ui:   'Inter', system-ui, sans-serif;
}
```

Fontes via Google Fonts: **Source Serif 4** (corpo, 16px, line-height 1.78) + **Inter** (interface).

### 3.2 Layout principal

```css
/* Wrapper geral */
#body-wrap { display: flex; height: 100vh; overflow: hidden; }

/* Sidebar */
#sidebar {
  width: 280px; height: 100vh;
  display: flex; flex-direction: column;
  transition: width .25s; overflow: hidden;
}
#sidebar.collapsed { width: 44px; }
.s-inner { flex: 1; overflow-y: auto; width: 280px; }

/* Conteúdo */
#content { flex: 1; padding: 52px 72px 120px; transition: padding .25s; overflow-y: auto; }
.prose  { max-width: 88ch; margin: 0 auto; transition: max-width .25s; }

/* Sidebar colapsada — conteúdo expande */
#body-wrap.sidebar-collapsed #content { padding: 52px 100px 120px; }
#body-wrap.sidebar-collapsed .prose   { max-width: 114ch; }
```

### 3.3 Sidebar colapsável

```html
<!-- Botão fora do .s-inner — nunca some ao colapsar -->
<div id="s-toggle">
  <button id="toggle-btn" aria-label="Toggle sidebar">‹</button>
</div>
<div class="s-inner">
  <!-- links de navegação -->
</div>
```

```js
// Estado persistido em sessionStorage
const COLLAPSED = 'sidebar-collapsed';
const sidebar   = document.getElementById('sidebar');
const bodyWrap  = document.getElementById('body-wrap');
const btn       = document.getElementById('toggle-btn');

function applyState(collapsed) {
  sidebar.classList.toggle('collapsed', collapsed);
  bodyWrap.classList.toggle('sidebar-collapsed', collapsed);
  btn.textContent = collapsed ? '›' : '‹';
  document.querySelectorAll('.s-logo,.s-group,a.sl').forEach(el => {
    el.style.opacity        = collapsed ? '0' : '';
    el.style.pointerEvents  = collapsed ? 'none' : '';
  });
}

btn.addEventListener('click', () => {
  const next = !sidebar.classList.contains('collapsed');
  sessionStorage.setItem(COLLAPSED, next);
  applyState(next);
});

applyState(sessionStorage.getItem(COLLAPSED) === 'true');
```

### 3.4 Barra de progresso de leitura

```html
<div id="progress-bar"></div>
```

```css
#progress-bar {
  position: fixed; top: 0; left: 0;
  height: 2px; background: var(--ac); z-index: 100;
  width: 0%;
}
```

```js
document.getElementById('content').addEventListener('scroll', function() {
  const el = this;
  const pct = el.scrollTop / (el.scrollHeight - el.clientHeight) * 100;
  document.getElementById('progress-bar').style.width = pct + '%';
}, { passive: true });
```

### 3.5 Highlight de seção ativa (sidebar + corpo)

```js
// Destaque na sidebar
const observer = new IntersectionObserver(entries => {
  entries.forEach(e => {
    const id   = e.target.id;
    const link = document.querySelector(`a.sl[href="#${id}"]`);
    if (link) link.classList.toggle('active', e.isIntersecting);
  });
}, { rootMargin: '-20% 0px -70% 0px', root: document.getElementById('content') });

document.querySelectorAll('section[id]').forEach(s => observer.observe(s));

// Highlight do h2 da seção visível
const observer2 = new IntersectionObserver(entries => {
  entries.forEach(e => e.target.classList.toggle('in-view', e.isIntersecting));
}, { rootMargin: '-20% 0px -70% 0px', root: document.getElementById('content') });

document.querySelectorAll('section[id]').forEach(s => observer2.observe(s));
```

```css
section.in-view > h2 { color: var(--ac); transition: color .3s; }
a.sl.active { color: var(--ac); border-left: 2px solid var(--ac); }
```

### 3.6 Responsivo (mobile ≤ 900px)

```css
@media (max-width: 900px) {
  #sidebar  { display: none; }
  #sidebar.open { display: block; position: fixed; z-index: 200; height: 100vh; }
  #mob-bar  { display: flex; }
  #content  { padding: 24px 20px 80px; }
  .ck-grid  { grid-template-columns: repeat(2, 1fr); }
}
```

### 3.7 Print

```css
@media print {
  body { background: #fff; color: #000; }
  #sidebar, #progress-bar, #mob-bar { display: none; }
  a::after { content: ' (' attr(href) ')'; font-size: 10px; }
}
```

---

## 4. Elementos visuais (CSS de referência)

```css
/* Nota histórica */
.hist {
  background: var(--bg2); border: 1px solid var(--border);
  border-radius: 5px; padding: 12px 16px; margin: 0 0 20px;
  font-size: 14px; font-family: var(--font-ui); color: var(--muted);
}
.hist .hl {
  font-size: 9px; font-weight: 600; color: var(--ac);
  text-transform: uppercase; letter-spacing: .09em;
  display: block; margin-bottom: 5px;
}

/* Caixa de conceito-chave / limites de modelo / controvérsia */
.kbox {
  background: var(--ac2bg); border-left: 2px solid var(--ac2);
  border-radius: 0 5px 5px 0; padding: 12px 16px; margin: 14px 0;
}
.kbox .klabel {
  font-family: var(--font-ui); font-size: 9px; font-weight: 600;
  color: var(--ac2); text-transform: uppercase; letter-spacing: .1em; margin-bottom: 6px;
}

/* Grid de conceitos-chave */
.ck-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px; margin: 14px 0; }
.ck-card { background: var(--bg2); border: 1px solid var(--border); border-radius: 5px; padding: 10px 13px; }
.ck-card .ckt { font-family: var(--font-ui); font-size: 12px; font-weight: 600; color: var(--ac2); margin-bottom: 4px; }

/* Cross-link inline */
a.cross-link {
  color: var(--ac); font-size: .85em; font-style: italic;
  border-bottom: 1px dashed var(--ac); text-decoration: none; opacity: .9;
}

/* Chips de metadados */
.chip {
  font-family: var(--font-ui); font-size: 11px; color: var(--muted);
  background: var(--bg2); border: 1px solid var(--border);
  border-radius: 20px; padding: 3px 10px;
}

/* Pergunta motivadora */
.pergunta {
  background: var(--bg3); border: 1px solid var(--border);
  border-left: 3px solid var(--ac); border-radius: 0 6px 6px 0;
  padding: 16px 20px; margin-bottom: 40px;
}
.pergunta .plabel {
  font-family: var(--font-ui); font-size: 9px; font-weight: 600;
  color: var(--ac); text-transform: uppercase; letter-spacing: .1em; margin-bottom: 8px;
}

/* Painel de dependências */
.dep-panel { background: var(--bg2); border: 1px solid var(--border); border-radius: 6px; padding: 14px 18px; margin-bottom: 40px; }
.dep-panel .dep-label { font-family: var(--font-ui); font-size: 9px; font-weight: 600; color: var(--muted); text-transform: uppercase; letter-spacing: .1em; margin-bottom: 12px; }
.dep-row  { display: flex; gap: 10px; flex-wrap: wrap; }
.dep-group { flex: 1; min-width: 160px; }
.dep-group .dgt { font-family: var(--font-ui); font-size: 10px; font-weight: 600; color: var(--muted); margin-bottom: 6px; text-transform: uppercase; letter-spacing: .06em; }
.dep-item { font-family: var(--font-ui); font-size: 12px; color: var(--muted); text-decoration: none; display: block; padding: 3px 0; border-bottom: 1px dashed var(--border); }

/* Perguntas em aberto */
.qa-block { background: var(--bg2); border: 1px solid var(--border); border-left: 3px solid var(--muted); border-radius: 0 6px 6px 0; padding: 14px 18px; margin: 10px 0; }
.qa-block .qa-label { font-family: var(--font-ui); font-size: 9px; font-weight: 600; color: var(--muted); text-transform: uppercase; letter-spacing: .1em; margin-bottom: 8px; }
.qa-block p { margin: 0; color: var(--muted); font-size: 15px; }

/* Citações inline */
.cite { color: var(--ac); }
```

---

## 5. Convenções de conteúdo

### IDs de âncoras
Todo `<section>` com `id` em kebab-case sem acentos. Exemplos: `fundamentos`, `conceitos-chave`, `perguntas-abertas`, `discussao`, `leituras`, `referencias`. Cross-links apontam para `arquivo.html#id-secao`, nunca para o topo.

### Terminologia
- Siglas por extenso na primeira ocorrência.
- Termos estrangeiros em itálico com tradução na primeira ocorrência; apenas o original nas seguintes.

### Citações
Formato autor-data NBR 10520: `(SOBRENOME, ano)` ou `(SOBRENOME et al., ano)`. Nunca numeração `[1]`. Múltiplas referências separadas por ponto e vírgula dentro dos parênteses.

### Referências ABNT
NBR 6023:2018. DOIs e URLs como links (`target="_blank" rel="noopener"`). Ordem alfabética por autor-data.

### Padrão histórico distribuído
Antes de cada conceito central: bloco `.hist` com sequência história → definição formal → mecanismo → implicação prática.

---

## 6. Índice (index.html)

Cada entrada de documento no portal:

```html
<a class="card" href="caminho/relativo/arquivo.html">
  <div class="card-area">Área · Subárea</div>
  <div class="card-title">Título do Documento</div>
  <div class="card-meta">~X min · Última revisão: YYYY-MM-DD</div>
</a>
```

Entradas agrupadas por área; mais recente primeiro dentro do grupo.

---

## 7. Fluxo de trabalho recomendado

1. **Antes de criar:** verificar se o conceito já existe em outro documento — linkar em vez de reexplicar.
2. **Criar na subpasta temática** em kebab-case.
3. **Verificação pós-criação:** confirmar que o arquivo fecha com `</body></html>`, que o JS do sidebar está presente e que a contagem de linhas é compatível.
4. **Atualizar o índice** na mesma operação — nunca como etapa posterior.
5. **Arquivar em `_archive/`** (com sufixo de data) antes de sobrescrever, quando a mudança afeta ≥30% do conteúdo ou altera estrutura de seções.

---

## 8. O que NÃO importar (específico deste projeto)

Os itens abaixo são contexto do projeto "Estudo de Conceitos" e não fazem sentido fora dele:

- Implicações clínicas e referências médicas (Abbas, Murray, Rang & Dale, Machado).
- Modo Anki e arquivos `anki/*.json`.
- `MIGRATION.md` e status de migração para template v2.
- `push.bat` e integração com `github.com/viniciuskato/estudo-conceitos`.
- Referências às memories internas (`project-estado`, `project-mapa-materiais`).

---

*Fim do documento exportável.*
