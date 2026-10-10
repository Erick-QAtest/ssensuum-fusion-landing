#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-$HOME/Downloads/ssensuum-qa-framework}"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
if [[ ! -f "$TARGET/playwright.config.ts" ]]; then
  echo "No parece un framework QA SSENSUUM válido: $TARGET"
  exit 1
fi
mkdir -p "$TARGET/tests/e2e/public"
cp "$SOURCE_DIR/qa/tests/e2e/public/landing-fusion.spec.ts" "$TARGET/tests/e2e/public/landing-fusion.spec.ts"
echo "Test de landing instalado en $TARGET/tests/e2e/public/landing-fusion.spec.ts"
echo "Ejecuta: cd \"$TARGET\" && npx playwright test tests/e2e/public/landing-fusion.spec.ts --project=desktop-chromium"
