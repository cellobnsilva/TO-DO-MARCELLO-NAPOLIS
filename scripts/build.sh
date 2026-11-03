#!/usr/bin/env bash
# Gera documentos completos (abrir direto no navegador ou no GitHub Pages)
# a partir das fontes em src/ (publicadas como artefatos no claude.ai).
set -euo pipefail
cd "$(dirname "$0")/.."
wrap() {
  { printf '<!doctype html>\n<html lang="pt-BR">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n</head>\n<body style="margin:0">\n'
    cat "$1"
    printf '\n</body>\n</html>\n'; } > "$2"
  echo "$2 gerado."
}
wrap src/pauta.html index.html
wrap src/pauta-comite.html comite.html
