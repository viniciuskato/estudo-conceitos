@echo off
setlocal enabledelayedexpansion

rem Move o .git para fora da pasta sincronizada pelo OneDrive, mantendo o
rem projeto (HTMLs, skills, docs) exatamente onde esta hoje. O git passa a
rem usar um "gitdir" externo via arquivo .git (texto), em vez da pasta .git
rem inteira. Isso elimina o .git/index.lock preso e leituras de git show
rem desatualizadas pelo cache do OneDrive, documentados em _docs/DEBT.md.
rem
rem NAO resolve a leitura/escrita de arquivos de conteudo (HTML/.md/.txt)
rem via bash nesta pasta — essa continua exigindo Read/Grep diretos, regra
rem ja em vigor no projeto.

set "PROJETO=C:\Users\vinic\OneDrive\Claude\Cowork\Base de estudos"
set "GITDIR_EXTERNO=%LOCALAPPDATA%\git-repos\estudo-conceitos.git"

echo Projeto: %PROJETO%
echo Novo local do .git: %GITDIR_EXTERNO%
echo.

if not exist "%PROJETO%\.git\" (
    echo ERRO: "%PROJETO%\.git" nao existe como pasta. Talvez ja tenha sido migrado.
    goto :fim
)

if exist "%GITDIR_EXTERNO%" (
    echo ERRO: "%GITDIR_EXTERNO%" ja existe. Aborte e verifique manualmente antes de continuar.
    goto :fim
)

echo Feche qualquer programa com o repositorio aberto (editor, terminal git, etc.)
echo antes de continuar. Pressione uma tecla para prosseguir ou Ctrl+C para cancelar.
pause >nul

if not exist "%LOCALAPPDATA%\git-repos" mkdir "%LOCALAPPDATA%\git-repos"
if not exist "%LOCALAPPDATA%\git-repos" (
    echo ERRO: nao foi possivel criar "%LOCALAPPDATA%\git-repos". Verifique permissoes.
    goto :fim
)

echo.
echo Copiando .git para o novo local (robocopy, com retry)...
robocopy "%PROJETO%\.git" "%GITDIR_EXTERNO%" /E /R:3 /W:2 /NFL /NDL /NP /NJH
if %ERRORLEVEL% GEQ 8 (
    echo ERRO: robocopy falhou ao copiar ^(codigo %ERRORLEVEL%^). Nada foi apagado do .git original.
    goto :fim
)

echo.
echo Verificando integridade da copia...
if not exist "%GITDIR_EXTERNO%\HEAD" (
    echo ERRO: "%GITDIR_EXTERNO%\HEAD" nao encontrado apos a copia. Abortando sem apagar o original.
    goto :fim
)
if not exist "%GITDIR_EXTERNO%\objects" (
    echo ERRO: "%GITDIR_EXTERNO%\objects" nao encontrado apos a copia. Abortando sem apagar o original.
    goto :fim
)
if not exist "%GITDIR_EXTERNO%\refs" (
    echo ERRO: "%GITDIR_EXTERNO%\refs" nao encontrado apos a copia. Abortando sem apagar o original.
    goto :fim
)
echo Copia integra confirmada (HEAD, objects, refs presentes).

echo.
echo Apagando .git original...
rmdir /s /q "%PROJETO%\.git"
if exist "%PROJETO%\.git\" (
    echo ERRO: nao foi possivel apagar o .git original. A copia em "%GITDIR_EXTERNO%" existe, mas o original ainda esta aqui tambem — verifique manualmente antes de continuar.
    goto :fim
)

echo Criando arquivo .git de referencia (gitdir externo)...
set "GITDIR_FORWARD=%GITDIR_EXTERNO:\=/%"
> "%PROJETO%\.git" echo gitdir: %GITDIR_FORWARD%

echo.
echo Verificando...
cd /d "%PROJETO%"
git status
if errorlevel 1 (
    echo ERRO: git status falhou apos a migracao.
    echo Para reverter: apague "%PROJETO%\.git" ^(o arquivo^) e mova "%GITDIR_EXTERNO%" de volta para "%PROJETO%\.git".
) else (
    echo.
    echo Sucesso. O .git agora vive fora do OneDrive; a pasta do projeto
    echo continua sincronizada normalmente. git log -3 --oneline abaixo
    echo deve mostrar o mesmo historico de sempre:
    echo.
    git log -3 --oneline
)

:fim
echo.
pause
