# USS Design System — Unified Inventory

**Role: main / core system.** This is the canonical USS design system. Two local libraries are connected
to it — [`USS One Design System Inventory/`](../USS%20One%20Design%20System%20Inventory/README.md) and
[`USS Extension Library Design System Inventory/`](../USS%20Extension%20Library%20Design%20System%20Inventory/README.md)
— see `decisions/010` for the hierarchy and `context/design.md` for the full cross-library comparison.

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
| Desktop component sets / variants | 106 / 920 (32 core pages) |
| Mobile component sets / variants | 93 / 776 (30 core pages) |

## Access scope for this inventory

The account used has **edit access** to the Fundamentos de diseño (Foundations) file, so its full variable
collections and styles were read live via the Figma Plugin API. The Desktop and Mobile component files are
**view-only** for this account; both were extracted via read-only Plugin API scripts.

**Correction (2026-09-25):** this inventory previously stated that Mobile exposed only its
"👋🏼 Comenzar" page and that Desktop held only 6 component pages. Both were **read-channel
artifacts**, not permissions limits — `get_metadata` under-counts pages on both files, while a
read-only Plugin API script returns the full list (Mobile 44, Desktop 46). Both files are now
extracted in full; see [`components/desktop-components.md`](components/desktop-components.md),
[`components/mobile-components.md`](components/mobile-components.md), `decisions/021`, and
`decisions/022`. Nothing was written to any Figma file — the main/core system stays read-only per
`decisions/012`.

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

**46 pages; 32 core component pages deep-scanned** (the same 30 as Mobile, plus Navigation stack and
Sheets). No Testing section. **106 sets / 920 variants — the largest Desktop library of the three.**

Full per-page component/variant breakdown: [`components/desktop-components.md`](components/desktop-components.md).

Sampling across these pages confirms they consume the exact same semantic tokens as the Foundations
file — one shared design-token library published across all three files, not three independent palettes.

## 3 · Componentes Mobile

**44 pages; 30 core component pages deep-scanned** (Accordion, Alert message, Badges, Banners, Breadcrumbs,
Buttons, Cards, Carousel, Checkbox, Divider, Dropdown list, Footer, Header menu, Image/video, Link, Linked
list, Modals, Page hero, Pagination, Radio button, Select, Select date, Steppers, Switch toggle, Table,
Tabs, Tags, Text field, Toast, Tooltip). Built for viewports up to 575px wide.

Full per-page component/variant breakdown:
[`components/mobile-components.md`](components/mobile-components.md).

**93 component sets, 776 variants — the largest Mobile library of the three systems** (USS One: 77/576;
Extension Library: 54/550), and the only one with **no "Testing 🟡" staging section**: every component page
here is core. Combined with the Desktop re-extraction the same day (106/920 across 32 core pages, also
no Testing), the main/core system is the most complete catalog on **both** channels — the "narrowest
capture" assumption does not survive.
