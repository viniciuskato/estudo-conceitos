@echo off
cd /d "%~dp0"
git add -A
git commit -m "Atualiza materiais"
git push
echo.
echo Concluido! Pressione qualquer tecla para fechar.
pause > nul
