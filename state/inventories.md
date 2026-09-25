# Inventory Completeness Matrix

Hierarchy per `decisions/010`: USS (original) is the **main/core system**; USS One and USS Extension
Library are **local libraries connected to it** (organizational model — each still has its own separate
Figma Foundations file and token architecture, per `decisions/004`).

| Role | System | Folder | Figma access (Fnd/Desk/Mob) | Tokens | Components | Canvas | Known gaps |
|---|---|---|---|---|---|---|---|
| **Main / core** | USS (original) | `USS Design System Inventory/` | edit / view (full via Plugin API; Sheets page via `get_metadata`) / read-confirmed | Complete (169 vars: 19 Space+144 Color+6 Radius; 156 text styles; 2 effects; 208 paint styles) | **Desktop complete — 32 core of 46 / 106 sets / 920 variants, extracted 2026-09-25, no Testing.** **Mobile complete — 30 core of 44 / 93 sets / 776 variants, extracted 2026-09-25, no Testing.** | `uss-design-system-inventory` | Data-quality items 11–15 + 18 (`spacing-216`=220 on disk). Kit↔Figma parity: `reports/uss-kit-figma-component-parity.md` (`decisions/024`) |
| Local library | USS One | `USS One Design System Inventory/` | edit / edit / edit | Complete (343+144 color vars, 235 typo vars incl. 205 line-heights, 6 effect styles) | **Desktop complete — 28 core of 51 / 88 sets / 676 variants** (Testing: Accordion, Breadcrumb-Tittle, Buttons, Empty State, Modals, Tags). Mobile 77 sets/576 variants (27 of 49 pages scanned, 21 staging pages listed not scanned) | `uss-one-design-system-inventory` | Desktop Testing pages not deep-scanned; 21 mobile staging pages not deep-scanned; Card ghost junk Dark-mode options (item 16) |
| Local library | USS Extension Library | `USS Extension Library Design System Inventory/` | edit / edit / edit | Complete but architecturally different: 0 color/typo variables; 529 paint styles (334 distinct, 195 exact duplicates); 191 text styles; 8 radius tokens (+`Radius-1000`, +stray `Boolean` var) | **Desktop complete — 24 core of 46 / 55 sets / 620 variants** (Testing: Avatar, Accordion, Cards, Header, Carousel, Footer, Page hero, Alert, Table). Mobile 54 sets/550 variants (22 of 54 pages scanned, staging listed not scanned) | `uss-extension-library-inventory` | Style/component duplication unresolved (flagged, not fixed); Tag secondary missing `type` axis (item 17); staging pages not deep-scanned |

## MCP channel note (verified 2026-09-25, extended same day)

The two Figma MCP read channels **do not see the same thing**, and the difference is the channel, not
permissions or which files are open in the desktop app:
- `get_metadata` (no `nodeId`) **under-counts** large component files: only `👋🏼 Comenzar` on all 3
  Mobile files; Comenzar + the same 6 component pages on all 3 Desktop files.
- `use_figma` with a read-only script (`figma.root.children.map(...)`) returns the **full** page list
  on all 9 files (Desktop 46 / 51 / 46; Mobile 44 / 49 / 54).
- One per-page exception: main Desktop **Sheets** (`8762:3101`) threw the genuine view-only error on
  `use_figma` even though every other page in that file succeeded. Recovered via `get_metadata` with
  that `nodeId`.

When a file looks empty or "narrow," retry through `use_figma` before concluding anything about access
or catalog size. Reading the main/core system's files this way stays within `decisions/012` — the
read-only rule forbids *writes*, not reads.

## Re-extraction triggers
Only re-run `skills/figma-inventory-extraction.md` for a system if:
- The user confirms the source Figma file(s) changed since the dates above, OR
- Figma access level changes for a previously access-limited file — this trigger fired on 2026-09-25
  for the main/core Mobile file (`decisions/021`) and the same day for all 3 Desktop files
  (`decisions/022`), OR
- The user explicitly asks to deep-scan a previously-skipped staging/testing page.
