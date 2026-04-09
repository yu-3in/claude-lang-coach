#!/bin/bash
# Language Coach — Save correction JSON from stdin.

DATA_DIR="$HOME/.claude-lang-coach"
mkdir -p "$DATA_DIR/corrections"
FILENAME="$(date '+%Y-%m-%d_%H%M%S').json"
cat > "$DATA_DIR/corrections/$FILENAME"
echo "$DATA_DIR/corrections/$FILENAME"
