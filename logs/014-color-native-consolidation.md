# 014 — Color consolidated onto the Kit's native CSS (`kitdigital-v2.md`)

**Date:** 2026-08-31

**What:** Following the typography consolidation (`decisions/016`), user asked for the same treatment for
color: `kitdigital-v2.md`'s color section only listed ModUSS Planner's already-used project class names, not
the Kit's full native scale, and dependencies/methods (declarative vs. imperative) weren't spelled out.

**How:** Read `_colors.scss` in full (`:root/.light` + `.dark` blocks), searched `kitdigital-react`'s entire
`dist/` for any theme/color JS API (found none), and cross-checked the semantic-token category shape
against `context/canonical-tokens.md`'s Figma-audited semantic set (category-level only, not exhaustive —
deliberately avoided bulk-loading all three systems' `colors.json` for this task, per `AGENTS.md` rule 2).

**Key findings (new, persisted to `context/code-design-mapping.md`):**
- 7 base ramps (10 steps each) — zero drift against the Figma-audited hex values, same "no divergence"
  pattern already found for the font-size scale.
- `--secondary-*` confirmed as the per-faculty override point directly from source
  (`var(--custom-secondary-NN, <default>)`), corroborating an existing inference with the primary-source
  line itself.
- ~60 semantic tokens per mode across 10 categories, matching the Figma semantic grouping's shape (not
  verified token-by-token).
- No JS/React color or theme API exists in `kitdigital-react` — same "CSS-only, no imperative API" pattern
  already found for typography; light/dark switching is a plain DOM class toggle, not a library hook.
- The Tailwind-collision fix is structurally different from spacing/typography: can't disable the `colors`
  core plugin (still needed for `bg-*`/`text-*` classes), so the fix is **replacing** `theme.colors`
  (not `theme.extend.colors`) with only Kit-mapped names, removing Tailwind's stock palette as a class
  entirely.

**Decision:** Rewrite `kitdigital-v2.md`'s `## Colores` section with the full base-ramp table, a
category-grouped semantic-token catalogue (referenced via variable chains to avoid duplicating ~140 hex
values), a "dependencias y método" subsection matching typography's format, and the `theme.colors`
replacement rule. Kept the existing project-specific bridge table as a named example subset. Explicitly
documented the "no exhaustive Figma cross-check" scope limit rather than fabricate certainty.

**Output:** `context/code-design-mapping.md` "Kit Digital native color architecture" section (new);
`deliverables/kitdigital-v2.md` color section rewritten + checklist item 6 updated; `decisions/017`;
`context/decisiones.md` index entry for 017.

**Open questions:** none new. If a future task needs an exhaustive Figma-vs-code color token diff, it should
be scoped as its own task (reading the relevant `colors.json` files), not assumed already done by this
session.
