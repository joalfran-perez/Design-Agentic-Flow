# 006 — Automate Definition-of-Done validation (script + stop hook)

**Date:** 2026-08-27

**Context:** `AGENTS.md` §6 defines a Definition of Done checklist for inventory folders, but nothing
enforced it — drift (missing files, invalid JSON, an inventory folder not listed in
`state/inventories.md`) could go unnoticed indefinitely.

**Decision:** Implement both, per explicit user choice:
1. A standalone, manually-runnable validator: `scripts/validate-dod.ps1` — checks folder structure, valid
   non-empty JSON in every `tokens/*.json`, and cross-reference in `state/inventories.md`.
2. A Cursor `stop` hook (`.cursor/hooks.json` + `.cursor/hooks/validate-inventories-hook.ps1`) that runs
   the same script after every agent response and only speaks up (`followup_message`) when it fails,
   capped at one nudge per stop (`loop_limit: 1`) to avoid nagging forever on a folder that's
   intentionally mid-work.

**Scope chosen:** "full" — structure + JSON validity + `state/inventories.md` cross-reference (not just
file existence).

**Consequence:** New inventory folders (or edits to existing ones) that violate the fixed shape from
`decisions/002` are caught automatically, without relying on the agent remembering to check manually. The
hook fails open — a broken validator script never blocks the agent, only silences the automated nudge.
See `skills/dod-validation.md` for usage.

**Side finding surfaced by first run:** `USS Design system Inventory` has a casing inconsistency (lowercase
"system") vs. the other two folders' "System" — flagged as a non-blocking lint, not auto-renamed. See
`state/current.md` open questions.
