---
name: code-review
description: Review priorities for homebrew-tap pull requests — Formula correctness that CI doesn't check, versus mechanical version-bump bots and prose that don't need scrutiny. Use for every PR review.
---

# Review priorities

This tap ships two formulae (`Formula/freshen.rb`, `Formula/frugalbar.rb`). CI (`audit.yml`) only runs `ruby -c` for syntax validity — it never runs `brew audit`/`brew style` and never checks that `version`, `url`, and `sha256` agree. Copilot review is the only check for formula semantics here.

## Spend real attention here
- `version`, `url`, and `sha256` must move together and stay internally consistent: the version string embedded in `url` must match the `version` field, and `sha256` must be a genuine 64-char hex digest that actually changed from the prior value, not a stale copy-paste.
- Formula DSL edits outside a plain version bump: `install` method paths, `on_macos`/`on_linux`/`depends_on` branching. The two formulae are intentionally shaped differently (freshen splits by OS and arch via `on_macos`/`on_linux`; frugalbar is arm64-macOS-only via `depends_on arch:`/`depends_on macos:`) — don't flag one for not mirroring the other.
- `service` blocks: paths must use `opt_bin`, not `bin` — frugalbar's service block relies on this, and using `bin` there breaks the running service across upgrades.
- `test do` blocks that swallow failures (`rescue true`, `rescue nil`, or a bare `rescue`). This repo has shipped that exact anti-pattern before (an earlier frugalbar formula's test block had `... "--help" rescue true`); a test block that can't fail isn't testing anything.

## Do not spend attention here
- Ruby syntax validity — already enforced by `audit.yml`'s `ruby -c` step.
- PRs from `seankoji-com-ci[bot]` titled "update `<formula>` to vX.Y.Z" that touch only `version`/`url`/`sha256` in one formula file: confirm the three fields agree per above, then move on — there is nothing else in these diffs.
- Wording/prose changes to README.md, CONTRIBUTING.md, LICENSE.
- "chore(ci): sync caller templates from seankoji-com/.github" PRs — these mirror reusable workflows whose source of truth is the central `.github` repo; don't re-review the workflow logic itself here.

## Comment style
- One comment per real issue, not one per file it repeats in.
- Skip restating what `ruby -c` already flags.
