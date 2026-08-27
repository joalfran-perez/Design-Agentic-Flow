# Skill: Inventory Canvas Creation/Update

1. Always read `~/.cursor/skills-cursor/canvas/SKILL.md` first — canvas platform rules live there and
   change independently of this repo. This file only covers repo-specific conventions on top of it.

2. **Location** (fixed, don't deviate): `~/.cursor/projects/c-Users-Genesys-ModUSS/canvases/<kebab-name>.canvas.tsx`.

3. **Naming**: mirrors the inventory folder, kebab-case, e.g. `USS One Design System Inventory/` →
   `uss-one-design-system-inventory.canvas.tsx`. One canvas per system — edit in place for updates, never
   create a second file for an already-covered system (`decisions/003`).

4. **Reusable component pattern** (established across all 3 canvases so far — reuse, don't reinvent):
   - `ColorCell({hex})` — swatch + `<Code>` hex, using `useHostTheme()` for the transparent-checkerboard
     fallback background, never a hardcoded hex for the swatch border/bg.
   - `SectionIntro({file, pages})` — links the source Figma file + one-line page list under each H2 section.
   - Headline `Grid` of `Stat` cards near the top (3–5 max) for the metrics that matter most.
   - `Callout` for headline findings/anomalies — one per major finding, not decorative.
   - `CollapsibleSection` per component page, with an inline `Table` of (Component | Variant axes |
     Variant symbols).
   - Data-quality flags rendered as a `Callout tone="warning"` inside the relevant `CollapsibleSection`,
     not buried in a table cell.

5. **Known gotcha**: passing `key` directly to a custom component inside `.map()` throws a TS error — wrap
   in a native `<div key={...}>` instead. See `gotchas/canvas-key-prop.md`.

6. After writing, the tool result includes "Canvas TypeScript check: ..." — treat that line as the
   authoritative pass/fail signal. Fix and re-save before considering the canvas done.

7. Link the canvas in your chat response using its full absolute path, per the platform skill's
   introduction rules.
