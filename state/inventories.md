# Inventory Completeness Matrix

Hierarchy per `decisions/010`: USS (original) is the **main/core system**; USS One and USS Extension
Library are **local libraries connected to it** (organizational model — each still has its own separate
Figma Foundations file and token architecture, per `decisions/004`).

| Role | System | Folder | Figma access (Fnd/Desk/Mob) | Tokens | Components | Canvas | Known gaps |
|---|---|---|---|---|---|---|---|
| **Main / core** | USS (original) | `USS Design System Inventory/` | edit / view / view | Complete (169 vars: 19 Space+144 Color+6 Radius; 156 text styles; 2 effects; 208 paint styles) | Desktop full (~40 components, 6 pages); Mobile = access notes only (`mobile-notes.md`, Comenzar index page only) | `uss-design-system-inventory` | Mobile per-component pages inaccessible under permissions used |
| Local library | USS One | `USS One Design System Inventory/` | edit / edit / edit | Complete (343+144 color vars, 235 typo vars incl. 205 line-heights, 6 effect styles) | Desktop 33 sets/323 variants (6/7 pages, Buttons page "Testing 🟡"); Mobile 77 sets/576 variants (27 of 48 pages scanned, 21 staging pages listed not scanned) | `uss-one-design-system-inventory` | Desktop porting behind Mobile; 21 mobile staging pages not deep-scanned |
| Local library | USS Extension Library | `USS Extension Library Design System Inventory/` | edit / edit / edit | Complete but architecturally different: 0 color/typo variables; 529 paint styles (334 distinct, 195 exact duplicates); 191 text styles; 8 radius tokens (+`Radius-1000`, +stray `Boolean` var) | Desktop 41 sets/383 variants (6 pages, Cards page "Testing 🟡"); Mobile 54 sets/550 variants (22 of ~48 pages scanned, ~29 staging pages listed not scanned) | `uss-extension-library-inventory` | Style/component duplication unresolved (by design — flagged, not fixed); staging pages not deep-scanned |

## Re-extraction triggers
Only re-run `skills/figma-inventory-extraction.md` for a system if:
- The user confirms the source Figma file(s) changed since the dates above, OR
- Figma access level changes for a previously access-limited file (e.g. original USS Mobile), OR
- The user explicitly asks to deep-scan a previously-skipped staging/testing page.
