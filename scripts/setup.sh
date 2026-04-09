#!/bin/bash
# Language Coach — Session setup (SessionStart hook)
# Creates data directory, initial config, and syncs scripts.

DATA_DIR="$HOME/.claude-lang-coach"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$DATA_DIR/corrections"

[ ! -f "$DATA_DIR/config.json" ] && cat > "$DATA_DIR/config.json" << 'EOF'
{
  "native_language": "en",
  "target_language": "en",
  "auto_detect": false
}
EOF

# Sync scripts to stable path (version-independent)
for f in autodetect.sh save-correction.sh; do
  [ -f "$SCRIPT_DIR/$f" ] && cp "$SCRIPT_DIR/$f" "$DATA_DIR/$f" && chmod +x "$DATA_DIR/$f"
done 2>/dev/null

exit 0
