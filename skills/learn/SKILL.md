---
name: learn
description: Correct or translate text for language learning. Detailed scoring, error analysis, and alternatives.
allowed-tools: Read Bash
user-invocable: true
argument-hint: "<text>"
---

# Language Coach — Learn

## 1. Load config

Read `~/.claude-lang-coach/config.json` via Bash.
If missing, tell the user: `/lang-coach:setup ja en`

## 2. Analyze

Detect whether input is in target or native language.

**Target language → Correction:**
1. Detect errors (grammar, vocabulary, tense, spelling, collocation)
2. Corrected text
3. Explain each error in native language
4. Score (0-100): Accuracy, Fluency, Naturalness, Overall
5. 2-3 alternatives
6. If error-free, note what was done well

**Native language → Translation coaching:**
1. Most natural translation
2. 2-3 variants (casual / formal / advanced) with nuance
3. Grammar points
4. Key vocabulary

## 3. Save

```bash
cat << 'JSONEOF' | ~/.claude-lang-coach/save-correction.sh
{
  "timestamp": "ISO 8601",
  "native_language": "...",
  "target_language": "...",
  "input_type": "target|native",
  "input": "original text",
  "result": {
    "output_text": "corrected or translated text",
    "errors": [{"type":"...","original":"...","corrected":"...","explanation":"...","severity":"high|medium|low"}],
    "score": {"accuracy":0,"fluency":0,"naturalness":0,"overall":0},
    "feedback": "...",
    "alternatives": ["..."]
  }
}
JSONEOF
```

## 4. Display

Localize labels to native language:

| Key | en | ja | ko | zh | fr | de | es |
|-----|----|----|----|----|----|----|-----|
| accuracy | Accuracy | 正確さ | 정확성 | 准确性 | Précision | Genauigkeit | Precisión |
| fluency | Fluency | 流暢さ | 유창성 | 流畅度 | Fluidité | Flüssigkeit | Fluidez |
| naturalness | Naturalness | 自然さ | 자연스러움 | 自然度 | Naturel | Natürlichkeit | Naturalidad |
| overall | Overall | 総合 | 종합 | 综合 | Global | Gesamt | General |

Score bars: █░ 20 segments. Severity: ▲ high · ● medium · ○ low.

**Correction:**

> ✗ **{original}**
> ✓ *{corrected}*

```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  {Accuracy}    {n}  {████████████████████}  ┃
┃  {Fluency}     {n}  {████████████████████}  ┃
┃  {Naturalness} {n}  {████████████████████}  ┃
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃  ★ {Overall}   {n}  {████████████████████}  ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
```

| | Before → After | Why |
|:---:|----------------|-----|
| ▲ | `{orig}` → **`{fixed}`** | {explanation} |

**Translation:**

> **{native text}** → *{main translation}*

| Style | Translation | Nuance |
|-------|-------------|--------|
| 💬 Casual | *{text}* | {note} |
| 📝 Formal | *{text}* | {note} |
| 🎯 Advanced | *{text}* | {note} |
