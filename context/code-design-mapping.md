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

