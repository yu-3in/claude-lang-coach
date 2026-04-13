<p align="center">
  <strong>claude-lang-coach</strong><br>
  Un plugin <a href="https://docs.anthropic.com/en/docs/claude-code">Claude Code</a> qui transforme votre travail quotidien en pratique linguistique.
</p>

<p align="center">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/version-1.3.0-green.svg" alt="Version"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/claude--code-plugin-blueviolet.svg" alt="Claude Code Plugin"></a>
</p>

<p align="center">
  <a href="./README.md">English</a> |
  <a href="./README.ja.md">日本語</a> |
  <a href="./README.ko.md">한국어</a> |
  <a href="./README.zh.md">中文</a> |
  <a href="./README.de.md">Deutsch</a> |
  <a href="./README.es.md">Espa&ntilde;ol</a>
</p>

---

Ecrivez dans votre langue cible pendant votre travail habituel et recevez des corrections automatiquement. Ecrivez dans votre langue maternelle et apprenez comment l'exprimer. Pas d'application supplementaire, pas de changement de contexte.

## Langues prises en charge

Toute paire ISO 639-1 est compatible. Exemples :

| Code | Langue | Code | Langue |
|------|--------|------|--------|
| `en` | Anglais | `ko` | Coreen |
| `ja` | Japonais | `zh` | Chinois |
| `fr` | Francais | `pt` | Portugais |
| `de` | Allemand | `es` | Espagnol |

## Installation

```bash
claude plugin marketplace add yu-3in/claude-lang-coach
claude plugin install lang-coach@claude-lang-coach
```

Activer la detection automatique (une seule fois) :

```bash
~/.claude/plugins/cache/claude-lang-coach/lang-coach/*/scripts/install-hook.sh
```

Redemarrez Claude Code.

> **Windows** : necessite WSL ou Git Bash.

## Configuration

```
/lang-coach:setup fr en
```

## Commandes

| Commande | Description |
|----------|-------------|
| `/lang-coach:setup <maternelle> <cible>` | Definir la paire de langues et activer la detection automatique |
| `/lang-coach:setup autodetect on\|off` | Activer ou desactiver la detection automatique |
| `/lang-coach:learn <texte>` | Correction detaillee avec score (langue cible) ou coaching de traduction (langue maternelle) |
| `/lang-coach:learn last` | Réanalyser en détail la dernière correction automatique |
| `/lang-coach:history [N\|all]` | Consulter l'historique des corrections, les statistiques et les points faibles |

### Exemples

```
/lang-coach:learn I goed to the store yesterday   # → correction avec score
/lang-coach:learn Je suis alle au magasin hier     # → coaching de traduction
/lang-coach:history                                  # → 10 dernieres corrections
/lang-coach:history all                              # → historique complet
```

### Detection automatique

Lorsque la detection automatique est activee, les corrections apparaissent automatiquement a la fin de chaque reponse, sans commande necessaire.

## Mise à jour

```bash
claude plugin marketplace update claude-lang-coach
claude plugin update lang-coach@claude-lang-coach
```

Redémarrez Claude Code après la mise à jour.

## Desinstallation

```bash
claude plugin uninstall lang-coach@claude-lang-coach
rm -rf ~/.claude-lang-coach
```

Si vous avez active la detection automatique, supprimez le hook `UserPromptSubmit` de `~/.claude/settings.json`.

## Licence

MIT
