---
name: lang-setup
description: Configure language pair and auto-detect for Language Coach.
allowed-tools: Read Write Bash
user-invocable: true
argument-hint: "[<native> <target>] | [autodetect on|off]"
---

# Language Coach — Setup

Config: `~/.claude-lang-coach/config.json`

## No arguments → interactive

1. Read config, show current settings
2. Ask: native language, target language, enable auto-detect?
3. Write config
4. Check if hook is installed (see below)

## `<native> <target>` → set language pair

Update config, set `auto_detect: true`. Display confirmation.

## `autodetect on|off` → toggle

Update `auto_detect` field. Display new state.

## Hook check

After enabling auto-detect, read `~/.claude/settings.json` and check if `hooks.UserPromptSubmit` contains `autodetect.sh`.

If missing, tell the user to run:
```bash
~/.claude/plugins/cache/claude-lang-coach/lang-coach/*/scripts/install-hook.sh
```

If present: `Hook: installed ✓`
