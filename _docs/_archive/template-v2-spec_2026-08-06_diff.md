# Diff — Base de estudos/_docs/template-v2-spec.md, 2026-08-06

## Seção "Fontes de imagens (hierarquia)"

**Antes:**
> 1. **OpenStax Anatomy & Physiology** (CC BY) — preferencial: colorido, rótulos grandes e legíveis.
> 2. **Gray's Anatomy (1918)** — domínio público: clássico, usar quando legível.
> 3. **Blausen Medical** (CC BY 3.0) — ilustrações 3D para estruturas específicas.
>
> Evitar SVGs com fundo branco em tema escuro (ficam estranhos no lightbox).

**Depois:** mesmo texto, mais o parágrafo novo:
> **Fotografia clínica/achado de exame (não diagrama anatômico) — hierarquia própria, 2026-08-06:** a hierarquia acima (OpenStax/Gray's/Blausen) cobre diagramas didáticos, não fotos de sinal clínico real (ex. nódulos de Osler, lesões de pele, achados de imagem). Para esse caso, **preferir figura de artigo revisado por pares e de acesso aberto (via PMC) a upload "own work" autopublicado no Wikimedia Commons sem publicação por trás**, quando ambos existirem para o mesmo achado — mesmo princípio de "Disciplina de fonte primária" já em vigor no Cowork, aplicado a imagem. Commons continua um repositório válido (é onde a imagem do PMC também aparece hotlinkável), mas o critério de confiabilidade é a proveniência (documentada/peer-reviewed vs. autopublicada), não a plataforma de hospedagem. **Verificar sempre a página `File:` do Commons ou o artigo fonte antes de referenciar** — não presumir confiabilidade pela familiaridade da imagem (uma foto pode ser a mais usada em várias Wikipédias e ainda assim ser autopublicada sem lastro editorial). URL de figura do PMC (padrão de hotlink verificado nesta sessão): `https://cdn.ncbi.nlm.nih.gov/pmc/blobs/<hash>/<pmcid>/<hash2>/<nome>_HTML.jpg` — obter navegando até a página do artigo em `pmc.ncbi.nlm.nih.gov/articles/PMC<ID>/` e copiando a URL da tag `<img>` da figura (não inventar o padrão de hash). Licença do PMC costuma vir explícita no rodapé do artigo ("Open Access... Creative Commons Attribution X.0") — conferir antes de hotlink, mesma exigência de qualquer outra fonte. Piloto: `casos-clinicos/endocardite-infecciosa-avc-embolico.html`, Fig. 2 (nódulos de Osler) — trocado de upload autopublicado (Wikimedia, 2010, sem publicação) para figura de Naruse et al., *J Med Case Rep* 2022;16:211, PMC9148510, CC BY 4.0.

## Motivo

Usuário perguntou, na revisão do caso de endocardite, se havia como usar imagens com fontes mais confiáveis, afirmando que "fontes confiáveis são um pilar fundamental na produção de todos os materiais". Auditoria das 3 imagens do arquivo (via Wikimedia Commons `File:` pages) mostrou que Fig. 2 (nódulos de Osler) era a única sem lastro peer-reviewed — upload "own work" de um usuário do Commons em 2010, sem publicação por trás (embora seja a imagem-padrão do achado, replicada em ~15 Wikipédias). Busca no PubMed/PMC (a pedido do usuário, que escolheu ampliar a busca em vez de só sinalizar o problema na legenda) encontrou Naruse et al. 2022 (J Med Case Rep, CC BY 4.0), com a foto exata do achado em 3 sítios anatômicos e consentimento informado documentado — substituída.

## Aplicação

`endocardite-infecciosa-avc-embolico.html`, Fig. 2: `src`, `alt`, `data-caption` e `.plate-caption` reescritos para a nova fonte, incluindo nota explícita distinguindo os nódulos de Osler (achado da endocardite) da doença de Osler-Weber-Rendu de base da paciente da foto (mesmo epônimo, condições não relacionadas) — para não confundir o leitor.
