# USS One — Componentes Desktop

Source: https://www.figma.com/design/5XVuReA8as6xhPa0jUzVOg/USS-One---Componentes-Desktop

Access: **edit** (via `use_figma` Plugin API — unlike the original "USS" Desktop file, which was read-only).

Local variables in this file: a single small `propiedades` collection with 2 utility variables (`altura-texto` = 48, `texto-truncado` = false) — used for component internals, not design tokens. All color/spacing/typography tokens are consumed from the shared "USS One - Fundamentos de diseño" library.

## Coverage note

This file currently only contains **6 pages / 33 component sets / 323 total variants** — a small subset of the full component library compared to the Mobile file (27 pages / 77 sets / 576 variants). It looks like Desktop porting of USS One components is still in progress; the Buttons page is explicitly marked "Buttons - Testing 🟡".

## Pages

### Badges (2 component sets, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Badge | 10 | Texto (text), ☾ Dark mode, Tipo: Neutral/Info/Success/Alert/Error |
| Badge dot | 2 | ☾ Dark mode |

### Cards (18 component sets, 115 variants)
| Component | Variants | Key properties |
|---|---|---|
| Card M Vertical | 6 | Tag, Metadato, Descripción, Imagen, Icon metadato (+ swap), Tag sobre imagen, Dark mode, Background (BG1/BG2/None-Borde) |
| Card M Horizontal (solo Desktop) | 6 | same as above |
| Card S Vertical | 6 | same as above |
| Card S Horizontal (solo Desktop) | 6 | same as above |
| Card Atributo - Horizontal | 6 | Icon swap, Dark mode, Background |
| Card Atributo - Vertical | 6 | Icon swap, Dark mode, Background |
| Card Metrica KPI | 4 | Icon swap, Valor Métrica, Descripción, Dark mode, Background (BG1/BG2 only) |
| Card Persona S horizontal | 6 | Mail/Social(Linkedin,Facebook,Twitter), Nombre persona, Tag/Metadato/Descripción/Imagen, Dark mode, Background |
| Card Persona S vertical | 6 | same as above |
| Card Persona M horizontal (solo Desktop) | 6 | same as above |
| Card Persona M Vertical | 6 | same as above |
| Feature card | 4 | Descripción, Dark mode, Background (BG1/BG2 only) |
| grid cards | 6 | Título, Texto introductorio, Dark mode, card type (vertical S-4col / M-3col / M-2col) |
| Card ghost | 4 | Tag/Metadato/Descripción, Icon metadato swap, media icon swap, Dark mode, Type: Icono/Imagen |
| card background image | 3 | Tag top/content, Icon metadato, Metadato, Descripción, Título, DetallesConHover, state: default/hover |
| grid cards (variant 2) | 2 | Texto introductorio, Título, Dark mode |
| card icono | 16 | Icon swap, Label, Dark mode, Estado (Default/Hover/Active/Disabled), Border |
| card interactivo | 16 | Imagen, Título, Descripción, Metadato, Icono swap, Dark mode, Tamaño (M/S), Estado (default/hover/active/disabled) |

### Divider (2 component sets, 4 variants)
| Component | Variants | Key properties |
|---|---|---|
| Divider sections (full width) | 2 | ☾ Dark mode |
| Divider contents | 2 | ☾ Dark mode |

### Image / video (2 component sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Image frame img | 12 | Aspect ratio (1:1, 4:3, 3:2, 16:9, 2:1, 21:9), Vertical |
| Video frame | 2 | Aspect ratio (16:9, 4:3) |

### Tags (2 component sets, 30 variants)
| Component | Variants | Key properties |
|---|---|---|
| Tag secondary | 20 | Icono close, Texto, Dark mode, Estado (Default/Hover/Active/Focus/Disabled), type (navigation-selection / toggle) |
| Tag primary | 10 | Texto, Dark mode, Estado (5 states) |

### Buttons - Testing 🟡 (7 component sets, 148 variants)
| Component | Variants | Key properties |
|---|---|---|
| Button icon | 30 | Icono swap, Dark mode, Tamaño (Large/Small/Medium), Estado (5 states) |
| Button float | 10 | Icono swap, Dark mode, Estado (5 states) |
| Button tertiary | 30 | Icono der/izq swap, Texto, Dark mode, Tamaño (3), Estado (5) |
| Button full width | 10 | Texto, Icono swap, Dark mode, Estado (5) |
| _Focus element | 8 | Dark mode, Border Radius (Circular/Rectangular/Circular Izq/Circular Der) |
| Button primary_Desktop | 30 | Icono der/izq swap, Texto, Dark mode, Tamaño (3), Estado (5) |
| Button secondary_Desktop | 30 | Icono der/izq swap, Texto, Dark mode, Tamaño (3), Estado (5) |

## Totals
- Pages: 6 (+ "👋🏼 Comenzar" landing page)
- Component sets: 33
- Total variant symbols: 323
