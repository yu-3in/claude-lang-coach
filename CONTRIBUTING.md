# Contributing

## Development

```bash
git clone https://github.com/yu-3in/claude-lang-coach.git
cd claude-lang-coach
claude --plugin-dir .
```

Edit files, restart Claude Code to test.

## Structure

| Path | Purpose |
|------|---------|
| `skills/learn/SKILL.md` | Correction and translation |
| `skills/setup/SKILL.md` | Language pair configuration |
| `skills/history/SKILL.md` | History and stats |
| `scripts/autodetect.sh` | UserPromptSubmit hook (auto-detect) |
| `scripts/setup.sh` | SessionStart hook (init + hook registration) |
| `scripts/save-correction.sh` | Save correction JSON |
| `scripts/install-hook.sh` | Manual hook registration (fallback) |
| `hooks/hooks.json` | Plugin hook declarations |
| `settings.json` | Plugin permission defaults |
| `.claude-plugin/plugin.json` | Plugin manifest |
| `.claude-plugin/marketplace.json` | Marketplace metadata |

## Guidelines

- **Scripts**: Pure bash. Python3 OK. No jq/node.
- **Skills**: Keep concise. Claude ignores long instructions.
- **Hook output**: Brief. 5-10 lines max.
- **Commits**: [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:`, `chore:`)
- **READMEs**: Sync all 7 languages when changing README.md.
- **Versions**: Never edit README badges manually. Use the release workflow.

## Known Limitations

- Plugin `UserPromptSubmit` hooks don't inject context ([#20659](https://github.com/anthropics/claude-code/issues/20659)). Workaround: `setup.sh` auto-registers globally.
- `$CLAUDE_PLUGIN_DATA` unavailable in Claude's Bash tool. Use fixed path `~/.claude-lang-coach/`.

## Releasing

See [docs/releasing.md](./docs/releasing.md).
