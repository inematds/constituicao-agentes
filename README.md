# 📜 Constituição dos Agentes

[![Constituição dos Agentes](guia/assets/banner.jpg)](https://inematds.github.io/constituicao-agentes/guia/)

**🇧🇷 [Português](README.md) · 🇺🇸 [English](README.en.md) · 🇪🇸 [Español](README.es.md)**

## 🎓 Curso rápido

5 aulas de uns 15 minutos (formato v6.2): **https://inematds.github.io/constituicao-agentes-v62/**

## O que é

Este projeto explica uma ideia: a Anthropic atrai talentos com propósito e autonomia, e também escreve uma "constituição" que ensina o Claude a decidir quando não há regra pronta. Nas duas culturas, o objetivo é o mesmo: formar quem sabe julgar, não só obedecer. Aqui você vê o que os dados provam e o que ainda é hipótese, e recebe um kit para escrever a constituição dos agentes de IA da sua empresa. Para usar, basta ler e preencher o modelo; o verificador opcional pede Python 3.

## 📖 Guia de uso

Guia completo (landing + passo a passo): **https://inematds.github.io/constituicao-agentes/guia/**

## O que tem aqui

| Arquivo | Para quê |
|---|---|
| [`docs/LOGICA.md`](docs/LOGICA.md) | A análise: duas culturas, o que os números provam, Maslow, constituição do Claude, treino × contexto, a ponte com a gestão |
| [`modelo/constituicao-modelo.md`](modelo/constituicao-modelo.md) | Modelo em 9 seções para preencher |
| [`modelo/prompt-rascunho.md`](modelo/prompt-rascunho.md) | Prompt para um assistente de IA fazer o primeiro rascunho |
| [`modelo/casos-de-teste.md`](modelo/casos-de-teste.md) | 8 casos para testar o agente antes e depois de cada versão |
| [`exemplos/clinica-atendimento.md`](exemplos/clinica-atendimento.md) | Exemplo fictício preenchido (clínica, atendimento no WhatsApp) |
| [`scripts/checar_constituicao.py`](scripts/checar_constituicao.py) | Verificador: seções, casos difíceis, "Por quê" e colchetes por preencher |

## Uso rápido

```bash
git clone https://github.com/inematds/constituicao-agentes
cd constituicao-agentes
cp modelo/constituicao-modelo.md minha-constituicao.md
# preencha (à mão ou com o prompt-rascunho) e confira:
python3 scripts/checar_constituicao.py minha-constituicao.md
```

## O ciclo

```
Missão + Constituição + Contexto → Agentes + Ferramentas + Execução
→ Resultados + Avaliação → Feedback + Revisão → novo ciclo
```

Uma mudança só entra se os casos de teste não pioram.

## Fontes

SignalFire, State of Talent Report 2025 · [Constituição do Claude](https://www.anthropic.com/constitution) (Anthropic, 22/01/2026, CC0).

---

Análise de Nei Maldaner · [INEMA.CLUB](https://inema.club) · conteúdo aberto e gratuito.
