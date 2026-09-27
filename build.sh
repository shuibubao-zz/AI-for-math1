#!/usr/bin/env bash
# Build paper.pdf from paper.tex
# Usage:  ./build.sh [engine]      engine = pdflatex (default) | xelatex | lualatex
set -euo pipefail

ENGINE="${1:-pdflatex}"
NAME="paper"

command -v "$ENGINE" >/dev/null 2>&1 || {
  echo "error: '$ENGINE' not found. Install TeX Live or MiKTeX first." >&2
  exit 1
}

echo "==> pass 1/4: $ENGINE"
"$ENGINE" -interaction=nonstopmode "$NAME" || true

echo "==> pass 2/4: bibtex"
bibtex "$NAME" || true

echo "==> pass 3/4: $ENGINE"
"$ENGINE" -interaction=nonstopmode "$NAME" || true

echo "==> pass 4/4: $ENGINE"
"$ENGINE" -interaction=nonstopmode "$NAME"

if [ -f "$NAME.pdf" ]; then
  echo "==> done: $NAME.pdf"
else
  echo "error: $NAME.pdf was not produced; see $NAME.log" >&2
  exit 1
fi
