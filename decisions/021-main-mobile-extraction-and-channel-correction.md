# 021 — Main/core Mobile file extracted; the "inaccessible" diagnosis was wrong

**Date:** 2026-09-25

**Context:** Since the very first extraction (2026-08-27) this repo recorded the main/core system's
*USS — Componentes Mobile* file (`uH4MBdFSPYvfxwXcrdFic9`) as access-limited: "only the `👋🏼 Comenzar`
index page is exposed under this account's permissions." It was logged as a blocker in
`state/current.md`, as a row caveat in `state/inventories.md`, as an example in
`gotchas/figma-read-only-access.md`, and the user deliberately deferred retrying it (2026-08-27). The
user asked to re-test MCP access with all Figma files open.

**What was found:** the two Figma MCP read channels do not return the same thing, and the difference has
nothing to do with permissions or with which files are open:
- `get_metadata` with no `nodeId` returns **only the Comenzar page** for all three Mobile files (main,
  USS One, Extension Library), in every condition tested.
- A read-only `use_figma` script (`figma.root.children.map(...)`) returns the **full** page list for all
  9 files — 44 pages for the main/core Mobile file.

No permission or auth error was ever raised by either channel, on any of the 9 files, authenticated as
`ext.joalfran.perez@uss.cl` (guest on the `DX USS` pro plan). The blocker was a **read-channel artifact
misdiagnosed as a permissions limit**, and it persisted for a month because the original diagnosis was
recorded as fact in four places and never re-tested.

**Decision:** extract the file in full and propagate the correction everywhere it touched.

Extraction followed `skills/figma-inventory-extraction.md` step 6 — one read-only `use_figma` call per
page, fanned out in parallel, no writes. **The main/core system's read-only status (`decisions/012`) is
unaffected: that rule forbids writes, not reads.**

**Result — the finding that matters most:** the main/core Mobile file holds **93 component sets / 776
variants across 30 core pages**, with **no "Testing 🟡" staging section at all**. It is the *largest and
most mature* Mobile library of the three (USS One: 77/576 with 6 Testing pages; Extension Library:
54/550 with 14). This inverts a standing assumption — "the main system's capture is the narrowest of the
three" was only ever true of its **Desktop** file — and that Desktop caveat was itself voided the
same day (`decisions/022`). The 6-page Desktop catalogs were the same `get_metadata` under-count.

**Consequence:**
- `USS Design System Inventory/components/mobile-components.md` created; `mobile-notes.md` **deleted**
  (it documented the wrong diagnosis; git history keeps it). The `decisions/002` `mobile-notes.md`
  exception is now unused by all three inventories.
- **`context/code-design-mapping.md`'s component-level conclusion is retracted and rewritten.** The old
  result ("only 5 of 26 code components match the main system; 16 exist only in USS One") was an artifact
  of the missing file. Actual result: **23 of 26 have a counterpart in the main/core system itself**. The
  remaining 3 are not gaps — `AspectRatio` and `OpacityLayer` exist as *variant/boolean properties*
  (`Aspect ratio` on `Imagen frame img 📱`; `Opacity` on `Page hero`), and `Icon` is an `INSTANCE_SWAP`
  slot, which is the normal Figma idiom. That file also had a dangling "(see follow-up section below)"
  pointer to a section that was never written; the rewrite fills it.
- **`decisions/018`'s Desktop gap still stands** — 11 of 12 patterns ModUSS Planner needs have no Desktop
  spec in any system. What changes is the *source* for a desktop adaptation (the canonical main/core
  Mobile spec, not a local library's) and the claim that Modal/Accordion were Testing-only, which is
  false for the main system. Its "reopens open question 5" consequence is void; **Empty state** is the
  one item of that recommendation that genuinely remains unspecified anywhere but staging.
- 4 new data-quality items (11–14) in `reports/figma-data-quality-issues.md`, including one genuine bug:
  `Assets/Item dropdown menu 📱` is a **broken component set** — Figma itself throws
  `Component set has existing errors` when reading its property definitions. These sit in the core
  system, so the read-only constraint means they can't be routed through the local-library consolidation
  track; they need whoever still holds edit rights.
- `gotchas/figma-read-only-access.md` rewritten with a symptom-discrimination table, so the two failure
  modes are never conflated again. The operative rule: **a short page list from `get_metadata` is
  evidence of nothing** — only a thrown error proves an access limit.
- `context/design.md`, the inventory README, `state/` and the `uss-design-system-inventory` canvas all
  updated with the real numbers.

**Process lesson worth keeping:** a recorded limitation is a hypothesis with an expiry date, not a fact.
This one was written down once, propagated into four files, and then reasoned from for a month. When a
constraint blocks something valuable, re-verify it before building conclusions on top of it.
