# Design Reference — Cross-System Architecture

Dense reference for all 3 USS Figma systems. Read this instead of opening raw `tokens/*.json` across
multiple inventories. Full detail always lives in the respective inventory folder.

## Sources (9 Figma files, 3 per system)

| System | File | Key | Access |
|---|---|---|---|
| USS | Fundamentos de diseño | `16PDlIOKg8kb176dMz0Ckg` | edit |
| USS | Componentes Desktop | `nCGtIjrJLW6v4ZMvzTsOAd` | view |
| USS | Componentes Mobile | `uH4MBdFSPYvfxwXcrdFic9` | view (Comenzar page only) |
| USS One | Fundamentos de diseño | `w2FNtlyzRgJtrzkw7ywZHj` | edit |
| USS One | Componentes Desktop | `5XVuReA8as6xhPa0jUzVOg` | edit |
| USS One | Componentes Mobile | `joO68kJ8XUJ8NepohniIRC` | edit |
| Extension Library | Fundamentos de diseño | `sDv64Fnh1bMxJXMOlTTZf8` | edit |
| Extension Library | Componentes Desktop | `DSOeWAXEvG2O18rQLMSqAf` | edit |
| Extension Library | Componentes Mobile | `mVPBqzhfGqQkBJSrpLwEGV` | edit |

Desktop/Mobile files across all 3 systems reuse the **same page IDs** for shared pages (Badges, Buttons,
Divider, Image/video, Tags, Cards) — confirms common lineage/branching, not independent rebuilds.

## Token architecture per system

| Aspect | USS (original) | USS One | Extension Library |
|---|---|---|---|
| Color delivery | 144 variables, 2 modes (Light/Dark) | 343 canonical + 144 sync vars; light/dark encoded in NAMES not modes | **0 variables** — 529 paint styles (334 distinct) |
| Typography delivery | 156 text styles, no type variables | 235 vars (incl. 205 per-style line-heights) + text styles | 191 text styles, no type variables |
| Effect styles | 2 (Elevación 1/2) | 6 (2 legacy + 4-level `Elevacion/1-4`) | 6 (same as USS One) |
| Space tokens | 19, 1 mode | 19, 2 modes (same values) | 19, 1 mode ("Mobile"); `spacing-216`→220px drift |
| Radius tokens | 6 | 6 (2 collections, 1 sync mirror) | 8 — adds `Radius-1000` pill + stray `Boolean` var |
| Accent theming | none | **Facultad system** (on-light/on-dark A/B/C + Tono-Exito/Alerta/Error) | Facultad values present but hardcoded, not aliased; base ramp renamed `Terciary` with unrelated purple hex |
| Base palette size | ~92 swatches | ~92 swatches (adds Facultad ramp) | 85 distinct paint-style swatches |
| Known data-quality issues | Mobile component pages inaccessible (permissions) | Desktop porting behind Mobile (6 vs 27 pages) | 195 duplicate paint styles; duplicate component sets; value drift; stray variables |

All three systems share the **same brand hex values** where directly comparable (e.g. `Primary 90 =
#001894`, `Neutral 100 = #0b141f`) — confirmed by spot-checks across all three color deliveries. The
systems differ in *packaging* (variables vs. styles, mode strategy, accent layering), not in core brand
color.

## Component library completeness

| System | Desktop pages/sets/variants | Mobile pages/sets/variants | Notes |
|---|---|---|---|
| USS | 6 pages, ~40 named components | 1 accessible page (Comenzar index only) | Mobile per-component pages blocked by permissions |
| USS One | 6/33/323 | 27 core (of 48 total)/77/576 | Desktop's Buttons page marked "Testing 🟡" |
| Extension Library | 6/41/383 | 22 core (of ~48 total)/54/550 | Desktop's Cards page "Testing 🟡"; Mobile Buttons/Modals core (opposite of USS One) |

USS One and Extension Library are **not strictly sequential** — they're sibling branches with different
components promoted from Testing to core (see `gotchas/duplicate-styles-components.md` and each system's
README "What's different" section for the full component-maturity matrix).

## Naming conventions observed in Figma
- Semantic color tokens: `<Category>/<Token name>` e.g. `Surface/Surface - default`, folded under
  `Light mode/` or `☾ Dark mode/` (USS/USS One) or literal folder prefix (Extension Library paint styles).
- Base palette: `_Base/<RampName>/<RampName> NN` (NN = 10-step scale, 10=lightest…100=darkest).
- Component variant property `Estado` (Spanish "State") is the near-universal state-axis name; `☾ Dark
  mode` is the near-universal dark-mode boolean variant, present on almost every component set across all
  3 systems.
- `📱` suffix marks Mobile-specific component names; `(solo Desktop)` marks Desktop-only variants of a
  shared component.

## Open cross-system question (not yet answered)
Should these three systems be reconciled into one canonical token set, or are USS One / Extension Library
intentionally divergent branches (e.g. per-product or per-faculty customization layers)? Not decided —
flag to the user before attempting any consolidation work.
