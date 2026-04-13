<p align="center">
  <strong>claude-lang-coach</strong><br>
  Ein <a href="https://docs.anthropic.com/en/docs/claude-code">Claude Code</a>-Plugin, das Ihre taegliche Arbeit in Sprachpraxis verwandelt.
</p>

<p align="center">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/version-1.2.0-green.svg" alt="Version"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/claude--code-plugin-blueviolet.svg" alt="Claude Code Plugin"></a>
</p>

<p align="center">
  <a href="./README.md">English</a> |
  <a href="./README.ja.md">日本語</a> |
  <a href="./README.ko.md">한국어</a> |
  <a href="./README.zh.md">中文</a> |
  <a href="./README.fr.md">Fran&ccedil;ais</a> |
  <a href="./README.es.md">Espa&ntilde;ol</a>
</p>

---

Schreiben Sie in Ihrer Zielsprache waehrend der normalen Arbeit und erhalten Sie automatisch Korrekturen. Schreiben Sie in Ihrer Muttersprache und lernen Sie, wie man es ausdrueckt. Keine zusaetzlichen Apps, kein Kontextwechsel.

## Unterstuetzte Sprachen

Jedes ISO 639-1-Paar wird unterstuetzt. Beispiele:

| Code | Sprache | Code | Sprache |
|------|---------|------|---------|
| `en` | Englisch | `ko` | Koreanisch |
| `ja` | Japanisch | `zh` | Chinesisch |
| `fr` | Franzoesisch | `pt` | Portugiesisch |
| `de` | Deutsch | `es` | Spanisch |

## Installation

```bash
claude plugin marketplace add yu-3in/claude-lang-coach
claude plugin install lang-coach@claude-lang-coach
```

Automatische Erkennung aktivieren (einmalig):

```bash
~/.claude/plugins/cache/claude-lang-coach/lang-coach/*/scripts/install-hook.sh
```

Starten Sie Claude Code neu.

> **Windows**: Erfordert WSL oder Git Bash.

## Einrichtung

```
/lang-coach:setup de en
```

## Befehle

| Befehl | Beschreibung |
|--------|--------------|
| `/lang-coach:setup <Muttersprache> <Zielsprache>` | Sprachpaar festlegen und automatische Erkennung aktivieren |
| `/lang-coach:setup autodetect on\|off` | Automatische Erkennung ein- oder ausschalten |
| `/lang-coach:learn <Text>` | Detaillierte Korrektur mit Bewertung (Zielsprache) oder Uebersetzungscoaching (Muttersprache) |
| `/lang-coach:learn last` | Letzte automatische Korrektur detailliert erneut analysieren |
| `/lang-coach:history [N\|all]` | Korrekturverlauf, Statistiken und Schwachstellen anzeigen |

### Beispiele

```
/lang-coach:learn I goed to the store yesterday   # → Korrektur mit Bewertung
/lang-coach:learn Gestern ging ich zum Geschaeft   # → Uebersetzungscoaching
/lang-coach:history                                  # → letzte 10 Korrekturen
/lang-coach:history all                              # → gesamter Verlauf
```

### Automatische Erkennung

Bei aktivierter automatischer Erkennung erscheinen Korrekturen am Ende jeder Antwort — ganz ohne Befehle.

## Aktualisierung

```bash
claude plugin marketplace update claude-lang-coach
claude plugin update lang-coach@claude-lang-coach
```

Starten Sie Claude Code nach dem Update neu.

## Deinstallation

```bash
claude plugin uninstall lang-coach@claude-lang-coach
rm -rf ~/.claude-lang-coach
```

Falls Sie die automatische Erkennung aktiviert haben, entfernen Sie den `UserPromptSubmit`-Hook aus `~/.claude/settings.json`.

## Lizenz

MIT
