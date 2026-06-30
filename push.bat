@echo off
cd /d "%~dp0"
git add -A
git commit -m "sessao %date% %time%"
git push
pause
