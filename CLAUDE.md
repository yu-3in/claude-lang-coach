# claude-lang-coach

Claude Code plugin for language learning during daily work.

## Project overview

- Plugin: `lang-coach@claude-lang-coach`
- Skills: `learn`, `setup`, `history` (invoked as `/lang-coach:learn` etc.)
- Auto-detect: UserPromptSubmit hook injects correction instructions
- Data: `~/.claude-lang-coach/` (config, corrections, synced scripts)

## Development guidelines

See [CONTRIBUTING.md](./CONTRIBUTING.md) for full details.

### Key rules

- Pure bash for scripts. Python3 OK. No jq/node dependencies.
- SKILL.md must be concise — Claude ignores long instructions.
- Hook output: 5-10 lines max.
- Conventional Commits: `feat:`, `fix:`, `docs:`, `chore:`
- Test with `claude --plugin-dir .` before pushing.

### Releasing

See [docs/releasing.md](./docs/releasing.md).

1. Update version in `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json`
2. Commit: `git commit -m "chore: bump version to X.Y.Z"`
3. Tag: `git tag vX.Y.Z && git push origin vX.Y.Z`
4. Release workflow auto-updates README badges and creates GitHub Release
5. **Never edit README badges manually.**

### Known limitations

- Plugin-level `UserPromptSubmit` hooks don't inject context ([#20659](https://github.com/anthropics/claude-code/issues/20659)). `setup.sh` auto-registers the hook globally as workaround.
- `$CLAUDE_PLUGIN_DATA` is not available in Claude's Bash tool. Use `~/.claude-lang-coach/`.
- Auto-detect corrections are display-only; not saved to history ([#1](https://github.com/yu-3in/claude-lang-coach/issues/1)).

### READMEs

7 languages: en, ja, ko, zh, fr, de, es. Keep all in sync. The release workflow updates version badges automatically.
