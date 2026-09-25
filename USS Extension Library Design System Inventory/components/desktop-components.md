# [Extension Library] USS — Componentes Desktop

Source: https://www.figma.com/design/DSOeWAXEvG2O18rQLMSqAf/-Extension-Library--USS---Componentes-Desktop

**Extracted 2026-09-25.** Replaces the earlier 6-page capture. That list was a `get_metadata`
under-count: the Plugin API returns **46 pages**. See `decisions/022`.

Access: **edit** (via `use_figma`). Local variables: empty `Collection 1`. Tokens come from the
shared Foundations file.

## Summary

| Metric | Count |
|---|---|
| Pages in file | 46 |
| Core component pages (deep-scanned) | 24 |
| Component sets | 55 |
| Variants | 620 |
| Loose components | 11 |
| Testing 🟡 pages (not deep-scanned) | 9 |
| Other staging/index pages (not deep-scanned) | 13 |

The smallest Desktop core of the three — not because the file is empty, but because **Cards, Header,
Carousel, Footer, Page hero, Alert, Table, Accordion, Avatar** are still Testing. Buttons and Tags
are core here (the inverse of USS One).

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

## Buttons (8 sets + 1 loose, 178 variants)
| Component | Variants | Key properties |
|---|---|---|
| Button primary | 30 | Dark mode, Tamaño (3), Estado (5) |
| Button Multi-Purpose | 30 | same axes as Button primary — extra set, not in the main system |
| Button secondary | 30 | Dark mode, Tamaño (3), Estado (5) |
| Button icon | 30 | Dark mode, Tamaño (3), Estado (5) |
| Button float | 10 | Dark mode, Estado (5) |
| Button tertiary | 30 | Dark mode, Tamaño (3), Estado (5) |
| Button full width | 10 | Dark Mode, Estado (5) |
| _Focus element | 8 | Dark mode, Border Radius (4) |

Loose: `Size=Size4` (orphaned variant name, not a set).

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

## Modals (4 sets + 1 loose, 54 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Modal icon | 16 | Dark mode, Type (4), Large |
| Assets/Modal footer | 6 | Dark mode, Centered, **Confirmation (Default/Checkbox)** — extra axis vs. main (4) |
| Modal | 16 | Dark mode, Type (4), Centered |
| Modal Extended | 16 | Dark mode, Type (4), Centered — extra set, not in the main system |

Loose: `Assets/Modal backdrop background`.

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

## Tabs (2 sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item tab | 12 | Dark mode, Estado (6) |
| Tabs | 2 | Dark mode |

## Tags (2 sets, 20 variants)
| Component | Variants | Key properties |
|---|---|---|
| Tag secondary | 10 | Dark mode, Estado (5) — **missing `type=navigation/selection\|toggle`** (main/USS One have 20) |
| Tag primary | 10 | Dark mode, Estado (5) |

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

**Testing 🟡 (9):** `Avatar  - Testing 🟡`, `Accordion - Testing 🟡`, `Cards  - Testing 🟡`,
`Header menu - Testing 🟡`, `Carousel - Testing 🟡`, `Footer  - Testing 🟡 | 🅰`,
`Page hero - Testing 🟡`, `Alert message - Testing 🟡`, `Table  - Testing 🟡`.

Index / dividers / history: `👋🏼 Comenzar`, `---`, `___________TESTING__________`,
`___________PATTERNS__________`, `Filters`, `Forms`, `___________OTROS__________`,
`Separador decorativo`, `Slot`, `Historial de actualizaciones`,
`Layer Naming Conventions - Testing 🟡 | 🅰`, `Reciclaje temporal`, `Thumbnail`.

## Data-quality flags

1. **`Tag secondary` is missing the `type` axis** (10 variants vs. 20 in the main system and USS One).
   Report item 17.
2. **`Button Multi-Purpose`** and **`Modal Extended`** exist only here — extra sets, not defects, but
   they are the reason this file's Buttons (178) and Modals (54) counts exceed the main system's.
3. **`Assets/Modal footer` has a third axis** (`Confirmation=Default|Checkbox`) that the main
   system's 4-variant footer does not.
4. **Orphan loose `Size=Size4`** on the Buttons page.
5. **Largest Testing area of the three Desktop files** (9 pages). Cards / Header / Carousel / Footer /
   Page hero / Alert / Table are core in the main system and still staged here.
