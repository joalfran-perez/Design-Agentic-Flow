# Design Reference — Main System + Local Libraries Architecture

Dense reference for the USS design system hierarchy: one **main/core system** (`USS Design System
Inventory/`) plus two **local libraries connected to it** (`USS One Design System Inventory/`,
`USS Extension Library Design System Inventory/`) — see `decisions/010`. Read this instead of opening raw
`tokens/*.json` across multiple inventories. Full detail always lives in the respective inventory folder.

This is an organizational/reference model: each local library still has its own separate Figma Foundations
file and its own genuinely different token-delivery architecture (`decisions/004`) — "connected to" reflects
shared lineage (see page-ID evidence below), not a literal shared Figma library asset. Don't assert a literal
technical link without new Figma evidence.

## Sources (9 Figma files — 1 main system + 2 local libraries, 3 files each)

| Role | System | File | Key | Access |
|---|---|---|---|---|---|
| **Main / core** | USS | Fundamentos de diseño | `16PDlIOKg8kb176dMz0Ckg` | edit |
| **Main / core** | USS | Componentes Desktop | `nCGtIjrJLW6v4ZMvzTsOAd` | view |
| **Main / core** | USS | Componentes Mobile | `uH4MBdFSPYvfxwXcrdFic9` | view (Comenzar page only) |
| Local library | USS One | Fundamentos de diseño | `w2FNtlyzRgJtrzkw7ywZHj` | edit |
| Local library | USS One | Componentes Desktop | `5XVuReA8as6xhPa0jUzVOg` | edit |
| Local library | USS One | Componentes Mobile | `joO68kJ8XUJ8NepohniIRC` | edit |
| Local library | Extension Library | Fundamentos de diseño | `sDv64Fnh1bMxJXMOlTTZf8` | edit |
| Local library | Extension Library | Componentes Desktop | `DSOeWAXEvG2O18rQLMSqAf` | edit |
| Local library | Extension Library | Componentes Mobile | `mVPBqzhfGqQkBJSrpLwEGV` | edit |

Desktop/Mobile files across the main system and both local libraries reuse the **same page IDs** for shared
pages (Badges, Buttons, Divider, Image/video, Tags, Cards) — confirms common lineage/branching, not
independent rebuilds. This shared lineage is the evidence behind modeling USS One and Extension Library as
libraries *connected to* the main system rather than unrelated rebuilds.

## Token architecture: main system vs. each local library

| Aspect | USS (main / core) | USS One (local library) | Extension Library (local library) |
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

| Role | System | Desktop pages/sets/variants | Mobile pages/sets/variants | Notes |
|---|---|---|---|---|
| Main / core | USS | 6 pages, ~40 named components | 1 accessible page (Comenzar index only) | Mobile per-component pages blocked by permissions |
| Local library | USS One | 6/33/323 | 27 core (of 48 total)/77/576 | Desktop's Buttons page marked "Testing 🟡" |
| Local library | Extension Library | 6/41/383 | 22 core (of ~48 total)/54/550 | Desktop's Cards page "Testing 🟡"; Mobile Buttons/Modals core (opposite of USS One) |

USS One and Extension Library, as the two local libraries, are **not strictly sequential relative to each
other** — they're both connected to the main system but have different components promoted from Testing to
core independently of one another (see `gotchas/duplicate-styles-components.md` and each library's README
"What's different" section for the full component-maturity matrix). `context/code-design-mapping.md` adds a
third data point: the published code library implements several components (Accordion, AlertMessage,
Banner, Breadcrumb, Carousel, Footer, Header, Hero, Link, LinkedList, Pagination, Stepper, Table, Tabs,
Toast, Tooltip, Form) that only exist in the USS One local library's catalog, not the main system's
narrower Desktop/Mobile capture — a concrete example of a local library carrying components the main
system's own Figma capture doesn't (yet) expose.

## Naming conventions observed in Figma
- Semantic color tokens: `<Category>/<Token name>` e.g. `Surface/Surface - default`, folded under
  `Light mode/` or `☾ Dark mode/` (USS/USS One) or literal folder prefix (Extension Library paint styles).
- Base palette: `_Base/<RampName>/<RampName> NN` (NN = 10-step scale, 10=lightest…100=darkest).
- Component variant property `Estado` (Spanish "State") is the near-universal state-axis name; `☾ Dark
  mode` is the near-universal dark-mode boolean variant, present on almost every component set across all
  3 systems.
- `📱` suffix marks Mobile-specific component names; `(solo Desktop)` marks Desktop-only variants of a
  shared component.

## Hierarchy decided; token reconciliation still open
`decisions/010` (2026-08-28) settled the *organizational* question: USS is the main/core system, USS One and
Extension Library are local libraries connected to it. Still **not decided**: whether their token sets
should ever be technically reconciled into one canonical schema, or are intentionally divergent per-library
customization layers (e.g. per-product or per-faculty branding — see the `--custom-secondary-*` CSS
override evidence in `context/code-design-mapping.md`, which supports the "intentional divergence" reading).
Flag to the user before attempting any consolidation work; `decisions/004` already forbids normalizing the
per-file data silently.
