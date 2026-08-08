# Instruções do Projeto — Casos Clínicos
**Versão:** 1.4 · **Data:** 2026-08-07

## Objetivo

Material de estudo construído a partir de casos clínicos reais vivenciados nas práticas hospitalares — anotações e lembranças de anamnese, exame físico e evolução de pacientes reais — usados como âncora para aprofundar raciocínio clínico: diagnóstico diferencial, fisiopatologia, exames complementares e conduta, sempre partindo do caso concreto, não de um recorte teórico abstrato.

Diferente de:
- **Anamnese e Exame Físico** — relatório `.docx` formal e estruturado do paciente (documentação clínica), não material de estudo.
- **Provas** — escopo fechado por edital/prova com data definida.
- **Compêndios/Mecanismo** — parte da área ou do conceito inteiro, não de um caso real específico.

Domínio aberto via `autocritica-cowork` em 2026-08-06 — decisão do usuário de mantê-lo separado, fisicamente dentro de `Base de estudos/` por compartilhar template HTML/GitHub Pages/modo Anki com Compêndios, Provas e Sistemas.

## Estrutura de pastas

```
casos-clinicos/
  CLAUDE.md                    → este arquivo
  caso_mapa.txt                 → casos já cobertos (achado/diagnóstico, especialidade, data)
  caso_estado.txt               → histórico e pendências
  [achado-ou-diagnostico].html  → um HTML por caso
  anki/                         → cartões de revisão espaçada por caso
```

Nomeação: pelo achado/diagnóstico principal do caso (ex.: `icterícia-obstrutiva-coledocolitiase.html`), não pelo nome do paciente — diferente de Anamnese e Exame Físico, onde o relatório é sobre a pessoa; aqui o material é sobre a condição clínica estudada a partir daquele encontro.

## Protocolo de abertura de sessão

1. Levantar o caso com o usuário: especialidade/rotação, achados principais — relatados de memória ou anotação, não há dado bruto estruturado como em Anamnese e Exame Físico.
2. Ler `caso_estado.txt` e `caso_mapa.txt` — pendências e casos já cobertos.
3. Checar se já existe relatório formal do mesmo paciente em `Anamnese e Exame Físico/` — se existir, usar como fonte de achados objetivos em vez de pedir de novo.
4. Ler `../_docs/DEBT.md` — informar dívidas relevantes a este domínio antes de prosseguir.

## Infraestrutura compartilhada com Compêndios, Provas e Sistemas

- `../_docs/template-v2-spec.md` — CSS/layout/sidebar/elementos visuais canônicos. Ler antes de criar qualquer HTML novo.
- `../_docs/operacoes-bash.md` — regras de Edit/Write/encoding, verificação obrigatória pós-escrita, arquivamento em `_archive/`.
- `../_docs/DEBT.md` — dívida técnica unificada dos domínios de Base de estudos.
- Modo Anki — procedimento canônico em `mecanismo/SKILL.md`, aplicado aqui desde o início (decisão do usuário, 2026-08-06), não como extra opcional.
- Busca de literatura biomédica via MCP PubMed/PMC, quando disponível — usar em vez de citar de memória.
- `push.bat` na raiz do repositório git publica no GitHub Pages — lembrar o usuário ao final de sessão que gerou/alterou HTML.
- **`git status` falha por completo neste sandbox** — reconstruir o que a sessão tocou a partir do histórico de tool calls, nunca rodar `git status --short` esperando resposta.

## Regras específicas deste domínio

- **O caso real é o ponto de partida obrigatório, nunca um exemplo genérico inventado — e toda suposição/inferência do raciocínio clínico que extrapole o relatado deve ser sinalizada como tal, nunca escrita como se fosse dado relatado.** Todo material referencia os achados reais relatados antes de expandir para teoria; quando o texto assume um cenário-padrão da literatura (ex. "AVC agudo", imobilização presumida) sem que isso tenha sido informado, usar nota explícita no material. Motivo: usuário corrigiu, no primeiro caso deste domínio, suposições escritas como fato (AVC "agudo", atelectasia "confirmada por exame de imagem") que nunca foram relatadas. Origem: correção do usuário, 2026-08-06.
- **Profundidade: caso + raciocínio clínico completo** — expandir para diagnóstico diferencial, fisiopatologia, exames complementares e conduta com fontes, quase um mini-compêndio ancorado no caso (decisão do usuário, 2026-08-06).
- **Nível de evidência:** toda conduta, diagnóstico ou terapêutica discutida indica se a base é Diretriz/Consenso, Ensaio Clínico Controlado, Revisão Sistemática ou Opinião de Especialista — mesmo padrão já em uso em Compêndios/Provas/Anamnese e Exame Físico/Tutorial. **O rótulo (`.evid`) é sempre um link clicável** para a entrada correspondente em "Referências" — mesmo mecanismo `navRef`/`#back-btn` das citações numeradas (`<a class="evid" href="#refN" onclick="navRef(this)">`), nunca um `<span>` estático; e toda entrada de Referências disponibiliza o link direto de acesso quando a fonte é aberta. Origem: usuário apontou, no primeiro caso deste domínio, que o rótulo de não-consenso era útil mas não clicável — 2026-08-06. **Verificação mecânica obrigatória (2026-08-06b):** antes de considerar a conversão concluída, `Grep` por `<span class="evid"` no arquivo inteiro e confirmar zero ocorrências — busca parcial por trecho lido (não o arquivo inteiro) deixou 5 de 12 rótulos sem converter na primeira passada deste domínio, só notado quando o usuário clicou e não funcionou.
- **Confidencialidade do paciente:** identificar o paciente só pelo necessário ao raciocínio clínico (idade, sexo, comorbidades relevantes), nunca nome completo — diferente de Anamnese e Exame Físico, que é relatório nominal por natureza. Confirmado pelo usuário na abertura deste domínio, 2026-08-06.
- **Fórmulas:** cálculo clínico (ex. clearance, escore de risco) em apresentação modular por variável com valor de referência — regra cross-domínio do Cowork.
- **Tamanho mínimo de fonte:** 0,85em — regra cross-domínio do Cowork.
- **Imagens pertinentes e referenciadas, mesmo mecanismo de Compêndios — busca é passo padrão da criação, não pendência para depois (2026-08-07):** ao criar um caso novo, buscar ativamente ao menos uma imagem pertinente (achado semiológico, critério diagnóstico, exame de imagem, ou — como no 2º caso do domínio — figura de artigo de referência que ilustre o padrão discutido) antes de considerar o material pronto, em vez de registrar "sem imagem" como pendência de sessão futura. Fontes: Wikimedia Commons/OpenStax/Gray's (diagramas) ou PMC (fotografia clínica/achado de imagem, hierarquia de "fontes fortes" já em `template-v2-spec.md`) — verificar carregamento e licença antes de referenciar (método já em uso: navegar via Chrome, inspecionar `<img>` no DOM, screenshot da URL direta). Se a imagem for só ilustrativa (paciente/exame diferente do caso), sinalizar isso na legenda, sempre. Só registrar como pendência genuína se a busca for feita e nada adequado for encontrado — não por a busca não ter sido tentada. Origem: pedido do usuário, 2026-08-06 (regra original) e 2026-08-07 (usuário pediu que a busca deixasse de ser opcional/adiável).
- **Não reexplicar fundamentos/mecanismos básicos — este é material de análise clínica aplicada, não de ciclo básico.** Definições de conceito (o que é flora comensal, mecanismo de bacteremia, farmacologia básica de um antibiótico) pertencem a Compêndios/Mecanismo; aqui, cross-linkar em vez de reexplicar, e manter o texto no nível de decisão clínica (qual agente, qual exame, qual conduta), não no nível de "por que isso funciona assim". Origem: correção do usuário, 2026-08-06.

## Atualização deste arquivo

Ao editar: arquivar só o trecho alterado em `_archive/CLAUDE_<data>_diff.md` (texto antigo vs. novo), não o arquivo inteiro — mesmo padrão cross-domínio adotado em `Cowork/CLAUDE.md` desde 2026-07-23 (ver "Regras gerais" daquele arquivo).

**Mudou em 2026-08-07:** regra "Imagens pertinentes e referenciadas" reforçada — busca de imagem passa a ser passo padrão da criação de qualquer caso novo, não mais pendência adiável para sessão futura. Motivo: usuário perguntou, após a criação do 2º caso sem imagem, se não havia nenhuma buscada — busca feita na hora encontrou figura pertinente (Fig. 2 de Govaert et al. 2020, já referência do caso) em minutos. Candidato a rollout futuro para Compêndios/Provas/Sistemas, registrado em `_docs/DEBT.md`. Diff em `_archive/CLAUDE_2026-08-07_diff.md`.

**Mudou em 2026-08-06 (7ª edição do dia):** correção de gap na 5ª edição — busca por `.evid` tinha sido feita por trecho lido, não por `Grep` no arquivo inteiro, deixando 5 rótulos sem converter (`Revisão/Estudos observacionais`, 2× `Revisão` na seção de estreptococos, `Opinião de especialista/Revisão clássica`, 2× `Revisão sistemática`), só notado quando o usuário clicou em produção e não navegou. Todos os 5 convertidos; 2 mapeados a referências já existentes (atelectasia→ref8, trombólise/anticoagulação→ref6 ambos), 2 novas referências adicionadas (ref13: Tong et al., *JAMA* 2025, revisão de bacteremia por *S. aureus* — acesso aberto não confirmado, checagem via PMC bloqueada por captcha; ref14: Bamrung & Sitthicharoenchai, *Front Microbiol* 2026, CC BY 4.0 confirmado), e 1 reaproveitou ref12 já existente (cura de viridans penicilina-sensível, mesma diretriz ESC 2023 da Tabela 5). Regra de "Nível de evidência" ganhou verificação mecânica obrigatória (`Grep` no arquivo inteiro, não busca parcial) para não recorrer. Diff em `_archive/CLAUDE_2026-08-06h_diff.md`.

**Mudou em 2026-08-06 (6ª edição do dia):** `../_docs/template-v2-spec.md` ("Fontes de imagens") ganhou hierarquia própria para fotografia clínica (achado de exame), distinta da hierarquia de diagramas anatômicos já existente (OpenStax/Gray's/Blausen): preferir figura de artigo revisado por pares e acesso aberto (via PMC) a upload autopublicado no Commons sem publicação por trás, quando ambos existirem para o mesmo achado. Piloto: Fig. 2 de `endocardite-infecciosa-avc-embolico.html` (nódulos de Osler) trocada de upload Wikimedia "own work" (2010, sem publicação) para figura de Naruse et al., *J Med Case Rep* 2022, PMC9148510, CC BY 4.0 — encontrada após o usuário pedir fontes mais confiáveis para as imagens do material. Como o arquivo é compartilhado com Compêndios/Provas/Sistemas, a mudança já vale para os quatro sem retrofit adicional. Diff em `_archive/CLAUDE_2026-08-06f_diff.md` (registrado no `_docs/` do domínio de origem, não neste `CLAUDE.md`, por ser edição do arquivo compartilhado).

**Mudou em 2026-08-06 (5ª edição do dia):** regra "Nível de evidência" ganhou exigência de clicabilidade — o rótulo `.evid` passa a ser link (`navRef`/`#refN`) para a entrada de Referências, não `<span>` estático; Referências devem trazer o link direto quando a fonte é aberta. Piloto aplicado em `endocardite-infecciosa-avc-embolico.html` (7 rótulos convertidos, 1 referência nova adicionada — Delgado et al., 2023 ESC Guidelines, como fonte pretendida da Tabela 5, sem acesso aberto confirmado). Pendência de propagação gradual a Compêndios/Provas/Anamnese e Exame Físico/Tutorial registrada em `Cowork/_meta/DEBT.md`. Diff em `_archive/CLAUDE_2026-08-06e_diff.md`.

**Mudou em 2026-08-06 (4ª edição do dia):** nova regra em "Regras específicas deste domínio" — não reexplicar fundamentos/mecanismos básicos (isso é papel de Compêndios/Mecanismo); Casos Clínicos fica no nível de decisão clínica. Motivo: usuário apontou trechos reexplicando o básico (flora comensal, mecanismo de bacteremia) ao enriquecer a microbiologia do primeiro caso com análise MSSA/MRSA e terapia dirigida por agente. Diff em `_archive/CLAUDE_2026-08-06d_diff.md`.

**Mudou em 2026-08-06 (3ª edição do dia):** duas regras novas em "Regras específicas deste domínio", a partir do primeiro caso criado (endocardite-infecciosa-avc-embolico.html): (1) suposições/inferências do raciocínio clínico devem ser sinalizadas como tal, nunca escritas como dado relatado — usuário corrigiu "AVC agudo" e "atelectasia confirmada por imagem" que nunca foram relatados; (2) imagens pertinentes e referenciadas (plate-block/lightbox de Compêndios) passam a valer também para Casos Clínicos, a pedido do usuário. Seção "Atualização deste arquivo" também alinhada ao padrão de arquivamento por diff (era full-file). Diff em `_archive/CLAUDE_2026-08-06c_diff.md`.

**Criado em 2026-08-06:** primeira versão deste arquivo, domínio novo aberto via `autocritica-cowork` — decisão do usuário de manter separado de Anamnese e Exame Físico/Provas/Compêndios (propósito distinto: caso real vivenciado como âncora, não relatório formal, não escopo de edital, não área/conceito inteiro), fisicamente dentro de `Base de estudos/` por infraestrutura compartilhada. Organização: um HTML por caso, nomeado pelo achado/diagnóstico. Profundidade: caso + raciocínio clínico completo. Modo Anki incluído desde o início. Regra de confidencialidade do paciente confirmada pelo usuário. Ver `Cowork/_meta/registro-sessoes.md`.
