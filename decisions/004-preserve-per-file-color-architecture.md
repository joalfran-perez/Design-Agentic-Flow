# 004 — Document each system's real color architecture, don't normalize

**Date:** 2026-08-27 (retroactive — decided during the Extension Library extraction)

**Context:** The three systems deliver color completely differently:
- USS: 144 color variables across 2 true Figma modes (Light/Dark).
- USS One: 343 canonical + 144 sync variables; light/dark encoded in variable NAMES, not modes; adds a
  Facultad accent layer.
- Extension Library: **zero** color variables — 529 legacy paint styles (334 distinct, 195 exact
  duplicates), Facultad accent values hardcoded rather than aliased.

**Decision:** Do not force these into one unified "canonical token schema" for the sake of tidiness.
Document each file's actual delivery mechanism as-is in its own `tokens/colors.json`. Cross-system
comparison lives only in `context/design.md` as an explicit diff table.

**Rationale:** Normalizing would erase the most valuable finding of this whole audit — that the three
systems have genuinely diverged in how they package color, which matters enormously to whoever eventually
consolidates or migrates off of them.

**Consequence:** Expect `tokens/colors.json` to look structurally different across the 3 inventories. This
is intentional, not an inconsistency to fix.
