# USS Design System — Unified Inventory

Variables, components, and styles extracted from the three USS Figma files. Color values are resolved
through their alias chains to final hex. See the `tokens/` folder for machine-readable design tokens and
`components/` for the component/variant inventory.

An interactive version of this same inventory is also available as a Cursor canvas:
`~/.cursor/projects/c-Users-Genesys-ModUSS/canvases/uss-design-system-inventory.canvas.tsx`

## Source files

| File | URL |
|---|---|
| USS — Fundamentos de diseño (Foundations) | https://www.figma.com/design/16PDlIOKg8kb176dMz0Ckg/USS---Fundamentos-de-dise%CC%83o |
| USS — Componentes Desktop | https://www.figma.com/design/nCGtIjrJLW6v4ZMvzTsOAd/USS---Componentes-Desktop |
| USS — Componentes Mobile | https://www.figma.com/design/uH4MBdFSPYvfxwXcrdFic9/USS---Componentes-Mobile |

## At a glance

| Metric | Count |
|---|---|
| Figma files | 3 |
| Variables (Space + Color + Radius) | 169 |
| Text styles | 156 |
| Effect styles | 2 |
| Legacy paint styles | 208 |
| Named components (Desktop library) | ~40 |

## Access scope for this inventory

The account used has **edit access** to the Fundamentos de diseño (Foundations) file, so its full variable
collections and styles were read live via the Figma Plugin API. The two component-library files (Desktop,
Mobile) are **view-only** for this account: their component/variant structure was captured from Figma's
metadata and variable-usage endpoints instead.

The Mobile file currently exposes only its "👋🏼 Comenzar" index page to this account — its dedicated
component pages (Buttons, Cards, Tags, etc., mirrored from Desktop at ≤575px) are not listed by the
document's page index under current permissions. Variable sampling on the Comenzar frame confirms it
resolves the same token set as Desktop and Foundations, so the mobile component set is built on the
identical design-token foundation — only page-level access differs.

## 1 · Fundamentos de diseño (Foundations)

**Pages:** "👋🏼 Comenzar" (intro) · "Logotipos" (logo lockups — vertical/horizontal × light/dark, legacy
versions, 2025/2021 accreditation marks)

| | |
|---|---|
| Space tokens | 19 (1 mode) |
| Color variables | 144 (Light/Dark modes) |
| Radius tokens | 6 (1 mode) |
| Text styles | 156 |
| Effect styles | 2 |
| Legacy paint styles | 208 |

Full token values: [`tokens/spacing.json`](tokens/spacing.json), [`tokens/radius.json`](tokens/radius.json),
[`tokens/colors.json`](tokens/colors.json), [`tokens/typography.json`](tokens/typography.json),
[`tokens/effects.json`](tokens/effects.json).

Key insight: base-palette primitives (Neutral, Primary, etc.) are **mode-invariant** — the same hex value in
both Light and Dark mode. Semantic tokens (`Color Tokens/...`) alias different primitives per mode; that
indirection is what implements theming.

## 2 · Componentes Desktop

**Pages:** "👋🏼 Comenzar" · Badges · Buttons · Cards · Divider · Image / video · Tags

Full per-page component/variant breakdown: [`components/desktop-components.md`](components/desktop-components.md).

Sampling `get_variable_defs` across these pages confirms they consume the exact same semantic tokens as the
Foundations file (e.g. `Color Tokens/Text/Strong`, `Light mode/Surface/Interactive default`, `Elevación 1`) —
one shared design-token library published across all three files, not three independent palettes.

## 3 · Componentes Mobile

**Accessible page:** "👋🏼 Comenzar" (index)

Notes: [`components/mobile-notes.md`](components/mobile-notes.md).

The Comenzar page is a scrolling index of ~30 `Card M` link-cards grouped under implicit sections ending in
dividers labeled `Patterns` and `Templates` — the same structure as the Desktop file's own landing page, just
organized for viewports up to 575px wide.
