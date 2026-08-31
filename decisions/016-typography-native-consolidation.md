# 016 — Typography consolidated onto the Kit's native CSS (`kitdigital-v2.md`)

**Date:** 2026-08-31

**Context:** `decisions/015` explicitly scoped the Bootstrap-native rewrite of `kitdigital-v2.md` to
spacing and structural grid only, keeping Tailwind as the owner of "typography scale" (among other things
neither the Kit nor Bootstrap covers). The deliverable's `## Tipografía` section reflected that: it only
mapped font-family (Montserrat/Karla → `font-serif`/`font-sans`) and stated "Tailwind sigue siendo dueño de
tipografía." The user pointed out the type scale itself was never explicitly declared, and asked to
consolidate typographic rules onto the Kit's own CSS instead — reversing that part of `decisions/015`'s
scope — so any coding agent consumes styles from the Kit's CSS, with dependencies/methods spelled out for
both declarative and imperative code, as a non-negotiable rule.

**What was found** (primary source: `node_modules/@ussebastian/kitdigital/src/css/_typography.scss` +
`_variables.scss`, verified against compiled `dist/css/main.css`; full detail persisted in
`context/code-design-mapping.md` § "Kit Digital native typography"):

- The Kit ships a complete, responsive (breakpoint `1010px`, same as grid/spacing) semantic type system —
  `h1..h6`/`.uss-h1..h6`, `.uss-display`(+`--sub`/`--content`), `.uss-intro`, `p`(+`.p-size--sm`/`--lg`),
  `blockquote`(+`--xl`), `.overline`, `code` — each with font-family/size/weight/line-height/letter-spacing
  fully specified, not just a font-family mapping.
- The native `--font-size-*` scale (17 steps) has **zero drift** against the Figma-audited canonical scale
  — unlike spacing/radius, which do diverge. This makes typography a stronger case for full native adoption
  than spacing was.
- **No JS/React API exists for typography** — `kitdigital-react`'s component export list has no
  `Typography`/`Heading`/`Text`. Declarative (JSX `className`) is the only method; there is no imperative
  equivalent, and none should be invented.
- None of the Kit's typography rules carry `!important`, unlike the Bootstrap utilities used for spacing —
  this creates a real risk: Tailwind's Preflight resets heading font-size/weight to `inherit`, and since
  this project's load order puts `@tailwind base` after the Kit's CSS, a bare `<h1>` with no class would
  lose its style. The fix is using the Kit's class on every heading (higher specificity than Preflight's
  element selector), not reordering imports.
- Two drifts found against Figma's named styles (`Títulos/H4` weight, `Otros/Display Tittle` size) — flagged
  per `decisions/005`, not corrected; the display-size drift has an explicit `// antes era 60` comment in
  the Kit's own source, i.e. it's an intentional code change Figma hasn't caught up to. Added as item 10 to
  `reports/figma-data-quality-issues.md` per user confirmation.

**Decision:**
1. Amend `decisions/015`'s scope: typography moves from "stays on Tailwind" to "fully native," for this
   deliverable variant only (`kitdigital-v2.md`) — `kitdigital-v1.md` is untouched and keeps its
   Tailwind-first typography mapping, per the versioning convention already established.
2. `kitdigital-v2.md`'s `## Tipografía` section is rewritten with: the full type scale, a per-class
   mobile/desktop style table, a Figma cross-check table (with the two flagged drifts), a modifiers table,
   an explicit "no imperative method exists" statement, a Tailwind core-plugins-disable rule
   (`fontSize`/`fontWeight`/`fontFamily`/`lineHeight`/`letterSpacing`) extending the existing spacing block,
   and the Preflight/specificity caveat as its own callout with a concrete rule (always pair the tag with
   its Kit class).
3. Persist all primary-source findings into `context/code-design-mapping.md` before/alongside the
   deliverable edit — same methodological pattern as `decisions/015`.

**Consequence:**
- `kitdigital-v2.md` now has feature parity in rigor between its spacing/grid section and its typography
  section; v1 remains the "Tailwind owns typography and spacing" baseline for comparison.
- The Preflight/specificity finding is new, general knowledge about consuming any un-`!important`-guarded
  Kit CSS class alongside Tailwind — worth checking for on any future section of either deliverable that
  isn't already known to use `!important` (e.g. if `_borders.scss`/`_shadows.scss` component classes are
  ever covered).
- If `@ussebastian/kitdigital` is re-pinned to a newer version, re-verify the two flagged drifts (they may
  have been fixed upstream) and re-check whether typography rules have gained `!important` (would remove
  the Preflight risk).
