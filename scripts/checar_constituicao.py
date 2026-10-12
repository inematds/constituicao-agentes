#!/usr/bin/env python3
"""Confere se uma constituição de agentes tem as 9 seções do modelo e se sobrou [colchete] por preencher.

Uso: python3 scripts/checar_constituicao.py minha-constituicao.md
Sai com 0 se está completa, 1 se falta algo.
"""
import re
import sys
import unicodedata

SECOES = [
    ("missao", "1. Missão"),
    ("prioridades", "2. Prioridades"),
    ("principios", "3. Princípios de julgamento"),
    ("limites", "4. Limites"),
    ("permissoes", "5. Permissões e nível de autonomia"),
    ("ajuda", "6. Quando pedir ajuda"),
    ("casos", "7. Casos difíceis"),
    ("medimos", "8. Como medimos"),
    ("revisao", "9. Revisão"),
]


def sem_acento(texto):
    return "".join(c for c in unicodedata.normalize("NFD", texto.lower()) if unicodedata.category(c) != "Mn")


def checar(caminho):
    with open(caminho, encoding="utf-8") as f:
        texto = f.read()
    titulos = [sem_acento(t) for t in re.findall(r"^##\s+(.+)$", texto, re.M)]
    problemas = []
    for chave, nome in SECOES:
        if not any(chave in t for t in titulos):
            problemas.append(f"falta a seção: {nome}")
    casos = len(re.findall(r"^###\s+Caso", texto, re.M))
    if casos < 3:
        problemas.append(f"só {casos} caso(s) difícil(eis); o mínimo é 3")
    if len(re.findall(r"\*\*Por qu", texto)) < casos:
        problemas.append("algum caso difícil está sem o 'Por quê'")
    corpo = texto.split("\n", 3)[-1]  # ignora o bloco de instrução do topo
    soltos = re.findall(r"\[[^\]\n]{2,80}\](?!\()", corpo)  # links markdown [x](y) não contam
    if soltos:
        problemas.append(f"{len(soltos)} trecho(s) entre colchetes por preencher, ex.: {soltos[0]}")
    return problemas, casos


def main():
    if len(sys.argv) != 2:
        print(__doc__.strip())
        return 2
    problemas, casos = checar(sys.argv[1])
    if problemas:
        print("INCOMPLETA:")
        for p in problemas:
            print(" -", p)
        return 1
    print(f"OK: 9 seções, {casos} casos difíceis com 'Por quê', nada por preencher.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
