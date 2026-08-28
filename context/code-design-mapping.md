# Code ↔ Design Mapping: `@ussebastian/kitdigital-react` vs. `USS Design System Inventory/`

**Added:** 2026-08-28. Cross-references the actual **published code** implementation of the USS kit
against this repo's Figma-derived audit of the **original USS system** (`USS Design System Inventory/`),
per user request. See `decisions/009-pin-code-library-reference.md` for why this npm package now lives in
this repo at all.

## What was analyzed

- **`@ussebastian/kitdigital-react@0.21.0`** — React component wrapper. `node_modules/@ussebastian/kitdigital-react`.
- **`@ussebastian/kitdigital@0.21.0`** — the actual vanilla JS/SCSS "kit base" (a real dependency of the
  React package, not just a peer). This is where CSS custom properties (design tokens) and component
  styles live. `node_modules/@ussebastian/kitdigital`.
- Docs site (consumption conventions, imperative vs. declarative API):
  [Kit Digital USS React docs](https://pre-dev--cl-uss-kitdigital-docs.netlify.app/desarrollo/componentes-react-intro).
- Design counterpart used for comparison (per user): `USS Design System Inventory/` (the "USS (original)"
  system in this repo's memory map).

## Architecture

- **Two-package split, not one self-contained library.** `kitdigital-react` ships only component
  logic/markup; the compiled CSS (and thus all design tokens) must be imported separately from
  `@ussebastian/kitdigital/dist/css/main.css`. A consumer app needs both packages.
- **Dual API convention** (confirmed in both the docs site and the README): every component supports an
  **imperative** style (nested JSX subcomponents, e.g. `<Card><Card.Img/><Card.Body>...`) and a
  **declarative** style (single `content={{ ... }}` config object), switchable in the docs site's live
  examples.
- Build: Vite + TypeScript, dual ESM/CJS output to `dist/`; `src/components` and `src/examples` are also
  published for reference.

## Token-level cross-reference

| Token family | Code location | vs. `USS Design System Inventory/tokens/` | Result |
|---|---|---|---|
| Color (Neutral, Primary, Secondary-Verde, Info/Success/Warning/Error ramps) | `kitdigital/src/css/_colors.scss` (`--neutral-*`, `--primary-*`, etc.) | `colors.json` basePalettes + semanticTokens | **Exact hex match**, spot-checked across all sampled ramps. This is confirmed to be the real, shipped implementation of the audited palette. |
| Typography sizes | `kitdigital/src/css/_variables.scss` (`--font-size-*`: 10,12,14,16,18,20,25,28,32,36,40,48,56,60,72,80) | `typography.json` desktop/mobile sizes (H1=48, H3=32, Body=16, Body S=14, etc.) | **Exact match** on every sampled size. |
| Radius | `_variables.scss` (`--border-radius-none/s/m/full` = 0 / 8px / 16px / 9999px — 4 steps) | `radius.json` (Radius-1..6 = 0,2,4,8,12,16px — 6 steps) | **Diverges.** Code only surfaces a subset (0/8/16) plus a `full` 9999px pill token with **no counterpart in this inventory** (a near-identical "Radius-1000" pill only shows up later, in `USS Extension Library Design System Inventory/tokens/radius.json`) — code appears to have gotten ahead of this particular Figma file-set on this token. |
| Spacing | No equivalent scale found in `_variables.scss`. Layout spacing appears to come from Bootstrap utility classes (`_bootstrap_remove.scss`, `_extended-bootstrap.scss`) with per-component values hardcoded in each component's own SCSS partial. | `spacing.json` — rich custom 19-step "Espaciado" scale (4–220px) | **Diverges most.** No 1:1 ported spacing token layer found in code; the granular Figma scale does not appear to be exposed as reusable CSS custom properties. |

**Theming finding:** the Secondary color ramp in code is wrapped as `var(--custom-secondary-N, <default>)`
for every step — i.e. explicitly built as an override point (almost certainly for faculty/tenant
white-labeling). This is direct code-level evidence relevant to `context/design.md`'s and
`state/current.md`'s open question about whether USS / USS One / Extension Library are meant to be
reconciled or are intentionally divergent per-faculty branches.

## Component-level cross-reference

Code ships **26 component folders**: Accordion, AlertMessage, AspectRatio, Badge, Banner, Breadcrumb,
Button, Card, Carousel, Divider, Footer, Form, Header, Hero, Icon, Link, LinkedList, Modal, OpacityLayer,
Pagination, Stepper, Table, Tabs, Tag, Toast, Tooltip.

`USS Design System Inventory/components/desktop-components.md` only covers **6 pages** (Badges, Buttons,
Cards, Divider, Image/video, Tags) — confirmed as that Figma file's *entire* page list, not a partial scan
(see `decisions/002`). So **20 of the 26 shipped components have no counterpart in this inventory at all**
— not because they're missing from Figma, but because this repo's capture of the original system is
narrower than the real product (Mobile was separately access-limited to an index page, see
`gotchas/figma-read-only-access.md`).

Where a Figma counterpart *does* exist, code consolidates many discrete Figma component instances into one
flexible component with a discriminated `variant`/`content` prop:

| Figma (`USS Design System Inventory`) | Code (`kitdigital-react`) |
|---|---|
| 6 separate Button components (primary/secondary/tertiary/icon/float/full width) | One `<Button variant="primary\|secondary\|tertiary\|icon\|icon-sm\|full-width\|link\|slide-prev\|slide-next" size="sm\|md\|lg">` |
| ~17 Card component sets (M/S Vertical/Horizontal, Atributo, Metrica KPI, Persona, Feature, ghost, background image, icono, interactivo, grid) | One `<Card variant="simple\|kpi\|attribute\|persona\|feature" content={...}>` + slot subcomponents `Card.Img` / `Card.Body` / `Card.Wrapper` / `Card.BottomLink` |
| Badge (5 types) | `<Badge variant="neutral\|info\|success\|warning\|error\|dot">` |
| Tag primary / secondary | `<Tag variant="primary\|secondary" isFilter?>` |

**Coverage gaps (per the package's own README changelog/TODOs at v0.21.0):** Footer, Header,
CarouselContent, and a `_Nav` component are explicitly **unfinished**, despite having folders — treat as
in-progress, not done, if consuming this package today.

### Follow-up: matched against `USS One Design System Inventory/` (2026-08-28)

Of the 26 code components, only **Badge, Button, Card, Divider, Tag** (5) map directly onto the original
system's 6 captured Desktop pages (the 6th page, "Image / video", has no single named-component
equivalent in code — closest is the `AspectRatio` utility). The other 21 were cross-checked against USS
One's much less access-restricted catalog (`components/mobile-components.md`, 27 core pages +
`components/desktop-components.md`):

| Code component | Match in `USS One Design System Inventory` | Status |
|---|---|---|
| AlertMessage | Mobile "Alert message" (2 sets, 16 variants) | Direct match |
| Banner | Mobile "Banners" (2 sets, 4 variants: Split/Main) | Direct match |
| Breadcrumb | Mobile "Breadcrumbs" (1 set, 6 variants) | Direct match |
| Carousel | Mobile "Carousel" (6 sets, 30 variants) | Direct match |
| Footer | Mobile "Footer" (2 sets, 16 variants) | Direct match (code side is the unfinished one, per README TODOs) |
| Header | Mobile "Header menu" (6 sets, 60 variants) | Direct match (code side unfinished, per README TODOs) |
| Hero | Mobile "Page hero" (5 sets + 1 loose, 16 variants) | Direct match |
| Link | Mobile "Link" (1 set, 12 variants) | Direct match |
| LinkedList | Mobile "Linked list" (2 sets, 18 variants) | Direct match |
| Pagination | Mobile "Pagination" (2 sets, 24 variants) | Direct match |
| Stepper | Mobile "Steppers" (4 sets, 16 variants) | Direct match |
| Table | Mobile "Table" (4 sets, 22 variants) | Direct match |
| Tabs | Mobile "Tabs" (2 sets, 12 variants) | Direct match |
| Toast | Mobile "Toast" (1 set, 8 variants) | Direct match |
| Tooltip | Mobile "Tooltip" (1 set, 2 variants) | Direct match |
| Form | Mobile "Text field", "Text area", "Checkbox", "Radio button", "Select", "Select date", "Switch toggle" (7 pages) | Many-to-one: one code `Form`/`FormGroup`/`FormLabel` wraps what Figma models as 7 separate input-type pages |
| Accordion | Mobile "Accordion - Testing 🟡" (Testing page, not core-scanned) | Partial — only a WIP Figma page, not a shipped one |
| Modal | Mobile "Modals - Testing 🟡" (Testing page, not core-scanned) | Partial — only a WIP Figma page, not a shipped one |
| AspectRatio | No standalone set; "Aspect ratio" is a variant property on Image/video frames in both USS systems | Utility-level, not a discrete component in either Figma file |
| Icon | No standalone set; icons appear as swap-instances inside other components | Utility-level, not a discrete component in either Figma file |
| OpacityLayer | No standalone set; "Opacity"/overlay appears as a property inside Hero/Banner variants | Utility-level, not a discrete component in either Figma file |

**Net finding:** 16 of the 21 previously "unmatched" code components have a solid design source after
all — just in USS One's catalog, not the original system's narrower capture. Only Accordion and Modal are
genuinely ahead of Figma's *shipped* state (their only Figma trace is an unfinished Testing page), and
AspectRatio/Icon/OpacityLayer are utility-level primitives neither Figma file models as standalone
components (expected — they're implementation details, not designer-facing patterns).

## Open questions / follow-ups
1. ~~Cross-check the 20 code components with no `USS Design System Inventory/` counterpart against
   `USS One Design System Inventory/`.~~ **Done above (2026-08-28).**
2. `package.json` / `package-lock.json` are now committed as a permanent pinned reference for future
   code↔design audits (per user decision, 2026-08-28). See `decisions/009`.
3. Reconcile the `--custom-secondary-*` theming-override finding above with `context/design.md`'s
   per-faculty-customization question.
