#!/bin/bash
# Language Coach — Auto-detect Hook (UserPromptSubmit)

CONFIG="$HOME/.claude-lang-coach/config.json"

[ ! -f "$CONFIG" ] && exit 0
grep -q '"auto_detect" *: *true' "$CONFIG" || exit 0

target=$(grep -o '"target_language" *: *"[^"]*"' "$CONFIG" | grep -o '"[^"]*"$' | tr -d '"')
native=$(grep -o '"native_language" *: *"[^"]*"' "$CONFIG" | grep -o '"[^"]*"$' | tr -d '"')

cat > /dev/null

echo "MANDATORY: After your main response, you MUST append a Lang Coach section.
Rules:
- If user wrote ${target}: correct errors → ✎ **Lang Coach** | ▲ \`error\` → \`fix\` — reason (${native}). No errors? → ✎ **Lang Coach** ✓
- If user wrote ${native}: translate to ${target} → ✎ **Lang Coach** | \`${native} phrase\` → \`${target} translation\`
- Mixed: do both.
- Only code/URLs/slash commands: skip entirely (no output).
Never skip for natural language input. Never output just ✓ for ${native} text."

exit 0
