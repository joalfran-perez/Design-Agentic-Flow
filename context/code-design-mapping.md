# Code ↔ Design Mapping: `@ussebastian/kitdigital-react` vs. `USS Design System Inventory/`

**Added:** 2026-08-28. Cross-references the actual **published code** implementation of the USS kit
against this repo's Figma-derived audit of the **original USS system** (`USS Design System Inventory/`),
per user request. See `decisions/009-pin-code-library-reference.md` for why this npm package now lives in
this repo at all.

## What was analyzed

- `@ussebastian/kitdigital-react@0.21.0` — React component wrapper. `node_modules/@ussebastian/kitdigital-react`.
- `@ussebastian/kitdigital@0.21.0` — the actual vanilla JS/SCSS "kit base" (a real dependency of the
React package, not just a peer). This is where CSS custom properties (design tokens) and component
styles live. `node_modules/@ussebastian/kitdigital`.
- Docs site (consumption conventions, imperative vs. declarative API):
[Kit Digital USS React docs](https://pre-dev--cl-uss-kitdigital-docs.netlify.app/desarrollo/componentes-react-intro).
- Design counterpart used for comparison (per user): `USS Design System Inventory/` — the **main/core
  system** in this repo's hierarchy (`decisions/010`). Where a code component has no counterpart there, it
  was cross-checked against the **local library** `USS One Design System Inventory/` instead (see follow-up
  section below).



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

## Real-world consumers

**Added 2026-08-31.** First confirmed real downstream consumer of the main/core system's tokens, found via
an external doc the user shared (not from Figma or `node_modules`) — see `decisions/013`.

- **"ModUSS Planner"** — a Next.js dashboard app (unrelated to this repo despite the name). Per its binding
  visual norm (ADR-012 / DDDI-112, 2026-08-28), it consumes `@ussebastian/kitdigital` **CSS-only** (not
  `kitdigital-react`, i.e. a different integration path than the one pinned in `decisions/009`) plus
  Tailwind for layout, reconciled via a `tailwind.config.ts` token bridge and a `kit-adapter.css` layer.
- **Token bridge cross-check (Light mode) — 100% match, no drift** against
  `USS Design System Inventory/tokens/colors.json`:

  | App class | Kit CSS var | App's hex fallback | `colors.json` semantic token | Match |
  |---|---|---|---|---|
  | `paper` | `--background-2` | `#F6F7F7` | Background 2 (light) | ✅ |
  | `surface` | `--background` | `#FFFFFF` | Background 1 (light) | ✅ |
  | `line` | `--border-subtle` | `#D4D6D9` | Border · Subtle (light) | ✅ |
  | `line2` | `--neutral-30` | `#DFE0E3` | Neutral 30 (base palette) | ✅ |
  | `navy` / `navy.head` | `--primary-100` / `--primary-90` | `#001370` / `#001894` | Primary 100 / Primary 90 | ✅ |
  | `brand` | `--text-interactive` | `#001894` | Text interactive · Default (light) | ✅ |
  | `ink` | `--text-strong` | `#0B141F` | Text · Strong (light) | ✅ |
  | `ok` / `warn` / `err` | `--text-success` / `--text-warning` / `--text-error` | `#007350` / `#836100` / `#9D0000` | Feedback · Text success/warning/error (light) | ✅ |

  Independently corroborates, for a second and differently-packaged consumer, the exact color-token match
  `decisions/009` already found for `kitdigital-react`.
- **No new gap found:** the norm doc also references `.uss-form__input`, `.uss-table`, `.uss-modal`, and
  `.uss-tabs__*` CSS classes, none of which have a counterpart in USS main's captured desktop pages
  (Badges/Buttons/Cards/Divider/Image-video/Tags only) — this matches the already-documented "16/21 extra
  code components matched to USS One instead" pattern from `decisions/009`, not a newly discovered gap.
- App-specific colors with **no Kit/Figma equivalent by design** (out of scope for this repo's inventories):
  `gold` (`#C9852A`, activity/share accent) and seven `ind.*` colors (one per MODUSS Planner indicator).

## Kit Digital native architecture (from pinned source)

**Added 2026-08-31.** Extracted directly from `@ussebastian/kitdigital`'s SCSS source (pinned per
`decisions/009`, at `node_modules/@ussebastian/kitdigital/src/css/`) — primary source, not inferred from an
external doc. Feeds `decisions/015` (Bootstrap-native alternative deliverable).

- **The Kit's utility layer is literally Bootstrap 5**, not just Bootstrap-styled: `_extended-bootstrap.scss`
  does `@import 'bootstrap/scss/{functions,variables,maps,mixins,utilities,reboot,containers,grid}'` with a
  custom `$spacers` map. `_bootstrap_remove.scss` then **deliberately strips** several Bootstrap utility
  categories: `opacity`, all `border-*`/`border-color`/`border-width`/`border-opacity`, `rounded-*`,
  `color`/`background-color`/`text-opacity`/`bg-opacity`/`gradient`, `font-family`/`font-style`,
  `margin-start`/`margin-end`/`padding-start`/`padding-end`, and negative-margin utilities. **Only spacing
  and grid utilities survive as "native Bootstrap"** — color/border/radius/opacity are meant to go through
  the Kit's semantic classes/CSS variables instead, never a raw Bootstrap utility class.
- **Caution: source SCSS ≠ compiled CSS here.** `_utilities-flex.scss` is headed
  `// copied from https://tailwindcss.com/docs/flex-direction` (Tailwind-named classes: `.items-center`,
  `.justify-between`, `.self-stretch`...) — but it is **never imported by `main.scss`**, so it's dead source
  code that never reaches `dist/css/main.css`. Confirmed empirically by searching the compiled CSS: `.flex`
  and other **display** utilities (`.block`, `.grid`, `.hidden`, `.inline-flex`...) *do* ship, unprefixed and
  without `!important` (from `_utilities.scss`, which *is* imported) — but flex-**property** utilities
  (direction/align/justify/wrap/grow/shrink) that actually ship come from Bootstrap's own generator instead,
  with **Bootstrap's class names**, not Tailwind's, and **with `!important`**: `.align-items-center`,
  `.justify-content-between`, `.flex-column` (not `.flex-col`), `.flex-wrap`, `.flex-fill`, all confirmed
  present in `dist/css/main.css` with `!important`. `.flex-row`/`.flex-wrap`/`.flex-nowrap` happen to share
  Tailwind's exact name (and value), so those specific three are safe either way; anything alignment- or
  justify-related is a different class name in each framework, not a same-name value collision.
- **Native spacing scale** (`--spacing-*` CSS vars in `_variables.scss` + Bootstrap `$spacers` map, both
  identical): `0, 4, 8, 12, 16, 20, 24, 28, 32, 40, 44, 48, 56, 64, 80, 96, 128, 160` (px). **Diverges from
  the Figma-audited canonical 19-step scale** (`context/canonical-tokens.md`): canonical has `36`, `112`,
  `216` that the native code scale lacks; the code has `40` that canonical lacks. Previously undocumented —
  found while building `decisions/015`'s alternative.
- **Native radius scale** (`_variables.scss`): only 4 values — `--border-radius-none: 0`,
  `--border-radius-s: 0.5rem` (8px), `--border-radius-m: 1rem` (16px), `--border-radius-full: 9999px`
  (confirms the `9999px` canonical decision, `decisions/011`, from primary source). The Figma canonical
  6-step scale's `2px`, `4px`, `12px` steps have **no native CSS variable at all** in the shipped Kit.
- **Two independent icon-sizing systems**, not one:
  1. Component-level (`_icons.scss`): `.uss-icon` forces `font-size: 1.5rem !important`; modifiers
     `--xs`/`--sm`/`--lg`/`--xl` (1/1.25/1.75/2rem, also `!important`) — already documented in
     "Real-world consumers" above.
  2. A separate **Bootstrap utility**, `icon-size-{xs,s,m,l,xl,xxl,xxxl}` → `1, 1.25, 1.5, 1.75, 2, 3, 4rem`
     (16/20/24/28/32/48/64px), responsive (per-breakpoint variants), defined in `_extended-bootstrap.scss`,
     **confirmed compiled with `!important`** (`.icon-size-xxl{font-size:3rem!important}` etc. present in
     `dist/css/main.css`). **Not used by ModUSS Planner's adapter** — its custom `--48` modifier duplicates
     exactly what `icon-size-xxl` already provides natively. A concrete example of an avoidable "additional
     code dependency."
- **Native grid**: standard Bootstrap 12-column `.row`/`.col-{1-12}` (`_extended-bootstrap.scss`), confirmed
  compiled (`.col-6{flex:0 0 auto;width:50%}`, no `!important` — grid columns come from Bootstrap's mixin
  system, not the important-utilities API). Breakpoints confirmed as real CSS vars in the compiled output:
  `--breakpoint-md: 1010px` / `--breakpoint-lg: 1296px` (matches the adapter's own `.uss-table` responsive
  breakpoint, `1010px` — shared origin). **No native CSS-Grid utility** (no `.grid-cols-*` equivalent) — only
  the Bootstrap flexbox-based row/column model.
- **Native width/height utilities are percentage-based, confirmed compiled**: `.w-10{width:10%!important}`,
  `.w-100{width:100%!important}` — a **third, distinct scale** from both Tailwind's `.w-10` (2.5rem/40px)
  *and* from what ModUSS Planner's adapter assumed it needed to restore (the Tailwind px-equivalent scale).
  None of the three agree with each other for this class name.
- **`rounded-*`/border/color utility classes confirmed absent** from the compiled CSS (only a `.ri-rounded-
  corner` icon glyph name matches the substring) — verifies `_bootstrap_remove.scss`'s removals actually
  took effect in the shipped artifact, not just in source intent.
- **Color tokens** (`_colors.scss`): confirms, from primary source, the exact same CSS variable names/hex
  values already cross-checked in "Real-world consumers" above (`--background`, `--background-2`,
  `--border-subtle`, `--neutral-*`, `--primary-*`, `--text-*`, etc.), for both `:root/.light` and `.dark`.
  Zero drift — this was previously confirmed only via an external doc's fallback hexes; now confirmed from
  the actual shipped CSS.

## Kit Digital native typography (from pinned source + compiled CSS)

**Added 2026-08-31.** Extracted from `_typography.scss` + `_variables.scss` (SCSS source) and verified
against the compiled `dist/css/main.css`. Feeds `decisions/016` (typography consolidation into
`kitdigital-v2.md`).

- **Native type scale is real CSS custom properties**, confirmed compiled: `--font-size-{10,12,14,16(=base),
  18,20,25,28,32,36,40,48,56,60,72,80}` (17 steps) and `--font-weight-{100..800}` (step 100, 8 steps). The
  font-size scale is the **one scale with zero drift** against the Figma-audited canonical scale
  (`context/canonical-tokens.md` § Typography — same 16-value list, code adds nothing, drops nothing). This
  is notably different from spacing/radius, where the code scale and the Figma scale disagree.
- **The Kit ships a complete, responsive semantic type system**, not just size/weight variables:
  `h1..h6`/`.h1..h6`/`.uss-h1..h6`, `.uss-display` (+ `--sub`, `--content`), `.uss-intro`, `p`/`.p`
  (+ `.p-size--sm`, `.p-size--lg`), `blockquote`/`.blockquote` (+ `.blockquote-size--xl`), `.overline`,
  `code`/`.code` — every rule sets font-family + font-size (var) + font-weight + line-height (+ letter-
  spacing where relevant), confirmed present in the compiled CSS, not just source. Responsive step confirmed
  at **`min-width: 1010px`** — the same breakpoint already documented for grid/spacing, not a separate scale.
- **None of these rules carry `!important`**, confirmed by inspecting the compiled selector blocks directly
  (e.g. `h1,.h1,.uss-h1{font-size:var(--font-size-32);...}` with no trailing `!important`) — unlike the
  Bootstrap spacing/icon-size utilities. This means these rules are only as strong as normal CSS
  specificity/cascade order, not self-protecting.
- **No JS/React typography API exists.** `@ussebastian/kitdigital-react`'s full `dist/components/` export
  list (Accordion, AlertMessage, Badge, Banner, Breadcrumb, Button, Card, Carousel, Divider, Footer, Form,
  Header, Hero, Icon, Link, LinkedList, Modal, Pagination, Stepper, Table, Tabs, Tag, Toast, Tooltip) has no
  `Typography`/`Heading`/`Text` component — typography is CSS-only, consumed via a semantic tag or a
  `.uss-*`/`.p-size--*` class, never a component prop or imperative call. Previously undocumented; confirmed
  by listing the package's compiled component directory, not inferred from docs.
- **Two drifts found against the Figma-audited named styles**
  (`USS Design System Inventory/tokens/typography.json`), flagged per `decisions/005` (not silently fixed;
  also written up in `reports/figma-data-quality-issues.md` item 10 for the Figma file owners):
  - `.uss-h4` at desktop compiles to `font-weight: var(--font-weight-600)`, but Figma's `Títulos/H4`
    (desktop) is `Montserrat Medium` (500) — a weight mismatch on this one heading level only; every other
    heading level's weight matches its Figma counterpart exactly.
  - `.uss-display` at desktop compiles to `font-size: var(--font-size-56)` (56px), but Figma's canonical
    `Otros/Display Tittle` is 60px. The SCSS source carries an inline comment `// antes era 60` ("used to be
    60") next to that exact line — a **documented, intentional** code-side change that Figma hasn't caught
    up to, not a compilation accident.
- **Cascade risk specific to typography (not spacing/icons):** because these rules have no `!important`,
  and Tailwind's Preflight (`@tailwind base`) resets `h1`-`h6` `font-size`/`font-weight` to `inherit`, a
  consumer loading Tailwind's base *after* the Kit's CSS (as `kitdigital-v2.md`'s documented load order
  does) would have Preflight's element-selector rule (`h1{...}`, specificity 0,0,1) win over the Kit's own
  bare-tag rule on any heading with no explicit class — same specificity, later cascade position wins. The
  Kit's compound selector (`h1,.h1,.uss-h1{...}`) means the **class** variant (specificity 0,1,0) always
  outranks Preflight regardless of load order, so the fix is "always pair the tag with its class," not a
  CSS-import reordering. Previously undocumented; only surfaces once Tailwind's Preflight is in the mix, so
  it wasn't visible when auditing the Kit's CSS in isolation.

## Kit Digital native color architecture (from pinned source)

**Added 2026-08-31.** Extracted from `_colors.scss` (full read, both `:root/.light` and `.dark` blocks).
Feeds `decisions/017` (color consolidation into `kitdigital-v2.md`).

- **7 base ramps, 10 steps each**, confirmed identical across `:root/.light` and referenced (not
  re-declared) in `.dark`: `--neutral-*`, `--primary-*`, `--secondary-*`, `--info-*`, `--success-*`,
  `--warning-*`, `--error-*`. Byte-for-byte identical to the hex values already cross-checked across all
  three Figma systems in `context/design.md` — **zero drift**, same as the font-size scale and unlike
  spacing/radius.
- **`--neutral-*` has 4 extra intermediate steps** (`73`, `77`, `82`, `85`) beyond the public 10-step scale,
  used only for dark-mode surface hover/elevation states — not part of the ramp consumers should reach for
  directly.
- **`--secondary-*` is the confirmed per-faculty override point**, each step declared as
  `var(--custom-secondary-NN, <default-hex>)` directly in source — corroborates
  `context/canonical-tokens.md` § "Accent / per-faculty theming" from the actual primary source line, not
  just an inference from this doc's own "Real-world consumers" section.
- **~60 semantic tokens per mode** (`.light` and `.dark`, same variable names, different resolved values):
  Background (2), Surface (8, incl. ghost/strong/disabled), Border (6), Text (4), Links (3), Text
  interactive (10, incl. hover/active/disabled/subtle/inverse variants), Buttons (6), Icons (4), Focus (2),
  Feedback text (8, info/success/warning/error × default/strong), Feedback surface (8, same shape), Neutral
  surface (2), Elevation (2, `transparent` in light → `neutral-82`/`neutral-85` in dark). Category shape
  matches the Figma-audited semantic grouping (`context/canonical-tokens.md` § "Color — semantic tokens":
  Background/Surface/Border/Text/Links/Text interactive/Icons/Feedback/Focus/Buttons, 66 tokens in USS
  One) — **no exhaustive token-by-token cross-check was performed** (would require bulk-loading all three
  systems' `colors.json`, against `AGENTS.md` rule 2); only the category-level shape was confirmed to match.
- **No JS/React color or theme API exists.** Searched `@ussebastian/kitdigital-react`'s entire `dist/` for
  `theme`/`dark`/`useTheme`/`ThemeProvider`/`colorScheme`: zero matches. Light/dark switching is a plain DOM
  class toggle (`.light`/`.dark` on the root element) — there is no library-provided hook or function, same
  "CSS-only, no imperative API" pattern already found for typography.

