# Skill: Figma Design-System Inventory Extraction

Repeatable procedure used identically across all 3 systems so far. Follow in order. Always load the
external `figma-use` skill first for the underlying `use_figma` API rules — this file only covers the
repo-specific workflow layered on top of it.

## Steps

1. **Extract file keys** from the 3 provided URLs: `figma.com/design/<fileKey>/<name>`.

2. **Discover pages** — `get_metadata` with no `nodeId` on each file (returns top-level page list). Do
   this for all 3 files in parallel (independent calls, one message).

3. **Check access + get style/variable overview** — one `use_figma` call per file, in parallel:
   ```js
   const collections = await figma.variables.getLocalVariableCollectionsAsync();
   const textStyles = await figma.getLocalTextStylesAsync();
   const effectStyles = await figma.getLocalEffectStylesAsync();
   const paintStyles = await figma.getLocalPaintStylesAsync();
   return { collections: collections.map(c => ({name:c.name, modes:c.modes.map(m=>m.name), variableCount:c.variableIds.length})),
     textStyleCount: textStyles.length, effectStyleCount: effectStyles.length, paintStyleCount: paintStyles.length };
   ```
   If this throws "read-only mode" for a file → see `gotchas/figma-read-only-access.md`, fall back to
   `get_metadata`/`get_variable_defs` for that file only.

4. **Small collections** (Space, Radius — typically ≤30 items): dump name+resolved-value list directly in
   one more `use_figma` call. No compression needed.

5. **Large collections** (Color, Typography, paint styles — 100+ items): NEVER dump raw.
   - First: category counts only (`name.split('/')[0]`, then `[0,1].join('/')` for a second level).
   - Then: targeted calls to resolve representative/sample hex or values per category.
   - Always resolve `VARIABLE_ALIAS` recursively (`gotchas/variable-alias-resolution.md`).
   - If a category count looks inflated relative to expectation, check `distinct names` vs `total objects`
     — see `gotchas/duplicate-styles-components.md`.

6. **Components** — one `use_figma` call PER PAGE, all pages fanned out in ONE message (parallel tool
   calls), never looped inside a single script (`gotchas/figma-page-switching.md`). Per-page script:
   ```js
   const page = await figma.getNodeByIdAsync(PAGE_ID);
   await figma.setCurrentPageAsync(page);
   const sets = page.findAllWithCriteria({ types: ['COMPONENT_SET'] });
   const loose = page.findAllWithCriteria({ types: ['COMPONENT'] }).filter(c => c.parent.type !== 'COMPONENT_SET');
   return { page: page.name, componentSets: sets.map(s => ({ name: s.name, variantCount: s.children.length,
     properties: Object.entries(s.componentPropertyDefinitions||{}).map(([k,v])=>({name:k,type:v.type,options:v.variantOptions})) })),
     looseComponents: loose.map(c=>c.name) };
   ```
   Skip deep-scanning obvious staging/testing pages (names containing "Testing 🟡", underscored section
   dividers, Patterns/Templates/DOR/Annotations/Otros) — list them as "not deep-scanned" instead.

7. **Sum and cross-check**: total variants/sets per page must sum to the file totals reported in step 6;
   category totals from step 5 must match the semantic-token counts used in `tokens/colors.json`.

8. **Write outputs** (see `decisions/002` for the fixed shape):
   - `tokens/{spacing,radius,colors,typography,effects}.json` — resolved values, category grouping,
     `note` fields for every anomaly, a `vsPreviousSystem`/comparison note.
   - `components/{desktop,mobile}-components.md` — page-by-page tables (Component | Variants | Key
     properties), "not deep-scanned" list, "Data-quality flags" section.
   - `README.md` — sources table, key-metrics table, "what's new/different" bullets, contents list.

9. **Build/update the canvas** — see `skills/canvas-creation.md`.

10. **Close out**: update `state/inventories.md` row, add `decisions/NNN-*.md` for any new
    pattern/anomaly, append `logs/NNN-*.md` (≤30 lines).
