# Diff — Casos Clínicos/CLAUDE.md, 2026-08-06 (7ª edição do dia)

## Regras específicas deste domínio — item "Nível de evidência"

**Adicionado ao final do bullet (após a extensão da 5ª edição):**
> **Verificação mecânica obrigatória (2026-08-06b):** antes de considerar a conversão concluída, `Grep` por `<span class="evid"` no arquivo inteiro e confirmar zero ocorrências — busca parcial por trecho lido (não o arquivo inteiro) deixou 5 de 12 rótulos sem converter na primeira passada deste domínio, só notado quando o usuário clicou e não funcionou.

## Motivo

Na 5ª edição do dia (mesma sessão), a conversão de `.evid` para link clicável foi feita a partir dos trechos que já tinham sido lidos ao longo da conversa (grep com padrões específicos como "Revisão|embolização|80%..."), não de uma varredura completa do arquivo. Resultado: 5 rótulos ficaram para trás — dois na seção "Estreptococos viridans e S. gallolyticus" (a mesma que o usuário testou e reportou não funcionar), um em "Diagnóstico diferencial da atelectasia", dois em "Manejo do AVC concomitante". O usuário clicou nos botões em produção e eles não levaram a lugar nenhum — falha só detectada por teste real, não por revisão do próprio Claude.

## Aplicação

`endocardite-infecciosa-avc-embolico.html`:
- 5 `<span class="evid">` restantes convertidos para `<a class="evid" href="#refN" onclick="navRef(this)">`.
- 2 novas referências adicionadas: `ref13` (Tong, S.Y.C. et al., "Management of Staphylococcus aureus Bacteremia: A Review", *JAMA* 2025;334(9):798-808, DOI 10.1001/jama.2025.4288, PMID 40193249, PMCID PMC12663922 — acesso aberto não confirmado, checagem de licença via PMC bloqueada por captcha nesta sessão) e `ref14` (Bamrung, V., Sitthicharoenchai, P., "The evolving story of *Streptococcus gallolyticus*...", *Frontiers in Microbiology* 2026;17:1765252, DOI 10.3389/fmicb.2026.1765252, PMID 41756132, PMCID PMC12932617 — CC BY 4.0 confirmado via fetch da página PMC).
- 2 rótulos reaproveitaram referências já existentes por conteúdo exato: atelectasia/imobilização → `ref8`; trombólise e controvérsia de anticoagulação (2 rótulos) → `ref6`.
- 1 rótulo (cura bacteriológica ~98% de viridans penicilina-sensível) reaproveitou `ref12` (ESC 2023 Guidelines, já adicionada na 5ª edição para a Tabela 5) — mesma diretriz é a fonte esperada para dados de eficácia terapêutica em EI.

## Verificação pós-correção

`Grep` de `<span class="evid"` no arquivo inteiro após a correção: 0 ocorrências. `Grep` de `<a class="evid"`: 12 linhas (13 ocorrências, uma linha com 2 rótulos) — todas com `href="#refN"` resolvendo a um `id` existente em Referências (ref1 a ref14, checado por leitura completa da seção).
