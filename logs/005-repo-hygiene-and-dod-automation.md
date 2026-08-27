# Log 005 — Initial commit, .gitignore, DoD automation, logs archival policy

**Date:** 2026-08-27

**What:** Implemented 4 of 5 user-proposed improvements (1, 2, 3, 5 — #4 explicitly skipped by user):
1. Initial git commit (`236e66a`): all 3 inventory folders + full memory system, 46 files.
2. `.gitignore` (`7684751`): OS/editor cruft + local extraction scratch conventions.
3. Definition-of-Done automation (`6581b45`, `decisions/006`): `scripts/validate-dod.ps1` (manual,
   checks structure + valid JSON + `state/inventories.md` cross-reference) plus a Cursor `stop` hook
   (`.cursor/hooks.json`) that runs it after every response and nudges once (`loop_limit: 1`) on failure.
   Chosen via user Q&A: hook+script (not script-only), "full" scope, `agent_stop` trigger.
5. Logs archival policy (`decisions/007`): keep ≤15 logs in `logs/`, archive older via
   `scripts/archive-logs.ps1 -Keep <n>` (manual, not hooked — infrequent/low-risk to defer).

**Finding:** First `validate-dod.ps1` run passed all 3 inventories, but surfaced a real naming-convention
lint: `USS Design system Inventory` uses lowercase "system" vs. the other two folders' "System" — flagged
non-blocking in `state/current.md` open questions, not auto-renamed (would require updating references
across `AGENTS.md`/`context/design.md`/`state/inventories.md`).

**Gotcha hit:** an em-dash (`—`) in a `.ps1` string broke the PowerShell 5.1 parser with a confusing
"missing closing parenthesis" error several lines later — root cause was file encoding, not real syntax.
Fixed by using plain `--` instead. Not yet promoted to `gotchas/` (single occurrence so far).

**Repo state:** 3 commits on `master`, no remote, working tree clean after this session's commit.
