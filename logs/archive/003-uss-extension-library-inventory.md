# Log 003 — USS Extension Library inventory

**What:** Extracted "[Extension Library] USS" — a third sibling branch, all 3 files edit access.

**Numbers:** 0 local color/typography variables (only `Space`+`Radius` collections exist locally); 529
paint styles (334 distinct, 195 exact duplicates, all in "Light mode"); 191 text styles; 8 radius tokens
(adds `Radius-1000` pill token + a stray non-radius `Boolean` variable); 1 spacing value drift
(`spacing-216` resolves to 220px). Desktop: 41 sets / 383 variants across 6 pages. Mobile: 54 sets / 550
variants across 22 of ~48 pages (~29 staging pages listed, not deep-scanned).

**Key findings:**
- Color/typography delivered entirely via legacy styles, no variables — architecturally distinct from
  both USS and USS One (see `decisions/004`).
- Heavy duplication artifact: every distinct Light-mode semantic paint style exists as exactly 4 copies
  (195 redundant objects) — flagged, not fixed (see `decisions/005` and
  `gotchas/duplicate-styles-components.md`).
- New unrelated purple `_Base/Terciary` ramp replaces the blue-gray Facultad base ramp name, while the
  Facultad accent tokens themselves still resolve to the original blue-gray values (now hardcoded, not
  aliased).
- Component maturity is **inverted** vs. USS One: Desktop Buttons core here (Testing there), Desktop Cards
  Testing here (core there); Mobile Buttons/Modals core here (Testing-only in USS One), while
  Alert/Badges/Cards/Carousel/Header menu/Page hero remain Testing here (core in USS One).
- Duplicate component sets found: `Button icon 📱` (Mobile), `Card Persona S horizontal` (Desktop).

**Output:** `USS Extension Library Design System Inventory/` (README + 5 tokens/*.json + 2
components/*.md) + canvas `uss-extension-library-inventory`.
