#!/bin/bash
# Language Coach — Auto-detect Hook (UserPromptSubmit)

CONFIG="$HOME/.claude-lang-coach/config.json"

[ ! -f "$CONFIG" ] && exit 0
grep -q '"auto_detect" *: *true' "$CONFIG" || exit 0

target=$(grep -o '"target_language" *: *"[^"]*"' "$CONFIG" | grep -o '"[^"]*"$' | tr -d '"')
native=$(grep -o '"native_language" *: *"[^"]*"' "$CONFIG" | grep -o '"[^"]*"$' | tr -d '"')

cat > /dev/null

echo "MANDATORY: After your main response, append a Lang Coach section. Correct like a friendly native speaker — prioritize natural, idiomatic expression over textbook grammar.
- ${target} text: correct errors + suggest more natural phrasing → ✎ **Lang Coach** | ▲ \`error\` → \`fix\` — reason (${native}). Perfect? → ✎ **Lang Coach** ✓
- ${native} text: translate naturally to ${target} → ✎ **Lang Coach** | \`${native}\` → \`${target}\`
- Save correction via: echo '{\"input\":\"...\",\"result\":{...}}' | ~/.claude-lang-coach/save-correction.sh
- Code/URLs/commands only: skip.
Never ✓ for ${native}. Never skip natural language."

exit 0
