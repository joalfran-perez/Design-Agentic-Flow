# 019 — Formal, permanent scope split between `kitdigital-v1.md` and `-v2.md`

**Date:** 2026-09-01

**Context:** `decisions/015` first established that `-v1.md` (Tailwind-first + adapter) and `-v2.md`
(Bootstrap-native spacing/grid) would coexist permanently rather than one replacing the other. But
`decisions/016` (typography) and `017` (color) only updated `-v2.md` — leaving `-v1.md`'s color/typography
sections stale (a 15-row color bridge with no full catalogue; a 2-line typography note with no scale at
all), while `-v2.md` accumulated all the audited native-CSS knowledge plus a Tailwind-hostile posture (hard
`corePlugins` disable, no exception). The user asked for an explicit, non-negotiable **definition** of what
each file is for, so a future agent never has to guess which one applies to ModUSS Planner (or any other
Tailwind-based consumer) — and for the newer color/typography findings to reach `-v1.md` too, adapted to its
Tailwind-coexistence premise instead of copy-pasted as-is.

**Decision:**
1. **Scope, declared as a permanent fact, not a preference:**
   - `kitdigital-v2.md` — for environments that can adopt the Kit's native Bootstrap utilities directly
     (new projects, or existing ones willing to migrate spacing/grid). No Tailwind fallback for
     spacing/color/typography; rules are absolute (`corePlugins` disabled with no exception).
   - `kitdigital-v1.md` — for **existing Tailwind-based environments**, explicitly including ModUSS
     Planner. Tailwind keeps owning layout/spacing (via `kit-adapter.css`) and, unlike v2, keeps owning any
     text utility the Kit genuinely doesn't cover — flexibility is the point of this variant.
2. **What migrates from v2 into v1, and how:**
   - **Color** (base ramps, semantic token catalogue, dependencies/method, non-negotiable `theme.colors`
     replacement) ports **unchanged** — the risk it guards against (Tailwind's stock palette silently
     coexisting with Kit tokens) is identical regardless of the spacing approach, so there's no flexibility
     to preserve here.
   - **Typography** (native scale, semantic table, Figma-drift note, dependencies/method, Preflight
     cascade-risk warning) ports with **one deliberate delta**: v1 does *not* mandate disabling
     `fontSize`/`fontWeight`/`fontFamily`/`lineHeight`/`letterSpacing` in `corePlugins`. Kit classes are
     required only where a Figma-audited equivalent exists (headings, body, blockquote, overline, display,
     intro); Tailwind's text utilities stay enabled and usable for anything the Kit doesn't cover. The
     Preflight cascade-risk warning itself ports unchanged — it's equally real in v1, which also keeps
     `@tailwind base` active.
   - **Icons**: v1 gains the previously v2-only `icon-size-{xs..xxxl}` note — specifically that
     `icon-size-xxl` (48px, native, `!important`) already covers what the project's adapter had reinvented
     as a custom `uss-icon--48` modifier; the adapter's custom sizes narrow to the genuinely uncovered
     14/22/30px steps.
3. **What does not change:** spacing/grid stays exactly as each file already had it — Tailwind + adapter in
   v1, native Bootstrap in v2. That is the one intentional, permanent divergence between the two files; this
   decision does not touch it.

**Consequence:**
- Both files' headers now carry an explicit "Alcance definitivo" banner cross-referencing this decision and
  each other, so an agent opening either file immediately knows which consuming environment it targets and
  that the other file is not a deprecated/earlier draft.
- `kitdigital-v1.md` and `-v2.md` now share the same underlying color/typography facts
  (`context/code-design-mapping.md`'s "Kit Digital native architecture" section) — future updates to that
  native-architecture research should be checked against both deliverables, not just v2, unless the finding
  is spacing/grid-specific.
- Any future "make v1/v2 flexible on X vs. strict on X" request should follow the same pattern used here:
  port facts unchanged, port *rules* only after deciding explicitly whether the underlying risk is
  spacing-dependent (v1 gets flexibility) or not (v1 gets the same non-negotiable rule as v2).
