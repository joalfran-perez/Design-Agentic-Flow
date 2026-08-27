# Componentes Desktop — Component Inventory

Source: https://www.figma.com/design/nCGtIjrJLW6v4ZMvzTsOAd/USS---Componentes-Desktop

Pages: "👋🏼 Comenzar" · Badges · Buttons · Cards · Divider · Image / video · Tags

Captured via Figma metadata endpoints (this account has view-only access to this file, so component
structure was read from `get_metadata` / `get_variable_defs` rather than the Plugin API).

Sampling `get_variable_defs` across these pages confirms they consume the exact same semantic tokens as the
Foundations file (e.g. `Color Tokens/Text/Strong`, `Light mode/Surface/Interactive default`, `Elevación 1`) —
one shared design-token library published across all three files, not three independent palettes.

## Badges

| Component | Variant dimensions | Total variant symbols |
|---|---|---|
| Badge | 5 types (Neutral, Info, Success, Alert, Error) | 10 (× Light/Dark) |
| Badge dot | 1 style | 2 (× Light/Dark) |

## Buttons

| Component | Variant dimensions | Total variant symbols |
|---|---|---|
| Button primary | 3 sizes × 5 states | 30 (× Light/Dark) |
| Button secondary | 3 sizes × 5 states | 30 (× Light/Dark) |
| Button tertiary | 3 sizes × 5 states | 30 (× Light/Dark) |
| Button icon | 3 sizes × 5 states | 30 (× Light/Dark) |
| Button float | 1 size × 5 states | 10 (× Light/Dark) |
| Button full width | 1 size × 5 states | 10 (× Light/Dark) |
| _Focus element (utility) | 4 border-radius shapes | 8 (× Light/Dark) |

States for all button variants: Default, Hover, Active, Focus, Disabled.

## Cards

| Component | Variant dimensions | Total variant symbols |
|---|---|---|
| Card M Vertical | Background 1/2/None(Border) | 6 (× Light/Dark) |
| Card M Horizontal | Background 1/2/None(Border) · Desktop only | 6 (× Light/Dark) |
| Card S Vertical | Background 1/2/None(Border) | 6 (× Light/Dark) |
| Card S Horizontal | Background 1/2/None(Border) · Desktop only | 6 (× Light/Dark) |
| Card Atributo - Horizontal | Background 1/2/None(Border) | 6 (× Light/Dark) |
| Card Atributo - Vertical | Background 1/2/None(Border) | 6 (× Light/Dark) |
| Card Metrica KPI | Background 1/2 | 4 (× Light/Dark) |
| Card Persona S horizontal | Background 1/2/None(Border) | 6 (× Light/Dark) |
| Card Persona S vertical | Background 1/2/None(Border) | 6 (× Light/Dark) |
| Card Persona M horizontal | Background 1/2/None(Border) · Desktop only | 6 (× Light/Dark) |
| Card Persona M Vertical | Background 1/2/None(Border) | 6 (× Light/Dark) |
| Feature card | Background 1/2 | 4 (× Light/Dark) |
| Card ghost | Type = Imagen / Icono | 4 |
| card background image | Hover state × default/hover | 3 |
| card icono | Default/Hover/Active/Disabled × Border true/false | 16 (× Light/Dark) |
| card interactivo | Tamaño M/S × 4 states (default/hover/active/disabled) | 16 (× Light/Dark) |
| grid cards (layout utilities) | S-4col / M-3col / M-2col arrangements | 8 (× Light/Dark) |

## Divider

| Component | Variant dimensions | Total variant symbols |
|---|---|---|
| Divider sections (full width) | — | 2 (× Light/Dark) |
| Divider contents | — | 2 (× Light/Dark) |

## Image / video

| Component | Variant dimensions | Total variant symbols |
|---|---|---|
| Image frame img | 6 aspect ratios (21:9, 2:1, 16:9, 3:2, 4:3, 1:1) × Vertical yes/no | 12 |
| Video frame | 2 aspect ratios (16:9, 4:3) | 2 |

## Tags

| Component | Variant dimensions | Total variant symbols |
|---|---|---|
| Tag secondary | type = navigation/selection & toggle × 5 states | 20 (× Light/Dark) |
| Tag primary | 5 states | 10 (× Light/Dark) |
