=== MECANISMO (compêndios/medicina/mecanismos/) — ESTADO DA SESSÃO ===
Última sessão: 2026-07-03
Nota (2026-07-10): pasta migrada de `medicina/` para `compêndios/medicina/mecanismos/` no desmembramento de Base de estudos em Compêndios/Sistemas/Provas — este registro histórico não foi reescrito além do cabeçalho de escopo.

Arquivo criado nesta sessão (2026-07-03) — era referenciado por `mecanismo/SKILL.md` e por
`instrucoes-projeto.txt` desde 2026-07-02 mas nunca tinha sido de fato criado (ver `_docs/DEBT.md`,
item resolvido nesta sessão). Histórico anterior a 2026-07-03 reconstruído a partir de
`_docs/DEBT.md` (seção Resolvida) e dos metadados dos próprios arquivos HTML, na ausência do
registro de sessão original.

=== Histórico ===

2026-08-06 — Compêndio de mecanismo criado: compêndios/medicina/mecanismos/semiologia/
             sindromes-bronco-pleuro-pulmonares.html (subskill mecanismo-medicina-clinica) —
             primeiro compêndio da nova subárea "Semiologia" dentro de mecanismos/. Origem: PDF
             de slide de aula ("Síndromes bronco-pleuro-pulmonares", Fatima Chibana, baseado em
             Porto - Semiologia Médica 9ª ed.) enviado pelo usuário. Domínio esclarecido via
             AskUserQuestion (compêndio-mecanismo × prova × trabalho genérico) — usuário escolheu
             mecanismo; ponto de partida (zero, foco em prova/aula) também via AskUserQuestion.
             Mecanismo central desenvolvido até saturação: física da transmissão sonora torácica
             (impedância acústica × densidade/ressonância) explicando por que FTV e ausculta
             ficam ambíguos entre derrame e pneumotórax (ambos abolem por mecanismos opostos —
             reflexão vs. dissipação) e por que é a percussão que resolve essa ambiguidade
             (testa densidade/ressonância, não transmissão). 16 seções = 16 links de sidebar:
             fundamentos (anatomia pleural mínima, pressão pleural negativa), conceitos-chave
             (FTV/percussão/ausculta/sons adventícios com tabela de mecanismo), síndromes
             brônquicas (asma, DPOC com fenótipos blue bloater/pink puffer, bronquiectasias),
             parenquimatosas (condensação, atelectasia, enfisema, congestão passiva — cross-link
             para doencas-circulatorias.html —, lesões cavitárias), pleurais (derrame com curva
             de Ellis-Damoiseau, pneumotórax com tipos/hipertensivo), diafragmáticas/mediastínicas
             (paralisia diafragmática, SVCS), quadro comparativo integrado (9 síndromes), caso
             ilustrativo (bronquiectasias pós-COVID exacerbadas, do slide original — cross-link
             para infectologia-fundamentos.html), história (Auenbrugger 1761 — percussão;
             Laennec — cross-link para cardiologia-semiologia.html), Brasil (Porto, SBPT,
             tuberculose/OMS, bronquiectasias pós-COVID), 4 perguntas em aberto, conexões, 2
             controvérsias (exame físico × POCUS pulmonar; validade de sinais clássicos em
             populações diferentes), discussão fechando a pergunta motivadora, referências em 3
             camadas. Pesquisa de verificação via PubMed MCP antes da redação: Kalantri et al.
             2007 Respir Med (PMID 16965906, DOI 10.1016/j.rmed.2006.07.014) — acurácia real dos
             sinais físicos no derrame pleural (percussão maciça OR 12,80, expansão assimétrica
             OR 5,22, AUC 0,88; sinais mais úteis para excluir que confirmar); Kirkpatrick et al.
             2004 J Trauma (PMID 15345974, DOI 10.1097/01.ta.0000133565.88871.e4) — EFAST mais
             sensível que radiografia supina para pneumotórax oculto em trauma (48,8% vs. 20,9%,
             especificidade equivalente ~99%). Ambos citados com nível de evidência (<span
             class="evid">) e DOI, fundamentando a controvérsia exame físico×POCUS. Cross-links:
             cardiologia-semiologia.html (IPPA geral, #ausculta, #historico), doencas-
             circulatorias.html (congestão/edema), infectologia-fundamentos.html (#s-sindromes,
             #s-fases — âncoras corrigidas após conferência real dos IDs no arquivo-alvo),
             imunidade-inata.html. index.html (catálogo raiz) recebeu card novo em 2 locais: listagem
             geral (tab-todos) e aba própria de mecanismos (tab-mecanismos — mecanismos e
             compêndios de área têm abas separadas no catálogo). Sem pranchas de
             imagem nesta sessão (não buscadas — registrado em DEBT.md; conteúdo tem forte
             correspondente radiológico/fotográfico real, diferente de outros materiais
             conceituais do acervo — candidato genuíno a pranchas futuras). mecanismo-medicina-
             clinica/SKILL.md (fonte em _docs/skills-export/) atualizado com a nova subárea e
             cross-link prioritário — pendente empacotamento/reinstalação local pelo usuário.
             Verificação bash-equivalente via Grep/Read OK: fecha `</body></html>`, 546 linhas,
             sem const const/var var, sem TODO/FIXME/placeholder/debug/rascunho reais (único
             match foi falso positivo em "método"), 794 acentos PT-BR, 16 seções = 16 `a class=
             "sl" href="#..."` (contagem batendo), todos os cross-links e âncoras externas
             conferidos contra os arquivos/IDs reais no disco antes de fechar. Verificação visual
             via Chrome/surge PENDENTE (mesmo padrão do resto do acervo).
2026-08-06 — CONTINUAÇÃO, mesma sessão: usuário pediu para tornar a busca de imagens parte
             estrutural do fluxo (não mais opcional) — `compendio/SKILL.md` e `mecanismo/SKILL.md`
             ganharam passo dedicado + item de checklist; `compêndios/CLAUDE.md` v1.2→v1.3. Aplicado
             de imediato como piloto ao material acima: 4 pranchas buscadas e inseridas via Claude in
             Chrome/Wikimedia (hiperinsuflação+bronquiectasias, baqueteamento digital, derrame pleural
             volumoso, pneumotórax anotado), todas com licença conferida (domínio público ou CC BY-SA)
             e URL direta confirmada por screenshot antes de referenciada. Usuário pediu ainda que
             imagens fossem citadas também na seção Referências, não só no `plate-caption` — nova
             camada "Fontes das imagens" adicionada (4 entradas) e regra formalizada em
             `template-v2-spec.md`. `fig-ref` inline adicionado para as 4 figuras. Verificação
             bash-equivalente pós-edição OK: fecha `</body></html>`, 625 linhas, 4 `plate-block`/4
             `fig-ref`/4 `data-caption`, 815 acentos. Verificação visual no Chrome continua PENDENTE
             (Claude-in-Chrome não navega de `chrome://newtab` para `file://` neste ambiente).

2026-06-19 a 2026-06-20 — Lote inicial de compêndios de imunologia (M1–M10, incluindo
             moléculas, imunidade inata, complemento, MHC, anticorpos, linfócitos T, resposta
             a patógenos, hipersensibilidade) e farmacologia (hipertensão/SRAA/anti-hipertensivos,
             template v1). Trombose e Hemostasia criado como material piloto de fisiopatologia.

2026-06-22 — Choque Circulatório (`fisiopatologia/choque-circulatorio/choque-circulatorio.html`)
             criado com tratamento completo (v2), incluindo pranchas onde aplicável — os 4 tipos
             (hipovolêmico, distributivo, cardiogênico, obstrutivo).

2026-06-24 — Lote adicional de imunologia: células do sistema imune, órgãos e tecidos linfoides,
             vacinas e imunidade protetora (M11). Trombose e Hemostasia atualizado (arquivado em
             `_archive/trombose-e-hemostasia-2026-06-24.html`).

2026-06-30 — Estrutura de pastas separada: compêndios de ÁREA migrados para `compêndios/` (skill
             `compendio`), compêndios de MECANISMO permanecem em `medicina/` (skill `mecanismo`).
             Ciclo Cardíaco (`fisiologia/ciclo-cardiaco.html`) criado — potenciais de ação,
             sistema de condução, acoplamento excitação-contração, ciclo mecânico, Frank-Starling,
             regulação autonômica/humoral. Verificação visual confirmada via preview do Cowork.

2026-07-01 — Atualização em massa de todos os compêndios de mecanismo pré-existentes ao modelo
             atual (sidebar scroll-based, `.data-table` + `td-label`, chip "Última revisão",
             pranchas Gray's/OpenStax onde o conteúdo é anatomicamente ilustrável). Tier A
             (tratamento completo CSS+tabelas+JS+pranchas): 9 compêndios de imunologia,
             hipertensão-SRAA, trombose-e-hemostasia. Tier B (já completo, sem retrabalho):
             choque-circulatorio. Tier C (CSS+tabelas+JS, sem pranchas novas — conteúdo
             molecular/farmacológico sem imagem CC apropriada): virologia, micologia,
             antifúngicos, antiagregantes/anticoagulantes/trombolíticos, doenças circulatórias,
             citocinas, Th1/Th2/Th17, vacinas. Link de retorno ao índice (`#s-home`) aplicado em
             todos os HTMLs ativos do projeto, incluindo os de `medicina/`. Nota de risco
             registrada em DEBT.md: 5 arquivos de imunologia (`celulas-sistema-imune.html`,
             `imunidade-inata.html`, `hipersensibilidade.html`, `linfocitos-t-diferenciacao.html`,
             `mhc-apresentacao-antigenica.html`) foram editados nesta atualização em massa sem
             backup prévio em `_archive/` — correção pontual sob pressão de tempo, não reescrita
             ≥30% isolada; se necessário reconstituir o estado anterior, usar histórico do Git.

2026-07-03 — Auditoria geral do projeto (instruções, skills, memória). Correções aplicadas a este
             escopo (mecanismo/medicina):
             - `_docs/project_estado.md` (este arquivo) criado.
             - `_docs/project_mapa_materiais.md` reescrito — escopo restrito a `medicina/`
               (mecanismo); antes misturava as três skills e citava caminhos mortos.
             - `instrucoes-projeto.txt`: contagem de `imunologia/` corrigida de 10 para 13
               compêndios ativos (contagem real de arquivos, excluindo `index.html`); `fisiologia/`
               corrigida de 1 para 2 (faltava `ciclo-cardiaco.html` na contagem).
             - `mecanismo-medicina-basica/SKILL.md`: `ciclo-cardiaco.html` estava ausente da lista
               de arquivos de `medicina/fisiologia/` e dos cross-links prioritários — adicionado.
             - Comentário órfão (`<!-- CONCEITOS-CHAVE (placeholder removido...) -->`) removido de
               `fisiopatologia/choque-circulatorio/choque-circulatorio.html` (resíduo de edição
               de 2026-07-01, registrado em DEBT.md).
             - `_docs/MIGRATION.md` (rastreamento de migração ao Template v2, papel já cumprido —
               todo o acervo ativo foi migrado em 2026-07-01) movido para
               `_acervo/docs-legado/MIGRATION.md`; referência removida de `mecanismo/SKILL.md`
               (fluxo de trabalho e checklist).
             - Convenção de `_archive/` aninhado por subpasta em `medicina/` (diverge do
               `_archive/` único da raiz usado por `compêndios/`) documentada explicitamente em
               `_docs/operacoes-bash.md` como coexistência aceita, não pendência.
             Pendência que segue em aberto (não resolvida nesta sessão, ver `_docs/DEBT.md`): os 5
             arquivos de imunologia editados em 2026-07-01 sem backup prévio continuam sem
             `_archive/` de antes daquela edição.
