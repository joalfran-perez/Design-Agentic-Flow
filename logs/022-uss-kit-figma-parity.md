# 022 — Kit 0.21.0 ↔ main Figma component parity

**Date:** 2026-09-25

**What:** Executed `plans/001`. `npm install` (already current). Catalogued React barrel + 53
compiled `.uss-*` roots. Built bidirectional matrix from existing Desktop/Mobile inventories.
Crossed foundation JSON vs `dist/css/main.css`. Sampled 10 families via `get_variable_defs`
(Mobile; Desktop Buttons via `get_metadata` after `use_figma` read-only).

**Numbers:** 23/26 presence unchanged. 2 Figma-only pages (Navigation stack, Sheets). 5 foundation
drifts (spacing, radius, H4 invert, Display 60→56, dark elevation swap). Alert pad 28 vs
32/40/32/24. Tag radius 1000 vs 9999.

**Wrote:** `reports/uss-kit-figma-component-parity.md`, canvas `uss-kit-figma-parity` (TS clean),
`skills/code-design-audit.md`, `decisions/024`. Mapping shortened to a pointer. DQ item 10
extended; item 18 added (main `spacing-216`=220 on disk).

**Open:** Live Foundations Space value not re-read (`use_figma` read-only this session). Empty
state still missing both sides. Did not commit.
