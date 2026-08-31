# 017 — Color consolidated onto the Kit's native CSS variables (`kitdigital-v2.md`)

**Date:** 2026-08-31

**Context:** Following `decisions/016` (typography consolidated onto the Kit's native CSS), the user asked
for the same treatment for color: `kitdigital-v2.md`'s existing `## Colores` section only listed the
project-specific class names ModUSS Planner already happens to use (`paper`, `surface`, `navy`, `ink`,
`ok`/`warn`/`err`...), not the Kit's full native color scale — leaving anything outside that subset
undetermined for an agent, plus dependencies/methods (declarative vs. imperative) were never spelled out
the way they now are for typography.

**What was found** (primary source: full read of
`node_modules/@ussebastian/kitdigital/src/css/_colors.scss`, both `:root/.light` and `.dark` blocks; full
detail persisted in `context/code-design-mapping.md` § "Kit Digital native color architecture"):

- **7 base ramps (10 steps each)** — `neutral`/`primary`/`secondary`/`info`/`success`/`warning`/`error` —
  byte-for-byte identical to the hex already cross-checked across all three Figma systems
  (`context/design.md`). **Zero drift**, same finding pattern as the font-size scale in `decisions/016`.
- **`--secondary-*` is the confirmed per-faculty theming override point**
  (`var(--custom-secondary-NN, <default>)` per step), directly from source — corroborates
  `context/canonical-tokens.md`'s existing "Accent / per-faculty theming" section with the primary-source
  line itself.
- **~60 semantic tokens per mode** across 10 categories (Background/Surface/Border/Text/Links/Text
  interactive/Buttons/Icons/Focus/Feedback/Elevation) for both light and dark — the category shape matches
  the Figma-audited semantic grouping (66 tokens, USS One), though **no exhaustive token-by-token diff was
  run** (would require bulk-loading all three systems' `colors.json`, which `AGENTS.md` rule 2 advises
  against for a narrow consolidation task) — only the category-level shape was confirmed.
- **No JS/React color or theme API exists** — searched `kitdigital-react`'s entire `dist/` for
  `theme`/`dark`/`useTheme`/`ThemeProvider`/`colorScheme`: zero matches. Light/dark switching is a plain DOM
  class toggle (`.light`/`.dark` on the root element); there is no library-provided hook or function — the
  same "CSS-only, no imperative API" shape already found for typography in `decisions/016`.
- **The Tailwind-collision fix is structurally different from spacing/typography.** Those could disable a
  whole core plugin (`padding`, `fontSize`, etc.). Color can't — the `colors` core plugin must stay enabled
  to generate `bg-*`/`text-*` classes at all. The actual risk is Tailwind's **default stock palette**
  (`blue-500`, `red-600`...) staying available alongside the Kit's tokens with nothing stopping an agent
  from reaching for it. The fix is replacing `theme.colors` (not extending it via `theme.extend.colors`)
  with only Kit-mapped names, so the stock palette doesn't exist as a class at all.

**Decision:**
1. Rewrite `kitdigital-v2.md`'s `## Colores` section to include: the full 7×10 base-ramp table, a
   category-grouped semantic-token catalogue (referenced via variable chains, not re-resolved to ~140 raw
   hex values, to avoid duplicating what the ramp table already provides), a "dependencias y método"
   subsection matching typography's format (no extra dependency; no imperative API beyond a plain DOM class
   toggle for theme; declarative = CSS var or Tailwind color mapped to it), and the `theme.colors`
   replacement rule as its own non-negotiable callout. Keep the existing project-specific bridge table as a
   named example subset, not the only source.
2. Explicitly document the "no exhaustive Figma cross-check performed" scope limit, rather than fabricate a
   token-by-token match/drift table without doing the work — consistent with `decisions/005` (flag, don't
   silently fabricate certainty) applied to an *absence* of verification, not just a factual drift.

**Consequence:**
- `kitdigital-v2.md` now has matching rigor across spacing/grid, typography, and color — all three "own"
  their full native scale with dependencies/methods spelled out, rather than color being the last section
  left thin.
- The `theme.colors`-replacement mechanism is a new, generalizable pattern distinct from the
  corePlugins-disable pattern used elsewhere — worth reusing if a future section needs the same "keep the
  plugin, remove the competing default values" treatment (e.g. if Tailwind's default `fontFamily` stack
  ever needed the same fix instead of a flat disable).
- If `@ussebastian/kitdigital` is re-pinned to a newer version, re-verify the base ramps and semantic token
  list against the new compiled CSS before trusting this section again.
