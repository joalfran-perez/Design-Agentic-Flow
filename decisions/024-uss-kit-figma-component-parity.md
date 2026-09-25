# 024 — Full Kit ↔ main-Figma component parity (presence, axes, tokens)

**Date:** 2026-09-25

**Context:** `context/code-design-mapping.md` only recorded name-level presence (23/26) after the
Desktop/Mobile catalog corrections (`decisions/021`, `022`). The user asked for a bidirectional
report against the published kit (not git repos) at the pinned 0.21.0 pin, at presence + variant
axes + visual tokens. The plan lived in `plans/001-uss-kit-figma-component-parity.md`
(`decisions/023`) until this session executed it.

**Decision:** Treat the parity report as a first-class audit artifact:

- Full matrix + sampled bindings → `reports/uss-kit-figma-component-parity.md` (Figma-owner /
  kit-maintainer facing, not consumer steering).
- Durable pointer + new facts only → `context/code-design-mapping.md` (do not duplicate the matrix).
- Interactive summary → canvas `uss-kit-figma-parity` (allowed extra canvas: not tied to one
  inventory, same exception as `consolidation-status-report`).
- Repeatable method → `skills/code-design-audit.md` (the skill `decisions/009` deferred).

Scope stays **main/core Figma + npm 0.21.0**. No re-extract, no Figma writes, no npm re-pin,
Patterns pages listed not scanned, `kitdigital-v1`/`-v2` left unchanged.

**Consequence:** Presence is unchanged (23/26 + packaging for AspectRatio / OpacityLayer / Icon).
New durable findings: Navigation stack + Sheets are `figma_only`; Button float has CSS but no
React variant; `.uss-btn--rrss`/`--inline` are `code_only`; H4 weights are **inverted** across
breakpoints (not just desktop 500 vs 600); dark elevation pairing is swapped vs compiled
`.shadow-1`/`.shadow-2`; Alert padding and Tag radius (1000 vs 9999) drift at component level;
on-disk main `spacing-216` is **220**, which contradicts DQ item 1. Live Foundations `use_figma`
threw read-only this session, so that last value was not re-confirmed in Figma.

`plans/001` is `done`. Next kit or inventory bump reuses the skill, not a new plan, unless scope
changes.
