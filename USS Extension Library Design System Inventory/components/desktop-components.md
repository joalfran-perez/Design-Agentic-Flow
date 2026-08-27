# [Extension Library] USS — Componentes Desktop

Source: https://www.figma.com/design/DSOeWAXEvG2O18rQLMSqAf/-Extension-Library--USS---Componentes-Desktop

Access: **edit** (via `use_figma` Plugin API).

Local variables: a single `Collection 1` with **0 variables** — completely empty. All tokens are consumed from the shared Foundations file / a published library.

## Coverage note

7 pages total: "👋🏼 Comenzar" (intro) + 6 component pages. Unlike USS One (where Buttons was the file's weak point, marked "Testing 🟡"), here **Buttons is a stable core page** and **Cards is the one still marked "Testing 🟡"** — the inverse maturity pattern. Two component sets in this file are literal name duplicates (see Cards section) — a data-quality note rather than an intentional variant.

## Pages

### Badges (2 component sets, 12 variants)
| Component | Variants | Key properties |
|---|---|---|
| Badge | 10 | Texto, ☾ Dark mode, Tipo: Neutral/Info/Success/Alert/Error |
| Badge dot | 2 | ☾ Dark mode |

### Buttons (8 component sets, 178 variants)
| Component | Variants | Key properties |
|---|---|---|
| Button primary | 30 | Icono der/izq swap, Texto, Dark mode, Tamaño (Small/Medium/Large), Estado (5) |
| Button Multi-Purpose | 30 | same axes as Button primary — appears to be an alternate/experimental primary button |
| Button secondary | 30 | same axes |
| Button icon | 30 | Icono swap, Dark mode, Tamaño (3), Estado (5) |
| Button float | 10 | Icono swap, Dark mode, Estado (5) |
| Button tertiary | 30 | Icono der/izq swap, Texto, Dark mode, Tamaño (3), Estado (5) |
| Button full width | 10 | Texto, Icono swap, Dark mode, Estado (5) |
| _Focus element | 8 | Dark mode, Border Radius (Circular/Rectangular/Circular Izq/Circular Der) |

Loose component (not a variant set): `Size=Size4`.

### Divider (2 component sets, 4 variants)
| Component | Variants | Key properties |
|---|---|---|
| Divider sections (full width) | 2 | ☾ Dark mode |
| Divider contents | 2 | ☾ Dark mode |

### Image / video (2 component sets, 14 variants)
| Component | Variants | Key properties |
|---|---|---|
| Image frame img | 12 | Aspect ratio (6 ratios), Vertical |
| Video frame | 2 | Aspect ratio (16:9, 4:3) |

### Tags (2 component sets, 20 variants)
| Component | Variants | Key properties |
|---|---|---|
| Tag secondary | 10 | Icono close, Texto, Dark mode, Estado (5) |
| Tag primary | 10 | Texto, Dark mode, Estado (5) |

### Cards - Testing 🟡 (25 component sets, 155 variants)
| Component | Variants | Key properties |
|---|---|---|
| Card M Vertical / Horizontal, Card S Vertical / Horizontal (4 sets) | 24 | Tag/Metadato/Descripción/Imagen, Icon metadato swap, Tag sobre imagen, Dark mode, Background (BG1/BG2/None-Borde) |
| Card Atributo - Horizontal / Extended | 12 | Icon swap, Dark mode, Background |
| Card Event - Extended | 6 | Icon swap, Date info toggle, Dark mode, Background |
| Card Atributo - Vertical | 8 | (no exposed variant properties returned) |
| Card Metrica KPI / Dashboard Metricas KPIs / Card Metrica KPI - Horizontal (3 near-identical sets) | 12 | Icon swap, Valor/Descripción text, Dark mode, Background (BG1/BG2) |
| Card Persona S horizontal *(appears twice — duplicate)* | 12 | Mail/Social(Linkedin,Facebook,Twitter), Nombre persona, Tag/Metadato/Descripción/Imagen, Dark mode, Background |
| Card Persona S vertical | 6 | same axes |
| Card Persona M horizontal (solo Desktop) | 6 | Tag, Metadata Info, Author info, Dark mode, Background |
| Card Persona M Vertical | 6 | Mail/Social, Nombre persona, Tag/Metadato/Descripción/Imagen, Dark mode, Background |
| Feature card | 4 | Descripción, Dark mode, Background (BG1/BG2) |
| grid cards (× 2 sets, different variant axes) | 8 | Título/Texto introductorio toggles, Dark mode, card type / layout |
| Card ghost | 4 | Type: Icono/Imagen, Dark mode (note: Dark mode variant options list includes stray extra values "☾ Dark mode3"/"☾ Dark mode4") |
| card background image | 3 | Tags top/content, Icon metadato, Metadato, Descripción, Título, DetallesConHover, state: default/hover |
| card icono / card icono - Extended (2 near-identical sets) | 32 | Icon swap, Label, Dark mode, Estado (4), Border |
| card interactivo | 8 | Imagen, Título, Descripción, Metadato, Icono swap, Dark mode, Estado (4) |
| Card Event | 4 | Icon swap, Fecha, Mes, Dark mode, Background |

## Totals
- Pages: 6 component pages (+ "👋🏼 Comenzar")
- Component sets: 41
- Total variant symbols: 383

## Data-quality flags
- "Card Persona S horizontal" exists as **two separate component sets with the identical name** on the Cards page.
- Several Cards sets are near-duplicates of each other with only minor naming differences (`Card Metrica KPI` / `Dashboard Metricas KPIs` / `Card Metrica KPI - Horizontal`; `card icono` / `card icono - Extended`; `Card Atributo - Horizontal` / `Card Atributo - Extended`) — likely iterative variants kept side-by-side rather than cleaned up.
