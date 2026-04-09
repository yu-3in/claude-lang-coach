# Contributing to claude-lang-coach

Thank you for your interest in contributing!

## Development Setup

1. Clone the repository:

```bash
git clone https://github.com/yu-3in/claude-lang-coach.git
cd claude-lang-coach
```

2. Load the plugin locally for testing:

```bash
claude --plugin-dir .
```

3. Edit skill files under `skills/` or hook scripts under `scripts/`, then restart Claude Code.

## Project Structure

```
.claude-plugin/       Plugin manifest and marketplace metadata
skills/
  learn/SKILL.md      Correction and translation skill
  setup/SKILL.md      Language pair configuration
  history/SKILL.md    Correction history and stats
hooks/
  hooks.json          SessionStart hook (script sync)
scripts/
  autodetect.sh       UserPromptSubmit hook (registered globally)
  save-correction.sh  Saves correction JSON to data directory
  setup.sh            Creates data dir and syncs scripts
  install-hook.sh     Registers global hook in settings.json
settings.json         Plugin permission defaults
```

## Data Directory

User data lives at `~/.claude-lang-coach/`:

```
~/.claude-lang-coach/
├── config.json              Language settings
├── autodetect.sh            Synced from plugin cache on session start
├── save-correction.sh       Synced from plugin cache on session start
└── corrections/
    └── YYYY-MM-DD_HHMMSS.json
```

## Guidelines

- **Scripts**: Pure bash, no external dependencies (no jq, no node). Python3 is acceptable (macOS/Linux standard).
- **Skills**: Keep SKILL.md concise. Claude follows shorter instructions more reliably.
- **Hook output**: Must be brief. Long hook output gets ignored by Claude.
- **Commits**: Use [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:`, `chore:`).
- **Testing**: Test with `claude --plugin-dir .` before pushing.
- **READMEs**: Changes to README.md must be reflected in all 7 language versions.

## Known Limitations

- **Plugin-level UserPromptSubmit hooks** cannot inject context into Claude's conversation ([#20659](https://github.com/anthropics/claude-code/issues/20659)). Workaround: register the hook globally via `install-hook.sh`.
- **Hook path is version-dependent** in the plugin cache. The `setup.sh` SessionStart hook syncs scripts to `~/.claude-lang-coach/` to provide a stable path.

## Releasing

See [docs/releasing.md](./docs/releasing.md) for the release process.
