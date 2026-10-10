#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-$HOME/Downloads/ssensuum-product}"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ ! -f "$TARGET/web/components/Catalog.tsx" || ! -f "$TARGET/api/app/main.py" ]]; then
  echo "No parece un proyecto SSENSUUM válido: $TARGET"
  echo "Uso: ./install.sh /ruta/a/ssensuum-product"
  exit 1
fi

BACKUP="$TARGET/.fusion-backup"
mkdir -p "$BACKUP/web/components" "$BACKUP/web/app" "$BACKUP/api/app"
cp "$TARGET/web/components/Catalog.tsx" "$BACKUP/web/components/Catalog.tsx"
cp "$TARGET/web/app/globals.css" "$BACKUP/web/app/globals.css"
cp "$TARGET/web/app/layout.tsx" "$BACKUP/web/app/layout.tsx"
cp "$TARGET/api/app/seed.py" "$BACKUP/api/app/seed.py"

cp "$SOURCE_DIR/web/components/Catalog.tsx" "$TARGET/web/components/Catalog.tsx"
cp "$SOURCE_DIR/web/app/globals.css" "$TARGET/web/app/globals.css"
cp "$SOURCE_DIR/web/app/layout.tsx" "$TARGET/web/app/layout.tsx"
mkdir -p "$TARGET/web/public/ssensuum"
cp "$SOURCE_DIR/web/public/ssensuum/"* "$TARGET/web/public/ssensuum/"
cp "$SOURCE_DIR/api/app/seed.py" "$TARGET/api/app/seed.py"

echo "Fusion landing instalada en: $TARGET"
echo "Backup anterior: $BACKUP"
echo
if [[ -f "$TARGET/api/ssensuum.db" ]]; then
  echo "IMPORTANTE: tu DB local ya existe. Para cargar el catálogo completo ejecuta:"
  echo "  cd \"$TARGET\" && ./scripts/reset_dev_db.sh"
fi
echo "Luego levanta el proyecto con:"
echo "  cd \"$TARGET\" && ./scripts/dev.sh"
echo "Y valida QA con:"
echo "  cd ~/Downloads/ssensuum-qa-framework && npm run test:smoke"
