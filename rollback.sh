#!/usr/bin/env bash
set -euo pipefail
TARGET="${1:-$HOME/Downloads/ssensuum-product}"
BACKUP="$TARGET/.fusion-backup"
if [[ ! -f "$BACKUP/web/components/Catalog.tsx" ]]; then
  echo "No encontré backup en $BACKUP"
  exit 1
fi
cp "$BACKUP/web/components/Catalog.tsx" "$TARGET/web/components/Catalog.tsx"
cp "$BACKUP/web/app/globals.css" "$TARGET/web/app/globals.css"
cp "$BACKUP/web/app/layout.tsx" "$TARGET/web/app/layout.tsx"
cp "$BACKUP/api/app/seed.py" "$TARGET/api/app/seed.py"
echo "Rollback aplicado. Los assets nuevos pueden permanecer; no afectan la versión anterior."
