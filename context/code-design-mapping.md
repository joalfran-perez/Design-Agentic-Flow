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

