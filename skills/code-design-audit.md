# Skill: Code ↔ Design Component Audit

Recurring procedure for a bidirectional parity pass between the **pinned** Kit Digital npm packages
and a Figma inventory already on disk. Promoted from `decisions/009` after the first full
presence+axes+tokens report (`decisions/024`).

This skill does **not** replace `skills/figma-inventory-extraction.md`. Do not re-extract Figma
unless `state/inventories.md` says the source changed **and** the user confirms.

## When to use

- User asks whether the published kit matches the USS Figma kit (components, variants, tokens).
- Refresh [`reports/uss-kit-figma-component-parity.md`](../reports/uss-kit-figma-component-parity.md)
  after a kit version bump or a confirmed inventory update.
- Do **not** use this to edit Figma (core is read-only, `decisions/012`) or to rewrite
  `deliverables/kitdigital-v1.md` / `-v2.md` unless a cited consumer rule is now false.

## Preconditions

1. Read `AGENTS.md` → `state/current.md` → `state/inventories.md`.
2. Scope must be explicit: which inventory folder, which npm pin (`package.json`).
   Default for plan 001: **main/core only** + `@ussebastian/kitdigital-react` + `@ussebastian/kitdigital` **0.21.0**.
3. `npm install` so `node_modules/@ussebastian/` matches the lockfile. Do not re-pin unless asked.
4. Confirm compiled CSS is the token source of truth (`dist/css/main.css`), not SCSS alone
   (source ≠ compiled is already documented in `context/code-design-mapping.md`).

## Steps

1. **Code catalog (no Figma).**
   - Public React exports: `dist/components/index.d.ts` (not the folder listing — ThemeToggle /
     OpacityLayer can exist as files without being exported).
   - Prop axes: `dist/types/index.d.ts`.
   - Compiled `.uss-*` roots + `--spacing-*` / `--border-radius-*` / semantic color vars from
     `dist/css/main.css`. Compress (do not paste the file). Group by family (`decisions/001`).

2. **Presence + axes matrix (no Figma).**
   - Union: core pages in `components/{desktop,mobile}-components.md` + React exports + CSS-only
     families that a consumer would treat as components (type, form internals, rrss).
   - Columns: Desk / Mob / React / CSS root / Figma axes vs code props / verdict
     `match | packaging | figma_only | code_only | axis_drift | token_drift`.
   - Patterns (`Filters`, `Forms`) stay listed, not deep-scanned.
   - Verify known axis flags in **code**, do not re-walk 900+ variants: Button Hover, Card named
     sets, Tag `type`, Form 7-to-1, Accordion Hover, Tabs Hover.

3. **Foundation tokens (no Figma).**
   - Cross `tokens/{spacing,radius,colors,typography,effects}.json` of the scoped inventory
     against compiled CSS vars. Do **not** bulk-load the other two systems (`AGENTS.md` rule 2).
   - Reuse `context/design.md` / prior mapping for color-ramp identity unless the user asks for a
     fresh hex pass.

4. **Sampled bindings (Figma, targeted).**
   - One Default/light variant per priority family: Button, Text field, Card, Header, Modal, Table,
     Tabs, Tag, Alert, Toast. Add Mobile only when the inventory already records an axis split.
   - Prefer `get_variable_defs` on a concrete component/instance id. `get_metadata` with no
     `nodeId` is not a catalog (`state/inventories.md` § MCP channel).
   - `use_figma` listing pages is fine when it works; if it throws read-only, fall back per
     `gotchas/figma-read-only-access.md`. Never write. Never call `componentPropertyDefinitions`
     on a variant (`figma-use` rule 18).
   - Cap bindings (~10 names/hexes per sample). Compare to the equivalent CSS custom properties.

5. **Write, don't dump.**
   - Full matrix + samples: `reports/uss-kit-figma-component-parity.md` (or a dated successor if
     the user asks to keep the 0.21.0 snapshot).
   - Short pointer + new facts only: `context/code-design-mapping.md` (do not paste 50 rows).
   - Refresh canvas `uss-kit-figma-parity` (cross-system exception, same as
     `consolidation-status-report` — do not create a second canvas).
   - New DQ items → append `reports/figma-data-quality-issues.md`. Flag, don't fix inventory JSON.
   - Close the session: `decisions/NNN` if the method or a new anomaly landed, `logs/`, `state/`.

## Do not

- Re-extract inventories “to be sure.”
- Open USS One / Extension Library token JSON for a main-system audit.
- Treat `dist/components/` file names as the public API.
- Trust SCSS comments over compiled CSS.
- Propose edits to core Figma files.
