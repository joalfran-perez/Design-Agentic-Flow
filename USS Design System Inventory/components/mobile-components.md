# Componentes Mobile — Component Inventory

Source: https://www.figma.com/design/uH4MBdFSPYvfxwXcrdFic9/USS---Componentes-Mobile

**Extracted 2026-09-25.** This file replaces the earlier `mobile-notes.md`, which recorded the file as
inaccessible. That diagnosis was wrong: the limitation was a **read-channel artifact**, not a permissions
limit — `get_metadata` enumerates only the `👋🏼 Comenzar` page, while a read-only `use_figma` script
returns all 44. See `decisions/021` and `state/inventories.md` § MCP channel note.

Captured via the Plugin API (read-only scripts, one call per page, per
`skills/figma-inventory-extraction.md` step 6). Nothing was written to the file — the main/core system's
Figma files remain read-only per `decisions/012`.

## Summary

| Metric | Count |
|---|---|
| Pages in file | 44 |
| Core component pages (deep-scanned) | 30 |
| Component sets | 93 |
| Variants | 776 |
| Loose components (not in a set) | 3 |
| Staging/section/index pages (not deep-scanned) | 14 |

**No "Testing 🟡" staging section exists in this file** — every component page is core. This is the only
one of the three systems' Mobile files without a Testing area, and it is also the **largest**: 93 sets /
776 variants, versus USS One's 77/576 and Extension Library's 54/550.

## Accordion (6 sets, 28 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Group row📱 | 4 | Dark mode, State (Default/Active), Tittle text |
| Assets/Content 📱 | 2 | Dark mode, 6 boolean content slots |
| Accordion📱 | 2 | Dark mode |
| Contenido de accordion 📱 | 14 | Dark mode, Contenido (7) |
| Feature list item 📱 | 4 | Dark mode, Type (Strong h6 / Subtle body), Icon swap |
| Feature list 📱 | 2 | Dark mode |

## Alert message (2 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Alert message📱 | 8 | Dark mode, Type (Info/Warning/Error/Success), Título/Descripción |
| Top page alert message📱 | 8 | Dark mode, type (4), close button |

## Badges (2 sets, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Badge 📱 | 10 | Dark mode, Tipo (Neutral/Info/Success/Alert/Error) |
| Badge dot 📱 | 2 | Dark mode |

## Banners (2 sets, 4 variants)
| Component | Variants | Key properties |
|---|---|---|
| Split banner 📱 | 2 | Dark mode, Descripción |
| Main banner 📱 | 2 | Tipografía display, Texto introductorio/Subtítulo/Descripción |

## Breadcrumbs (1 set, 6 variants)
| Component | Variants | Key properties |
|---|---|---|
| Breadcrumbs 📱 | 6 | Dark mode, Estado (Default/Active/Focus), Label |

## Buttons (7 sets, 122 variants)
| Component | Variants | Key properties |
|---|---|---|
| Button primary 📱 | 24 | Dark mode, Tamaño (3), Estado (4), icon L/R swaps |
| Button secondary 📱 | 24 | Dark mode, Tamaño (3), Estado (4), icon L/R swaps |
| Button tertiary 📱 | 24 | Dark mode, Tamaño (3), Estado (4), icon L/R swaps |
| Button icon 📱 | 24 | Dark mode, Tamaño (3), Estado (4), icon swap |
| Button full width 📱 | 10 | Dark Mode, Estado (5 — **includes Hover**) |
| Button float 📱 | 8 | Dark mode, Estado (4), icon swap |
| _Focus element | 8 | Dark mode, Border Radius (4 shapes) |

Estado axis is **Default/Active/Focus/Disabled** on every button except `Button full width 📱`, which adds
Hover — see data-quality flag 3.

## Cards (13 sets + 1 loose, 88 variants)
| Component | Variants | Key properties |
|---|---|---|
| Card M 📱 | 6 | Dark mode, Background (BG1/BG2/None-borde), Tag/Metadato/Imagen |
| Card S📱 | 6 | Dark mode, Background (3), Estado (**1 option only**), Tag/Metadato |
| Feature card 📱 | 4 | Dark mode, Background (BG2/BG1) |
| Card Atributo - Horizontal 📱 | 6 | Dark mode, Background (3), Icon swap |
| Card Atributo - Vertical 📱 | 6 | Dark mode, Background (3), Icon swap |
| Card Métrica KPI 📱 | 4 | Dark mode, Background (2), Valor/Descripción |
| Card Persona S - Horizontal 📱 | 6 | Dark mode, Background (3), Mail/Social media |
| Card Persona S - Vertical 📱 | 6 | Dark mode, Background (3), Mail/Social media |
| Card Persona M 📱 | 6 | Dark mode, Background (3), Mail/Social media |
| Card ghost 📱 | 4 | Type (Icono/Imagen), **Dark mode has 4 junk options** |
| card icono 📱 | 16 | Dark mode, Estado (4), Border, Icon swap |
| card interactivo 📱 | 16 | Dark mode, Tamaño (M/S), Estado (4) |
| grid cards | 2 | Dark mode, Título/Texto introductorio |
| *(loose) card background image 📱* | — | not a variant set |

## Carousel (6 sets, 30 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item slider control | 16 | Dark mode, Estado (4), Invertir |
| Assets/Carousel controls | 4 | Dark mode, Left buttons, Slide indicator |
| Assets/Slider control buttons | 2 | Dark mode |
| Card carousel📱 | 4 | Dark mode, Card size (M/S) |
| Card icono carousel📱 | 2 | Dark mode |
| Single content carousel📱 | 2 | Dark mode, Introductorio, Button |

## Checkbox (2 sets, 42 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Checkbox 📱 | 24 | Dark mode, Checked, Indeterminate, Estado (4) |
| Checkbox 📱 | 18 | Dark mode, Checked, Indeterminate, Estado (3), Label |

## Divider (2 sets, 4 variants)
| Component | Variants | Key properties |
|---|---|---|
| Divider sections (full width) 📱 | 2 | Dark mode |
| Divider contents📱 | 2 | Dark mode |

## Dropdown list (combo box) (2 sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item dropdown list📱 | 10 | Dark mode, Tipo (Item/Título), Estado (4), Checkbox |
| Dropdown list box📱 | 4 | Dark mode, Checkbox, Apply button, Search |

## Footer (2 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Footer navbar 📱 | 8 | Dark mode, Dropdown (Default/La universidad/Estudiantes/Acreditación) |
| Footer 📱 | 8 | Dark mode, Dropdown (4), Listado items |

## Header menu (6 sets, 60 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item navbar 📱 | 18 | Dark mode, Tipo (Dropdown/Link externo/Link), State (3) |
| Assets/Item dropdown menu 📱 | 24 | **Properties unreadable — broken component set**, see flag 1 |
| Assets/Item bottombar (topbar desktop) 📱 | 10 | Dark mode, Estado (5), Link sitio externo |
| Assets/bottombar (topbar desktop) 📱 | 2 | Dark mode |
| Assets/Navbar 📱 | 2 | Dark mode |
| Header menu 📱 | 4 | Dark mode, Menu open, Topbar (bottom) |

## Image / video (2 sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Imagen frame img 📱 | 12 | Aspect ratio (1:1/4:3/3:2/16:9/2:1/21:9), Vertical |
| Video frame📱 | 2 | Aspect ratio (16:9, 4:3) |

## Link (1 set, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Link enlace📱 | 12 | Dark mode, Estado (6 — Default/Hover/Focus/Disabled/Active/Visited), Sitio externo |

## Linked list (2 sets, 18 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item linked list 📱 | 16 | Dark mode, Estado (4), Link sitio externo, Label |
| Linked list 📱 | 2 | Dark mode |

## Modals (3 sets + 1 loose, 52 variants)
| Component | Variants | Key properties |
|---|---|---|
| Modal📱 | 32 | Dark mode, Type (4), Centered, Wide buttons, Close button, Icon |
| Assets/Modal icon 📱 | 16 | Dark mode, Type (Info/Warning/Error/Success), Large |
| Assets/Bottom actions📱 | 4 | Dark mode, Wide buttons, Secondary action |
| *(loose) Assets/Modal background* | — | not a variant set |

## Page hero (5 sets + 1 loose, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Simple centered📱 | 4 | Dark mode, Tipografía display, Título/Descripción/Tags/Buttons |
| Simple + image📱 | 4 | Dark mode, Tipografía display, same content slots |
| Simple + form📱 | 4 | Dark mode, Tipografía display, Form content swap |
| Simple + background image📱 | 2 | Tipografía display, Opacity |
| Slider carousel | 2 | Tipografía display, Opacity |
| *(loose) _assets/form content example* | — | not a variant set |

## Pagination (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item pagination📱 | 20 | Dark mode, Estado (5, incl. "Current (pag actual)"), Arrow |
| Pagination📱 | 4 | Dark mode, Extended |

## Radio button (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Radio button 📱 | 12 | Dark mode, Checked, Estado (3) |
| Radio button📱 | 12 | Dark mode, Checked, Estado (3), Label |

## Select (1 set, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Select📱 | 12 | Dark mode, Estado (6: Default/Active-Focus/Disabled/Error/Alert/Success), Label, Help icon |

## Select date (2 sets, 26 variants)
| Component | Variants | Key properties |
|---|---|---|
| Select date simple📱 | 12 | Dark mode, Estado (6), Label, Help icon |
| Select date range📱 | 14 | Dark mode, Estado (7 — focus split into "desde"/"hasta"), Desde/Hasta |

## Steppers (4 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Stepper 📱 | 6 | Dark mode, Type (First/Middle/Final step) |
| Assets/Stepper controls📱 | 6 | Dark mode, Type (3) |
| Assets/Item Step indicator📱 | 2 | Dark mode, Título/Descripción |
| Assets/Radial step progress 📱 | 2 | Dark mode |

## Switch toggle (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Switch toggle📱 | 12 | Dark mode, Checked, Estado (3) |
| Switch toggle📱 | 12 | Dark mode, Checked, Estado (3), Label |

## Table (4 sets, 22 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Table Column📱 | 8 | Dark mode, Size (Small/Large), Align right |
| Assets/Table cell📱 | 6 | Dark mode, Size (Small/Large-B/Large-A) |
| Assets/Table head cell 📱 | 4 | Dark mode, Size (Large/Small), Tittle |
| Table 📱 | 4 | Dark mode, Size (Large/Small) |

## Tabs (2 sets, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item tab📱 | 10 | Dark mode, Estado (5), Icon, Badge, Label |
| Tabs📱 | 2 | Dark mode |

## Tags (2 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Tag primary📱 | 8 | Dark mode, Estado (Default/Active/Focus/Disabled) |
| Tag secondary📱 | 8 | Dark mode, Estado (4), Icono close |

## Text field (4 sets, 36 variants)
| Component | Variants | Key properties |
|---|---|---|
| Text field📱 | 12 | Dark mode, Estado (6), Label, Placeholder, Icon L/R, Validación |
| Text area📱 | 12 | Dark mode, Estado (6), Label, Placeholder, Size corner |
| Assets/texto ayuda y validacion 📱 | 8 | Dark mode, Tipo (Error/Alerta/Exito/Ayuda) |
| Assets/Icon help | 4 | Dark mode, Hover |

## Toast (1 set, 8 variants)
| Component | Variants | Key properties |
|---|---|---|
| Toast 📱 | 8 | Dark mode, Type (Info/Success/Warning/Error), Action, Close button |

## Tooltip (1 set, 2 variants)
| Component | Variants | Key properties |
|---|---|---|
| Tooltip📱 | 2 | Dark mode, Título/Description |

## Pages not deep-scanned (14)

Index/divider: `👋🏼 Comenzar`, `____________________`.
Patterns: `___________PATTERNS___________`, Filters, Forms.
Secciones: `___________SECCIONES___________`, Métricas y KPIs, Testimonios.
Templates: `__________TEMPLATES___________`, Landing page.
Otros: `__________OTROS___________`, Separador decorativo, Historial de actualizaciones, Thumbnail.

Same convention as the two local libraries' Mobile inventories — patterns/templates/section pages are
compositions of the component sets above, not new components.

## Data-quality flags

Flagged, not fixed (`decisions/005`); these are also written up for the file owners in
`reports/figma-data-quality-issues.md`.

1. **`Assets/Item dropdown menu 📱` (Header menu, 24 variants) is a broken component set.** Reading its
   `componentPropertyDefinitions` throws `Component set has existing errors` — Figma itself considers the
   set invalid (typically a variant-name collision or a missing property combination). Its variant count
   is readable; its property axes are not. This is the only such set across all 30 pages.
2. **`Card ghost 📱` has two junk dark-mode options.** Its dark-mode axis is
   `[False | True | ☾ Dark mode3 | ☾ Dark mode4]` — the last two are Figma's auto-generated placeholder
   names from an accidental variant add, not real states.
3. **Button state axes disagree.** Every button set uses Estado = Default/Active/Focus/Disabled except
   `Button full width 📱`, which uses Default/**Hover**/Active/Focus/Disabled. Note the Desktop inventory
   records *all* buttons as having 5 states including Hover, so Mobile is the narrower set.
4. **`Card S📱` has a single-option variant property** (`Estado=[Default]`), which adds an axis with no
   choices — a leftover, not a usable dimension.
5. **Dark-mode property naming is inconsistent across sets**: `☾ Dark mode` (majority), `☾ Dark Mode`
   (`Button full width 📱`), and plain `Dark mode` with no moon glyph (`_Focus element`, `card icono 📱`,
   `card interactivo 📱`, `grid cards`). Option casing also varies (`False|True` vs `false|true`), which
   breaks naive cross-set matching.
6. **`Tittle` (misspelling of "Title") is used as a property name** in `Assets/Group row📱`,
   `Card carousel📱`, `Card icono carousel📱`, `Assets/Table head cell 📱` and `Toast 📱`. Elsewhere the
   same slot is `Título` or `Title`, so three spellings coexist for one concept.
**Checked and cleared (not a defect):** `Select date range📱` carries 7 Estado options against every other
form control's 6. The extra one is deliberate — it splits the focus state per field
(`Active/focus (desde)` / `Active/focus (hasta)`) because the component has two date inputs. Verified
directly against the file; listed here so a future reader doesn't re-flag it.
