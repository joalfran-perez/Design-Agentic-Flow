# 019 — Main/core Mobile extracted; "inaccessible" blocker was a misdiagnosis

**Date:** 2026-09-25

**What happened:** User asked to re-test Figma MCP access with all files open. All 9 files responded with
zero auth/permission errors. The three Mobile files still enumerated only `👋🏼 Comenzar` via
`get_metadata` — but a read-only `use_figma` script returned their full page lists. The month-old
"USS Mobile is inaccessible under this account's permissions" blocker was a **read-channel artifact**, not
a permissions limit. User then asked to fill the gap and propagate the correction.

**Numbers:** Main/core Mobile file = 44 pages, **30 core component pages, 93 component sets, 776
variants, 3 loose components, and no "Testing 🟡" section at all**. That makes it the largest and most
mature Mobile library of the three (USS One 77/576 with 6 Testing pages; Extension Library 54/550 with
14). Extracted with 31 read-only Plugin API calls (one per page + 1 verification), fanned out in parallel
per `skills/figma-inventory-extraction.md` step 6. No writes — `decisions/012` untouched.

**Key findings:**
1. **A prior conclusion had to be retracted, not just updated.** The code↔design cross-check said only
   5 of 26 published code components matched the main system and 16 "existed only in USS One." Actual
   number with the file readable: **23 of 26 match the main system itself**. The other 3 aren't gaps —
   `AspectRatio`/`OpacityLayer` are modelled as variant/boolean *properties*, `Icon` as an
   `INSTANCE_SWAP` slot.
2. **The direction of the maturity gap reverses.** Local libraries hold large Testing staging areas of
   components the main system already ships as core (Accordion is core in main, Testing in both locals).
   The Desktop asymmetry named here was **voided the same day** (`decisions/022`): the 6-page Desktop
   catalogs were the same `get_metadata` under-count.
3. **4 new data-quality items (11–14)**, one a real bug: `Assets/Item dropdown menu 📱` is a broken
   component set (Figma throws `Component set has existing errors`). They sit in the read-only core, so
   they can't go through the local-library consolidation track.
4. One suspected anomaly **checked and cleared**: `Select date range📱`'s 7th Estado option is a
   deliberate per-field focus split, not drift.

**Action taken:** New `components/mobile-components.md` (+ `mobile-notes.md` deleted); README, canvas
(`uss-design-system-inventory`, compiles clean), `context/design.md`, `context/code-design-mapping.md`,
`gotchas/figma-read-only-access.md` (rewritten with a symptom-discrimination table),
`decisions/018` (correction block), both ModUSS Planner and data-quality reports, `state/current.md`,
`state/inventories.md`. New `decisions/021`. Also backfilled `context/decisiones.md`, which was missing
rows for decisions 014–020.

**Open questions:** None new. The one live item from the retracted thread is **Empty state** — still
Testing-only in both local libraries and absent from the main system, and still requested by a real
consumer.

**Process lesson:** a recorded limitation is a hypothesis with an expiry date. This one was written once,
propagated to four files, and reasoned from for a month. Re-verify a blocker before building on it.
