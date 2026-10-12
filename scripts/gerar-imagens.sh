#!/usr/bin/env bash
# Gera capa + 6 banners (live/grade x PT/EN/ES) do guia. Roda uma vez; as imagens ficam no repo.
R="$(cd "$(dirname "$0")/.." && pwd)"
G=~/.claude/skills/projetos-landing-guia/assets/gerar-banner.sh
LOG="$R/scripts/.imagens.log"; : > "$LOG"

node ~/.claude/skills/capa-inema/assets/gerar-capa.cjs --repo "$R" \
  --title "Constituição dos Agentes" --cat "Gestão de agentes" \
  --save-raw "$R/guia/assets/hero.png" --gerador auto >>"$LOG" 2>&1 &

PT=(--title "CONSTITUIÇÃO DOS AGENTES" --destaque "AGENTES"
    --sub "Da cultura da Anthropic às regras de julgamento dos seus agentes"
    --line "Missão, prioridades, limites e a hora de pedir ajuda"
    --tiles "Missão,Prioridades,Limites,Pedir ajuda,Casos difíceis,Ciclo de revisão"
    --sides "sala de reunião moderna com uma pessoa revisando um documento dourado ao lado de telas com fluxos de agentes")
EN=(--title "THE AGENT CONSTITUTION" --destaque "CONSTITUTION"
    --sub "From Anthropic's culture to judgment rules for your agents"
    --line "Mission, priorities, limits and when to ask for help"
    --tiles "Mission,Priorities,Limits,Ask for help,Hard cases,Review cycle"
    --sides "modern meeting room with a person reviewing a golden document next to screens showing agent workflows")
ES=(--title "CONSTITUCIÓN DE AGENTES" --destaque "AGENTES"
    --sub "De la cultura de Anthropic a las reglas de juicio de tus agentes"
    --line "Misión, prioridades, límites y cuándo pedir ayuda"
    --tiles "Misión,Prioridades,Límites,Pedir ayuda,Casos difíciles,Ciclo de revisión"
    --sides "sala de reuniones moderna con una persona revisando un documento dorado junto a pantallas con flujos de agentes")

bash $G --repo "$R" "${PT[@]}" >>"$LOG" 2>&1 &
bash $G --repo "$R" "${PT[@]}" --estilo grade --saida banner-grade >>"$LOG" 2>&1 &
bash $G --repo "$R" "${EN[@]}" --lang en --saida banner-en >>"$LOG" 2>&1 &
bash $G --repo "$R" "${EN[@]}" --lang en --estilo grade --saida banner-grade-en >>"$LOG" 2>&1 &
bash $G --repo "$R" "${ES[@]}" --lang es --saida banner-es >>"$LOG" 2>&1 &
bash $G --repo "$R" "${ES[@]}" --lang es --estilo grade --saida banner-grade-es >>"$LOG" 2>&1 &
wait
ls -la "$R/guia/assets" "$R/capa" >>"$LOG" 2>&1
echo FIM >>"$LOG"
