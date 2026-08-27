# [Extension Library] USS — Design System Inventory

Unified inventory of variables, styles, and components extracted from the three **"[Extension Library] USS"** Figma files — a third branch/packaging of the same underlying USS design system, alongside `USS Design system Inventory/` (original) and `USS One Design System Inventory/` (successor).

## Source files

| File | URL | Access |
|---|---|---|
| Fundamentos de diseño | https://www.figma.com/design/sDv64Fnh1bMxJXMOlTTZf8/-Extension-Library--USS---Fundamentos-de-diseño | Edit (Plugin API) |
| Componentes Desktop | https://www.figma.com/design/DSOeWAXEvG2O18rQLMSqAf/-Extension-Library--USS---Componentes-Desktop | Edit (Plugin API) |
| Componentes Mobile | https://www.figma.com/design/mVPBqzhfGqQkBJSrpLwEGV/-Extension-Library--USS---Componentes-Mobile | Edit (Plugin API) |

All three files reuse the same page IDs as USS/USS One where pages are shared (e.g. Badges, Buttons, Divider, Image/video, Tags, Cards), confirming common lineage.

## Key metrics

| Metric | Count |
|---|---|
| Spacing tokens | 19 (1 value drifted: `spacing-216` = 220px here) |
| Radius tokens | 8 (6 shared + new `Radius-1000` pill token + 1 stray non-radius `Boolean` variable) |
| Local color **variables** | 0 — none exist; color is delivered entirely via paint styles |
| Local paint styles | 529 total / **334 distinct** (195 are exact duplicates, all in "Light mode") |
| Local text styles | 191 (no local typography variables at all) |
| Effect styles | 6 (2 legacy + 4 current elevation, same math as USS One) |
| Desktop: pages / component sets / variants | 6 / 41 / 383 |
| Mobile: pages / component sets / variants (core pages only) | 22 / 54 / 550 |

## What's different vs. USS One

- **No color or typography variables at all.** This file drops USS One's `Color`/`Figma-Color` (343/144 vars) and `Tipografia`/`Figma-Typography` (235 vars) collections entirely — it only keeps `Space` and `Radius` as local variable collections. Color and type are instead delivered as classic **paint styles** (529) and **text styles** (191), consistent with this file's role as a lighter-weight "Extension Library" that layers on top of a consumed/published core library rather than owning canonical tokens.
- **Heavy style duplication.** Every one of the 65 distinct "Light mode" semantic paint styles (Background/Surface/Border/Text/Links/Text interactive/Icons/Feedback/Focus/Buttons) exists as **4 identical copies** with different IDs — 195 redundant style objects, almost certainly a library-hygiene artifact from repeated imports/merges rather than a deliberate pattern (Dark mode styles are clean, 1x each).
- **A new, unrelated purple "Terciary" base ramp** (`_Base/Terciary/10-100`, `#f5eff9`→`#402851`) replaces where USS One kept a blue-gray "Secondary"/"Facultad" base ramp — yet the Facultad/USS accent tokens still resolve to the ORIGINAL blue-gray hex values, suggesting they're now hardcoded rather than aliased to any local base group.
- **Different dark-mode elevation replacement color** (`#121c27`, flat across all 4 levels) vs. USS One's 2-tone `#202a37`/`#242f3c`.
- **New `Radius-1000`** pill/full-round token and a **new `Mobile/Navigation Label`** text style group (4 styles) for bottom-nav labels — both absent from USS One.
- **Inverted component maturity vs. USS One**: Desktop's Buttons page is stable/core here (it was "Testing 🟡" in USS One) while Desktop's Cards page is now the one marked "Testing 🟡" (it was core in USS One). On Mobile, Buttons and Modals are core here but were Testing-only in USS One, while Alert message/Badges/Cards/Carousel/Header menu/Page hero — core in USS One — are still Testing here.
- **Component-set duplication**: "Button icon 📱" (Mobile) and "Card Persona S horizontal" (Desktop) each exist as two separate, identically-named component sets.

## Contents

- `tokens/spacing.json` — 19-step spacing scale (1 value drift flagged)
- `tokens/radius.json` — 8-token radius scale (2 new/anomalous entries flagged)
- `tokens/colors.json` — paint-style inventory: semantic tokens, base palettes (incl. the new purple "Terciary" ramp), Facultad accent system, and the duplication finding
- `tokens/typography.json` — text-style breakdown (verbose + compact ramps, no local type variables)
- `tokens/effects.json` — elevation/shadow scale (legacy + current + dark-mode replacement)
- `components/desktop-components.md` — full page-by-page component breakdown (Desktop)
- `components/mobile-components.md` — full page-by-page component breakdown (Mobile, core pages)

## Notes on adaptive compression

Given the file's scale (529 paint styles, 191 text styles, 54+41 component sets), values were sampled and cross-checked against the already-catalogued USS One brand palette rather than re-dumping every hex; category counts and representative variant-property schemas were captured per component set instead of every individual variant permutation; and duplicate/near-duplicate definitions were called out explicitly as data-quality findings rather than silently de-duplicated.
