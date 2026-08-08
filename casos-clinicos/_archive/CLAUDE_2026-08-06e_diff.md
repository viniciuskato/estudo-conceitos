# Diff — Casos Clínicos/CLAUDE.md, 2026-08-06 (5ª edição do dia)

## Regras específicas deste domínio — item "Nível de evidência"

**Antes (v1.2):**
> - **Nível de evidência:** toda conduta, diagnóstico ou terapêutica discutida indica se a base é Diretriz/Consenso, Ensaio Clínico Controlado, Revisão Sistemática ou Opinião de Especialista — mesmo padrão já em uso em Compêndios/Provas/Anamnese e Exame Físico/Tutorial.

**Depois (v1.3):**
> - **Nível de evidência:** toda conduta, diagnóstico ou terapêutica discutida indica se a base é Diretriz/Consenso, Ensaio Clínico Controlado, Revisão Sistemática ou Opinião de Especialista — mesmo padrão já em uso em Compêndios/Provas/Anamnese e Exame Físico/Tutorial. **O rótulo (`.evid`) é sempre um link clicável** para a entrada correspondente em "Referências" — mesmo mecanismo `navRef`/`#back-btn` das citações numeradas (`<a class="evid" href="#refN" onclick="navRef(this)">`), nunca um `<span>` estático; e toda entrada de Referências disponibiliza o link direto de acesso quando a fonte é aberta. Origem: usuário apontou, no primeiro caso deste domínio, que o rótulo de não-consenso era útil mas não clicável — 2026-08-06.

## Motivo

Usuário revisou `endocardite-infecciosa-avc-embolico.html` e apontou que o rótulo `.evid` "Revisão" (marcando que o dado de incidência de embolização não é consenso fechado) era exatamente o padrão desejado para todo material, mas não era clicável nem levava à referência — e que a referência, quando de acesso aberto, deve trazer o link direto.

## Aplicação nesta sessão

`endocardite-infecciosa-avc-embolico.html`:
- Todos os 11 `<div class="ref-item">` de "Referências" ganharam `id="ref1"`..`id="ref11"`.
- Nova referência `id="ref12"` adicionada (Delgado et al., 2023 ESC Guidelines for the management of endocarditis, *Eur Heart J* 2023;44(39):3948-4042, DOI 10.1093/eurheartj/ehad193) — fonte pretendida da Tabela 5 (terapia antimicrobiana por agente), que não tinha referência correspondente na lista original. Sem acesso aberto confirmado (não indexado em PMC, sem licença aberta identificada via checagem de copyright do PubMed) — texto completo não recuperado nesta sessão, sinalizado explicitamente na nota da referência (mesmo padrão já usado na entrada de Fowler et al. 2023 no mesmo arquivo).
- Os 7 rótulos `.evid` do arquivo (`Revisão`, `Diretriz/Consenso` ×4, `Novo em 2023`, `Revisão sistemática/Meta-análise`) convertidos de `<span>` para `<a class="evid" href="#refN" onclick="navRef(this)">`, cada um apontando para a referência correta por conteúdo (não por proximidade — conferido contra a nota `rnote` de cada `ref-item`).
- CSS `.evid` ganhou `text-decoration:none;cursor:pointer` e `.evid:hover{opacity:.8}`.
- JS ganhou `window.navRef = window.navFig;` — alias reaproveitando o mecanismo `#back-btn` já existente no arquivo (usado antes só para `navFig`, navegação de figura).

## Pendência registrada

Rótulos `.evid` (nível de evidência) já existem em Compêndios/Provas/Anamnese e Exame Físico/Tutorial (mesmo padrão citado na regra original). Propagação da clicabilidade a esses domínios é gradual — não é retrofit em massa nesta sessão. Pendência a registrar em `Cowork/_meta/DEBT.md`.
