<p align="center">
  <strong>claude-lang-coach</strong><br>
  让日常工作变成语言练习的 <a href="https://docs.anthropic.com/en/docs/claude-code">Claude Code</a> 插件。
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
  <a href="./README.fr.md">Fran&ccedil;ais</a> |
  <a href="./README.de.md">Deutsch</a> |
  <a href="./README.es.md">Espa&ntilde;ol</a>
</p>

---

用目标语言输入，自动获得纠正；用母语输入，学习如何用目标语言表达。无需额外应用，无需切换上下文。

## 支持的语言

支持任意 ISO 639-1 语言对。示例：

| 代码 | 语言 | 代码 | 语言 |
|------|------|------|------|
| `en` | 英语 | `ko` | 韩语 |
| `ja` | 日语 | `zh` | 中文 |
| `fr` | 法语 | `pt` | 葡萄牙语 |
| `de` | 德语 | `es` | 西班牙语 |

## 安装

```bash
claude plugin marketplace add yu-3in/claude-lang-coach
claude plugin install lang-coach@claude-lang-coach
```

启用自动检测（仅需一次）：

```bash
~/.claude/plugins/cache/claude-lang-coach/lang-coach/*/scripts/install-hook.sh
```

重启 Claude Code。

> **Windows**：需要 WSL 或 Git Bash。

## 配置

```
/lang-coach:setup zh en
```

## 命令

| 命令 | 说明 |
|------|------|
| `/lang-coach:setup <母语> <目标语言>` | 设置语言对并启用自动检测 |
| `/lang-coach:setup autodetect on\|off` | 开启或关闭自动检测模式 |
| `/lang-coach:learn <文本>` | 目标语言输入时给出评分和详细纠正，母语输入时进行翻译辅导 |
| `/lang-coach:history [N\|all]` | 查看纠正记录、统计数据和薄弱项 |

### 示例

```
/lang-coach:learn I goed to the store yesterday   # → 带评分的纠正
/lang-coach:learn 昨天我去了商店                    # → 翻译辅导
/lang-coach:history                                  # → 最近 10 条纠正记录
/lang-coach:history all                              # → 全部记录
```

### 自动检测

开启自动检测后，每次响应末尾会自动附上纠正内容，无需手动输入命令。

## 卸载

```bash
claude plugin uninstall lang-coach@claude-lang-coach
rm -rf ~/.claude-lang-coach
```

如果启用了自动检测，请从 `~/.claude/settings.json` 中移除 `UserPromptSubmit` hook。

## 许可证

MIT
