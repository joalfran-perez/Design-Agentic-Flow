# 002 — Fixed inventory folder structure

**Date:** 2026-08-27 (retroactive)

**Context:** Three independent extraction rounds needed a structure that (a) is quick to produce under
context/output constraints, and (b) lets later sessions diff systems without re-reading everything.

**Decision:** Every inventory folder = `<System> Design System Inventory/{README.md, tokens/{spacing,
radius,colors,typography,effects}.json, components/{desktop,mobile}-components.md}`. No inventory-specific
extra top-level files.

**~~Known exception~~ (closed 2026-09-25):** `USS Design System Inventory/components/` used
`mobile-notes.md` instead of `mobile-components.md`, on the belief that the Mobile Figma file was
view-only and exposed a single index page. That belief was wrong — the limitation was a read-channel
artifact (`decisions/021`). The file has been extracted in full and `mobile-notes.md` deleted, so **all
three inventories now use the standard shape with no exception**. `scripts/validate-dod.ps1` still
accepts `mobile-notes.md` as a fallback, but nothing uses it; treat a new one as a smell, not a
sanctioned pattern.

**Consequence:** `state/inventories.md` and `context/design.md` can present per-system rows/columns
mechanically. Any new system extraction must match this shape before being marked done.
