#!/bin/bash
set -euo pipefail

SETTINGS="$HOME/.claude/settings.json"
HOOK_CMD="$HOME/.claude-lang-coach/autodetect.sh"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

[ -f "$SETTINGS" ] || { echo "Error: $SETTINGS not found" >&2; exit 1; }

mkdir -p "$HOME/.claude-lang-coach"
for f in autodetect.sh save-correction.sh; do
  [ -f "$SCRIPT_DIR/$f" ] && cp "$SCRIPT_DIR/$f" "$HOME/.claude-lang-coach/$f" && chmod +x "$HOME/.claude-lang-coach/$f"
done 2>/dev/null

python3 << PYEOF
import json, sys

settings_path = "$SETTINGS"
hook_cmd = "$HOOK_CMD"

with open(settings_path) as f:
    settings = json.load(f)

hooks = settings.setdefault("hooks", {})
ups = hooks.setdefault("UserPromptSubmit", [])

for entry in ups:
    for h in entry.get("hooks", []):
        if "autodetect.sh" in h.get("command", ""):
            print("✓ Hook already installed")
            sys.exit(0)

ups.append({
    "matcher": "*",
    "hooks": [{"type": "command", "command": hook_cmd, "timeout": 5}]
})

with open(settings_path, "w") as f:
    json.dump(settings, f, indent=2, ensure_ascii=False)

print("✓ Hook installed. Restart Claude Code to activate.")
PYEOF
