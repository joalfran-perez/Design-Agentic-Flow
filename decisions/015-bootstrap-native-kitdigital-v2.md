# 015 — Alternative deliverable: Bootstrap-native spacing/grid (`kitdigital-v2.md`)

**Date:** 2026-08-31

**Context:** Following `decisions/014` (first authored deliverable, `deliverables/kitdigital.md`, Tailwind-
first with an adapter layer restoring Tailwind's spacing scale over the Kit's colliding utility names), the
user asked for an **alternative** version — one that reinforces the Kit's *native* Bootstrap-based utilities
for spacing instead of fighting them with an adapter, "so there are no divergences or additional code
dependencies," following `context/code-design-mapping.md`.

While researching, the pinned local copy of `@ussebastian/kitdigital` (`node_modules/`, per `decisions/009`)
turned out to include the package's **SCSS source**, not just its compiled CSS. Inspecting it — and,
critically, verifying claims against the actual **compiled** `dist/css/main.css`, not just the SCSS source
— surfaced several previously undocumented facts, now persisted in `context/code-design-mapping.md`'s new
"Kit Digital native architecture" section:

- The Kit's utility layer **is Bootstrap 5**, not merely Bootstrap-styled (`@import 'bootstrap/scss/...'`).
- `_bootstrap_remove.scss` deliberately strips opacity/border/rounded/color/font-family utility categories
  from the compiled output — confirmed absent in `dist/css/main.css`, not just source intent.
- A Tailwind-cloned flex-utility file (`_utilities-flex.scss`) exists in source but is **dead code** — never
  imported by `main.scss`, never reaches the compiled CSS. What actually ships for flex *properties*
  (align/justify/wrap/grow) is Bootstrap's own generator, with Bootstrap's class names and `!important`.
- Native spacing scale (16 steps, confirmed compiled with `!important`) diverges from the Figma-audited
  19-step canonical scale (`context/canonical-tokens.md`): canonical has `36`/`112`/`216` the code lacks;
  code has `40` canonical lacks.
- Native radius scale is only 4 values (`none`/`s`=8px/`m`=16px/`full`) vs. Figma canonical's 6+1 steps —
  `2px`/`4px`/`12px` have no native CSS variable at all.
- Two independent icon-sizing systems exist: the already-known `.uss-icon--*` component modifiers, and a
  separate, previously undocumented `icon-size-{xs..xxxl}` Bootstrap utility (confirmed compiled with
  `!important`) that already covers 48px natively — exactly what ModUSS Planner's adapter reinvented as a
  custom `--48` modifier.
- Native `.w-*`/`.h-*` are **percentage-based**, a third scale distinct from both Tailwind's and from what
  the adapter assumed it needed to restore.

**Decision:**
1. Persist all of the above into `context/code-design-mapping.md` (new "Kit Digital native architecture"
   section) *before* writing the deliverable — it's new primary-source evidence future tasks will also need,
   not just deliverable-specific detail (methodological pattern: verify against compiled output, not only
   source, before writing anything as fact).
2. Scope of the alternative, per user's explicit choices:
   - Bootstrap-native replaces Tailwind for **both** spacing *and* structural grid (`.row`/`.col-*`), not
     spacing alone — Tailwind is kept only for what neither the Kit nor Bootstrap covers (real CSS grid,
     typography scale, animations).
   - Figma-canonical steps with no native equivalent (spacing `36`/`112`/`216`; radius `2`/`4`/`12`px) are
     **forbidden** as exceptions — the rule rounds to the nearest native step instead (tie → round up),
     documented as an explicit table in the deliverable, not silently.
3. Versioning: retroactively renamed the prior deliverable `deliverables/kitdigital.md` →
   `deliverables/kitdigital-v1.md` (Tailwind-first + adapter) so `deliverables/kitdigital-v2.md`
   (Bootstrap-native spacing/grid) sits alongside it as a named alternative, not a silent replacement — both
   are valid steering-file candidates for ModUSS Planner; the choice between them is that project's decision,
   not this repo's.

**Consequence:**
- `context/code-design-mapping.md` gained its most detailed code-only (no Figma counterpart) section to
  date — a reminder that `decisions/009`'s pinned reference is good for more than the original "does
  published code match Figma" question; it also holds internal architecture facts (dead code, `!important`
  usage, utility removal) no doc had captured before.
- `deliverables/kitdigital-v1.md` and `-v2.md` now coexist permanently as two evidenced alternatives. Any
  future request of this shape ("another alternative for X consumer") should follow the same
  `-vN.md` naming convention rather than overwriting.
- If `@ussebastian/kitdigital` is ever re-pinned to a newer version, the "native architecture" section and
  both deliverables should be spot-checked against the new compiled CSS before being trusted again — none of
  this is guaranteed stable across upstream releases.
