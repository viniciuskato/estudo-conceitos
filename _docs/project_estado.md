=== MECANISMO (medicina/) — ESTADO DA SESSÃO ===
Última sessão: 2026-07-03

Arquivo criado nesta sessão (2026-07-03) — era referenciado por `mecanismo/SKILL.md` e por
`instrucoes-projeto.txt` desde 2026-07-02 mas nunca tinha sido de fato criado (ver `_docs/DEBT.md`,
item resolvido nesta sessão). Histórico anterior a 2026-07-03 reconstruído a partir de
`_docs/DEBT.md` (seção Resolvida) e dos metadados dos próprios arquivos HTML, na ausência do
registro de sessão original.

=== Histórico ===

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
