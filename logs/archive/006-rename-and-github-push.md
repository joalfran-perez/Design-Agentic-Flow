# Log 006 — Folder casing fix + push to GitHub

**Date:** 2026-08-27

**What:**
1. Renamed `USS Design system Inventory/` → `USS Design System Inventory/` (two-step `git mv`, casing-only
   rename on a case-insensitive filesystem). Updated all current-state references (`AGENTS.md`,
   `state/inventories.md`, `state/current.md`, `decisions/002`, cross-links in the other two inventories'
   READMEs). Historical logs/006 finding text intentionally left quoting the old name. See `decisions/008`.
   `scripts/validate-dod.ps1` now runs with zero warnings.
2. User decided **not** to retry the original USS Mobile file re-extraction for now — moved from "open
   question" to a resolved/deferred blocker note in `state/current.md`.
3. Created a new **private** GitHub repo (`gh repo create`, account `joalfran-perez`) named
   `Design-Agentic-Flow` and pushed `master` — `origin` now tracks
   https://github.com/joalfran-perez/Design-Agentic-Flow. All 6 local commits pushed, working tree clean.

**Gotcha hit:** `gh repo create ... --push` succeeded, but PowerShell's `2>&1` redirect turned git's normal
stderr progress output into a `NativeCommandError`-looking failure in the console. Verified success via
`git remote -v` / `git status` (exit code 0, branch tracking set, nothing to commit) rather than trusting
the console error text.

**Repo state:** 6 commits on `master`, pushed to GitHub (private), working tree clean.
