<p align="center">
  <strong>claude-lang-coach</strong><br>
  일상 업무를 언어 학습으로 바꿔주는 <a href="https://docs.anthropic.com/en/docs/claude-code">Claude Code</a> 플러그인.
</p>

<p align="center">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/version-1.0.0-green.svg" alt="Version"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/claude--code-plugin-blueviolet.svg" alt="Claude Code Plugin"></a>
</p>

<p align="center">
  <a href="./README.md">English</a> |
  <a href="./README.ja.md">日本語</a> |
  <a href="./README.zh.md">中文</a> |
  <a href="./README.fr.md">Fran&ccedil;ais</a> |
  <a href="./README.de.md">Deutsch</a> |
  <a href="./README.es.md">Espa&ntilde;ol</a>
</p>

---

학습 중인 언어로 입력하면 자동으로 교정해 줍니다. 모국어로 입력하면 학습 언어로 어떻게 표현하는지 알려 줍니다. 별도의 앱도, 컨텍스트 전환도 필요 없습니다.

## 지원 언어

ISO 639-1 조합이라면 무엇이든 가능합니다. 예시:

| 코드 | 언어 | 코드 | 언어 |
|------|------|------|------|
| `en` | 영어 | `ko` | 한국어 |
| `ja` | 일본어 | `zh` | 중국어 |
| `fr` | 프랑스어 | `pt` | 포르투갈어 |
| `de` | 독일어 | `es` | 스페인어 |

## 설치

```bash
claude plugin marketplace add yu-3in/claude-lang-coach
claude plugin install lang-coach@claude-lang-coach
```

자동 감지 활성화 (최초 1회, [jq](https://jqlang.github.io/jq/) 필요):

```bash
~/.claude/plugins/cache/claude-lang-coach/lang-coach/*/scripts/install-hook.sh
```

Claude Code를 재시작하세요.

## 설정

```
/lang-coach:setup ko en
```

## 사용법

### 수동 모드

```
/lang-coach:learn I goed to the store yesterday
/lang-coach:learn 어제 가계에 갔습니다
```

### 자동 감지

평소처럼 작업하기만 하면 됩니다. 매 응답 끝에 교정 내용이 표시됩니다.

### 복습

```
/lang-coach:history
```

## 삭제

```bash
claude plugin uninstall lang-coach@claude-lang-coach
rm -rf ~/.claude-lang-coach
```

자동 감지를 활성화했다면 `~/.claude/settings.json`에서 `UserPromptSubmit` hook을 제거하세요.

## 라이선스

MIT
