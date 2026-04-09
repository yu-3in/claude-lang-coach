<p align="center">
  <strong>claude-lang-coach</strong><br>
  日常業務を語学学習に変える <a href="https://docs.anthropic.com/en/docs/claude-code">Claude Code</a> プラグイン。
</p>

<p align="center">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/version-1.2.0-green.svg" alt="Version"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/claude--code-plugin-blueviolet.svg" alt="Claude Code Plugin"></a>
</p>

<p align="center">
  <a href="./README.md">English</a> |
  <a href="./README.ko.md">한국어</a> |
  <a href="./README.zh.md">中文</a> |
  <a href="./README.fr.md">Fran&ccedil;ais</a> |
  <a href="./README.de.md">Deutsch</a> |
  <a href="./README.es.md">Espa&ntilde;ol</a>
</p>

---

学習言語で入力すると自動添削。母国語で入力すると学習言語での表現を提案。別アプリもコンテキストスイッチも不要。

## 対応言語

ISO 639-1 の任意のペアに対応。

| コード | 言語 | コード | 言語 |
|--------|------|--------|------|
| `en` | 英語 | `ko` | 韓国語 |
| `ja` | 日本語 | `zh` | 中国語 |
| `fr` | フランス語 | `pt` | ポルトガル語 |
| `de` | ドイツ語 | `es` | スペイン語 |

## インストール

```bash
claude plugin marketplace add yu-3in/claude-lang-coach
claude plugin install lang-coach@claude-lang-coach
```

自動検知を有効化（初回のみ）:

```bash
~/.claude/plugins/cache/claude-lang-coach/lang-coach/*/scripts/install-hook.sh
```

Claude Code を再起動。

> **Windows**: WSL または Git Bash 環境が必要です。

## 設定

```
/lang-coach:setup ja en
```

## コマンド

| コマンド | 説明 |
|---------|------|
| `/lang-coach:setup <native> <target>` | 言語ペアを設定し自動検知を有効化 |
| `/lang-coach:setup autodetect on\|off` | 自動検知の切替 |
| `/lang-coach:learn <text>` | 詳細な添削 (学習言語) または翻訳指導 (母国語) |
| `/lang-coach:learn last` | 直近の自動検知添削を詳細に再分析 |
| `/lang-coach:history [N\|all]` | 添削履歴・統計・弱点分析 |

### 使用例

```
/lang-coach:learn I goed to the store yesterday     # → スコア付き添削
/lang-coach:learn 昨日お店に行きました                # → 翻訳指導
/lang-coach:history                                   # → 直近 10 件
/lang-coach:history all                               # → 全件
```

### 自動検知

ON にすると、普段通り作業するだけで応答末尾に添削が追加されます。

## アンインストール

```bash
claude plugin uninstall lang-coach@claude-lang-coach
rm -rf ~/.claude-lang-coach
```

`~/.claude/settings.json` の `UserPromptSubmit` Hook も削除してください。

## ライセンス

MIT
