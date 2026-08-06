---
name: autocritica-sessao
description: "APOSENTADA em 2026-07-17 — não usar. autocritica-cowork virou skill única e genérica para melhoria contínua de todo o Cowork; não há mais subskills por domínio. Se esta descrição ainda aparecer disparando por engano, ignorar e usar autocritica-cowork diretamente."
---

# APOSENTADA em 2026-07-17

Esta subskill foi aposentada — `autocritica-cowork` virou skill única e genérica de melhoria contínua para todo o Cowork, sem subskills por domínio. Motivo completo em `Cowork/_meta/registro-sessoes.md`, entrada 2026-07-17, e em `Cowork/CLAUDE.md` v2.18, seção "Auditoria estrutural e melhoria contínua".

Não carregar esta skill. Usar `autocritica-cowork` diretamente para qualquer sessão, em qualquer domínio (Compêndios, Provas, Sistemas, ou qualquer outro).

**Para onde foi o delta que esta subskill continha:**
- Arquivos de controle (`compendio_mapa.txt`/`compendio_estado.txt`, `prova_mapa.txt`/`prova_estado.txt`, `sistema_mapa.txt`/`sistema_estado.txt`, `_docs/DEBT.md`) e a nota de `git status` falhando neste sandbox → seção "Infraestrutura compartilhada" do `CLAUDE.md` de Compêndios, Provas e Sistemas, respectivamente.
- Tabela de destino do Passo 2.5 (onde classificar cada melhoria dentro deste cluster) → generalizada dentro de `autocritica-cowork/SKILL.md`, Passo 2.5, item (d) — inclui a distinção "sempre-carregado no CLAUDE.md vs. doc referenciado sob demanda" que era específica daqui.
- Pendências de fechamento (`push.bat`, "Save skill") → já cobertas de forma genérica em `autocritica-cowork/SKILL.md`, Passo 4; a pendência de copiar `instrucoes-projeto.txt` no painel Instruções ficou obsoleta desde a consolidação do Cowork em projeto único (2026-07-04) e não foi migrada.

**Pendência do usuário:** remover esta skill instalada (não só o arquivo-fonte) via Settings → Capabilities, já que este SKILL.md fonte não pode desinstalar a versão empacotada que o app já tem salva.
