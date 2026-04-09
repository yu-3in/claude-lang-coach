# Releasing

## Version Scheme

[Semantic Versioning](https://semver.org/): `MAJOR.MINOR.PATCH`

- **MAJOR**: Breaking changes (skill renamed, config format changed)
- **MINOR**: New features (new skill, new hook behavior)
- **PATCH**: Bug fixes, documentation

## Release Process

1. **Update version** in both manifests:

```bash
# Example: bumping to 1.2.0
sed -i '' 's/"version": "[^"]*"/"version": "1.2.0"/g' \
  .claude-plugin/plugin.json \
  .claude-plugin/marketplace.json
```

2. **Commit and tag**:

```bash
git add -A
git commit -m "chore: bump version to 1.2.0"
git tag v1.2.0
git push origin main --tags
```

3. **GitHub Release** is created automatically by the `release.yml` workflow when a `v*` tag is pushed. It auto-generates the changelog from commit messages.

4. **Users update** via:

```bash
claude plugin marketplace update claude-lang-coach
claude plugin update lang-coach@claude-lang-coach
```

## Checklist

- [ ] Version updated in `.claude-plugin/plugin.json`
- [ ] Version updated in `.claude-plugin/marketplace.json`
- [ ] All README badge versions updated (release workflow does this automatically)
- [ ] Changes tested with `claude --plugin-dir .`
- [ ] Conventional commit messages used
- [ ] Tag matches version (`v1.2.0`)

## Post-Release

After pushing a tag:
1. The release workflow updates version badges in all READMEs
2. A GitHub Release is created with auto-generated notes
3. Users receive the update on next `claude plugin update`
