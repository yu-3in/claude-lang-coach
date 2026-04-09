#!/bin/bash
# Language Coach — Auto-detect Hook (UserPromptSubmit)
# Injects a brief correction instruction into Claude's context.

CONFIG="$HOME/.claude-lang-coach/config.json"

[ ! -f "$CONFIG" ] && exit 0
grep -q '"auto_detect" *: *true' "$CONFIG" || exit 0

target=$(grep -o '"target_language" *: *"[^"]*"' "$CONFIG" | grep -o '"[^"]*"$' | tr -d '"')
native=$(grep -o '"native_language" *: *"[^"]*"' "$CONFIG" | grep -o '"[^"]*"$' | tr -d '"')

cat > /dev/null

echo "MANDATORY: After your main response, append a Lang Coach section.
- ${target} text → correct errors, explain in ${native}
- ${native} text → show how to express in ${target}
Format: ✎ **Lang Coach** | ▲ \`original\` → \`corrected\` — explanation
No issues? ✎ **Lang Coach** ✓ | Never skip."

exit 0
