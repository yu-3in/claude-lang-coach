# Releasing

## Version Scheme

[Semantic Versioning](https://semver.org/): `MAJOR.MINOR.PATCH`

- **MAJOR**: Breaking changes (skill renamed, config format changed)
- **MINOR**: New features (new skill, new hook behavior)
- **PATCH**: Bug fixes, documentation

## Release Steps

### 1. Update manifests

```bash
VERSION=1.4.0
sed -i '' "s/\"version\": \"[^\"]*\"/\"version\": \"${VERSION}\"/g" \
  .claude-plugin/plugin.json \
  .claude-plugin/marketplace.json
```

### 2. Commit

```bash
git add -A
git commit -m "chore: bump version to ${VERSION}"
git push origin main
```

### 3. Tag and push

```bash
git tag v${VERSION}
git push origin v${VERSION}
```

This triggers the release workflow which:
- Updates version badges in all 7 README files
- Creates a GitHub Release with auto-generated changelog

**Do NOT manually update README badges.** The workflow handles this.

### 4. Verify

```bash
gh run list --repo yu-3in/claude-lang-coach --limit 1
gh release view v${VERSION} --repo yu-3in/claude-lang-coach
```

## User Update Command

```bash
claude plugin marketplace update claude-lang-coach
claude plugin update lang-coach@claude-lang-coach
```

## Checklist

- [ ] Version updated in `.claude-plugin/plugin.json`
- [ ] Version updated in `.claude-plugin/marketplace.json`
- [ ] **NOT** updated: README badges (workflow does this)
- [ ] Tested with `claude --plugin-dir .`
- [ ] Conventional commit messages used
- [ ] Tag pushed: `git tag v${VERSION} && git push origin v${VERSION}`
- [ ] Release workflow succeeded
- [ ] `git pull` to sync workflow's badge commit
