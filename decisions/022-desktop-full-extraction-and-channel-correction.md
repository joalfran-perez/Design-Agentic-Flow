# 022 — All three Desktop files extracted in full; the "6-page Desktop" claim was the same channel artifact

**Date:** 2026-09-25

**Context:** After `decisions/021` extracted the main/core Mobile file, this repo still treated every
Desktop file as a 6-page stub (Badges / Buttons / Cards / Divider / Image-video / Tags). That number
came from `get_metadata` and was repeated in `context/design.md`, `context/code-design-mapping.md`,
`decisions/018`, both ModUSS Planner reports, all three inventory READMEs, `state/inventories.md`,
and the inventory canvases. The user noticed the conflict with the actual Figma files — Desktop and
Mobile have component parity — and asked to re-read Desktop via MCP, then to fill the gap.

**What was found:** the same channel difference already documented for Mobile also applies to Desktop.

| File | `get_metadata` pages | `use_figma` pages | Core deep-scanned | Sets / variants |
|---|---|---|---|---|
| USS (main) Desktop | 7 | **46** | 32 (no Testing) | **106 / 920** |
| USS One Desktop | 7 | **51** | 28 (6 Testing) | **88 / 676** |
| Extension Library Desktop | 7 | **46** | 24 (9 Testing) | **55 / 620** |

The main Desktop catalog has **parity with its Mobile file** (the same 30 pages) plus two
Desktop-only pages: **Navigation stack** and **Sheets**. Accordion, Alert, Banners, Breadcrumbs,
Carousel, Footer, Header, Link, Linked list, Modals, Page hero, Pagination, Steppers, Table, Tabs,
Toast, Tooltip and the 7 form pages are all core on Desktop, not Mobile-only.

One per-page exception: `use_figma` on the main system's Sheets page (`8762:3101`) threw the genuine
view-only error even though every other page in that file succeeded. Structure recovered via
`get_metadata` with that `nodeId` (Bottom sheet 4 + side sheet 8 + 8 loose slot examples). Recorded
in `gotchas/figma-read-only-access.md` as a page-scoped, not file-scoped, read-only throw.

**Decision:** extract all three Desktop files in full (core pages only; Testing / Patterns / Sections
listed not deep-scanned) and retract every "Desktop is a 6-page stub / desktop consumers must adapt
from Mobile" claim.

No writes to any Figma file. The main/core read-only rule (`decisions/012`) is unaffected.

**Consequence:**
- All three `components/desktop-components.md` rewritten. READMEs, `context/design.md`,
  `context/code-design-mapping.md` (23/26 now match on **Desktop and Mobile**), `decisions/018`
  (second correction — point 3 void except Empty state), both Planner reports, data-quality items
  15–17, `gotchas/figma-read-only-access.md`, `skills/figma-inventory-extraction.md` step 2, state
  files, and the three inventory canvases updated.
- **Empty state** remains the only requested consumer pattern without a core spec (Testing in USS
  One Desktop + both local Mobile files; absent from the main system).
- Desktop-only pages with no code export: Navigation stack, Sheets.
- New data-quality items: 15 (main Desktop `Card ghost` broken), 16 (USS One Desktop `Card ghost`
  junk Dark-mode options), 17 (Extension `Tag secondary` missing `type` axis).
