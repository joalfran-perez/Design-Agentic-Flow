# 012 — Bootstrap-native alternative deliverable (`kitdigital-v2.md`)

**Date:** 2026-08-31

**What:** User asked for an alternative to `deliverables/kitdigital.md` (renamed `-v1.md`) that uses the
Kit's *native* Bootstrap utilities for spacing instead of a Tailwind-restoring adapter, following
`context/code-design-mapping.md`.

**How:** Inspected the pinned `@ussebastian/kitdigital` package's SCSS **source**
(`node_modules/.../src/css/`), then verified every claim against its **compiled** `dist/css/main.css` —
source and shipped output disagreed on at least one major point (a Tailwind-clone flex-utility file exists
in source but is never imported, so it's dead code).

**Key findings (new, persisted to `context/code-design-mapping.md`):**
- Kit's utility layer is real Bootstrap 5 (`@import 'bootstrap/scss/...'`), not just similarly named.
- `_bootstrap_remove.scss` strips opacity/border/rounded/color/font-family utilities — confirmed absent in
  compiled CSS.
- Native spacing scale (16 steps, `!important`, px-as-suffix/rem-value) diverges from the Figma canonical
  19-step scale: canonical has `36`/`112`/`216` the code lacks; code has `40` canonical lacks.
- Native radius: only 4 values (`none`/`s`=8px/`m`=16px/`full`) vs. canonical's 6+1 steps — `2/4/12px` have
  no native token.
- Second, previously unknown icon-sizing utility (`icon-size-{xs..xxxl}`, confirmed `!important`) already
  covers 48px — duplicated unnecessarily by ModUSS Planner's custom `--48` modifier.
- Native `.w-*`/`.h-*` are percentage-based — a third, distinct scale from both Tailwind's and from what the
  adapter assumed.

**User decisions:** Bootstrap replaces Tailwind for spacing *and* structural grid (not spacing alone); gaps
vs. canonical Figma scale are forbidden as exceptions — round to nearest native step (tie → round up); the
native-architecture findings get persisted to `code-design-mapping.md` before writing the deliverable.

**Output:** `context/code-design-mapping.md` "Kit Digital native architecture" section (new);
`deliverables/kitdigital-v1.md` (renamed from `kitdigital.md`) + `deliverables/kitdigital-v2.md` (new,
Bootstrap-native); `decisions/015`; `context/decisiones.md` index entries for 014 + 015 (014 was missing).

**Open questions:** none new. Both `-v1.md` and `-v2.md` are point-in-time snapshots with no auto-sync to
ModUSS Planner's real code, and both should be spot-checked if `@ussebastian/kitdigital` is ever re-pinned
to a newer version.
