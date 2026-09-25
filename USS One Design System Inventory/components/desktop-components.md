# USS One — Componentes Desktop

Source: https://www.figma.com/design/5XVuReA8as6xhPa0jUzVOg/USS-One---Componentes-Desktop

**Extracted 2026-09-25.** Replaces the earlier 6-page capture. That list was a `get_metadata`
under-count, not a half-ported file: the Plugin API returns **51 pages**. See `decisions/022`.

Access: **edit** (via `use_figma`). Local variables: a single small `propiedades` collection with 2
utility variables — not design tokens. Color/spacing/typography come from the USS One Foundations library.

## Summary

| Metric | Count |
|---|---|
| Pages in file | 51 |
| Core component pages (deep-scanned) | 28 |
| Component sets | 88 |
| Variants | 676 |
| Loose components | 10 |
| Testing 🟡 pages (not deep-scanned) | 6 |
| Other staging/index pages (not deep-scanned) | 17 |

Desktop porting is **not** "6 pages behind Mobile." The file is a near-complete catalog. What is
actually behind: **Buttons, Tags, Accordion, Modals** (and Empty State, Breadcrumb-Tittle) still sit
in Testing, so those four core-catalog pages are missing from the counts above.

## Alert message (2 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Alert message | 8 | Dark mode, Type (4) |
| Top page alert message | 8 | Dark mode, type (4) |

## Badges (2 sets, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Badge | 10 | Dark mode, Tipo (5) |
| Badge dot | 2 | Dark mode |

## Banners (2 sets, 6 variants)
| Component | Variants | Key properties |
|---|---|---|
| Split banner | 4 | Dark mode, IMG invert |
| Main banner | 2 | Tipografía display |

## Breadcrumbs (2 sets, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item breadcrumbs | 10 | Dark mode, Estado (5) |
| Breadcrumbs | 2 | Dark mode |

## Cards (18 sets, 115 variants)
| Component | Variants | Key properties |
|---|---|---|
| Card M Vertical | 6 | Dark mode, Background (3) |
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
| grid cards | 6 | Dark mode, card type (3) |
| Card ghost | 4 | Dark mode (**junk options `☾ Dark mode3` / `☾ Dark mode4`**), Type (Icono/Imagen) |
| card background image | 3 | DetallesConHover, state |
| grid cards (2nd set) | 2 | Dark mode |
| card icono | 16 | Dark mode, Estado (4), Border |
| card interactivo | 16 | Dark mode, Tamaño (M/S), Estado (4) |

`Card ghost` is readable here (unlike the main system's broken set) but its Dark-mode axis is
polluted — see flag 1 / report item 16.

## Carousel (7 sets, 48 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Slide indicator control | 10 | Dark mode, State (5) |
| Assets/Carousel controls | 4 | Dark mode, Left buttons |
| Assets/Item slider control | 20 | Dark mode, Estado (5), Invertir |
| Assets/Slider control buttons | 2 | Dark mode |
| Card carousel | 8 | Dark mode, Card size, Wide card |
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
| Assets/Item dropdown list | 12 | Dark mode, Tipo, Estado (5) |
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
| Assets/Item dropdown menu | 26 | Dark mode, Tipo, Sitio externo, Estado (5) |
| Assets/Columna dropdown menu | 2 | Dark mode |
| Dropdown menu | 4 | Dark mode, Títulos |

## Image / video (2 sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Image frame img | 12 | Aspect ratio (6), Vertical |
| Video frame | 2 | Aspect ratio (2) |

## Link (1 set, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Link enlace | 12 | Dark mode, Estado (6) |

## Linked list (2 sets, 22 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item linked list | 20 | Dark mode, Estado (5), Link sitio externo |
| Linked list | 2 | Dark mode |

## Navigation stack (3 sets + 1 loose, 12 variants) — Desktop-only
| Component | Variants | Key properties |
|---|---|---|
| navigation stack | 2 | Dark mode |
| assets/Navigation list item | 8 | Dark mode, state (4) |
| Navigation list | 2 | Dark mode |

Loose: `assets/stack header`.

## Pagination (2 sets, 28 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item pagination | 24 | Dark mode, Estado (6), Arrow |
| Pagination | 4 | Dark mode, Extended |

## Page hero (6 sets + 1 loose, 39 variants)
| Component | Variants | Key properties |
|---|---|---|
| Simple centered | 4 | Dark mode, Tipografía display |
| Simple + image | 12 | Dark mode, img ratio, Horizontal, Tipografía display |
| Simple + form | 4 | Dark mode, Horizontal (False only), Tipografía display |
| Slider carousel | 2 | tipografía display |
| Simple + background image | 2 | Tipografía display |
| Assets/opacity layer | 15 | type (5), Color (3) |

Loose: `_assets/form content example`.

## Radio button (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Radio button | 12 | Dark mode, Checked, Estado (3) |
| Radio button | 12 | same axes |

## Select (1 set, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Select | 12 | Dark mode, Estado (6) |

## Select date (2 sets, 26 variants)
| Component | Variants | Key properties |
|---|---|---|
| Select date simple | 12 | Dark mode, Estado (6) |
| Select date range | 14 | Dark mode, Estado (7) |

## Sheets (2 sets + 8 loose, 12 variants) — Desktop-only
| Component | Variants | Key properties |
|---|---|---|
| Bottom sheet | 4 | dark mode, is modal |
| side sheet | 8 | dark mode, is modal, width (400px/600px) |

Loose: `_sheet content example` 1–4, `_side sheet content example` 1–4.

## Steppers (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item step | 16 | Dark mode, Condensed, Estado (4) |
| Stepper | 8 | Dark mode, Condensed, Descripción |

## Switch toggle (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Switch toggle | 12 | Dark mode, Checked, Estado (3) |
| Switch toggle | 12 | same axes |

## Table (4 sets, 22 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Table head cell | 4 | Dark mode, Size |
| Assets/Table cell | 6 | Dark mode, Size (3) |
| Assets/Table Column | 8 | Dark mode, Size, Align right |
| Table | 4 | Dark mode, Size |

## Tabs (2 sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item tab | 12 | Dark mode, Estado (6) |
| Tabs | 2 | Dark mode |

## Text field (4 sets, 36 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Icon help | 4 | Dark mode, Hover |
| Assets/Validation help text | 8 | Dark mode, Tipo (4) |
| Text field | 12 | Dark mode, Estado (6) |
| Text area | 12 | Dark mode, Estado (6) |

## Toast (1 set, 8 variants)
| Component | Variants | Key properties |
|---|---|---|
| Toast | 8 | Dark mode, Type (4) |

## Tooltip (1 set, 2 variants)
| Component | Variants | Key properties |
|---|---|---|
| Tooltip | 2 | Dark mode |

## Not deep-scanned

**Testing 🟡 (6):** `Accordion - Testing 🟡`, `Breadcrumb-Tittle - Testing 🟡`,
`Buttons - Testing 🟡`, `Empty State - Testing 🟡`, `Modals - Testing 🟡`,
`Tags - Testing 🟡`.

Index / dividers / history: `👋🏼 Comenzar`, `---`, `___________TESTING___________`,
`___________PATTERNS__________`, `Filters`, `Forms`, `___________SECCIONES__________`,
`Métricas y KPIs`, `Testimonios`, `___________OTROS__________`, `Separador decorativo`,
`Do & Dont´s`, `Slot`, `Historial de actualizaciones`, `Reciclaje temporal`, `Thumbnail`.

## Data-quality flags

1. **`Card ghost` Dark-mode axis is polluted** (`False|True|☾ Dark mode3|☾ Dark mode4`). Same class
   of junk-variant bug as Mobile item 12. Report item 16.
2. **Two `grid cards` sets**, identically named (6 + 2).
3. **Buttons / Tags / Accordion / Modals / Empty State are Testing-only here**, while they are core
   in the main system's Desktop file (Empty State is absent from the main system entirely).
