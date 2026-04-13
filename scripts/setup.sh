#!/bin/bash
# Language Coach — Session setup (SessionStart hook)
# Creates data directory, syncs scripts, and auto-registers global hook.

DATA_DIR="$HOME/.claude-lang-coach"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SETTINGS="$HOME/.claude/settings.json"
HOOK_CMD="$DATA_DIR/autodetect.sh"

# Data directory
mkdir -p "$DATA_DIR/corrections"

# Initial config
[ ! -f "$DATA_DIR/config.json" ] && cat > "$DATA_DIR/config.json" << 'EOF'
{
  "native_language": "en",
  "target_language": "en",
  "auto_detect": false
}
EOF

# Sync scripts to stable path
for f in autodetect.sh save-correction.sh; do
  [ -f "$SCRIPT_DIR/$f" ] && cp "$SCRIPT_DIR/$f" "$DATA_DIR/$f" && chmod +x "$DATA_DIR/$f"
done 2>/dev/null

# Auto-register global hook if not present
if [ -f "$SETTINGS" ] && command -v python3 &>/dev/null; then
  python3 - "$SETTINGS" "$HOOK_CMD" << 'PYEOF'
import json, sys
settings_path, hook_cmd = sys.argv[1], sys.argv[2]
with open(settings_path) as f:
    s = json.load(f)
hooks = s.setdefault("hooks", {})
ups = hooks.setdefault("UserPromptSubmit", [])
for entry in ups:
    for h in entry.get("hooks", []):
        if "autodetect.sh" in h.get("command", ""):
            sys.exit(0)
ups.append({"matcher":"*","hooks":[{"type":"command","command":hook_cmd,"timeout":5}]})
with open(settings_path, "w") as f:
    json.dump(s, f, indent=2, ensure_ascii=False)
PYEOF
fi

exit 0
