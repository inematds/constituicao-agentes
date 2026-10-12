# Prompt: rascunho da constituição com um assistente de IA

Cole no Claude, ChatGPT ou Gemini, troque o que está entre `< >` e anexe o arquivo
`constituicao-modelo.md`. O assistente faz um rascunho; **quem decide e assina é você**.

```
Você vai me ajudar a escrever a constituição dos agentes de IA da minha empresa.

Empresa: <nome e o que faz, em uma frase>
O que os agentes vão fazer: <ex.: atender clientes no WhatsApp e marcar horários>
Quem é o responsável humano: <nome e cargo>
Regras que já existem: <ex.: política de desconto, LGPD, horário de atendimento>
O que me dá medo que o agente faça: <ex.: prometer prazo, dar desconto, falar de saúde>

Use exatamente as 9 seções do modelo anexo. Regras:
1. Prioridades na ordem: segurança e supervisão humana, honestidade, regras da empresa, ser útil.
2. Escreva pelo menos 3 casos difíceis reais do meu negócio, cada um com Situação, O que fazer e Por quê.
3. Na tabela de autonomia, use os níveis 0 (não toca), 1 (propõe), 2 (faz e avisa) e 3 (faz sozinho).
4. Não invente regra que eu não informei: quando faltar informação, deixe [entre colchetes] e me pergunte no fim.
5. Linguagem simples, frases curtas.
```

Depois:

1. Salve a resposta como `minha-constituicao.md`.
2. Rode `python3 scripts/checar_constituicao.py minha-constituicao.md` até dar **OK**.
3. Adapte `casos-de-teste.md` e teste o agente antes de colocar no ar.
