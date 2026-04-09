<p align="center">
  <strong>claude-lang-coach</strong><br>
  Un plugin de <a href="https://docs.anthropic.com/en/docs/claude-code">Claude Code</a> que convierte tu trabajo diario en practica de idiomas.
</p>

<p align="center">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/version-1.0.0-green.svg" alt="Version"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/claude--code-plugin-blueviolet.svg" alt="Claude Code Plugin"></a>
</p>

<p align="center">
  <a href="./README.md">English</a> |
  <a href="./README.ja.md">日本語</a> |
  <a href="./README.ko.md">한국어</a> |
  <a href="./README.zh.md">中文</a> |
  <a href="./README.fr.md">Fran&ccedil;ais</a> |
  <a href="./README.de.md">Deutsch</a>
</p>

---

Escribe en tu idioma objetivo durante el trabajo habitual y recibe correcciones automaticamente. Escribe en tu idioma nativo y aprende como expresarlo. Sin aplicaciones adicionales, sin cambiar de contexto.

## Idiomas compatibles

Cualquier par ISO 639-1 es compatible. Ejemplos:

| Codigo | Idioma | Codigo | Idioma |
|--------|--------|--------|--------|
| `en` | Ingles | `ko` | Coreano |
| `ja` | Japones | `zh` | Chino |
| `fr` | Frances | `pt` | Portugues |
| `de` | Aleman | `es` | Espanol |

## Instalacion

```bash
claude plugin marketplace add yu-3in/claude-lang-coach
claude plugin install lang-coach@claude-lang-coach
```

Activar la deteccion automatica (solo una vez, requiere [jq](https://jqlang.github.io/jq/)):

```bash
~/.claude/plugins/cache/claude-lang-coach/lang-coach/*/scripts/install-hook.sh
```

Reinicia Claude Code.

## Configuracion

```
/lang-coach:setup es en
```

## Uso

### Modo manual

```
/lang-coach:learn I goed to the store yesterday
/lang-coach:learn Ayer fui a la tienda
```

### Deteccion automatica

Trabaja con normalidad. Las correcciones aparecen al final de cada respuesta.

### Repaso

```
/lang-coach:history
```

## Desinstalacion

```bash
claude plugin uninstall lang-coach@claude-lang-coach
rm -rf ~/.claude-lang-coach
```

Si activaste la deteccion automatica, elimina el hook `UserPromptSubmit` de `~/.claude/settings.json`.

## Licencia

MIT
