# Contributing to homebrew-tap

Thank you for helping maintain and improve the Homebrew tap for Sean Koji's projects and utilities!

---

## Adding or Updating a Formula

1. **Formula Location**: All formulae reside under `Formula/<name>.rb`.
2. **Syntax Validation**: Ensure Ruby syntax is valid:
   ```bash
   ruby -c Formula/<name>.rb
   ```
3. **Sha256 Checksums**: Always use real release artifact sha256 checksums from the corresponding upstream GitHub release.
4. **Dependencies**: Declare platform dependencies explicitly (e.g. `depends_on :macos`).

---

## Submitting Changes

1. Create a branch: `git checkout -b formula/update-<name>`.
2. Commit your changes following conventional commits (`feat(formula): update <name> to vX.Y.Z`).
3. Open a pull request against `main`.
