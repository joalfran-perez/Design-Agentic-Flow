# 002 — Fixed inventory folder structure

**Date:** 2026-08-27 (retroactive)

**Context:** Three independent extraction rounds needed a structure that (a) is quick to produce under
context/output constraints, and (b) lets later sessions diff systems without re-reading everything.

**Decision:** Every inventory folder = `<System> Design System Inventory/{README.md, tokens/{spacing,
radius,colors,typography,effects}.json, components/{desktop,mobile}-components.md}`. No inventory-specific
extra top-level files.

**Known exception:** the original `USS Design system Inventory/components/` uses `mobile-notes.md` instead
of `mobile-components.md`, because that Figma file was view-only and only exposed one index page — there
was no per-component breakdown to tabulate, just access-limitation notes. Treat this as intentional, not a
bug to fix retroactively unless the Mobile file's access is upgraded and a real component audit becomes
possible.

**Consequence:** `state/inventories.md` and `context/design.md` can present per-system rows/columns
mechanically. Any new system extraction must match this shape before being marked done.
