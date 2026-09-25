# USS Kit Digital 0.21.0 ↔ main Figma component parity

**Prepared:** 2026-09-25 · **Audience:** design-system / kit maintainers (audit, not consumer steering).
**Scope:** published npm `@ussebastian/kitdigital-react` + `@ussebastian/kitdigital` **0.21.0** vs the
**main/core** USS Figma kit only (Foundations + Desktop + Mobile). USS One and Extension Library are
out of scope. Core Figma files were **not edited** (`decisions/012`). Inventories were **not
re-extracted**.

Durable summary: [`context/code-design-mapping.md`](../context/code-design-mapping.md). Interactive
matrix: canvas `uss-kit-figma-parity`. Method: [`skills/code-design-audit.md`](../skills/code-design-audit.md).
Decision: [`decisions/024-uss-kit-figma-component-parity.md`](../decisions/024-uss-kit-figma-component-parity.md).

**Verdicts:** `match` · `packaging` · `figma_only` · `code_only` · `axis_drift` · `token_drift`. A row
can carry a presence verdict **and** an axis/token tag.

## Sources (cited, not conversation)

| Side | Artifact |
|---|---|
| React public API | `node_modules/@ussebastian/kitdigital-react/dist/components/index.d.ts` + `dist/types/index.d.ts` |
| CSS tokens / classes | `node_modules/@ussebastian/kitdigital/dist/css/main.css` (compiled = truth); SCSS only as comment |
| Figma structure / axes | `USS Design System Inventory/components/{desktop,mobile}-components.md` |
| Figma foundations | `USS Design System Inventory/tokens/{spacing,radius,colors,typography,effects}.json` |
| Sample bindings | `get_variable_defs` on one Default/light variant per priority family (node IDs below). Desktop `use_figma` threw read-only this session; Desktop Buttons recovered via `get_metadata` on `802:11800` |

Patterns pages (`Filters`, `Forms`) stay **listed, not deep-scanned**. Empty state is **absent from
this core** (and from the 0.21.0 export list) — a consumer gap, not a one-sided parity cell.

## Headline

Name-level presence is still **23/26** React families in the core kit. The new work is the other
direction and the axes/tokens: **two Desktop-only Figma pages have no code** (Navigation stack,
Sheets); **Button / Tag / Accordion / Tabs / Card** share a name but not the same axes; **spacing,
radius, H4 weight, Display size, and dark elevation pairing** disagree at the foundation layer;
sampled component tokens (button fill, tag padding, alert/toast type colors, modal/toast elevation
*light*) mostly match.

## 1. Code catalog (0.21.0)

Two packages, not one: React ships markup; tokens live in `@ussebastian/kitdigital/dist/css/main.css`.

**Public React exports** (`dist/components/index.d.ts`): Header, Form, Accordion, AccordionItem,
AspectRatio, AlertMessage, Button, CarouselCards, CarouselHero, CarouselContent, Tabs, Tab, Icon,
Tooltip, Modal, ModalBody, ModalFooter, Stepper, StepperCircle, Badge, Breadcrumb, BreadcrumbItem,
Divider, Hero, Link, LinkedList, LinkedListItem, Pagination, Tag, Table + table parts, Card + card
parts, Banner + banner parts, Footer, ToastProvider, useToast, ToastStaticTemplate.

**Present as files, not barrel-exported:** `Button/ThemeToggle.d.ts` (`ButtonToggleTheme`) and
`OpacityLayer`. Header exposes `toggleThemeButton`; Hero/Banner take `opacityLayer`. Packaging, not
a public-component gap.

**Compiled `.uss-*` roots** (53, BEM elements omitted): accordion, alert-message, badge, banner,
breadcrumb, btn, card, carousel-cards/content/hero/v2, circle-progress, display, divider,
font-heavier/italic/lighter, footer (+ baseline/main/sublinks), form, form-group, h1–h6, hero, icon,
input-style, intro, link, logo, mainnav, menu-accordion, modal, nav, opacity-layer, skip-to-content,
sr-only / not-sr-only, stepper, table, tag, toast (+ container), toggle-switch, tooltip, topnav
(+ items/wrapper). Tabs and pagination exist only as `.uss-tabs__*` / `.uss-pagination__*` (no root
class). Linked list is `.uss-linked-list__*` only.

**CSS-only (no React component):** semantic type (`.uss-h1`–`.h6`, `.uss-display`, `.uss-intro`,
`.p-size--*`), form internals (`.uss-form__input`, `.uss-toggle-switch`, native checkbox/radio/select),
`.uss-btn--rrss`, `.uss-btn--inline`, `.uss-btn--theme-toggle`.

## 2. Bidirectional presence + axes

Sources: Desktop 32 core pages / 106 sets / 920 variants; Mobile 30 / 93 / 776.

| Family | Desk | Mob | React | CSS root | Figma axes (compressed) | Code props / classes | Verdict |
|---|---|---|---|---|---|---|---|
| Accordion | yes | yes | Accordion | `.uss-accordion` | Dark; Group row Estado D=3 (incl. Hover) / M=2 | `autoClose`; no Hover prop | `match` + `axis_drift` |
| Alert | yes | yes | AlertMessage | `.uss-alert-message` | Dark; Type 4; extra **Top page** set | `variant` 4 | `match` (top-page = composition) |
| Badge | yes | yes | Badge | `.uss-badge` | Dark; Tipo 5 + dot | `variant` 6 incl. `dot` | `match` (Alert↔warning name) |
| Banner | yes | yes | Banner | `.uss-banner` | Split / Main; Dark; display type | `variant` main\|split | `match` |
| Breadcrumb | yes | yes | Breadcrumb | `.uss-breadcrumb` | D Item Estado 5; M 3 | `currentPage` | `match` + `axis_drift` |
| Button | yes | yes | Button | `.uss-btn` | D 5 states (Hover); M 4 except full width; 3 sizes; float set | `variant` primary/secondary/tertiary/full-width/link/icon/icon-sm/slide-*; `size` sm\|md\|lg; **no `floating`** | `axis_drift` |
| Card | yes | yes | Card | `.uss-card` | Many named sets; horizontal **Desktop-only**; ghost **broken** (D) | `variant` simple\|kpi\|attribute\|persona\|feature; `size`; `orientation` | `axis_drift` |
| Carousel | yes | yes | 3 exports | `.uss-carousel-*` | Cards / single / icono + controls | Cards / Hero / Content | `match` (`packaging` split) |
| Divider | yes | yes | Divider | `.uss-divider` | Dark; section vs content | `vertical` | `match` |
| Footer | yes | yes | Footer | `.uss-footer` | Dark; M extra navbar dropdown | sections + baseline | `match` |
| Form (7 Figma pages) | yes | yes | Form + Group/Label/Help | `.uss-form` | Checkbox, Dropdown, Radio, Select, Select date, Switch, Text field | `Form.Group.state` normal\|success\|warning\|error\|disabled; native inputs + CSS | `packaging` |
| Header | yes | yes | Header | `.uss-mainnav` / `.uss-topnav` | Standard vs CTA (D); menu-open (M) | `menuLinks`, `topbarLinks`, `toggleThemeButton` | `match` |
| Hero | yes | yes | Hero | `.uss-hero` | 5 layouts; Opacity layer set | `variant` 3; `opacityLayer`; `height` | `match` |
| Image / video | yes | yes | — | — | Aspect ratio axis | AspectRatio **prop/component** | `packaging` |
| Link | yes | yes | Link | `.uss-link` | Dark; Estado 6 (incl. Visited) | href / external | `match` (Visited CSS-only) |
| Linked list | yes | yes | LinkedList | `.uss-linked-list__*` | Dark; Item Estado 5/4 | `links[]` | `match` |
| Modal | yes | yes | Modal | `.uss-modal` | Dark; Type 4; Centered | `iconVariant` 4; `orientation`; `isOpen` | `match` |
| Navigation stack | **yes** | no | — | — | Dark; list item state 4 | none | `figma_only` |
| Pagination | yes | yes | Pagination | `.uss-pagination__*` | Dark; Item Estado 6/5; Extended | children / active | `match` |
| Radio / Checkbox / Switch / Select / Date / Text | yes | yes | (Form) | `.uss-form*` / `.uss-toggle-switch` | Dark; Checked; Estado 3–7 | native + `Form.Group.state` | `packaging` |
| Sheets | **yes** | no | — | — | Bottom / side; is modal; width | none | `figma_only` |
| Stepper | yes | yes | Stepper, StepperCircle | `.uss-stepper` / `.uss-circle-progress` | D condensed; M First/Middle/Final + radial | item `variant`; Circle `currentStep` | `match` + `axis_drift` |
| Table | yes | yes | Table | `.uss-table` | Dark; Size L/S | `tableSize` lg; **`stripes`** | `match` + `code_only` stripes |
| Tabs | yes | yes | Tabs | `.uss-tabs__*` | D Item Estado 6 (Hover); M 5 | no state props | `match` + `axis_drift` |
| Tag | yes | yes | Tag | `.uss-tag` | D secondary `type` nav/toggle, 5 states; M 4 states, no type | `variant` primary\|secondary; `isFilter`; `href` | `axis_drift` |
| Toast | yes | yes | useToast | `.uss-toast` | Dark; Type 4 | `variant` 4 | `match` |
| Tooltip | yes | yes | Tooltip | `.uss-tooltip` | Dark | `placement` 12 | `match` |
| Icon | swap | swap | Icon | `.uss-icon` | INSTANCE_SWAP; only `Assets/Icon help` named | `icon` + size | `packaging` |
| OpacityLayer | set | prop | (not exported) | `.uss-opacity-layer` | type 5 × Color 3 | Hero/Banner prop | `packaging` |
| AspectRatio | axis | axis | AspectRatio | — | 6 + vertical | `ratio` enum | `packaging` |
| Typography | styles | styles | **none** | `.uss-h*` / `.uss-display` | 156 text styles | CSS-only | `packaging` |
| Button rrss / inline | no | no | — | `.uss-btn--rrss`, `--inline` | no Figma set | CSS-only | `code_only` |
| Theme toggle | — | — | not exported | `.uss-btn--theme-toggle` | — | Header flag | `packaging` |
| Slot / Separador / Patterns | listed | listed | — | — | not deep-scanned | — | `figma_only` (composition) |
| Empty state | **absent** | **absent** | **absent** | — | Testing-only in local libraries | — | neither side (consumer gap) |

### Axis notes already in inventory (verified in code, not re-discovered)

- **Buttons:** Desktop Hover on every set; Mobile drops Hover except `Button full width 📱` (DQ item 14).
  CSS implements `:hover` / `.hover` on all `.uss-btn--*` — code is closer to Desktop. React has no
  `floating` variant; CSS `.uss-btn--floating` exists and Figma has `Button float`.
- **Cards:** Figma’s named sets (Persona, Atributo, KPI, ghost, interactivo, icono, background-image,
  horizontal Desktop-only) collapse to five React `variant`s plus `orientation`. `Card ghost` is a
  broken Desktop set (item 15) with no code counterpart.
- **Tags:** Desktop `type=navigation|toggle` remaps to React `href` / `isFilter`; Mobile has neither
  axis. CSS hover exists on secondary; Mobile Figma has no Hover.
- **Form:** seven Figma pages → one `Form` + CSS. `Form.Group.state` covers 5 of Text field’s 6
  Estados; Active/Focus is `:focus` in CSS, not a React state.

## 3. Foundation tokens (inventory JSON vs compiled CSS)

| Category | Figma core (`tokens/*.json`) | Kit compiled CSS | Verdict |
|---|---|---|---|
| Spacing | 19 steps: 4…32, **36**, 44…96, **112**, 128, 160, **`spacing-216` = 220** | `--spacing-{0,4,8,12,16,20,24,28,32,40,44,48,56,64,80,96,128,160}` | `token_drift` — code missing 36/112/216; extra 0 and **40**. On-disk main inventory records **220** for `spacing-216` (name≠value), which **contradicts** DQ item 1 (“main = 216”). Live Foundations `use_figma` threw read-only this session; value not re-confirmed in Figma. |
| Radius | 0, **2, 4**, 8, **12**, 16 | none / s=8 / m=16 / **full=9999** | `token_drift` — no 2/4/12 vars; full exists only in code (DQ item 6) |
| Color ramps + semantic | 7×10 + semantics, Light/Dark | same names/hex (prior audit) | `match` |
| Type size scale | 16 named sizes | `--font-size-{10…80}` same list | `match` |
| H4 | Desk: Medium **500** / 25 / 40; Mob: SemiBold **600** / 18 / 32 | Mob: weight **500** / 18 / 2rem; Desk mq: weight **600** / 25 / 2.5rem | `token_drift` — **weights are inverted** across breakpoints (item 10 was desktop-only) |
| Display title | ExtraBold **60** / 120% | desktop `.uss-display` → `--font-size-56` (source comment `// antes era 60`) | `token_drift` |
| Elevation light | Elevación 1 & 2 drop-shadow pairs | `.shadow-1` / `.shadow-2` same offsets + alpha (order swapped) | `match` |
| Elevation dark | `#242f3c` (1) / `#202a37` (2) | `.shadow-1` → `--neutral-85` `#202a37`; `.shadow-2` → `--neutral-82` `#242f3c` | `token_drift` — pairing **swapped** vs this core (open item 5 vs USS One) |

## 4. Sampled component bindings

One Default/light variant per priority family. Bindings from `get_variable_defs`. Empty
`node.boundVariables` on the Plugin API walk — variables are on descendants; the remote tool walks them.

| Family | Node | Bound tokens (compressed) | vs compiled CSS | Verdict |
|---|---|---|---|---|
| Button (M) | `1141:8028` Button primary 📱 Large Default | Botones/Primario `#001894`; Text interactive Inverse `#E4E8FC`. Pad 10/16; radius 100000 (full) | `--button-primary` light = primary-90 `#001894`; `--text-interactive-inverse`; pad `0.625rem 1rem` under default breakpoint; `--border-radius-full` | `match` |
| Button (D) | same id in Desktop file `nCGtIjrJLW6v4ZMvzTsOAd` | Color Tokens/Buttons/Primary default `#001894`; Inverse `#e4e8fc` | same hex | `match` (token name path differs, value does not) |
| Text field (M) | `1289:14040` | Text Strong/Subtle; Surface ghost `#FFFFFF`; Border Strong `#888E96` | `.uss-form__input` border `--border-strong`; color `--text-subtle`; **`--surface-ghost-default: transparent`** not `#FFFFFF` | `match` colors; `token_drift` ghost = white vs transparent |
| Card M (M) | `1568:23185` BG1 | Background 1 `#FFFFFF`; Surface default `#E4E8FC`; H4 Mobile 18/600; Body 16/400 | `.uss-card` default border `--border`; alt uses `--background-2`. Title if `.uss-h4` is weight 500 on mobile | `match` surfaces; H4 weight as above |
| Header (M) | `1793:16086` | Text interactive Default; Surface ghost | `.uss-mainnav__wrap` `--background` | `match` (chrome uses background, not ghost) |
| Modal (M) | `2214:22785` Info | Surface info `#E1EEF8`; Text info `#00628D`; H4 18/600; Elevación 1 | `--surface-info` / `--text-info`; `.shadow-1` = Elevación 1 light | `match` (H4 weight aside) |
| Table (M) | `2196:38982` Small | Text Strong; Border Subtle/Default; H6 14/700; Body 16 | `.uss-table` uses `--border-*` / `--text-strong` | `match` |
| Tabs (M) | `1393:10834` Item Default | Text interactive Subtle `#58616E` | default tab color `--text-interactive-subtle` family | `match` |
| Tag (M) | `1366:11739` primary Default | Surface strong `#001894`; Inverse `#E4E8FC`. Pad 4/12; **radius 1000** | `.uss-tag--primary` extends `.uss-btn--primary` → radius **9999**; pad `0.25rem 0.75rem` | pad `match`; radius `token_drift` |
| Alert (M) | `2007:17600` Info | Surface info `#E1EEF8`; Text info / info strong; pad **28** | `--surface-info`; title `--text-info-strong`; pad **`2rem 2.5rem 2rem 1.5rem`** (32/40/32/24) | colors `match`; pad `token_drift` |
| Toast (M) | `2026:17845` Info | Background 1; Elevación 2; Text info; H6; Body S | `--background`; `.shadow-2` = Elevación 2 light; type modifiers | `match` |

Mobile Tabs `use_figma` threw read-only; structure + Default id recovered via `get_metadata` on
`1393:10823`.

## 5. What this does *not* change

- Core Figma stays read-only. No suggested edit to `USS Design System Inventory/` sources.
- `deliverables/kitdigital-v1.md` / `-v2.md` rules still hold (use Kit classes; H4/Display already
  flagged). Not rewritten.
- Local-library inventories were not opened for this audit.

## 6. Suggested next steps (owners, not this repo)

1. Decide whether mobile buttons should document Hover (code already has it) — item 14.
2. Confirm H4: Figma and CSS have **opposite** weights at each breakpoint; pick one pairing.
3. Display 60 vs 56 — code already documents the change.
4. Add or drop spacing 36/112/216 and radius 2/4/12/`full` so Figma Variables and `--spacing-*` /
   `--border-radius-*` share a scale.
5. Navigation stack + Sheets: either a future kit export or an explicit “Figma-only layout” note.
6. Empty state: still the only named consumer pattern with no core spec and no 0.21.0 export.
