# USS One — Componentes Mobile

Source: https://www.figma.com/design/joO68kJ8XUJ8NepohniIRC/USS-One---Componentes-Mobile

Access: **edit** (via `use_figma` Plugin API — unlike the original "USS" Mobile file, which was read-only and only exposed a single "Comenzar" page).

Local variable collections: none (empty) — all tokens consumed from the shared "USS One - Fundamentos de diseño" library.

## Coverage note

This is by far the most complete file in the USS One system: **48 total pages**, of which 27 are core, shippable component pages (scanned in full below) plus 21 Testing/Patterns/Sections/Templates/Other pages (see list at the end, not deep-scanned in this pass).

## Pages (core components)

### Alert message (2 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Alert message📱 | 8 | Título, Descripción, Dark mode, Type (Info/Warning/Error/Success) |
| Top page alert message📱 | 8 | Title, Description, close button, Dark mode, type (4) |

### Badges (2 sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Badge 📱 | 10 | Texto, Dark mode, Tipo (Neutral/Info/Success/Alert/Error) |
| Badge dot 📱 | 4 | Dark mode, Info (Default/Alert) |

### Banners (2 sets, 4 variants)
| Component | Variants | Key properties |
|---|---|---|
| Split banner 📱 | 2 | Descripción, Dark mode |
| Main banner 📱 | 2 | Texto introductorio, Descripción, Subtítulo, Title, Tipografía display |

### Breadcrumbs (1 set, 6 variants)
| Component | Variants | Key properties |
|---|---|---|
| Breadcrumbs 📱 | 6 | Label, Dark mode, Estado (Default/Active/Focus) |

### Cards (13 sets + 1 loose component, 88 variants)
| Component | Variants | Key properties |
|---|---|---|
| Card M📱 | 6 | Tag/Metadato/Descripción/Imagen, Icon metadato swap, Tag sobre imagen, Dark mode, Background |
| Card S📱 | 6 | same + Estado: Default |
| Feature card 📱 | 4 | Descripción, Dark mode, Background (BG1/BG2) |
| Card Atributo - Horizontal 📱 | 6 | Icon swap, Dark mode, Background |
| Card Atributo - Vertical 📱 | 6 | Icon swap, Dark mode, Background |
| Card Métrica KPI 📱 | 4 | Icon swap, Valor Métrica, Descripción, Dark mode, Background |
| Card Persona S - Horizontal 📱 | 6 | Mail/Social, Nombre persona, Tag/Metadato/Descripción/Imagen, Dark mode, Background |
| Card Persona S - Vertical 📱 | 6 | same as above |
| Card Persona M 📱 | 6 | same as above |
| Card ghost 📱 | 4 | Tag/Metadato/Descripción, Icon swaps, Dark mode, Type (Icono/Imagen) |
| card icono 📱 | 16 | Icon swap, Label, Dark mode, Estado (4), Border |
| grid cards | 2 | Texto introductorio, Título, Dark mode |
| card interactivo 📱 | 16 | Imagen, Título, Descripción, Metadato, Icono swap, Dark mode, Tamaño (M/S), Estado (4) |
| *(loose) card background image 📱* | — | not a variant set |

### Carousel (6 sets, 30 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Carousel controls | 4 | Nº slide, Slide indicator, Dark mode, Left buttons |
| Assets/Item slider control | 16 | Icono swap, Dark mode, Estado (4), Invertir |
| Assets/Slider control buttons | 2 | Dark mode |
| Card carousel📱 | 4 | Tittle, Dark mode, Card size (M/S) |
| Card icono carousel📱 | 2 | Tittle, Dark mode |
| Single content carousel📱 | 2 | Tittle, Introductorio, Button, Dark mode |

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

### Dropdown list / combo box (2 sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item dropdown list📱 | 10 | Checkbox, Label, Dark mode, Tipo (Item/Título), Estado (4) |
| Dropdown list box📱 | 4 | Apply button, Search, Dark mode, Checkbox |

### Footer (2 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Footer navbar 📱 | 8 | Dark mode, Dropdown (Default/La universidad/Estudiantes/Acreditación) |
| Footer 📱 | 8 | Listado items, Dark mode, Dropdown (4) |

### Header menu (6 sets, 60 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item bottombar (topbar desktop) 📱 | 10 | Link sitio externo, Dark mode, Estado (5) |
| Assets/bottombar (topbar desktop) 📱 | 2 | Dark mode |
| Assets/Item navbar 📱 | 18 | Label, Dark mode, Tipo (Dropdown menu/Link externo/Link), State (3) |
| Assets/Item dropdown menu 📱 | 24 | (no exposed variant properties) |
| Assets/Navbar 📱 | 2 | Dark mode |
| Header menu 📱 | 4 | Topbar (bottom), Dark mode, Menu open |

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

### Page hero (5 sets + 1 loose, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Simple centered📱 | 4 | Título, Descripción, Buttons, Introductorio, Tags, Subtítulo, Dark mode, Tipografía display |
| Simple + image📱 | 4 | same pattern as above |
| Simple + form📱 | 4 | same + Form content (instance swap) |
| Slider carousel | 2 | Título, Descripción, Button, Tags, Subtítulo, Opacity, Tipografía display |
| Simple + background image📱 | 2 | Título, Descripción, Buttons, Introductorio, Tags, Subtítulo, Opacity, Tipografía display |
| *(loose) _assets/form content example* | — | not a variant set |

### Pagination (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item pagination📱 | 20 | Dark mode, Estado (Default/Active/Current/Focus/Disabled), Arrow |
| Pagination📱 | 4 | Dark mode, Extended |

### Radio button (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Radio button 📱 | 12 | Dark mode, Checked, Estado (3) |
| Radio button📱 | 12 | Texto, Label, Dark mode, Checked, Estado (3) |

### Select (1 set, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Select📱 | 12 | Label, Help icon, Placeholder, Validacion ayuda, Dark mode, Estado (Default/Active-Focus/Disabled/Error/Alert/Success) |

### Select date (2 sets, 26 variants)
| Component | Variants | Key properties |
|---|---|---|
| Select date simple📱 | 12 | Label, Help icon, Placeholder, Validacion ayuda, Dark mode, Estado (6) |
| Select date range📱 | 14 | Label, Help icon, Hasta, Desde, Validacion ayuda, Dark mode, Estado (7, incl. desde/hasta focus) |

### Steppers (4 sets, 16 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Radial step progress 📱 | 2 | Dark mode |
| Assets/Item Step indicator📱 | 2 | Descripción, Título de step, Dark mode |
| Assets/Stepper controls📱 | 6 | Dark mode, Type (First/Middle/Final step) |
| Stepper 📱 | 6 | Dark mode, Type (First/Middle/Final step) |

### Switch toggle (2 sets, 24 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Switch toggle📱 | 12 | Dark mode, Checked, Estado (3) |
| Switch toggle📱 | 12 | Texto, Label, Dark mode, Checked, Estado (3) |

### Table (4 sets, 22 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Table head cell 📱 | 4 | Tittle, Dark mode, Size (Large/Small) |
| Assets/Table cell📱 | 6 | Text content, Dark mode, Size (Small/Large-B/Large-A) |
| Assets/Table Column📱 | 8 | Dark mode, Size, Align right |
| Table 📱 | 4 | Dark mode, Size |

### Tabs (2 sets, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Assets/Item tab📱 | 10 | Label, Icon swap, Badge, Dark mode, Estado (5) |
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
| Assets/texto ayuda y validacion 📱 | 8 | Dark mode, Tipo (Error/Alerta/Exito/Ayuda) |
| Text field📱 | 12 | Label, Help icon, Placeholder, Icon left/right swaps, Validacion ayuda, Dark mode, Estado (6) |
| Text area📱 | 12 | Label, Help icon, Placeholder, Validacion ayuda, Size corner, Dark mode, Estado (6) |

### Toast (1 set, 8 variants)
| Component | Variants | Key properties |
|---|---|---|
| Toast 📱 | 8 | Tittle, Description, Action, Close button, Dark mode, Type (Info/Success/Warning/Error) |

### Tooltip (1 set, 2 variants)
| Component | Variants | Key properties |
|---|---|---|
| Tooltip📱 | 2 | Description, Título, Dark mode |

## Additional pages (not deep-scanned — Testing / Patterns / Sections / Templates / Other)
`____________________`, `___________TESTING___________`, Accordion - Testing 🟡, Buttons - Testing 🟡 (x2), Breadcrumbs - Trail 🟡, Empty State - Testing 🟡, Modals - Testing 🟡, `___________PATTERNS___________`, Filters, Forms, `___________SECCIONES___________`, Métricas y KPIs, Testimonios, `__________TEMPLATES___________`, Landing page, `__________OTROS___________`, Separador decorativo, Historial de actualizaciones, Thumbnail.

## Totals (core pages only)
- Pages scanned: 27
- Component sets: 77
- Total variant symbols: 576
