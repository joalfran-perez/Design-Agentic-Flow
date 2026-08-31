# 009 — Local-library consolidation plan (harmonize, don't merge)

**Date:** 2026-08-28

**What:** User confirmed 3 new facts and asked for a full plan to consolidate USS One + Extension Library:
1. Both local libraries are actual branches of the core (upgrades `decisions/010`'s circumstantial evidence
   to a confirmed fact).
2. Both are actively consumed by real downstream projects, unknown to this repo.
3. The main/core system's Figma files are now **permanently read-only** — no future edit proposals allowed.

Before drafting the plan, asked 3 scoping questions (`decisions/012`): "consolidate" = **harmonize, not
merge** (both libraries stay separate/independently consumable); target token mechanism = **Figma
Variables** (USS One's model, retiring Extension Library's 529 legacy paint styles); migration risk
tolerance = **phased with deprecation** (real consumers exist, no big-bang swap).

**Deliverable:** `context/consolidation-plan.md` — a 6-phase (0-5) roadmap:
- Phase 0: discovery & governance (identify consumers, freeze scope) — blocking, can't be done from Figma
  data alone.
- Phase 1: zero-risk value/hygiene fixes (spacing, radius, ramp rename, de-dupe styles & component sets).
- Phase 2: build parallel Variable collections in Extension Library (additive, non-breaking).
- Phase 3: component rewiring (paint styles → variables), highest risk — flagged a real technical gotcha
  (true Figma modes vs. name-encoded dark/light variants must be preserved to keep dark-mode toggling
  working) and a blocking sub-item (elevation-color pairing decision, still deferred).
- Phase 4: deprecation window (communicate, monitor usage — duration is a placeholder pending Phase 0 data).
- Phase 5: removal + re-extract Extension Library in this repo; revisit `decisions/004` once shipped.

Includes a risk register and a definition of done. Explicit "what ModUSS can/cannot do" section: can define
and track the plan; cannot edit Figma, identify real consumers, or set a real calendar timeline.

**Corrections made:** `context/canonical-tokens.md` and `reports/figma-data-quality-issues.md` had prior
recommendations to "add Radius-Full to USS and USS One" — invalid now that core is read-only; fixed to
USS One only. `AGENTS.md` §1 updated with the read-only fact as a standing rule, not just a session note.
Extended the `consolidation-status-report` canvas with a phase table and re-tagged its Figma-owner todo
list by phase number.

**Open/carried forward:** Phase 0's consumer-identification gap is the single biggest blocker to giving
this plan a real timeline; nothing else in this session can resolve it. Elevation-color-pairing decision
(item 5) still deferred, now also flagged as a Phase 3 blocking sub-item.
