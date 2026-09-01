# 017 — Formal v1/v2 scope split; color/typography ported into kitdigital-v1.md

**Date:** 2026-09-01

**What:** Declared `kitdigital-v1.md` (Tailwind-coexistence, existing environments like ModUSS Planner) and
`kitdigital-v2.md` (native Bootstrap, no exceptions) as a permanent, non-negotiable scope split rather than
two drafts of the same idea. Ported v2's color and typography findings (added in `decisions/016`/`017`)
into v1, adapted for its flexibility premise.

**How:**
- Color ported unchanged into v1: full 7x10 base ramps, ~60-token semantic catalogue, dependencies/method,
  and the non-negotiable "replace theme.colors, don't extend it" rule — this risk isn't spacing-dependent.
- Typography ported with one delta: v1 does not mandate disabling Tailwind's text corePlugins; Kit classes
  are required only where a Figma-audited equivalent exists, Tailwind text utilities stay enabled for the
  rest. The Preflight cascade-risk warning (h1-h6 losing size/weight if the tag lacks its Kit class) ported
  unchanged — equally real in v1, which also keeps `@tailwind base` active.
- Icons: added the `icon-size-{xs..xxxl}` native Bootstrap utility note to v1 (`icon-size-xxl` already
  covers the 48px the project's adapter had reinvented as `uss-icon--48`).
- Updated both files' banners with an "Alcance definitivo" cross-reference, v1's CSS-load-order comment, and
  v1's checklist (typography + expanded color + icon-size-* items).

**Output:** `decisions/019-two-tier-deliverable-scope.md` (new), `deliverables/kitdigital-v1.md` (color +
typography + icons + CSS load order + checklist sections rewritten), `deliverables/kitdigital-v2.md` (banner
cross-reference only).

**Open questions:** none new — spacing/grid remains the one deliberate, untouched divergence between the
two files.
