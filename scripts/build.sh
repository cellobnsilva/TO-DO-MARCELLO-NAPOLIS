#!/usr/bin/env bash
# Gera index.html (documento completo, para abrir direto no navegador ou no GitHub Pages)
# a partir de src/pauta.html (fonte publicada como artefato no claude.ai).
# O arquivo contém os dois painéis: Afazeres MN e Pauta Comitê (#comite).
set -euo pipefail
cd "$(dirname "$0")/.."
{
  printf '<!doctype html>\n<html lang="pt-BR">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n</head>\n<body style="margin:0">\n'
  cat src/pauta.html
  printf '\n</body>\n</html>\n'
} > index.html
echo "index.html gerado."
