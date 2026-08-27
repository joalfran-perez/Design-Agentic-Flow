# 008 — Rename `USS Design system Inventory` → `USS Design System Inventory`

**Date:** 2026-08-27

**Context:** `decisions/006`'s first `validate-dod.ps1` run flagged a casing inconsistency: the original
system's folder used lowercase "system" while USS One and Extension Library both use "System".

**Decision:** User confirmed — rename the folder to `USS Design System Inventory` (capital S), matching
the other two. Renamed via a two-step `git mv` (case-only renames need an intermediate name on
case-insensitive filesystems). Updated all "current state" references: `AGENTS.md`, `state/inventories.md`,
`state/current.md`, `decisions/002`'s known-exception wording, and the cross-links in the Extension
Library's and USS One's `README.md`.

**Left unchanged (intentional):** `logs/001`, `logs/005`, and `decisions/006`'s own "side finding" text
still quote the old lowercase name — they are dated, point-in-time records of what was found/output at the
time, not living references. Rewriting history there would misrepresent when the fix happened.

**Consequence:** `scripts/validate-dod.ps1` now runs clean with zero warnings across all 3 inventories.
