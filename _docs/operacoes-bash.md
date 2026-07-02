=== Operações de bash e arquivo — Base de Estudos ===
Regras mecânicas de edição de arquivo, verificação e encerramento de sessão. Ler ANTES de escrever/editar HTML, rodar bash, ou encerrar a sessão — não fica em Project Instructions (carregado em toda mensagem) porque só é relevante nesses momentos específicos. Ver instrucoes-projeto.txt para dispatch de skills, estrutura de pastas e protocolo de abertura de sessão.

=== Eficiência operacional (regras compartilhadas) ===
- Edit: nunca >~150 linhas por bloco new_string. Backup antes de editar HTML.
- Write: arquivo novo ou reescrita completa <300 linhas.
- Python: conteúdo com acentos PT-BR, símbolos tipográficos e entidades HTML. Nunca echo ou heredoc bash (corrompe encoding).
- sed: substituições pontuais em arquivos >500 linhas.
- HTML binário: se grep retornar 'binary file matches', editar via python3 com open(path, 'r', encoding='utf-8') diretamente — não copiar para /tmp.
- bash append: completar conteúdo ao final de arquivo íntegro.
- HTML novo >300 linhas: Write estrutura inicial (~150 linhas) → verificar → Python escreve restante → cat >> arquivo → verificar.
- Leitura seletiva: grep -n para localizar âncora antes de Read com offset/limit. Ler arquivo inteiro só quando estritamente necessário.
- Wrapper HTML: antes de manipular seções via Python (content_start/content_end), confirmar o seletor do wrapper principal com grep: grep -n 'id="content"' arquivo.html — pode ser <div> ou <main>.
- plate-caption: fecha com </div> (não </p>). Regex Python para manipular deve usar r'(<div class="plate-caption">)(.*?)(</div>)' com re.DOTALL.
- Verificação preditiva: antes de Edit com new_string >80 linhas, calcular linhas esperadas. Após o Edit, wc -l e comparar — divergência ±5 indica truncamento.
- Comandos de diagnóstico independentes no mesmo bash: usar ";" em vez de "&&" entre eles — uma falha esperada num comando (ex.: `ls` numa pasta que pode não existir) não deve impedir os comandos seguintes de rodar silenciosamente.

=== Verificação bash obrigatória após qualquer escrita de HTML ===
(a) fecha com </body></html>
(b) wc -l compatível com o esperado
(c) sem const const / var var
(d) encoding UTF-8 intacto: grep -c "ã\|ç\|é\|ñ\|→\|–" > 0 (compêndios PT-BR); para inglês, grep -c "\xef\xbf\xbd" deve ser 0. Em compêndios em inglês, conferir também que não entrou texto de outro script por engano — grep da faixa CJK (hiragana/katakana/han) deve ser 0 (incidente 2026-07-02: fragmento em japonês digitado por engano numa caixa .hist, corrigido na hora).
(e) sem artefatos: grep -w "TODO\|FIXME" (case-sensitive) + grep -iw "placeholder\|debug\|rascunho" — ambos vazios
Corrigir antes de prosseguir. Mesma verificação de fechamento vale para .md core editado na sessão (template-v2-spec.md, instrucoes-projeto.txt, operacoes-bash.md, DEBT.md, SKILL.md de skills): confirmar via Read do final do arquivo (não só wc -l) que termina em frase/seção completa, não cortado no meio.

Pasta sincronizada via OneDrive — regra geral: bash não é confiável para verificar integridade de conteúdo nesta pasta (wc -l, cat, tail); o cache pode mostrar conteúdo desatualizado ou truncado tanto na leitura quanto na escrita, mesmo logo após salvar. Única fonte confiável de conteúdo real: Read/Grep direto. O mesmo cache afeta a EXECUÇÃO de scripts Python nesta pasta (ex.: `empacotar_skills.py`) — bash pode rodar uma versão desatualizada/truncada do arquivo mesmo com o conteúdo real íntegro (confirmado 2026-07-01: `SyntaxError` em duas tentativas de rodar `empacotar_skills.py` via bash do sandbox após editar via Edit tool). Não insistir mais de ~2 tentativas: pedir para o usuário rodar o script localmente (duplo clique). Comandos git (`status`, `diff`, `add`, `commit`, `log`, `show`) FALHAM POR COMPLETO no bash do sandbox (`fatal: not a git repository`) desde a migração do `.git` para fora do OneDrive — não tentar verificação ou operação git via bash do sandbox; pedir para o usuário rodar localmente (`push.bat` ou terminal nativo), que usa Windows nativo e não sofre essa limitação. Histórico completo dos incidentes que fundamentam esta regra: `_docs/DEBT.md`.

Rede do sandbox: bash bloqueia por padrão qualquer domínio externo não listado (erro `403 blocked-by-allowlist` via proxy interno) — confirmado ao tentar testar `api.mymemory.translated.net` e `api.dictionaryapi.dev` via curl (2026-07-02). Isso NÃO afeta o app publicado nem o browser real do usuário (fetch client-side do HTML entregue funciona normalmente pela internet) — é limitação só de testes feitos a partir do bash do Claude. Para liberar um domínio: usuário adiciona em Settings > Capabilities > Code Execution > "Permitir saída de rede" > domínios adicionais. IMPORTANTE: a mudança só entra em vigor numa sessão NOVA do sandbox — não retroage na sessão em andamento. Não insistir tentando de novo no mesmo bash após o usuário reconfigurar; avisar isso ANTES de sugerir o reteste, não depois de falhar de novo.

=== Verificação visual ===
Novos arquivos e reescritas ≥30%: verificação visual obrigatória via Claude in Chrome.
Esse limiar é sobre TAMANHO da edição (proporção real de linhas alteradas/adicionadas em relação ao total do arquivo, ou arquivo novo/reescrita completa) — calcular antes de propor, não perguntar por reflexo a cada edição de HTML/CSS/JS. NÃO confundir com o critério de "mudança estrutural" da seção Arquivamento (CSS+JS combinados, mesmo em edições pequenas) — esse outro critério dispara só o backup em _archive/, não o fluxo de verificação visual abaixo. Uma edição pontual de dezenas de linhas num componente específico dentro de um arquivo de centenas/milhares de linhas normalmente NÃO atinge os 30% (incidente 2026-07-02: verificação via surge proposta para ~15 linhas de JS/CSS num arquivo de 675 linhas — desproporcional, usuário teve que questionar a relevância).
ANTES de encerrar a sessão, se o limiar foi de fato atingido, Claude deve propor ativamente: "A mudança foi ≥30% — quer verificar no browser via surge antes de fechar?"
Workflow para arquivos locais (Chrome não abre file://):
  1. Usuário roda no CMD: surge "<caminho_pasta>" <subdominio>.surge.sh
  2. Claude abre https://<subdominio>.surge.sh/<arquivo>.html no Chrome
  3. Verificar: layout, sidebar, float das pranchas, lightbox, botão de retorno, tabelas, acentuação
  Economia de tokens (IMPORTANTE — screenshots são imagens grandes e caras no contexto): usar `read_page` (árvore de acessibilidade/texto, barato) para conferir estrutura, conteúdo e acentuação; reservar `screenshot` para poucos pontos genuinamente visuais (cabeçalho, uma tabela, um componente especial como kbox/prancha), teto de ~3 por verificação. Não "passear" rolando o documento inteiro tirando screenshots.
  Lag de pintura: após `scroll`/`navigate` no Chrome, esperar ~1–2s antes do `screenshot`. Um quadro totalmente preto, ou com conteúdo só na base e vão preto acima, é atraso de pintura da página — NÃO bug de layout no HTML. Re-tirar o screenshot após esperar, em vez de investigar o HTML (confirmado em 2026-07-01: vários screenshots pretos na verificação de epistemologia eram só lag).
  Nota: se a mudança não aparecer após redeploy, forçar recarga do browser (Ctrl+Shift+R) antes de depurar o HTML — surge pode servir versão cacheada.
  Subd.: compendios-medicina.surge.sh -> compêndios/medicina/
  Conta surge: vinicius.kato.734@gmail.com (token no Windows)

=== Arquivamento ===
Sobrescrever com archive em _archive/ + sufixo de data quando mudança ≥30%. Editar no lugar para correções pontuais.
Uma atualização de modelo completa (CSS + tabelas + JS combinados no mesmo arquivo, mesmo que aplicada em vários Edits pequenos) conta como mudança estrutural, não como correção pontual — sempre fazer backup em _archive/ antes de começar, mesmo que cada edição individual pareça pequena.
Ao renomear pastas: verificar e atualizar links em index.html — caminhos antigos causam 404 no app publicado.
Material inadequado ao modelo atual → _acervo/ com nota no LEIA-ME.md (não deletar).

=== GitHub ===
Ao concluir a sessão (usuário sinalizar "terminamos", "pode fechar" ou similar), após aplicar as mudanças aprovadas: rodar `git add -A`, `git commit` com mensagem descrevendo o que foi feito na sessão, e `git push` para enviar ao repositório remoto.
Se o push falhar (conflito, sem credenciais configuradas no ambiente, etc.): informar o usuário do erro específico e deixar o commit local intacto — não forçar (`--force`) nem tentar contornar credenciais.
Deleções manuais pendentes: se, durante a sessão, uma ou mais remoções de arquivo falharam por lock de sincronização do OneDrive (ver seção anterior), não reportar cada uma isoladamente no meio da sessão. Consolidar todas num único checklist ao final, junto do lembrete de `push.bat` — o usuário resolve tudo de uma vez depois que o OneDrive terminar de sincronizar.
