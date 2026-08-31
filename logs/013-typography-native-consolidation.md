# 013 — Typography consolidated onto the Kit's native CSS (`kitdigital-v2.md`)

**Date:** 2026-08-31

**What:** User pointed out `kitdigital-v2.md`'s typography section had no explicit scale and still deferred
to Tailwind ("Tailwind sigue siendo dueño de tipografía") — a leftover from `decisions/015`, which had
scoped the Bootstrap-native rewrite to spacing/grid only. Asked to consolidate typographic rules onto the
Kit's own CSS, per `context/code-design-mapping.md`, with dependencies/methods spelled out for both
declarative and imperative code, as a non-negotiable rule.

**How:** Read `_typography.scss` + `_variables.scss` (SCSS source), verified every class/value against the
compiled `dist/css/main.css`, then cross-checked the resulting table against the Figma-audited named styles
in `USS Design System Inventory/tokens/typography.json`. Also listed `@ussebastian/kitdigital-react`'s full
`dist/components/` export directory to confirm whether a Typography/Heading/Text React component exists.

**Key findings (new, persisted to `context/code-design-mapping.md`):**
- The Kit ships a complete, responsive (`1010px` breakpoint) semantic type system — `h1..h6`, `.uss-display`
  (+`--sub`/`--content`), `.uss-intro`, `p`(+`.p-size--sm`/`--lg`), `blockquote`(+`--xl`), `.overline`,
  `code` — each with font-family/size/weight/line-height/letter-spacing fully specified.
- Native `--font-size-*` scale (17 steps) has **zero drift** against the Figma canonical scale — the first
  scale in this whole investigation (spacing/radius diverge) that matches exactly.
- No JS/React API exists for typography at all: `kitdigital-react` exports no `Typography`/`Heading`/`Text`
  component. Declarative (tag or class) is the only method; there is no imperative equivalent.
- None of the typography rules carry `!important` (unlike the Bootstrap spacing/icon utilities) — this
  creates a real risk with Tailwind's Preflight (`@tailwind base`), which resets `h1`-`h6` to
  `font-size/weight: inherit` and loads *after* the Kit's CSS in this project's documented order. A bare
  `<h1>` with no class would lose its style; the fix is pairing the tag with its Kit class (higher
  specificity than Preflight's element selector), not reordering imports.
- Two drifts found against Figma's named styles, flagged per `decisions/005`: `.uss-h4` desktop weight
  (600 vs. Figma's Medium/500), and `.uss-display` desktop size (56px vs. Figma's 60px — the Kit's own
  source has an inline `// antes era 60` comment, i.e. an intentional code-side change).

**Decision:** Amend `decisions/015`'s scope for typography specifically (was "stays on Tailwind," now
"fully native") — `kitdigital-v1.md` is untouched. Rewrote `## Tipografía` with the full scale, per-class
mobile/desktop table, Figma cross-check, modifiers table, explicit "no imperative method" statement, a
Tailwind corePlugins-disable rule extending the existing spacing block, and the Preflight/specificity
caveat as its own callout. Added matching notes to "Orden de carga del CSS" and the checklist.

**Output:** `context/code-design-mapping.md` "Kit Digital native typography" section (new);
`deliverables/kitdigital-v2.md` typography section rewritten + small edits to CSS-order/checklist;
`decisions/016`; `context/decisiones.md` index entry for 016; `reports/figma-data-quality-issues.md` item 10
(new, user confirmed) for the two flagged drifts.

**Open questions:** none new.
