<p align="center">
  <strong>claude-lang-coach</strong><br>
  일상 업무를 언어 학습으로 바꿔주는 <a href="https://docs.anthropic.com/en/docs/claude-code">Claude Code</a> 플러그인.
</p>

<p align="center">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/yu-3in/claude-lang-coach"><img src="https://img.shields.io/badge/version-1.3.0-green.svg" alt="Version"></a>
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

자동 감지 활성화 (최초 1회):

```bash
~/.claude/plugins/cache/claude-lang-coach/lang-coach/*/scripts/install-hook.sh
```

Claude Code를 재시작하세요.

> **Windows**: WSL 또는 Git Bash가 필요합니다.

## 설정

```
/lang-coach:setup ko en
```

## 명령어

| 명령어 | 설명 |
|--------|------|
| `/lang-coach:setup <모국어> <학습 언어>` | 언어 쌍을 설정하고 자동 감지를 활성화합니다 |
| `/lang-coach:setup autodetect on\|off` | 자동 감지 모드를 켜거나 끕니다 |
| `/lang-coach:learn <텍스트>` | 학습 언어로 입력하면 점수와 함께 상세 교정, 모국어로 입력하면 번역 코칭 |
| `/lang-coach:learn last` | 최근 자동 감지 교정을 상세히 재분석 |
| `/lang-coach:history [N\|all]` | 교정 이력, 통계, 취약 포인트 확인 |

### 사용 예시

```
/lang-coach:learn I goed to the store yesterday   # → 점수와 함께 교정
/lang-coach:learn 어제 가게에 갔습니다              # → 번역 코칭
/lang-coach:history                                  # → 최근 10건 교정 이력
/lang-coach:history all                              # → 전체 이력
```

### 자동 감지

자동 감지가 켜져 있으면 별도의 명령어 없이 매 응답 끝에 교정 내용이 자동으로 표시됩니다.

## 업데이트

```bash
claude plugin marketplace update claude-lang-coach
claude plugin update lang-coach@claude-lang-coach
```

업데이트 후 Claude Code를 재시작하세요.

## 삭제

```bash
claude plugin uninstall lang-coach@claude-lang-coach
rm -rf ~/.claude-lang-coach
```

자동 감지를 활성화했다면 `~/.claude/settings.json`에서 `UserPromptSubmit` hook을 제거하세요.

## 라이선스

MIT
