<p align="center">
  <strong>claude-lang-coach</strong><br>
  A <a href="https://docs.anthropic.com/en/docs/claude-code">Claude Code</a> plugin that turns your daily work into language practice.
</p>

<p align="center">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/version-1.1.0-green.svg" alt="Version"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/claude--code-plugin-blueviolet.svg" alt="Claude Code Plugin"></a>
</p>

<p align="center">
  <a href="./README.ja.md">日本語</a> |
  <a href="./README.ko.md">한국어</a> |
  <a href="./README.zh.md">中文</a> |
  <a href="./README.fr.md">Fran&ccedil;ais</a> |
  <a href="./README.de.md">Deutsch</a> |
  <a href="./README.es.md">Espa&ntilde;ol</a>
</p>

---

Write in your target language during normal work — get corrections automatically. Write in your native language — learn how to express it. No extra apps, no context switching.

## Supported Languages

Any ISO 639-1 pair. Examples:

| Code | Language | Code | Language |
|------|----------|------|----------|
| `en` | English | `ko` | Korean |
| `ja` | Japanese | `zh` | Chinese |
| `fr` | French | `pt` | Portuguese |
| `de` | German | `es` | Spanish |

## Install

```bash
claude plugin marketplace add yu-3in/claude-lang-coach
claude plugin install lang-coach@claude-lang-coach
```

Enable auto-detect (one-time):

```bash
~/.claude/plugins/cache/claude-lang-coach/lang-coach/*/scripts/install-hook.sh
```

Restart Claude Code.

> **Windows**: Requires WSL or Git Bash.

## Setup

```
/lang-coach:setup ja en
```

## Commands

| Command | Description |
|---------|-------------|
| `/lang-coach:setup <native> <target>` | Set your language pair and enable auto-detect |
| `/lang-coach:setup autodetect on\|off` | Toggle auto-detect mode |
| `/lang-coach:learn <text>` | Detailed correction with scoring (target lang) or translation coaching (native lang) |
| `/lang-coach:learn last` | Re-analyze the most recent auto-detect correction in full detail |
| `/lang-coach:history [N\|all]` | View correction history, stats, and weak points |

### Examples

```
/lang-coach:learn I goed to the store yesterday   # → correction with score
/lang-coach:learn 昨日お店に行きました              # → translation coaching
/lang-coach:history                                  # → last 10 corrections
/lang-coach:history all                              # → full history
```

### Auto-detect

With auto-detect ON, corrections appear at the end of every response automatically — no commands needed.

## Uninstall

```bash
claude plugin uninstall lang-coach@claude-lang-coach
rm -rf ~/.claude-lang-coach
```

Remove the `UserPromptSubmit` hook from `~/.claude/settings.json` if added.

## License

MIT
