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
- `.prose`: `max-width:1000px; margin:0 auto; transition:max-width .25s`
- `#body-wrap.sidebar-collapsed #content`: `padding:52px 100px 120px`
- `#body-wrap.sidebar-collapsed .prose`: `max-width:1180px`

**Largura da coluna de leitura (atualizado 2026-08-05):** valores em `px` fixos (não mais `ch`), calibrados para equivaler à largura de dashboard já usada em Investimentos (`.container{max-width:1180px}`) no estado de maior espaço disponível (sidebar recolhida) — `1000px` com sidebar aberta (280px ocupados pela nav) e `1180px` recolhida, mesmo número literal do container de Investimentos. Substitui os valores anteriores em `ch` (88/114), que produziam coluna mais estreita. Origem: pedido do usuário para igualar a largura ao padrão de Investimentos, 2026-08-05 — aplicado nesta rodada em `cardiologia-semiologia.html`/`cardiologia-anatomia.html`; resto do acervo não retroaplicado (ver "Escopo de melhorias — não retroagir").

---

## Sidebar colapsável

- Botão `#toggle-btn` dentro de `#s-toggle`, fora do `.s-inner` — nunca some ao colapsar
- Estado persistido em `sessionStorage('sidebar-collapsed')`
- Colapsar: `sidebar.classList.add('collapsed')` + `bodyWrap.classList.add('sidebar-collapsed')`
- `.s-logo`, `.s-group`, `a.sl` recebem `opacity:0; pointer-events:none` quando colapsado

---

## Modo claro/escuro (tema) — padrão obrigatório (2026-08-05)

Todo compêndio/mecanismo novo nasce com alternância de tema claro/escuro, replicando o mecanismo já usado em `Investimentos/Orçamento/Simulador.html` (único piloto real antes desta data — não era padrão de domínio nenhum, verificado por grep antes de promover). Escuro continua o tema padrão (`:root` sem atributo); claro é opt-in via toggle, persistido.

**Script inline no `<head>`, antes do CSS e antes de qualquer paint** (evita flash de tema errado ao carregar):
```html
<script>(function(){try{var t=localStorage.getItem('theme');if(t==='light'||t==='dark'){document.documentElement.setAttribute('data-theme',t);}}catch(e){}})();</script>
```

**Paleta clara — bloco de override, logo após o `:root` escuro já documentado (paleta C):**
```css
:root[data-theme="light"]{
  --bg:#f4f0e8;--bg2:#ffffff;--bg3:#eee7d9;--border:#ddd3bf;
  --text:#2a2620;--muted:#6b6459;
  --ac:#6b4023;--ac2:#8a3620;--ac2bg:#fbe2d8;
}
body{transition:background .25s,color .25s}
```
**Correção de contraste (2026-08-05, mesmo dia):** os tons originais de `--ac`/`--ac2` (`#8a6a3f`/`#a8452f`) mediam ~4.0-4.9:1 conforme a superfície (abaixo do mínimo AA de 4.5:1 para texto normal em `--bg3`, o pior caso — cabeçalho de `.data-table`, por exemplo) — usuário sentiu falta de contraste no modo claro e o recálculo confirmou. Escurecidos para `#6b4023`/`#8a3620`, mesma família de cor (âmbar/ferrugem), agora **7.0-8.8:1** (`--ac`) e **6.4-7.0:1** (`--ac2`) nas três superfícies onde aparecem (`--bg`, `--bg2`, `--bg3`) — acima do mínimo AA com folga em qualquer tamanho de texto, sem alterar o tema escuro. `--text`/`--bg`/`--bg2` seguem >12:1 (não tocados). Não escurecer mais os acentos claros sem reconferir esse número.

**Botão flutuante (fora do `.s-inner`, mesma lógica de nunca sumir ao colapsar sidebar):**
```html
<button id="theme-toggle-btn" class="theme-toggle" aria-label="Alternar tema claro/escuro" title="Alternar tema claro/escuro">🌙</button>
```
```css
.theme-toggle{position:fixed;top:16px;right:16px;z-index:210;background:var(--bg2);border:1px solid var(--border);border-radius:50%;width:44px;height:44px;font-size:1.25em;display:flex;align-items:center;justify-content:center;cursor:pointer;box-shadow:0 4px 14px rgba(0,0,0,.35);transition:transform .15s ease,background .25s}
.theme-toggle:hover{transform:scale(1.08) rotate(-8deg)}
@media(max-width:900px){.theme-toggle{top:10px;right:10px;width:38px;height:38px;font-size:1.1em}}
```

**JS (dentro do mesmo bloco de script dos demais comportamentos, não em IIFE separada):**
```js
function temaAtual(){ return document.documentElement.getAttribute('data-theme') || 'dark'; }
var themeBtn = document.getElementById('theme-toggle-btn');
themeBtn.textContent = temaAtual()==='light' ? '🌙' : '☀️';
themeBtn.addEventListener('click', function(){
  var novo = temaAtual()==='light' ? 'dark' : 'light';
  try{ localStorage.setItem('theme', novo); }catch(e){}
  document.documentElement.setAttribute('data-theme', novo);
  themeBtn.textContent = novo==='light' ? '🌙' : '☀️';
});
```

Chave de `localStorage` é `theme` (compartilhada entre todo compêndio/mecanismo do mesmo site — preferência de tema persiste ao navegar entre páginas, já que todas vivem sob o mesmo domínio GitHub Pages). Não usar a chave `simulador-theme` do piloto de Investimentos — namespaces diferentes, domínios diferentes.

Escopo: aplicar em todo HTML novo e ao revisar HTML existente reaberto por outro motivo — não retroaplicar em lote ao acervo (ver "Escopo de melhorias — não retroagir").

---

## Idioma e tooltips de tradução

O idioma do compêndio segue o idioma predominante das fontes primárias: literatura internacional (PubMed, guidelines, livros-texto canônicos, textos-fonte em inglês) → compêndio em inglês; fontes predominantemente em português (diretrizes brasileiras, epidemiologia nacional) → compêndio em português. Vale tanto para compêndio de área quanto para mecanismo. Na prática: física, IA, filosofia e a maior parte da medicina têm literatura-fonte majoritariamente anglófona → inglês; conteúdo ancorado em diretrizes/epidemiologia brasileiras → português.

**Escopo da regra (decidido 2026-07-02):** aplica-se a material CRIADO A PARTIR DESTA DATA. O acervo anterior em `pt-BR` (25 dos 26 HTMLs ativos em jul/2026 — imunologia, fisiologia, farmacologia, fisiopatologia, microbiologia, IA, filosofia, investimentos) é **grandfathered**: não retroagir a conversão de idioma só porque a regra passou a ser seguida (ver "Escopo de melhorias — não retroagir" em instrucoes-projeto.txt). Converter um material antigo de idioma só se ele for reaberto por outro motivo e o usuário pedir. Primeiro material nascido sob a regra: `compêndios/fisica/fisica.html` (2026-07-02, em inglês, fontes anglófonas — Feynman/Halliday/Griffiths/Landau/arXiv). O único HTML em inglês anterior à regra era `compêndios/medicina/cardiologia-anatomia.html`.

Dentro do texto, independente do idioma principal:
- Latim (anatômico ou de outra área) entre parênteses na primeira ocorrência dos termos principais (ex: "crista terminalis").
- Termos PT-BR entre parênteses quando o contexto brasileiro exige — nomenclatura de provas, siglas consagradas (ex: "left bundle branch block (LBBB — bloqueio de ramo esquerdo)").
- Termos em inglês entre parênteses em compêndios em português quando o termo técnico é de uso universal na literatura (ex: "preload", "afterload").

**Sidebar:** os títulos seguem o idioma do compêndio. Cada item exibe também a tradução em português via `<span class="sl-pt">` logo após o título principal:
```css
.sl-pt{display:block;font-size:10.5px;color:var(--muted);opacity:.7;margin-top:1px;font-style:italic}
```

**Tooltips de tradução (`.term`):** termos técnicos em compêndios em idioma estrangeiro levam tooltip PT-BR:
```html
<span class="term" data-pt="tradução">termo</span>
```
```css
.term{border-bottom:1px dotted var(--ac);cursor:help;position:relative;white-space:nowrap}
.term::after{content:attr(data-pt);position:absolute;bottom:calc(100% + 6px);left:50%;transform:translateX(-50%);background:var(--bg3);color:var(--text);border:1px solid var(--ac);border-radius:5px;padding:4px 9px;font-size:11.5px;white-space:nowrap;pointer-events:none;opacity:0;transition:opacity .18s;z-index:999}
.term:hover::after{opacity:1}
```
Escopo: marcar primeira ocorrência de cada termo técnico relevante por seção (não todas as ocorrências). Manipulação via Python: `re.split(r'(<[^>]+>)', body)` para separar tags de texto, substituindo só nos nós de texto.

Aplicar (`.sl-pt` e `.term`) em todos os compêndios novos e ao revisar existentes.

**Tooltip enriquecido (`.term-rich`) — padrão preferencial em compêndios de idioma estrangeiro:** onde o `.term` simples mostra só a palavra traduzida (uma linha via `data-pt`), o `.term-rich` mostra a tradução PT em negrito **mais** uma glosa curta explicativa, em tooltip multilinha. É o padrão a usar em compêndios em inglês (não só a tradução, mas uma mini-definição junto). Estrutura autossuficiente (não precisa combinar com `.term`):

```html
<span class="term-rich">termo<span class="tip"><b>tradução PT</b><i>glosa curta em inglês</i></span></span>
```
```css
.term-rich{border-bottom:1px dotted var(--ac);cursor:help;position:relative;white-space:normal}
.term-rich .tip{position:absolute;bottom:calc(100% + 6px);left:50%;transform:translateX(-50%);background:var(--bg3);color:var(--text);border:1px solid var(--ac);border-radius:6px;padding:7px 11px;font-family:var(--font-ui);font-size:11.5px;line-height:1.45;white-space:normal;width:max-content;max-width:230px;text-align:left;pointer-events:none;opacity:0;transition:opacity .18s;z-index:999}
.term-rich .tip b{display:block;color:var(--ac);font-weight:600;margin-bottom:2px}
.term-rich .tip i{display:block;color:var(--muted);font-style:normal}
.term-rich:hover .tip{opacity:1}
```
Escopo igual ao `.term`: primeira ocorrência de cada termo técnico relevante por seção. A glosa é uma definição de uma frase curta — não repetir a tradução, acrescentar informação. `.term` simples segue válido para casos em que a tradução isolada basta.

**Dicionário ao vivo (`#dict-panel`) — padrão em compêndios de idioma estrangeiro:** complementa o `.term-rich`. Enquanto o `.term-rich` cobre os termos técnicos curados (com tradução + glosa autoral), o `#dict-panel` cobre o **vocabulário geral**: duplo-clique em qualquer palavra abre um painel flutuante com a definição em inglês, buscada ao vivo na API pública `dictionaryapi.dev`, mais a tradução PT-BR buscada em paralelo na API pública `api.mymemory.translated.net` (grátis, sem chave). Termos curados são pulados (o guard ignora `.term` e `.term-rich`, que já têm seu próprio tooltip). Cobre só inglês — usar apenas em compêndios em inglês. Promovido de piloto a padrão em 2026-07-02 (antes só em `cardiologia-anatomia.html`; aplicado também em `fisica.html` e `medicina.html`). Tradução PT-BR (via MyMemory) adicionada em 2026-07-02.

```css
#dict-panel{display:none;position:absolute;z-index:1001;background:var(--bg3);border:1px solid var(--ac);border-radius:8px;padding:10px 30px 10px 14px;max-width:280px;font-family:var(--font-ui);font-size:12.5px;line-height:1.5;box-shadow:0 6px 24px rgba(0,0,0,.5)}
#dict-panel.open{display:block}
#dict-close{position:absolute;top:4px;right:8px;background:none;border:none;color:var(--muted);font-size:16px;cursor:pointer;line-height:1;font-family:var(--font-ui)}
#dict-close:hover{color:var(--text)}
.dict-word{font-family:var(--font-body);font-weight:600;color:var(--ac);font-size:14px;margin-bottom:3px;text-transform:lowercase}
.dict-pt{font-family:var(--font-body);color:var(--text);font-size:12.5px;margin-bottom:6px;padding-bottom:6px;border-bottom:1px solid var(--border)}
.dict-pt b{color:var(--ac);font-weight:600}
.dict-pos{font-style:italic;color:var(--muted);margin:4px 0 2px}
.dict-def{margin-bottom:3px;color:var(--text)}
.dict-ex{color:var(--muted);font-style:italic;margin-bottom:3px}
.dict-src{color:var(--muted);font-size:10px;margin-top:4px}
.dict-loading{color:var(--muted)}
```

JS (bloco próprio, dentro de um IIFE antes de `</script>`; o guard `closest('.term, .term-rich')` evita disparar sobre termos curados):

```js
(function(){
  var dictPanel = document.createElement('div');
  dictPanel.id = 'dict-panel';
  dictPanel.innerHTML = '<button id="dict-close" aria-label="Fechar">×</button><div id="dict-body"></div>';
  document.body.appendChild(dictPanel);
  document.getElementById('dict-close').addEventListener('click', function(){ dictPanel.classList.remove('open'); });
  document.addEventListener('click', function(e){ if(dictPanel.classList.contains('open') && !dictPanel.contains(e.target)) dictPanel.classList.remove('open'); });
  var content = document.getElementById('content');
  if(content){
    content.addEventListener('dblclick', function(e){
      if(e.target.closest('.term, .term-rich')) return;
      var word = window.getSelection().toString().trim().replace(/[^a-zA-Z-]/g, '');
      if(!word || word.length < 2) return;
      dictPanel.style.left = Math.min(e.pageX, window.innerWidth - 300) + 'px';
      dictPanel.style.top = (e.pageY + 14) + 'px';
      dictPanel.classList.add('open');
      var body = document.getElementById('dict-body');
      body.innerHTML = '<p class="dict-loading">Buscando "' + word + '"…</p>';
      var defFetch = fetch('https://api.dictionaryapi.dev/api/v2/entries/en/' + encodeURIComponent(word.toLowerCase()))
        .then(function(r){ if(!r.ok) throw new Error('not found'); return r.json(); });
      var ptFetch = fetch('https://api.mymemory.translated.net/get?q=' + encodeURIComponent(word.toLowerCase()) + '&langpair=en|pt-BR')
        .then(function(r){ return r.ok ? r.json() : null; })
        .catch(function(){ return null; });
      Promise.all([defFetch.catch(function(){ return null; }), ptFetch])
        .then(function(results){
          var data = results[0], trans = results[1];
          if(!data){ body.innerHTML = '<p class="dict-loading">Sem definição encontrada. Vocabulário técnico costuma não estar nessa base — ver tooltip dos termos sublinhados.</p>'; return; }
          var entry = data[0];
          var pt = trans && trans.responseData && trans.responseData.translatedText;
          if(pt && (pt.toLowerCase() === word.toLowerCase() || /MYMEMORY WARNING/i.test(pt))) pt = null;
          var html = '<div class="dict-word">' + entry.word + '</div>';
          if(pt) html += '<div class="dict-pt">PT: <b>' + pt.toLowerCase() + '</b></div>';
          (entry.meanings || []).slice(0, 2).forEach(function(m){
            html += '<div class="dict-pos">' + m.partOfSpeech + '</div>';
            (m.definitions || []).slice(0, 2).forEach(function(d){
              html += '<p class="dict-def">' + d.definition + '</p>';
              if(d.example) html += '<p class="dict-ex">"' + d.example + '"</p>';
            });
          });
          html += '<p class="dict-src">via dictionaryapi.dev' + (pt ? ' + MyMemory' : '') + '</p>';
          body.innerHTML = html;
        });
    });
  }
})();
```

---

## Link de retorno ao índice (`#s-home`) — obrigatório

Todo compêndio é aberto a partir do `index.html` raiz. Sem um link de volta explícito, o usuário fica preso na página (o botão "voltar" do navegador nem sempre está disponível — ex. app shell, aba aberta direto por link/atalho). `#s-home` fica **acima** de `#s-toggle`, fora do `.s-inner`, para nunca sumir ao colapsar a sidebar.

```html
<div id="s-home"><a id="home-btn" href="../../index.html" title="Voltar ao índice">⌂ <span class="home-label">Índice</span></a></div>
<div id="s-toggle">
  <button id="toggle-btn" onclick="toggleSidebar()">◀</button>
</div>
```

- `href` relativo: calcular a partir da profundidade real do arquivo até a raiz do projeto (`../../index.html` para arquivos em `compêndios/<área>/`; para mecanismos, um nível a mais de pasta — `compêndios/medicina/mecanismos/<subárea>/` já pede `../../../../index.html`, e mais um `../` por nível extra de subpasta, ex. `compêndios/medicina/mecanismos/fisiopatologia/choque-circulatorio/` → `../../../../../index.html`). Caminho de mecanismo migrado de `medicina/<subárea>/` para `compêndios/medicina/mecanismos/<subárea>/` em 2026-07-10 (desmembramento de Base de estudos em Compêndios/Sistemas/Provas) — ver `Base de estudos/compêndios/CLAUDE.md`.
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
.data-table td.td-label{color:var(--ac);font-weight:600;white-space:nowrap}
```

Uso de `.data-table`: a primeira célula de cada linha (o rótulo/nome da linha) recebe `class="td-label"` para destacá-la visualmente das demais colunas, na cor de destaque `--ac` (âmbar) com `white-space:nowrap` — padrão seguindo `cardiologia-anatomia.html`. (O acervo PT anterior usa `--text` e é grandfathered — não retroagir.) Sempre envolver em `<div class="table-wrap">` e seguir com `<caption>` ou `<p class="table-caption">` numerada. Usar quando: comparação de estruturas (≥3 itens com ≥3 atributos), diferencial clínico, tabela de territórios/classificações — preferir a `.data-table` à lista de bullets nesses casos. Cada `<table class="data-table">` deve levar um `aria-label` descritivo (acessibilidade para leitores de tela), ex.: `<table class="data-table" aria-label="Comparison of cardiac valves">` — convenção adotada de `cardiologia-anatomia.html`.

---

## Fórmulas e equações — apresentação modular obrigatória (2026-08-06)

Toda fórmula/equação apresentada em qualquer compêndio, sistema ou material de prova segue duas regras: (1) o bloco da fórmula em si, na classe `.eq` já em uso informal em `fisica.html`, agora formalizada aqui; (2) logo abaixo, uma lista `.eq-vars` que decompõe **cada variável individualmente** — símbolo, nome por extenso, unidade e, quando existir um valor de referência/recomendado consolidado (clínico, físico, financeiro etc.), esse valor também. Nunca apresentar só o símbolo isolado sem essa decomposição — o objetivo é que o leitor não precise sair do material para saber se um número calculado é normal, alto, baixo ou uma constante fixa.

```css
.eq{background:var(--bg2);border:1px solid var(--border);border-left:2px solid var(--ac);border-radius:0 5px 5px 0;padding:12px 18px;margin:16px 0 8px;font-family:var(--font-ui);font-size:16px;color:var(--text);text-align:center;line-height:1.9;overflow-x:auto}
.eq-vars{list-style:none;margin:0 0 18px;padding:0;font-family:var(--font-ui);font-size:13px;color:var(--muted)}
.eq-vars li{padding:4px 0 4px 14px;border-left:2px solid var(--border);margin-bottom:2px}
.eq-vars b{color:var(--ac);font-family:var(--font-body);font-style:italic;margin-right:6px;font-size:15px}
```

```html
<div class="eq"><i>PA</i> = <i>DC</i> × <i>RVP</i></div>
<ul class="eq-vars">
  <li><b>PA</b> — pressão arterial média, mmHg. Referência: 70–100 mmHg.</li>
  <li><b>DC</b> — débito cardíaco, L/min. Referência: 4–8 L/min em repouso.</li>
  <li><b>RVP</b> — resistência vascular periférica, dyn·s/cm⁵. Sem valor único de referência — varia com o leito vascular.</li>
</ul>
```

Quando a variável for uma constante universal (ex. `c`, `h`, `k_B` em física) em vez de algo com faixa de referência, a entrada da lista traz o valor fixo no lugar da faixa (`c ≈ 299 792 458 m/s`) — o princípio (nunca deixar uma variável sem contexto numérico) é o mesmo. Vale tanto para fórmula nova quanto para revisão de material existente que já usa `.eq` sem a lista de variáveis (`fisica.html` é o único caso legado — retrofit não obrigatório em lote, seguir "Escopo de melhorias — não retroagir", mas aplicar a `.eq-vars` a qualquer equação nova daquele arquivo se reaberto). Origem: pedido do usuário, 2026-08-06 — ver `Cowork/CLAUDE.md`, "Regras gerais".

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

**Método que funciona de fato (2026-08-05):** `web_fetch` (fora do Chrome) retorna vazio para `wikimedia.org`/`upload.wikimedia.org` neste ambiente — domínio bloqueado, não é problema de URL. Dentro do Chrome conectado, `javascript_tool` executando `fetch()` com querystring (`action=query&...`) é bloqueado por um filtro de segurança do próprio Chrome MCP (`[BLOCKED: Cookie/query string data]`), mesmo reescrevendo a chamada com `URLSearchParams` — não tentar contornar esse filtro. O caminho que funciona: (1) `navigate` até a página normal `File:` no Commons e `get_page_text` para ler descrição/autor/licença (navegação de página comum, não é bloqueada); (2) calcular o hash MD5 do nome de arquivo (`hashlib.md5` em Python via bash, comando local, não é fetch) e montar a URL direta `https://upload.wikimedia.org/wikipedia/commons/<hash[0]>/<hash[0:2]>/<Nome_Do_Arquivo.ext>` — padrão de armazenamento do Wikimedia; (3) `navigate` + `screenshot` nessa URL para confirmar visualmente que a imagem carrega antes de referenciá-la no HTML. Evita todo bloqueio, sem tentar contornar nenhuma restrição de segurança — só troca o mecanismo de verificação.

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
- **Referência formal, além do `plate-caption`:** toda imagem inserida também ganha uma entrada na seção "Referências" do compêndio, sob um `ref-layer` "Fontes das imagens" (após "Consulta especializada") — autor, título do arquivo, ano, licença e link para a página `File:` no Wikimedia Commons. O `plate-caption` já traz a atribuição resumida; a entrada em Referências é a citação completa e rastreável, mesmo padrão de rigor já exigido para toda afirmação de texto. Origem: pedido do usuário, 2026-08-06 — primeiro material a aplicar: `compêndios/medicina/mecanismos/semiologia/sindromes-bronco-pleuro-pulmonares.html`.

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

Dicionário interativo (tooltip enriquecido `.term-rich` + busca ao vivo `#dict-panel`): promovido a **padrão** para compêndios em idioma estrangeiro em 2026-07-02 — ver seção "Idioma e tooltips de tradução" acima (CSS + JS canônicos). Antes era piloto isolado em `cardiologia-anatomia.html`; agora aplicado também em `fisica.html` e `medicina.html`.

**Discussão:** três movimentos — (1) convergência, fechando a pergunta motivadora com os conceitos desenvolvidos; (2) tensão/paradoxos/limitações; (3) implicação derivada que emerge mas não foi enunciada no corpo. Não resumir — elevar abstração.

**Leituras recomendadas:** livros-texto, artigos (leis primárias), enciclopédias de referência e monografias, organizados em **camadas** para guiar o estudo — não uma lista plana. Três camadas obrigatórias:

1. **Ponto de entrada** — a leitura por onde começar sem pré-requisito: verbete de enciclopédia revisada por pares (em filosofia, SEP/IEP), capítulo introdutório de livro-texto ou artigo de síntese. Serve para mapear o debate antes do texto-fonte.
2. **Aprofundamento** — os textos-fonte e artigos seminais que fundamentam as afirmações centrais do compêndio. Aqui vai o argumento original (em filosofia, o texto do próprio filósofo ou o artigo seminal do debate contemporâneo), não o comentador.
3. **Consulta especializada** — monografias, comentadores e literatura de disputa interpretativa, para quem já domina o núcleo e quer resolver uma controvérsia específica ou ir à fronteira.

Cada referência com **tipo** (livro / artigo / verbete / texto-fonte), **título**, **autor**, **ano** e uma **anotação** de 1–2 frases justificando por que está ali e o que o leitor ganha com ela — nunca uma referência sem anotação. Não omitir material relevante por ser longo ou difícil: o compêndio deve informar o que existe, cabendo ao leitor decidir o quanto encarar. Marcar (quando houver) qual referência corresponde ao ponto de partida recomendado do leitor.
