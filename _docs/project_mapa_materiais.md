# Mapa de Materiais — Estudo de Conceitos

Registro de conceitos centrais cobertos por compêndio. Consultar antes de escrever explicação inline — linkar em vez de reexplicar.

---

## IA · Fundamentos

### `ia/fundamentos/ia-para-estudar.html` — IA como Ferramenta de Estudo (2026-06-25)
- Diagnóstico de uso: produção vs. consolidação (retrieval gap)
- Efeito de testagem (testing effect) — Roediger & Karpicke 2006
- Espaçamento (spacing effect) — algoritmo SM-2, Anki
- Elaboração interleaved — mistura de tópicos melhora discriminação
- Ilusão de fluência — reconhecimento vs. recall
- Modo socrático com IA — feedback sobre tentativa de resposta
- Técnica Feynman com IA — explicar para detectar lacuna
- Revisão espaçada via JSON + chat
- Protocolo de 5 fases: criação → ativação imediata → revisão semanal → revisão integrativa → manutenção

### `ia/fundamentos/introducao-ia.html` — Introdução à Inteligência Artificial (2026-06-25)
- Inteligência Artificial: definição, hierarquia (IA ⊃ ML ⊃ Deep Learning ⊃ LLMs)
- Machine Learning: aprendizado supervisionado, não-supervisionado, por reforço, auto-supervisionado
- Parâmetro / peso: número ajustável; o que muda durante o treinamento
- Treinamento: ciclo predição → perda → backpropagation → descida de gradiente
- Função de perda (loss function): quantifica erro do modelo
- Backpropagation: algoritmo de cálculo de gradientes por regra da cadeia
- Descida de gradiente (gradient descent): atualização de parâmetros no sentido do menor erro
- Overfitting: memorização sem generalização; detectado via dataset de validação
- Rede neural: camadas de unidades que transformam números em números
- Deep Learning: redes neurais profundas (muitas camadas)
- Transformer: arquitetura baseada em mecanismo de atenção (Vaswani et al., 2017)
- Mecanismo de atenção (attention): pondera dinamicamente relevância entre tokens
- Token: unidade mínima de processamento de texto em LLMs
- LLM (Large Language Model): rede Transformer treinada para prever próximo token
- Alucinação: geração de afirmação incorreta com aparência de confiança
- IA generativa: modelos que criam conteúdo novo (texto, imagem, vídeo, áudio)
- Modelo de difusão (diffusion model): gera imagens removendo ruído iterativamente
- IA Estreita (ANI) vs. IA Geral (AGI): distinção por escopo de capacidade
- RLHF: ajuste fino por feedback humano (Reinforcement Learning from Human Feedback)
- História: Turing (1950), Dartmouth (1956), backpropagation (1986), AlexNet (2012), Transformer (2017), ChatGPT (2022)

---

## Ferramentas

### `ferramentas/instrucoes-skills-agentes.html` — Instruções, Skills e Agentes (2026-06-25)
- System prompt: texto injetado antes da conversa — define comportamento para toda sessão
- Instruções de projeto: subconjunto do system prompt persistente por pasta/projeto
- Memória persistida: fatos do usuário reinjetados entre sessões
- Stateless (sem estado): LLMs não preservam contexto entre chamadas — deve ser injetado
- Context window (janela de contexto): tokens visíveis ao modelo no momento da geração
- Skill: arquivo SKILL.md com instruções especializadas ativado por gatilho semântico
- Ativação semântica de skill: modelo infere relevância pela descrição da skill
- Agente: loop autônomo planejamento → ação → observação → iteração
- Tool use / Function calling: emissão de chamadas estruturadas a ferramentas externas
- MCP (Model Context Protocol): padrão de exposição de ferramentas externas ao modelo
- Orquestrador + sub-agentes: padrão de decomposição e delegação paralela de tarefas
- Error compounding (acúmulo de erros): erros em etapas iniciais invalidam as seguintes
- Critério de parada de agente: condição de término explícita para evitar loops
- Escopo de autonomia: o que o agente pode fazer sem confirmação do usuário
- Prompt injection: técnica de sobrescrever instruções via input do usuário
- Efeito de primazia e recência: instruções nas extremas da janela recebem mais aderência
- ReAct (Yao et al., 2022): paper que formalizou o loop agentivo com LLMs

### `ferramentas/claude-llm.html` — Claude: Arquitetura, Capacidades e Uso Avançado
- Constitutional AI, RLHF, MCP (Model Context Protocol), agentes, ferramentas

### `ferramentas/instrucoes-projeto-cowork.html` — Instruções de Projeto no Cowork
- Estrutura de system prompt, instruções de projeto, otimização de workflow

---

## Investimentos

### `investimentos/fundamentos-investimentos.html` — Fundamentos de Investimentos (2026-06-22)
- Risco/retorno, diversificação, CAPM, Fama-French, eficiência de mercado, finanças comportamentais, renda fixa vs. variável, método Bazin, estratégia de objetivo pessoal

---

## Medicina · Imunologia

### Compêndios M1–M13 (2026-06-20 a 2026-06-24)
- Imunidade inata, adaptativa, sistema complemento, MHC, anticorpos, linfócitos T, Th1/Th2/Th17, vacinas, citocinas (JAK-STAT, TNF/IL-6/IFN), hipersensibilidade, resposta a patógenos

---

## Medicina · Farmacologia

### Compêndios Farmacologia (2026-06-20 a 2026-06-24)
- Antifúngicos, antiagregantes/anticoagulantes/trombolíticos, hipertensão/SRAA/anti-hipertensivos

## Medicina · Fisiologia

### `medicina/fisiologia/ciclo-cardiaco.html` — Ciclo Cardíaco (2026-06-30)
- Potencial de ação ventricular (fases 0–4): I_Na, I_Ca,L, I_Kr/Ks, I_K1
- Potencial de ação do nó SA: automacidade, I_f (HCN), I_Ca,T, I_Ca,L
- Sistema de condução: nó SA → vias internodais → nó AV (delay) → His-Purkinje
- Acoplamento excitação-contração: CICR via RyR2, SERCA2a, fosfolambano
- Ciclo mecânico: 6 fases (enchimento, sístole atrial, contração isovolumétrica, ejeção rápida, ejeção lenta, relaxamento isovolumétrico)
- Pressões e volumes: VDF, VSF, VS, FE; diagrama pressão-volume (loop PV)
- ESPVR e E_max: índice de contratilidade independente de carga
- Sons cardíacos: B1 (mitral/tricúspide), B2 (aórtica/pulmonar), B3 (enchimento rápido), B4 (sístole atrial)
- Débito cardíaco: DC = VS × FC; método de Fick; termodiluição; índice cardíaco
- Lei de Frank-Starling: mecanismo molecular (sobreposição actina-miosina + sensibilidade ao Ca²⁺)
- Pré-carga, pós-carga, contratilidade — definições e proxies clínicos
- Regulação intrínseca: Frank-Starling, efeito de Anrep
- Regulação autonômica: simpático (β₁ → PKA → cronotropismo/inotropismo/lusitropismo positivos); parassimpático (M₂ → I_K,ACh → cronotropismo negativo)
- Regulação humoral: epinefrina, angiotensina II, Ca²⁺/K⁺ sérico, T₃/T₄, ANP
- Pressão de enchimento sistêmico e retorno venoso
