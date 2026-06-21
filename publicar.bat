@echo off
cd /d "%~dp0"
git add -A
git commit -m "Atualização %date% %time%"
git push origin main
echo.
echo Publicado! Em ~1 minuto o site estará atualizado.
pause
