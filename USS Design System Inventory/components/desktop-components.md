# Componentes Desktop — Component Inventory

Source: https://www.figma.com/design/nCGtIjrJLW6v4ZMvzTsOAd/USS---Componentes-Desktop

**Extracted 2026-09-25.** This file replaces the earlier 6-page capture (Badges / Buttons / Cards /
Divider / Image-video / Tags). That list was a **read-channel artifact**, not the real file:
`get_metadata` with no `nodeId` enumerates only those 6 component pages plus Comenzar, while a
read-only `use_figma` script returns all 46. Same channel difference already documented for Mobile
(`decisions/021`); confirmed here for Desktop (`decisions/022`).

Captured via the Plugin API (read-only scripts, one call per page), except **Sheets**, where
`use_figma` threw the genuine view-only error and the page was recovered via `get_metadata`. Nothing
was written to the file — the main/core system's Figma files remain read-only per `decisions/012`.

## Summary

| Metric | Count |
|---|---|
| Pages in file | 46 |
| Core component pages (deep-scanned) | 32 |
| Component sets | 106 |
| Variants | 920 |
| Loose components (not in a set) | 11 |
| Staging/section/index pages (not deep-scanned) | 14 |

**No "Testing 🟡" staging section exists in this file** — every component page is core. The catalog
has **parity with this system's Mobile file** (the same 30 pages) plus two Desktop-only pages:
**Navigation stack** and **Sheets**. This is the largest Desktop library of the three.

## Accordion (6 sets, 30 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Group row | 6 | Dark mode, State (Default/Hover/Active) |
| Assets/Content | 2 | Dark mode |
| Accordion | 2 | Dark mode |
| Contenido de accordion | 14 | Dark mode, Contenido (7) |
| Feature list item | 4 | Dark mode, Type (Strong h6 / Subtle body) |
| Feature list | 2 | Dark mode |

Desktop `Assets/Group row` includes a Hover state (6 variants) that the Mobile set does not (4).

## Alert message (2 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Alert message | 8 | Dark mode, Type (Info/Warning/Error/Success) |
| Top page alert message | 8 | Dark mode, type (4) |

## Badges (2 sets, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Badge | 10 | Dark mode, Tipo (Neutral/Info/Success/Alert/Error) |
| Badge dot | 2 | Dark mode |

## Banners (2 sets, 6 variants)
| Component | Variants | Key properties |
|---|---|---|
| Split banner | 4 | Dark mode, IMG invert |
| Main banner | 2 | Tipografía display |

## Breadcrumbs (2 sets, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item breadcrumbs | 10 | Dark mode, Estado (Default/Hover/Active/Focus/Pag actual) |
| Breadcrumbs | 2 | Dark mode |

## Buttons (7 sets, 148 variants)
| Component | Variants | Key properties |
|---|---|---|
| Button primary | 30 | Dark mode, Tamaño (3), Estado (5 — includes Hover) |
| Button secondary | 30 | Dark mode, Tamaño (3), Estado (5) |
| Button tertiary | 30 | Dark mode, Tamaño (3), Estado (5) |
| Button icon | 30 | Dark mode, Tamaño (3), Estado (5) |
| Button float | 10 | Dark mode, Estado (5) |
| Button full width | 10 | Dark Mode, Estado (5) |
| _Focus element | 8 | Dark mode, Border Radius (4 shapes) |

All Desktop buttons carry Hover. Mobile drops Hover on every set except `Button full width 📱` — see
data-quality flag 3 / report item 14.

## Cards (18 sets, 115 variants)
| Component | Variants | Key properties |
|---|---|---|
| Card M Vertical | 6 | Dark mode, Background (BG1/BG2/None-borde) |
| Card M Horizontal (solo Desktop) | 6 | Dark mode, Background (3) |
| Card S Vertical | 6 | Dark mode, Background (3) |
| Card S Horizontal (solo Desktop) | 6 | Dark mode, Background (3) |
| Card Atributo - Horizontal | 6 | Dark mode, Background (3) |
| Card Atributo - Vertical | 6 | Dark mode, Background (3) |
| Card Metrica KPI | 4 | Dark mode, Background (BG1/BG2) |
| Card Persona S horizontal | 6 | Dark mode, Background (3) |
| Card Persona S vertical | 6 | Dark mode, Background (3) |
| Card Persona M horizontal (solo Desktop) | 6 | Dark mode, Background (3) |
| Card Persona M Vertical | 6 | Dark mode, Background (3) |
| Feature card | 4 | Dark mode, Background (BG1/BG2) |
| grid cards | 6 | Dark mode, card type (S-4col / M-3col / M-2col) |
| Card ghost | 4 | **BROKEN** — `componentPropertyDefinitions` throws |
| card background image | 3 | DetallesConHover, state (default/hover) |
| grid cards (2nd set) | 2 | Dark mode |
| card icono | 16 | Dark mode, Estado (4), Border |
| card interactivo | 16 | Dark mode, Tamaño (M/S), Estado (4) |

Two identically named `grid cards` sets (6 + 2). `Card ghost` is a broken set — see flag 1.

## Carousel (7 sets, 48 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Slide indicator control | 10 | Dark mode, State (5) |
| Assets/Carousel controls | 4 | Dark mode, Left buttons |
| Assets/Item slider control | 20 | Dark mode, Estado (5), Invertir |
| Assets/Slider control buttons | 2 | Dark mode |
| Card carousel | 8 | Dark mode, Card size (S/M), Wide card |
| Single content carousel | 2 | Dark mode |
| Card icono carousel | 2 | Dark mode |

## Checkbox (2 sets, 48 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Checkbox | 24 | Dark mode, Checked, Indeterminate, Estado (4) |
| Checkbox | 24 | same axes |

## Divider (2 sets, 4 variants)
| Component | Variants | Key properties |
|---|---|---|
| Divider sections (full width) | 2 | Dark mode |
| Divider contents | 2 | Dark mode |

## Dropdown list (combo box) (2 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item dropdown list | 12 | Dark mode, Tipo (Item/Título), Estado (5) |
| Dropdown list box | 4 | Dark mode, Checkbox |

## Footer (1 set, 2 variants)
| Component | Variants | Key properties |
|---|---|---|
| Footer | 2 | Dark mode |

## Header menu (9 sets, 66 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item navbar | 16 | Dark mode, Estado (4), Link sitio externo |
| Assets/Item topbar | 10 | Dark mode, Estado (5) |
| Assets/Topbar | 2 | Dark mode |
| Assets/Navbar | 2 | Dark mode |
| Header menu - standard | 2 | Dark mode |
| Header menu - CTA | 2 | Dark mode |
| Assets/Item dropdown menu | 26 | Dark mode, Tipo (2), Sitio externo, Estado (5) |
| Assets/Columna dropdown menu | 2 | Dark mode |
| Dropdown menu | 4 | Dark mode, Títulos |

Unlike the Mobile sibling `Assets/Item dropdown menu 📱` (report item 11), this Desktop set is
readable — `componentPropertyDefinitions` does not throw.

## Image / video (2 sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Image frame img | 12 | Aspect ratio (6), Vertical (No/Yes) |
| Video frame | 2 | Aspect ratio (16:9 / 4:3) |

`Aspect ratio` is a variant property, not a standalone component — same packaging as Mobile.

## Link (1 set, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Link enlace | 12 | Dark mode, Estado (Default/Hover/Focus/Disabled/Active/Visited) |

## Linked list (2 sets, 22 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item linked list | 20 | Dark mode, Estado (5), Link sitio externo |
| Linked list | 2 | Dark mode |

## Modals (3 sets + 1 loose, 36 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Modal icon | 16 | Dark mode, Type (4), Large |
| Assets/Modal footer | 4 | Dark mode, Centered |
| Modal | 16 | Dark mode, Type (4), Centered |

Loose: `Assets/Modal backdrop background`.

## Navigation stack (3 sets + 1 loose, 12 variants) — Desktop-only
| Component | Variants | Key properties |
|---|---|---|
| navigation stack | 2 | Dark mode |
| assets/Navigation list item | 8 | Dark mode, state (4) |
| Navigation list | 2 | Dark mode |

Loose: `assets/stack header`. No Mobile counterpart in any of the three systems.

## Pagination (2 sets, 28 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item pagination | 24 | Dark mode, Estado (6), Arrow |
| Pagination | 4 | Dark mode, Extended |

## Page hero (6 sets + 1 loose, 39 variants)
| Component | Variants | Key properties |
|---|---|---|
| Simple centered | 4 | Dark mode, Tipografía display |
| Simple + image | 12 | Dark mode, img ratio (1:1/4:3), Horizontal, Tipografía display |
| Simple + form | 4 | Dark mode, Horizontal (False only), Tipografía display |
| Slider carousel | 2 | tipografía display |
| Simple + background image | 2 | Tipografía display |
| Assets/opacity layer | 15 | type (5 gradients), Color (neutral/secondary/primary) |

Loose: `_assets/form content example`. `Assets/opacity layer` is the Figma model for the code
`OpacityLayer` utility — a property/set, not a missing component.

## Radio button (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Radio button | 12 | Dark mode, Checked, Estado (Default/Focus/Disabled) |
| Radio button | 12 | same axes |

## Select (1 set, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Select | 12 | Dark mode, Estado (Default/Active-Focus/Disabled/Error/Alert/Success) |

## Select date (2 sets, 26 variants)
| Component | Variants | Key properties |
|---|---|---|
| Select date simple | 12 | Dark mode, Estado (6) |
| Select date range | 14 | Dark mode, Estado (7, including Active/focus desde/hasta) |

## Sheets (2 sets + 8 loose, 12 variants) — Desktop-only
Recovered via `get_metadata` after `use_figma` threw read-only on this page only.

| Component | Variants | Key properties |
|---|---|---|
| Bottom sheet | 4 | dark mode, is modal |
| side sheet | 8 | dark mode, is modal, width (400px/600px) |

Loose content-slot examples: `_sheet content example` 1–4, `_side sheet content example` 1–4.
No Mobile counterpart.

## Steppers (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item step | 16 | Dark mode, Condensed, Estado (Inactive/Active-Current/Done/Error) |
| Stepper | 8 | Dark mode, Condensed, Descripción |

## Switch toggle (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Switch toggle | 12 | Dark mode, Checked, Estado (Default/Focus/Disabled) |
| Switch toggle | 12 | same axes |

## Table (4 sets, 22 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Table head cell | 4 | Dark mode, Size (Large/Small) |
| Assets/Table cell | 6 | Dark mode, Size (Small / Large-B / Large-A) |
| Assets/Table Column | 8 | Dark mode, Size, Align right |
| Table | 4 | Dark mode, Size (Large/Small) |

## Tabs (2 sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item tab | 12 | Dark mode, Estado (Default/Hover/Pressed/Selected/Focus/Disabled) |
| Tabs | 2 | Dark mode |

## Tags (2 sets, 30 variants)
| Component | Variants | Key properties |
|---|---|---|
| Tag secondary | 20 | Dark mode, Estado (5), type (navigation/selection \| toggle) |
| Tag primary | 10 | Dark mode, Estado (5) |

## Text field (4 sets, 36 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Icon help | 4 | Dark mode, Hover |
| Assets/Validation help text | 8 | Dark mode, Tipo (Error/Alerta/Exito/Ayuda) |
| Text field | 12 | Dark mode, Estado (6) |
| Text area | 12 | Dark mode, Estado (6) |

`Assets/Icon help` is the only named icon component; other icons are `INSTANCE_SWAP` slots.

## Toast (1 set, 8 variants)
| Component | Variants | Key properties |
|---|---|---|
| Toast | 8 | Dark mode, Type (Info/Success/Warning/Error) |

## Tooltip (1 set, 2 variants)
| Component | Variants | Key properties |
|---|---|---|
| Tooltip | 2 | Dark mode |

## Not deep-scanned (14 pages)

Index / dividers / history: `👋🏼 Comenzar`, `---`, `Historial de actualizaciones`,
`Reciclaje temporal`, `Thumbnail`.

Patterns: `___________PATTERNS__________`, `Filters`, `Forms`.

Sections: `___________SECCIONES__________`, `Métricas y KPIs`, `Testimonios`.

Other: `___________OTROS__________`, `Separador decorativo`, `Slot`.

## Data-quality flags

1. **`Card ghost` is a broken component set.** `componentPropertyDefinitions` throws
   `Component set has existing errors`. Same class of bug as Mobile item 11
   (`reports/figma-data-quality-issues.md` item 15). 4 child variants are still present.
2. **Two `grid cards` sets** on the same page (6 + 2 variants), identically named.
3. **Desktop buttons have Hover; Mobile mostly does not** — already item 14. Confirmed on the
   full Desktop re-read: every Desktop button set uses the 5-state axis.
4. **Sheets page is the only core page that rejected `use_figma`** on this view-only file
   (threw read-only). Structure recovered via `get_metadata`. Not a missing page — a per-page
   channel quirk. See `gotchas/figma-read-only-access.md`.
