# Current State

**Last updated:** 2026-08-27

## Done
- 3/3 requested Figma file-sets fully inventoried: USS (original), USS One, USS Extension Library.
- 3 interactive canvases built, one per system, all compiling with no TypeScript errors.
- Persistent memory system bootstrapped (`AGENTS.md`, `context/`, `decisions/`, `state/`, `skills/`,
  `gotchas/`, `logs/`).
- Initial commit made (`236e66a`) + `.gitignore` added (`7684751`). Repo has no remote yet.
- Definition-of-Done automated: `scripts/validate-dod.ps1` (manual) + `.cursor/hooks.json` `stop` hook
  (automatic, nudges once per failure). All 3 inventories currently pass. See `decisions/006`,
  `skills/dod-validation.md`.

## Pending
- Nothing actively requested right now.

## Blockers
- None active.
- Historical (not currently blocking): the original `USS Design system Inventory/` Mobile file only
  exposes its "Comenzar" index page under the account used for that session — per-component Mobile pages
  (Buttons, Cards, Tags, etc.) were never enumerated. Would need re-extraction with broader Figma access
  to close this gap. See `state/inventories.md` row 1 and `gotchas/figma-read-only-access.md`.

## Open questions for the user (not yet decided)
1. Should USS / USS One / Extension Library be reconciled into one canonical token set, or are they
   intentionally divergent branches (e.g. per-faculty customization)? See `context/design.md` bottom.
2. Should the flagged data-quality issues (195 duplicate paint styles, duplicate component sets, value
   drift, stray variables — all in Extension Library, some in USS One) be reported back to whoever owns
   those Figma files?
3. Is it worth re-attempting the original USS Mobile file extraction with different Figma access to close
   that historical gap?
4. Repo has no git remote — commit/push strategy not yet decided (commits are local-only so far).
5. `USS Design system Inventory/` has a casing inconsistency ("system" vs. "System" in the other two
   folders) — flagged by `scripts/validate-dod.ps1` as a non-blocking lint. Rename it? Would require
   updating references in `AGENTS.md`, `context/design.md`, `state/inventories.md`, and the canvas skill's
   folder-name assumptions — not done automatically, needs your go-ahead.

## Next-session bootstrap
Read `AGENTS.md` + this file. Nothing else needed unless the task points elsewhere per the skill routing
table in `AGENTS.md` §4.
