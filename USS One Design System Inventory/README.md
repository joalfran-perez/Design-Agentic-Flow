# USS One — Design System Inventory

Unified inventory of variables, styles, and components extracted from the three **USS One** Figma files (the successor/evolution of the original "USS" system — see `USS Design System Inventory/` for that prior audit).

## Source files

| File | URL | Access |
|---|---|---|
| Fundamentos de diseño | https://www.figma.com/design/w2FNtlyzRgJtrzkw7ywZHj/USS-One---Fundamentos-de-diseño | Edit (Plugin API) |
| Componentes Desktop | https://www.figma.com/design/5XVuReA8as6xhPa0jUzVOg/USS-One---Componentes-Desktop | Edit (Plugin API) |
| Componentes Mobile | https://www.figma.com/design/joO68kJ8XUJ8NepohniIRC/USS-One---Componentes-Mobile | Edit (Plugin API) |

All three files use identical page IDs to the original "USS" files, and Mobile/Desktop consume tokens from the Foundations file as a shared library (no local token collections other than a couple of component-internal utility variables).

## Key metrics

| Metric | Count |
|---|---|
| Spacing tokens | 19 |
| Radius tokens | 6 |
| Canonical color variables ("Color" collection) | 343 |
| Sync color variables ("Figma-Color" collection) | 144 |
| Typography variables ("Tipografia" collection, incl. 205 per-style line-heights) | 235 |
| Effect styles (elevation) | 6 (2 legacy + 4 current + dark-mode flat replacements) |
| Local text styles (verbose + compact ramps, Desktop + Mobile) | ~200+ |
| Desktop: pages / component sets / variants | 6 / 33 / 323 |
| Mobile: pages / component sets / variants (core pages only) | 27 / 77 / 576 |

## What's new vs. the original USS system

- **Facultad accent theming**: a new blue-gray "Facultad" base ramp plus `on-light`/`on-dark` A/B/C semantic tokens, extended to `Tono-Exito`/`Tono-Alerta`/`Tono-Error` feedback accents — likely powers per-faculty/school branding on top of the shared component set. See `tokens/colors.json` → `facultadAccentSystem`.
- **Expanded elevation scale**: 4 shadow levels (`Elevacion/1`-`4`) replacing the legacy 2-level `Elevación 1/2`, plus flat dark-mode "replacement" surface colors.
- **Much larger color system**: 343 canonical color variables (vs. ~68 semantic + ~92 base in the original), including a second Secondary/blue-gray palette ramp.
- **Tokens-sync pipeline**: parallel `Figma-Color` / `Figma-Typography` collections with true Figma modes mirror the canonical `Color` / `Tipografia` collections — consistent with an external tokens-sync tool (e.g. Tokens Studio) now driving the design tokens.
- **Full edit access** on all three files (the original USS Desktop/Mobile files were read-only), which enabled direct Plugin API extraction instead of the REST metadata workarounds used previously.
- **Mobile component library is far more complete**: 27 core pages / 77 component sets vs. the original Mobile file, which only exposed a single "Comenzar" landing page under read-only access. It now covers the full component catalog (alerts, banners, breadcrumbs, cards, carousel, checkbox, dropdowns, footer, header/nav, links, pagination, radio, selects, steppers, switches, table, tabs, tags, text fields, toast, tooltip) plus Testing/Patterns/Sections/Templates staging pages.
- **Desktop is comparatively behind**: only 6 pages / 33 component sets ported so far, with the Buttons page explicitly marked "Buttons - Testing 🟡" — Desktop porting of USS One appears to be in progress.

## Contents

- `tokens/spacing.json` — 19-step spacing scale (identical to original USS)
- `tokens/radius.json` — 6-step radius scale (identical to original USS)
- `tokens/colors.json` — semantic light/dark tokens, base palettes, and the new Facultad accent system
- `tokens/typography.json` — font families/weights/sizes, compact type ramp, and verbose style matrix summary
- `tokens/effects.json` — elevation/shadow scale (legacy + current + dark-mode replacements)
- `components/desktop-components.md` — full page-by-page component breakdown (Desktop)
- `components/mobile-components.md` — full page-by-page component breakdown (Mobile, core pages)

## Notes on adaptive compression

Given the scale of this system (343+144 color variables, 235 typography variables incl. 205 line-heights, 77+33 component sets), raw dumps were avoided in favor of: resolving aliases to final hex/px values, grouping by semantic category, sampling representative variant-property schemas per component set rather than every individual variant combination, and calling out duplicate/sync collections instead of repeating their contents.
