# [Extension Library] USS — Componentes Mobile

Source: https://www.figma.com/design/mVPBqzhfGqQkBJSrpLwEGV/-Extension-Library--USS---Componentes-Mobile

Access: **edit** (via `use_figma` Plugin API).

Local variable collections: none — all tokens consumed externally, same as the Desktop file.

## Coverage note

This file has the richest page structure of the three: pages are explicitly split into a **core/shippable set** (22 pages, scanned in full below) and a large **staging area** — `___________TESTING___________`, `___________PATTERNS___________`, `__________TEMPLATES___________`, `__________DEFINITION OF READY (DOR)___________`, `__________ANOTATIONS__________`, `__________OTROS___________` — containing Testing variants of Accordion, Badges, Cards, Header menu, Carousel, Page hero, Alert message, Navigation Bar, Table, Button, Empty State (×2), Basic State, Sheet-Linked-List, plus Filters/Forms patterns, a Landing page template, a DOR checklist, annotations, and a cover/thumbnail.

Compared to USS One's mobile file, several components that were **core** there (Alert message, Badges, Cards, Carousel, Header menu, Page hero) are **still in Testing here**, while **Buttons and Modals are core here** but were Testing-only in USS One — the two "Extension Library" files and the "USS One" file are clearly different snapshots/branches of the same evolving library, each further along on different components.

## Pages (core components)

### Banners (2 sets, 4 variants)
| Component | Variants | Key properties |
|---|---|---|
| Split banner 📱 | 2 | Descripción, Dark mode |
| Main banner 📱 | 2 | Texto introductorio, Descripción, Subtítulo, Title, Tipografía display |

### Breadcrumbs (1 set, 6 variants)
| Component | Variants | Key properties |
|---|---|---|
| Breadcrumbs 📱 | 6 | Label, Dark mode, Estado (Default/Active/Focus) |

### Buttons (8 sets, 146 variants)
| Component | Variants | Key properties |
|---|---|---|
| Button primary 📱 | 24 | Icono der/izq swap, Texto, Dark mode, Tamaño (Large/Medium/Small), Estado (4: no Hover) |
| Button secondary 📱 | 24 | same axes |
| Button icon 📱 *(appears twice — duplicate)* | 48 | Icono swap, Dark mode, Tamaño (3), Estado (4) |
| Button float 📱 | 8 | Icono swap, Dark mode, Estado (4) |
| Button tertiary 📱 | 24 | Icono der/izq swap, Texto, Dark mode, Tamaño (3), Estado (4) |
| Button full width 📱 | 10 | Texto, Icono swap, Dark mode, Estado (5, incl. Hover) |
| _Focus element | 8 | Dark mode, Border Radius (4 shapes) |

### Checkbox (2 sets, 42 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Checkbox 📱 | 24 | Dark mode, Checked, Indeterminate, Estado (4) |
| Checkbox 📱 | 18 | Texto, Label, Dark mode, Checked, Indeterminate, Estado (3) |

### Divider (2 sets, 4 variants)
| Component | Variants | Key properties |
|---|---|---|
| Divider sections (full width) 📱 | 2 | Dark mode |
| Divider contents📱 | 2 | Dark mode |

### Dropdown list (combo box) (2 sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item dropdown list📱 | 10 | Checkbox, Label, Dark mode, Tipo (Item/Título), Estado (4) |
| Dropdown list box📱 | 4 | Apply button, Search, Dark mode, Checkbox |

### Footer (2 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Footer navbar 📱 | 8 | Dark mode, Dropdown (Default/La universidad/Estudiantes/Acreditación) |
| Footer 📱 | 8 | Listado items, Dark mode, Dropdown (4) |

### Image / video (2 sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Imagen frame img 📱 | 12 | Aspect ratio (6 ratios), Vertical |
| Video frame📱 | 2 | Aspect ratio (16:9, 4:3) |

### Link (1 set, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Link enlace📱 | 12 | Sitio externo, Texto, Dark mode, Estado (Default/Hover/Focus/Disabled/Active/Visited) |

### Linked list (2 sets, 18 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item linked list 📱 | 16 | Label, Dark mode, Estado (4), Link sitio externo |
| Linked list 📱 | 2 | Dark mode |

### Modals (3 sets + 1 loose, 52 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Modal icon 📱 | 16 | Dark mode, Type (Info/Warning/Error/Success), Large toggle |
| Assets/Bottom actions📱 | 4 | Secondary action, Dark mode, Wide buttons |
| Modal📱 | 32 | Close button, Icon, Dark mode, Type (4), Centered, Wide buttons |
| *(loose) Assets/Modal background* | — | not a variant set |

### Pagination (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item pagination📱 | 20 | Dark mode, Estado (5, incl. "Current (pag actual)"), Arrow |
| Pagination📱 | 4 | Dark mode, Extended |

### Radio button (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Radio button 📱 | 12 | Dark mode, Checked, Estado (3) |
| Radio button📱 | 12 | Texto, Label, Dark mode, Checked, Estado (3) |

### Select (1 set, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Select📱 | 12 | Estado (6: Default/Active-Focus/Disabled/Error/Alert/Success) × Dark mode |

### Select date (2 sets, 26 variants)
| Component | Variants | Key properties |
|---|---|---|
| Select date simple📱 | 12 | Estado (6) × Dark mode |
| Select date range📱 | 14 | Estado (7, incl. desde/hasta) × Dark mode |

### Steppers (4 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Radial step progress 📱 | 2 | Dark mode |
| Assets/Item Step indicator📱 | 2 | Descripción, Título de step, Dark mode |
| Assets/Stepper controls📱 | 6 | Type: First/Middle/Final step × Dark mode |
| Stepper 📱 | 6 | Contenido del step (slot), Type (3) × Dark mode |

### Switch toggle (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Switch toggle📱 | 12 | Dark mode, Checked, Estado (3) |
| Switch toggle📱 | 12 | Label, Checked, Estado (3), Dark mode |

### Table (4 sets, 22 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Table head cell 📱 | 4 | Tittle, Dark mode, Size (Large/Small) |
| Assets/Table cell📱 | 6 | Text content, Dark mode, Size (Small/Large-A/Large-B) |
| Assets/Table Column📱 | 8 | Size × Align right × Dark mode |
| Table 📱 | 4 | Size × Dark mode |

### Tabs (2 sets, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item tab📱 | 10 | Label, Icon toggle, Badge toggle, Dark mode, Estado (5) |
| Tabs📱 | 2 | Dark mode |

### Tags (2 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Tag secondary📱 | 8 | Icono close, Texto, Dark mode, Estado (4) |
| Tag primary📱 | 8 | Texto, Dark mode, Estado (4) |

### Text field (4 sets, 36 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Icon help | 4 | Dark mode, Hover |
| Assets/texto ayuda y validacion 📱 | 8 | Tipo: Error/Alerta/Exito/Ayuda × Dark mode |
| Text field📱 | 12 | Estado (6) × Icon left/right toggles × Dark mode |
| Text area📱 | 12 | Estado (6) × Size corner × Dark mode |

### Toast (1 set, 8 variants)
| Component | Variants | Key properties |
|---|---|---|
| Toast 📱 | 8 | Type: Info/Success/Warning/Error × Dark mode |

### Tooltip (1 set, 2 variants)
| Component | Variants | Key properties |
|---|---|---|
| Tooltip📱 | 2 | Título, Descripción toggle, Dark mode |

## Additional pages not deep-scanned (Testing / Patterns / Templates / DOR / Annotations / Other)
`____________________`, `___________TESTING___________`, Accordion - Testing 🟡, Badges - Testing 🟡, Cards - Testing 🟡, Header menu - Testing 🟡, Carousel - Testing 🟡, Page hero - Testing 🟡, Alert message - Testing 🟡, Navigation Bar - Testing 🟡, Table - Testing 🟡, Button - Testing 🟡, Empty State - Testing 🟡, Empty State - Solid background - Testing 🟡, Basic State - Testing 🟡, Sheet-Linked-List - Testing 🟡, `___________PATTERNS___________`, Filters, Forms, `__________TEMPLATES___________`, Table & Accordeon & Tabs - Testing 🟡, Landing page, `__________DEFINITION OF READY (DOR)___________`, 📄Checklist, `__________ANOTATIONS__________`, 📝 Annotations, 🖼️ Portada, `__________OTROS___________`, Historial de actualizaciones, Thumbnail.

## Totals (core pages only)
- Pages scanned: 22
- Component sets: 54
- Total variant symbols: 550

## Data-quality flags
- "Button icon 📱" exists as **two separate identical component sets** on the Buttons page (48 combined variants where 24 would be expected).
- "Assets/Item dropdown menu 📱"-style pre-expanded variant sets and several `Assets/...` "primitive" component sets are duplicated in near-identical form between Desktop and Mobile — expected for a shared extension library, but worth deduping if consolidating with USS One.
