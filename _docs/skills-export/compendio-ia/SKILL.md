---
name: compendio-ia
description: >
  Contexto epistêmico para criação e revisão de compêndios de área de Inteligência
  Artificial: machine learning, deep learning, LLMs, visão computacional,
  robótica, ética de IA e áreas correlatas. Carregada pela skill compendio quando
  o tema pertence a essa área. Ative sempre que o usuário pedir compêndio de área
  de IA, machine learning, redes neurais, LLMs ou computação inteligente.
---

# Subskill Compêndio de Área — Inteligência Artificial

Contexto específico para compêndios de área de IA e áreas correlatas.
As regras gerais de formato, fluxo e verificação estão na skill `compendio` (compêndio de área).
Esta subskill fornece o contexto epistêmico da área **e as decisões de estrutura HTML**.

## Subáreas cobertas

- **Machine Learning (ML)** — aprendizado supervisionado, não supervisionado, por reforço; teoria de generalização
- **Deep Learning (DL)** — redes neurais, CNNs, RNNs, Transformers, arquiteturas modernas
- **Processamento de Linguagem Natural (PLN)** — LLMs, modelos de linguagem, tradução, geração de texto
- **Visão Computacional** — classificação de imagens, detecção de objetos, segmentação, modelos multimodais
- **IA Generativa** — modelos de difusão, GANs, LLMs geradores, síntese de vídeo e áudio
- **Aprendizado por Reforço (RL)** — Q-learning, policy gradient, RLHF, agentes autônomos
- **IA Simbólica e Raciocínio** — lógica, sistemas especialistas, planejamento, representação do conhecimento
- **Robótica e Sistemas Autônomos** — controle, percepção, planejamento de movimento
- **Ética, Alinhamento e Segurança** — alinhamento de valores, interpretabilidade, fairness, governança
- **IA Aplicada** — saúde, finanças, direito, educação, ciência

## Material existente no projeto

- `compêndios/ia/inteligencia-artificial.html` — rascunho experimental (2026-06-30)
  - Cobre: o que estuda, 10 subáreas, histórico (1956–2026), 10 questões centrais, métodos, conexões, 3 controvérsias, roteiro de entrada, referências anotadas
  - Estado: segue template-v2 visualmente, mas foi gerado quando a skill ainda era "mapa orientador" — conteúdo raso para o novo propósito de compêndio de área
  - Pendência: reescrita com profundidade real antes de usar como referência

## Estrutura HTML — adaptação do template-v2 para o compêndio de área

Referência canônica de estrutura: `_docs/template-v2-spec.md`.
**Ler esse arquivo antes de criar ou refatorar qualquer mapa de IA.**

### O que importar integralmente do template-v2

- **Layout**: `#body-wrap` → `#sidebar` (280px, colapsável) + `#content` + `.prose` (max-width: 88ch)
- **Sidebar colapsável**: botão `#toggle-btn` em `#s-toggle`, estado em `sessionStorage('sidebar-collapsed')`, `.s-logo`, `.s-group`, `a.sl`
- **Tipografia**: `Source Serif 4` (corpo, 16px, line-height 1.78) + `Inter` (UI) via Google Fonts
- **Paleta**: idêntica ao template-v2 — `--ac:#d4924a` (âmbar), `--ac2:#c0604a`, fundo escuro `#111010`. Mantém coerência visual com todo o projeto.
- **Progress bar**: `position:fixed; top:0; left:0; height:2px; width:0%` atualizado via `scroll` passivo
- **Highlight de seção ativa**: `IntersectionObserver` com `rootMargin:'-20% 0px -70% 0px'` → `.in-view` na seção + `.active` no link da sidebar
- **Anchor links**: `<a class="anchor">` em todo `h2` e `h3`, visível só no hover
- **`.pergunta`**: substitui qualquer `div` de "pergunta orientadora" — mesmo CSS do template-v2
- **`.hist`**: para contexto histórico em destaque dentro do texto
- **`.box`** (variantes `info`, `alerta`): para destaques, avisos e notas dentro das seções
- **`a.cross-link`**: para links internos entre mapas e para compêndios em `medicina/`
- **Mobile** (`max-width:900px`): sidebar oculta por padrão, `#mob-bar` com botão ☰
- **Print**: fundo branco, texto preto, sidebar e âncoras ocultos

### O que NÃO importar (específico de compêndios)

- `.dep-panel` — dependências entre materiais: não se aplica ao compêndio de área
- `.kbox` / `.ck-grid` — conceitos-chave estruturados: papel da skill `mecanismo`
- `.qa-block` — no compêndio de área as questões abertas viram a seção "Questões centrais" em prosa com `<ol>`
- Seção Discussão fechando a pergunta motivadora — no compêndio de área a `.pergunta` fica aberta propositalmente; o fechamento é implícito ao longo do mapa
- Citações ABNT inline (`.cite`) — o compêndio de área usa referências anotadas em camadas, não citações acadêmicas formais
- Painel de dependências `.dep-panel` — o compêndio de área não tem hierarquia de pré-requisitos formal

### Componentes exclusivos do compêndio de área (não no template-v2)

Esses componentes precisam ser definidos localmente no HTML:

```css
/* Cards de subárea — mapa do campo */
.subarea-grid { display:grid; grid-template-columns:1fr 1fr; gap:16px; margin-bottom:8px }
.subarea-card { background:var(--bg2); border:1px solid var(--border); border-radius:8px; padding:16px 18px }
.subarea-card h3 { font-family:var(--font-ui); font-size:.88rem; font-weight:600; color:var(--ac2); margin-bottom:6px }
.subarea-card p { font-family:var(--font-ui); font-size:.83rem; color:var(--muted); margin:0 }

/* Controvérsias com duas posições */
.controversia { background:var(--bg2); border:1px solid var(--border); border-radius:8px; padding:18px 20px; margin-bottom:16px }
.controversia h3 { font-family:var(--font-ui); font-size:.9rem; font-weight:600; color:var(--text); margin-bottom:12px }
.posicoes { display:grid; grid-template-columns:1fr 1fr; gap:12px }
.posicao { background:var(--bg3); border-radius:6px; padding:12px 14px }
.posicao .label { font-family:var(--font-ui); font-size:10px; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:var(--muted); margin-bottom:6px }
.posicao p { font-family:var(--font-ui); font-size:.83rem; color:var(--text); margin:0 }

/* Roteiro de entrada */
.roteiro-step { display:flex; gap:14px; margin-bottom:18px; align-items:flex-start }
.step-num { min-width:28px; height:28px; background:var(--ac); color:#fff; border-radius:50%; display:flex; align-items:center; justify-content:center; font-family:var(--font-ui); font-size:12px; font-weight:700; flex-shrink:0 }
.step-body { font-size:.92rem; line-height:1.7 }

/* Referências anotadas em camadas */
.ref-group h3 { font-family:var(--font-ui); font-size:.82rem; font-weight:700; text-transform:uppercase; letter-spacing:1px; color:var(--muted); margin-bottom:12px; margin-top:24px }
.ref-item { background:var(--bg2); border:1px solid var(--border); border-radius:6px; padding:14px 16px; margin-bottom:10px }
.ref-item .ref-title { font-size:.9rem; font-weight:600; color:var(--text); margin-bottom:4px }
.ref-item .ref-meta { font-family:var(--font-ui); font-size:.78rem; color:var(--ac); margin-bottom:6px }
.ref-item .ref-nota { font-family:var(--font-ui); font-size:.8rem; color:var(--muted); margin:0 }
.tag { display:inline-block; background:var(--bg3); border-radius:4px; padding:2px 7px; font-family:var(--font-ui); font-size:11px; color:var(--ac2); margin-right:4px }
```

### Cabeçalho do mapa (adaptação do template-v2)

```html
<div class="doc-header">
  <h1>Título do Mapa</h1>
  <p class="doc-meta">Compêndio de área · Área · Subárea (se houver)</p>
  <div class="doc-chips">
    <span class="chip">⏱ ~X min de leitura</span>
    <span class="chip">📍 Nível: campo amplo</span>
    <span class="chip">🗓 Última revisão: YYYY-MM-DD</span>
  </div>
</div>
```

Omitir chips de pré-requisitos e dependências (específicos de compêndios).

## Heurística de fontes para IA

- **Artigos fundadores**: Turing (1950) — teste de Turing; McCarthy et al. (1956) — proposta do campo; Rosenblatt (1958) — perceptron; Rumelhart et al. (1986) — backpropagation; Vaswani et al. (2017) — Transformers.
- **Livros-texto**: Russell & Norvig — referência universitária canônica; Goodfellow, Bengio & Courville — deep learning técnico; James et al. — ML acessível.
- **Fontes de acesso aberto**: arXiv.org para papers; Papers With Code para benchmarks e reprodutibilidade; Distill.pub para explicações visuais de alta qualidade.
- **Organismos e relatórios**: Stanford HAI Index (anual) — estado do campo com dados; OECD AI Policy Observatory — governança; relatórios de segurança da Anthropic, OpenAI e DeepMind.
- **Evitar**: posts de blog sem revisão, benchmarks sem contexto de limitações, afirmações de AGI iminente sem base técnica.

## Controvérsias estruturais do campo

Sempre representar as duas posições sem resolver artificialmente:

1. **Compreensão vs. correlação estatística** — LLMs entendem ou apenas imitam?
2. **Escala vs. limites arquiteturais** — mais compute resolve tudo ou há barreiras fundamentais?
3. **Risco existencial vs. danos presentes** — foco em segurança futura ou harms concretos hoje?
4. **IA simbólica vs. conexionismo** — lógica explícita ou aprendizado de dados brutos?
5. **Open source vs. acesso restrito** — democratização vs. controle de capacidades perigosas?

## Checklist adicional para IA

- [ ] Distinção entre capacidades atuais e projeções futuras feita explicitamente?
- [ ] Controvérsias representadas com as duas posições sem resolução artificial?
- [ ] Referências incluem tanto fontes técnicas (arXiv, livros) quanto críticas (Crawford, Christian)?
- [ ] HTML segue template-v2 com adaptações desta skill (verificar antes de escrever)?
- [ ] Verificação bash completa após escrita (fechar `/body/html`, acentuação, sem artefatos)?
