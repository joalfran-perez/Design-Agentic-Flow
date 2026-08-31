# USS Design System — Figma Data-Quality Report

**Prepared:** 2026-08-28 · **Audience:** whoever owns/maintains the USS, USS One, and USS Extension Library
Figma files. **Purpose:** a consolidated list of data-quality issues found while auditing all three
file-sets, for triage and fixing at the source. This repo (`ModUSS`) only documents Figma state — it does
not edit these files, so every item below still needs a human decision/fix in Figma itself.

Each item lists: what was found, exactly where, why it matters, and a suggested next step. Full technical
detail and raw values live in `context/design.md` and `context/canonical-tokens.md` if needed.

**Constraint added 2026-08-28 (`decisions/012`):** the main/core USS system is now **read-only** — every
fix below applies only to the 2 local libraries (USS One, Extension Library), never to the core system's
files, even where an item's ideal fix would logically also touch the core. See
`context/consolidation-plan.md` for the full phased plan these items feed into.

---

## 1. Extension Library: `spacing-216` resolves to 220px, not 216px
**Where:** Extension Library → Fundamentos de diseño → `Space` variable collection → `Espaciado/spacing-216`.
**Found:** Every other spacing token's name matches its pixel value (`spacing-04` = 4px, etc.) in all three
files. This one token alone breaks that pattern — named "216" but set to 220px. The same-named token in USS
and USS One both correctly resolve to 216px.
**Impact:** Low-medium — anyone trusting the token name over its resolved value will get a 4px layout
discrepancy specifically in the Extension Library file.
**Suggested fix:** Correct the value to 216px, or rename the token to `spacing-220` if 220 was actually
intended and the other two files are the ones that should change.

## 2. Extension Library: stray `Boolean` variable inside the Radius collection
**Where:** Extension Library → Fundamentos de diseño → `Radius` variable collection.
**Found:** Alongside the 8 radius tokens (6 shared + `Radius-1000`) there's a variable simply named
`Boolean` holding a `true`/`false` value — unrelated to corner radius.
**Impact:** Low — doesn't break anything today, but pollutes the collection and could confuse anyone
scripting against "all radius tokens."
**Suggested fix:** Move it to whatever collection it actually belongs to, or delete it if unused.

## 3. Extension Library: 195 duplicate paint styles (4× copies of every Light-mode semantic style)
**Where:** Extension Library → Fundamentos de diseño → Paint Styles → `Light mode/*`.
**Found:** All 65 distinct Light-mode semantic paint styles (Background, Surface, Border, Text, Links, Text
interactive, Icons, Feedback, Focus, Buttons) exist as **4 separate style objects each** — same name, same
resolved hex, different style IDs. Dark-mode styles are clean (1 copy each), so this looks like a
library-hygiene artifact from repeated imports/merges rather than an intentional pattern.
**Impact:** Medium — inflates the style picker 4x for Light mode, makes it easy to accidentally apply a
"stale" duplicate that later diverges from the "real" one if edited independently.
**Suggested fix:** De-duplicate down to 1 style per name; re-point any layers using a duplicate to the
canonical one first.

## 4. Extension Library: orphaned purple "Terciary" base ramp, name collision with Facultad theming — DECIDED
**Where:** Extension Library → Fundamentos de diseño → `_Base/Terciary/10-100`.
**Found:** USS One's second base ramp is `_Base/Secondary` (blue-gray, `#f3f8f8`→`#092430`) and backs the
Facultad accent theming system. In Extension Library, that ramp slot is renamed `_Base/Terciary` and given
an unrelated **purple** palette (`#f5eff9`→`#402851`) — yet the Facultad/USS accent tokens in this same file
still resolve to the ORIGINAL blue-gray hex values via hardcoded solid colors, not aliased to this new
ramp. The purple ramp itself also has a bug: steps 90 and 100 resolve to the identical hex (`#402851`).
**Impact:** Medium — the purple ramp appears completely unused (nothing in this file aliases to it), and
its name collides confusingly with what "Secondary" means in USS One.
**Decision (2026-08-28):** keep and formalize it as a real third accent — this is not a Facultad-system
alias, it's a new, separate theme.
**Fix needed:**
1. Move it out of `_Base/` (reserved for the shared brand palette) into a new top-level group `Themes/`.
2. Rename `_Base/Terciary` → `Themes/Amatista`.
3. Fix the duplicate-step bug: keep step 90 at its current `#402851`; change step 100 from the duplicate
   `#402851` to `#2f1d3c` (restores a proper light→dark progression across all 10 steps).
4. Leave `_Base/Secondary` naming alone / restore it if it was renamed away from that — the blue-gray
   Facultad ramp should keep the `Secondary` name to stay consistent with USS One, separate from this new
   `Themes/Amatista` purple ramp.

## 5. Main system vs. USS One: dark-mode elevation replacement colors are inverted
**Where:** USS (main) → Fundamentos de diseño → effect styles / color tokens, "Elevation 1/2 (reemplazo a
sombra)" — compared against USS One's `☾ Elevation 1/2 (reemplazo a sombra)`.
**Found:** Both files use the same two hex values, but paired to opposite token numbers:

| Token | USS (main) | USS One |
|---|---|---|
| Elevation 1 | `#242f3c` | `#202a37` |
| Elevation 2 | `#202a37` | `#242f3c` |

**Impact:** Low-medium — a component built against "Elevation 1" in one file will render a visibly
different dark-mode surface tone than the "same" component in the other file.
**Suggested fix:** Confirm which pairing is correct. **Note (2026-08-28, `decisions/012`):** the main/core
system is read-only, so in practice this can only be resolved by changing **USS One's** pairing to match
the core system's (not the reverse) — unless the design team decides the core's pairing was wrong all
along, in which case USS One's current pairing becomes the documented target and nothing changes there.

## 6. Radius "full/pill" value disagrees between Figma and shipped code — DECIDED
**Where:** Extension Library's `Radius-1000` variable (= 1000px) vs. the published
`@ussebastian/kitdigital` code's `--border-radius-full: 9999px` custom property.
**Found:** Both express the same intent (a radius large enough to always fully round a pill/circle
regardless of element size), but use different literal numbers. Neither USS nor USS One's Figma files have
a "full" radius token at all yet.
**Impact:** Low functionally (both numbers achieve a visually identical pill at typical component sizes),
but the discrepancy means Figma and code aren't sourced from the same literal value.
**Decision (2026-08-28):** the published code is canonical here — **9999px**, not 1000px. Code is what's
actually running in production; Figma should be corrected to match it, not the reverse.
**Fix needed:** rename/update Extension Library's `Radius-1000` → `Radius-Full` = **9999px**, and add a
matching `Radius-Full = 9999px` variable to **USS One** (it has no equivalent today). **Note (2026-08-28,
`decisions/012`):** the main/core USS system is now read-only and out of scope for this fix — only the 2
local libraries (USS One, Extension Library) can receive it.

## 7. Duplicate component sets with identical names
**Where:** Extension Library → "Button icon 📱" (Mobile) and "Card Persona S horizontal" (Desktop) — each
exists as **two separate, identically-named component sets** in their respective file.
**Impact:** Medium — anyone inserting one of these components has a 50/50 chance of picking the "wrong"
(possibly stale) duplicate with no visual way to tell them apart in the picker.
**Suggested fix:** Diff the two instances of each; keep the more complete/up-to-date one, delete the other,
and re-point any existing usages.

## 8. Informational: component "maturity" differs by library, sometimes in opposite directions
**Where:** across USS One and Extension Library's Desktop/Mobile files.
**Found:** Not a bug, just worth knowing — the two local libraries don't promote components from
"Testing 🟡" to core in the same order. Example: Desktop's Buttons page is core in Extension Library but
still "Testing 🟡" in USS One; Desktop's Cards page is the reverse (core in USS One, "Testing 🟡" in
Extension Library). Same pattern on Mobile for Buttons/Modals vs. Alert message/Badges/Cards/Carousel/
Header menu/Page hero.
**Impact:** Low as a bug, but worth flagging to whoever coordinates the two libraries' roadmaps, since a
consumer picking "the more finished" component may get a different answer depending on which library they
open.
**Suggested action:** No fix needed — purely FYI for planning purposes.

## 9. Extension Library: Facultad blue-gray values have no formal base ramp (pending task)
**Where:** Extension Library → Fundamentos de diseño → `_Base/` (missing) vs. Facultad accent tokens.
**Found:** USS One backs its Facultad accent tokens with a real 10-step base ramp, `_Base/Secondary`
(`10=#f6f8fb` … `100=#293f56`), that those tokens alias to. Extension Library has no equivalent ramp at
all — the same blue-gray values are hardcoded directly onto the Facultad accent tokens with nothing to
alias. (This became more visible now that the `Terciary` name slot next to it has been repurposed as the
new `Themes/Amatista` ramp — see item 4 — leaving the Facultad blue-gray with no formal home of its own.)
**Impact:** Low today (values are correct and match USS One), but medium risk going forward — without a
real ramp, there's nothing to keep every Facultad token in sync if one value ever needs to change; each
would have to be hand-edited individually.
**Decision (2026-08-28):** keep the Facultad accent tokens' values exactly as they are (no value change) —
just add a proper `_Base/Secondary` ramp with USS One's exact 10 values, so the Facultad tokens can alias
it instead of hardcoding. This is a **pending task**, not yet done in Figma; also noted in this repo's
`uss-extension-library-inventory` canvas for visibility.
**Suggested fix:** create `_Base/Secondary` in this file with USS One's 10-step values, then re-point the
Facultad accent tokens to alias it.

## 10. Two typographic values disagree between Figma and shipped code
**Where:** USS (main) → `tokens/typography.json` (desktop) `Títulos/H4` and `Otros/Display Tittle`, vs. the
published `@ussebastian/kitdigital` code's compiled `h4`/`.uss-h4` and `.uss-display` CSS rules.
**Found:**
- **H4 weight:** Figma's `Títulos/H4` (desktop) is `Montserrat Medium` (font-weight 500). The shipped code's
  `.uss-h4` at its desktop breakpoint (`≥1010px`) compiles to `font-weight: var(--font-weight-600)` — one
  step heavier. Every other heading level's weight (H1, H2, H3, H5, H6) matches its Figma counterpart
  exactly at both breakpoints; H4 is the only mismatch.
- **Display title size:** Figma's `Otros/Display Tittle` is 60px. The shipped code's `.uss-display` at
  desktop compiles to `font-size: var(--font-size-56)` (56px). Notably, the Kit's own SCSS source carries
  an inline comment directly above that line — `// antes era 60` ("used to be 60") — meaning this looks
  like an **intentional code-side change** that was never ported back to the Figma file, not a compilation
  accident.
**Impact:** Low-medium — a component/page built to the Figma spec for either style will render slightly
bolder (H4) or smaller (Display title) than what ships in production. Low risk of layout breakage, but a
real visual mismatch between "what the design system says" and "what actually renders."
**Suggested fix:** Confirm with whoever owns the shipped code whether these were deliberate. If yes (the
`// antes era 60` comment suggests so for the Display title), update Figma's `Títulos/H4` weight to
SemiBold (600) and `Otros/Display Tittle` size to 56px to match the code — per this repo's existing
precedent (item 6) that the shipped code is treated as canonical over Figma where the two disagree, unless
the design team says otherwise.

---

## Summary table

| # | Issue | File(s) | Severity |
|---|---|---|---|
| 1 | `spacing-216` = 220px instead of 216px | Extension Library | Bug |
| 2 | Stray `Boolean` variable in Radius collection | Extension Library | Bug |
| 3 | 195 duplicate Light-mode paint styles | Extension Library | Bug |
| 4 | Orphaned purple "Terciary" ramp, name collision | Extension Library | Decided: keep as new `Themes/Amatista` accent, fix duplicate step |
| 5 | Elevation 1/2 dark-mode colors inverted vs. main system | USS (main) vs. USS One | Needs decision (deferred by ModUSS's user for now) |
| 6 | Radius "full" value: 1000px (Figma) vs. 9999px (code) | Extension Library vs. shipped code | Decided: use 9999px (code) — Figma needs updating |
| 7 | Duplicate component sets (2 names) | Extension Library | Bug |
| 8 | Inconsistent Testing→core promotion order | USS One vs. Extension Library | Informational |
| 9 | Facultad blue-gray values have no formal `_Base/Secondary` ramp | Extension Library | Pending task: create the ramp, values unchanged |
| 10 | H4 weight (500 vs. 600) and Display title size (60px vs. 56px) disagree between Figma and shipped code | USS (main) vs. shipped code | Needs confirmation — code likely canonical (has an "antes era 60" comment) |

Full source data for every row above lives in this repo's `context/design.md`, `context/canonical-tokens.md`,
and the individual `tokens/*.json` files under each system's inventory folder, if more detail is needed
before fixing.
