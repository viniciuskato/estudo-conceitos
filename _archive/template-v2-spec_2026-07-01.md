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
Fontes via Google Fonts: Source Serif 4 (corpo **17px**, line-height 1.78) + Inter (interface).

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

## Link de retorno ao índice (`#s-home`) — obrigatório

Todo compêndio é aberto a partir do `index.html` raiz. Sem um link de volta explícito, o usuário fica preso na página (o botão "voltar" do navegador nem sempre está disponível — ex. app shell, aba aberta direto por link/atalho). `#s-home` fica **acima** de `#s-toggle`, fora do `.s-inner`, para nunca sumir ao colapsar a sidebar.

```html
<div id="s-home"><a id="home-btn" href="../../index.html" title="Voltar ao índice">⌂ <span class="home-label">Índice</span></a></div>
<div id="s-toggle">
  <button id="toggle-btn" onclick="toggleSidebar()">◀</button>
</div>
```

- `href` relativo: calcular a partir da profundidade real do arquivo até a raiz do projeto (`../../index.html` para arquivos em `compêndios/<área>/` ou `medicina/<área>/`; um `../` a mais por nível extra, ex. `medicina/fisiopatologia/choque-circulatorio/` → `../../../index.html`)
- `.home-label` fica oculto quando `#sidebar.collapsed`, mantendo só o ícone ⌂ visível

```css
#s-home{padding:8px 8px 0;flex-shrink:0}
#home-btn{display:inline-flex;align-items:center;gap:6px;font-family:var(--font-ui);font-size:12px;color:var(--muted);text-decoration:none;padding:4px 8px;border:1px solid var(--border);border-radius:4px;white-space:nowrap;overflow:hidden}
#home-btn:hover{color:var(--text);border-color:var(--muted)}
#sidebar.collapsed #home-btn .home-label{display:none}
#sidebar.collapsed #home-btn{padding:4px;justify-content:center}
```

Aplicar em todo compêndio novo e ao revisar compêndios existentes — mesma obrigatoriedade da tradução PT-BR na sidebar (`.sl-pt`).

---

## Barra de progresso

- `#progress-bar`: `position:fixed; top:0; left:0; height:2px; background:var(--ac); z-index:100`
- Atualizada via evento `scroll` passivo: `width = scrollTop/(scrollHeight-clientHeight)*100+'%'`

---

## Highlight de seção ativa

- `.active` na sidebar: **scroll-based listener** (NÃO `IntersectionObserver`) — robusto para seções de tamanho variável:
  ```js
  var sideLinks = document.querySelectorAll('a.sl[href^="#"]');
  var sections = Array.from(document.querySelectorAll('section[id]'));
  function updateActive(){
    var scrollY = window.scrollY || window.pageYOffset;
    var offset = 80;
    var current = sections[0];
    for(var i=0;i<sections.length;i++){
      if(sections[i].getBoundingClientRect().top + scrollY <= scrollY + offset) current = sections[i];
    }
    sideLinks.forEach(function(l){ l.classList.remove('active'); });
    var a = document.querySelector('a.sl[href="#'+current.id+'"]');
    if(a) a.classList.add('active');
  }
  window.addEventListener('scroll', updateActive, {passive:true});
  updateActive();
  ```
- `.in-view` em seções (para `h2` colorido): `IntersectionObserver` com `rootMargin:'-10% 0px -55% 0px'`
  - Seção visível recebe `.in-view` → `section.in-view > h2 { color:var(--ac); transition:color .3s }`

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

/* Tabela de dados (comparativo) */
.data-table{width:100%;border-collapse:collapse;margin:18px 0;font-size:13.5px;font-family:var(--font-ui)}
.data-table th{background:var(--bg3);color:var(--ac);font-weight:600;font-size:11px;text-transform:uppercase;letter-spacing:.06em;padding:8px 12px;text-align:left;border-bottom:2px solid var(--border)}
.data-table td{padding:8px 12px;border-bottom:1px solid var(--border);color:var(--text);vertical-align:top;line-height:1.5}
.data-table tr:last-child td{border-bottom:none}
.data-table tr:hover td{background:var(--bg3)}
.data-table td.td-label{color:var(--text);font-weight:600}
```

Uso de `.data-table`: a primeira célula de cada linha (o rótulo/nome da linha) recebe `class="td-label"` para destacá-la visualmente das demais colunas — ver exemplos em `medicina/imunologia/*.html`. Sempre envolver em `<div class="table-wrap">` e seguir com `<caption>` ou `<p class="table-caption">` numerada.

---


---

## Fontes de imagens (hierarquia)

1. **OpenStax Anatomy & Physiology** (CC BY) — preferencial: colorido, rótulos grandes e legíveis.
2. **Gray's Anatomy (1918)** — domínio público: clássico, usar quando legível.
3. **Blausen Medical** (CC BY 3.0) — ilustrações 3D para estruturas específicas.

Evitar SVGs com fundo branco em tema escuro (ficam estranhos no lightbox).

URL via API Wikimedia (usar `javascript_tool` no Chrome):
```js
fetch('https://commons.wikimedia.org/w/api.php?action=query&titles=File:NOME.ext&prop=imageinfo&iiprop=url&format=json&origin=*')
```

---

## Pranchas anatômicas (plate-block)

```html
<div class="plate-block" id="fig-NNN">
  <img src="URL_WIKIMEDIA"
       alt="Descrição curta"
       loading="lazy"
       data-caption="Legenda curta para o lightbox">
  <div class="plate-caption">
    <b>Fig. N — Título</b> — Descrição. Fonte, Ano. Licença.
    <span style="display:block;margin-top:5px;font-size:13px;color:var(--muted);line-height:1.6">
      Term1 <em>(tradução PT)</em> · Term2 <em>(tradução PT)</em>
    </span>
  </div>
</div>
```

**Regras:**
- `float:right; width:42%; margin:4px 0 20px 28px` — texto corre ao lado
- `id="fig-NNN"` — âncora para referências clicáveis no texto
- `data-caption` — legenda CURTA para o lightbox (não o caption completo)
- `plate-caption` fecha com `</div>` (não `</p>`) — regex Python: `r'(<div class="plate-caption">)(.*?)(</div>)'`
- Traduções PT obrigatórias: listar termos visíveis na imagem na ordem estruturas maiores → menores
- Mobile: `float:none; width:100%` em `max-width:900px`
- NÃO usar `filter:invert`

```css
.plate-block{float:right;clear:right;width:42%;margin:4px 0 20px 28px;background:var(--bg2);border:1px solid var(--border);border-radius:6px;overflow:hidden}
.plate-block img{width:100%;display:block;background:#e8e2d8;cursor:zoom-in}
.plate-caption{padding:8px 14px;font-family:var(--font-ui);font-size:13px;color:var(--muted);border-top:1px solid var(--border)}
.plate-caption b{color:var(--ac);font-weight:600}
a.fig-ref{color:var(--ac);font-size:.82em;font-style:italic;white-space:nowrap;border-bottom:1px dashed color-mix(in srgb,var(--ac) 50%,transparent);text-decoration:none;cursor:pointer}
```

---

## Lightbox

```css
#lightbox{display:none;position:fixed;inset:0;z-index:1000;background:rgba(0,0,0,.93);align-items:center;justify-content:center;padding:40px 56px;flex-direction:column;gap:10px}
#lightbox.open{display:flex}
#lightbox img{max-width:82vw;max-height:80vh;object-fit:contain;border-radius:6px;box-shadow:0 4px 32px rgba(0,0,0,.8)}
#lightbox-caption{background:rgba(30,28,28,.85);color:var(--muted);font-family:var(--font-ui);font-size:12.5px;padding:6px 18px;border-radius:8px;max-width:78vw;text-align:center;pointer-events:none;flex-shrink:0}
#lightbox-close{position:fixed;top:16px;right:20px;background:none;border:none;color:var(--muted);font-size:24px;cursor:pointer;font-family:var(--font-ui);line-height:1}
```

- Caption do lightbox usa `data-caption` da imagem (legenda curta) — não o `textContent` do plate-caption completo
- Fecha com ESC ou clique fora da imagem
- `document.body.style.overflow='hidden'` ao abrir; restaurar ao fechar

---

## Referências clicáveis e botão voltar

```html
<!-- No texto: -->
<a class="fig-ref" onclick="navFig(this)" href="#fig-NNN">(Fig. N)</a>

<!-- Botão fixo (HTML, antes do </body>): -->
<button id="back-btn" onclick="backToRead()">← Voltar à leitura</button>
```

```js
// navFig: salva posição antes de navegar para a prancha
window._readPos = null;
window.navFig = function(anchor){
  window._readPos = window.scrollY;
  document.getElementById('back-btn').style.display = 'block';
};
// backToRead: retorna ao ponto salvo
window.backToRead = function(){
  if(window._readPos !== null){
    window.scrollTo({top: window._readPos, behavior:'smooth'});
  }
  document.getElementById('back-btn').style.display = 'none';
};
```

```css
#back-btn{display:none;position:fixed;bottom:28px;right:28px;z-index:200;background:var(--bg2);border:1px solid var(--ac);color:var(--ac);font-family:var(--font-ui);font-size:12px;font-weight:600;padding:8px 14px;border-radius:20px;cursor:pointer;box-shadow:0 2px 8px rgba(0,0,0,.4)}
```

---

## Scroll suave

```css
html{scroll-behavior:smooth}
```

Aplicar ao `<html>` para que links de âncora (sidebar, fig-ref) rolem suavemente.

---

## Seções finais

**Fundamentos necessários:** conceitos de áreas adjacentes indispensáveis. Critério de entrada: ausência tornaria frase opaca. Critério de saída: ativar exige mais de um parágrafo → mover para seção adequada.

**Perguntas em aberto (obrigatória):** seção entre Conexões e Discussão. Lista de 3–5 questões que o campo ainda não resolveu — fronteiras do conhecimento, não gaps do compêndio. Cada pergunta em `.qa-block`. Critério: deve ser genuinamente aberta (sem resposta consensual na literatura), não apenas difícil. Ao revisar compêndio existente, verificar se as perguntas ainda estão abertas — fechar as que tiverem sido respondidas e adicionar novas da literatura recente.

---

## App shell (PWA) — instalável no Chrome

Arquivos na raiz do repositório (fora de `compêndios/`, `medicina/` etc.) que dão suporte a instalar o site como app — não recriar em outro lugar nem duplicar:

- `manifest.json` (raiz) — `start_url`/`scope` apontam para `index.html`; não precisa mudar ao adicionar compêndio novo.
- `assets/icons/icon-192.png`, `icon-512.png`, `icon-512-maskable.png` — ícone gerado via Python/PIL (paleta do tema: fundo `#171514`, formas em `--ac`/`--ac2`). Regenerar só se quiser trocar o visual do ícone.
- `.nojekyll` (raiz, arquivo vazio) — desativa o processamento Jekyll do GitHub Pages. Necessário porque Jekyll por padrão *exclui* pastas com nome começando em `_` (`_docs/`, `_archive/`, `_acervo/`) do build; sem esse arquivo, qualquer link público para dentro dessas pastas quebra.
- `index.html` (raiz) é o `start_url` do manifest — é a tela inicial do app instalado, então manter seu catálogo atualizado importa mais do que antes (ver `_docs/DEBT.md` para pendências).

Piloto de dicionário interativo (tooltip enriquecido + busca ao vivo): ver entrada em `_docs/DEBT.md` — aplicado só em `compêndios/medicina/cardiologia-anatomia.html` até o momento, não é padrão a replicar automaticamente sem confirmar com o usuário.

**Discussão:** três movimentos — (1) convergência, fechando a pergunta motivadora com os conceitos desenvolvidos; (2) tensão/paradoxos/limitações; (3) implicação derivada que emerge mas não foi enunciada no corpo. Não resumir — elevar abstração.

**Leituras recomendadas:** livros-texto, artigos (leis primárias), enciclopédias de referência e monografias, organizados em **camadas** para guiar o estudo — não uma lista plana. Três camadas obrigatórias:

1. **Ponto de entrada** — a leitura por onde começar sem pré-requisito: verbete de enciclopédia revisada por pares (em filosofia, SEP/IEP), capítulo introdutório de livro-texto ou artigo de síntese. Serve para mapear o debate antes do texto-fonte.
2. **Aprofundamento** — os textos-fonte e artigos seminais que fundamentam as afirmações centrais do compêndio. Aqui vai o argumento original (em filosofia, o texto do próprio filósofo ou o artigo seminal do debate contemporâneo), não o comentador.
3. **Consulta especializada** — monografias, comentadores e literatura de disputa interpretativa, para quem já domina o núcleo e quer resolver uma controvérsia específica ou ir à fronteira.

Cada referência com **tipo** (livro / artigo / verbete / texto-fonte), **título**, **autor**, **ano** e uma **anotação** de 1–2 frases justificando por que está ali e o que o leitor ganha com ela — nunca uma referência sem anotação. Não omitir material relevante por ser longo ou difícil: o compêndio deve informar o que existe, cabendo ao leitor decidir o quanto encarar. Marcar (quando houver) qual referência corresponde ao ponto de partida recomendado do leitor.
