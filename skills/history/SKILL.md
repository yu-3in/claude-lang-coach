---
name: history
description: Review language learning history — scores, error patterns, and progress.
allowed-tools: Read Glob Grep Bash
user-invocable: true
argument-hint: "[N | all]"
---

# Language Coach — Review

Corrections: `~/.claude-lang-coach/corrections/`

## Scope

- No argument: last 10
- Number N: last N
- `all`: all entries

## Display

Glob `~/.claude-lang-coach/corrections/*.json`, sorted newest first.

If no corrections found, display:
```
No corrections yet. Start with:
  /lang-coach:learn <text>
  or enable auto-detect: /lang-coach:setup autodetect on
```

Otherwise show:

| Date | Input | Type | Overall | Key Issue |
|------|-------|------|---------|-----------|
| ... | ... | ... | ... | ... |

Then: total count, average score, trend, top 3 error types, weak points, encouragement.
