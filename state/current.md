# Current State

**Last updated:** 2026-08-27

## Done
- 3/3 requested Figma file-sets fully inventoried: USS (original), USS One, USS Extension Library.
- 3 interactive canvases built, one per system, all compiling with no TypeScript errors.
- Persistent memory system bootstrapped (`AGENTS.md`, `context/`, `decisions/`, `state/`, `skills/`,
  `gotchas/`, `logs/`).
- Definition-of-Done automated: `scripts/validate-dod.ps1` (manual) + `.cursor/hooks.json` `stop` hook
  (automatic, nudges once per failure). All 3 inventories currently pass with zero warnings. See
  `decisions/006`, `skills/dod-validation.md`.
- `USS Design system Inventory/` renamed to `USS Design System Inventory/` (casing fix). See `decisions/008`.
- Pushed to GitHub: `origin` = https://github.com/joalfran-perez/Design-Agentic-Flow (private), `master`
  tracks `origin/master`, working tree clean.
- Code↔design mapping done for `@ussebastian/kitdigital-react` (published npm library) vs.
  `USS Design System Inventory/` and, for the 21 components with no counterpart there, cross-checked
  against `USS One Design System Inventory/` too. Token-level exact match confirmed for colors + font
  sizes, divergence found in radius/spacing, component consolidation pattern documented, 16/21 "extra"
  code components matched to USS One instead. See `context/code-design-mapping.md`, `decisions/009`.
  `package.json`/`package-lock.json` are committed as a permanent pinned reference; `node_modules/` stays
  gitignored.

## Pending
- Nothing actively requested right now.

## Blockers
- None active.
- Historical, deferred by user decision (2026-08-27): the original `USS Design System Inventory/` Mobile
  file only exposes its "Comenzar" index page under the account used for that session — per-component
  Mobile pages (Buttons, Cards, Tags, etc.) were never enumerated. User decided **not to retry** this
  extraction for now. Re-open only if the user asks again or Figma access to that file changes. See
  `state/inventories.md` row 1 and `gotchas/figma-read-only-access.md`.

## Open questions for the user (not yet decided)
1. Should USS / USS One / Extension Library be reconciled into one canonical token set, or are they
   intentionally divergent branches (e.g. per-faculty customization)? See `context/design.md` bottom.
2. Should the flagged data-quality issues (195 duplicate paint styles, duplicate component sets, value
   drift, stray variables — all in Extension Library, some in USS One) be reported back to whoever owns
   those Figma files?
3. Repo is private on GitHub by default (no explicit instruction on visibility) — flip to public if desired.
4. The code's `--custom-secondary-*` theming-override pattern is evidence toward open question #1
   (per-faculty customization) — worth reconciling with `context/design.md`.
5. Accordion and Modal in code only trace back to unfinished "Testing 🟡" pages in USS One's Figma —
   worth a follow-up check once/if those Testing pages are promoted to core pages.

## Next-session bootstrap

**What to tell the agent at the start of a new session:** nothing more than *"Lee AGENTS.md y
state/current.md antes de empezar"* — or nothing at all, since this is now a standing rule the agent
should follow proactively (`AGENTS.md` §3 reading order). You never need to paste prior context or
re-summarize past sessions; it lives on disk.

What that unlocks, by task type:
- New Figma extraction request → agent loads `skills/figma-inventory-extraction.md`.
- "How do the 3 systems differ?" → agent reads `context/design.md`'s diff tables, not raw JSON.
- A Figma/MCP tool call fails → agent checks `gotchas/` before retrying blind.
- Canvas create/update → agent loads `skills/canvas-creation.md`.
- Checking an inventory folder is complete → agent runs `scripts/validate-dod.ps1`
  (`skills/dod-validation.md`); also runs automatically via the `stop` hook.
- End of any session that changes state → agent updates `state/`, adds a `decisions/` entry if a new
  pattern/anomaly was found, and appends a compressed `logs/` entry — without being asked.
