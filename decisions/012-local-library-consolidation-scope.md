# 012 — Consolidation plan scope: harmonize, don't merge; target = variables; phased migration

**Date:** 2026-08-28

**Context:** Following `decisions/010`'s hierarchy (main/core + 2 local libraries) and `decisions/011`'s
canonical-schema proposal, the user confirmed new facts that change how consolidation must be planned:

1. USS One and USS Extension Library were created as **branches of the core library**, not independent
   builds — upgrading the "connected to" language in `decisions/010` from circumstantial evidence to a
   confirmed fact.
2. Both local libraries are **actively consumed by other (downstream) projects** today — this is not a
   documentation-only exercise; real production consumers exist, even though this repo has no visibility
   into who they are or how many.
3. The main/core system (`USS Design System Inventory/`) is now **read-only going forward** — it cannot be
   modified as part of this or any future consolidation work. Any canonical addition (e.g. `Radius-Full`)
   can only land in the two local libraries, never in the core file.

**Decision — 3 scope questions resolved with the user before planning:**

| Question | Decision |
|---|---|
| What does "consolidate" mean? | **Harmonize, don't merge.** USS One and Extension Library stay as 2 separate, independently consumable libraries. The goal is making their token/component schemas *consistent with each other*, not collapsing them into one file/package. |
| Target token-delivery architecture? | **Figma Variables** (USS One's model). Extension Library's 529 legacy paint styles are the migration target to retire, not the pattern to keep. |
| Migration risk tolerance? | **Phased, with deprecation.** Because both libraries have real consumers, changes must ship via a parallel-build → deprecate → remove sequence, never a direct swap that could break a consumer mid-flight. |

**Consequence:**
- `context/consolidation-plan.md` (new) is the phased plan built from these 3 decisions — see it for the
  actual roadmap.
- `context/canonical-tokens.md` and `reports/figma-data-quality-issues.md` needed a correction: any prior
  recommendation to "add a token to USS (main)" is invalid now that core is read-only. Canonical additions
  (e.g. `Radius-Full`) only ever land in USS One and/or Extension Library going forward.
- `AGENTS.md` §1 updated to record core-read-only as a standing fact, not just a session note — future
  sessions must not propose edits to `USS Design System Inventory/`'s Figma files.
- This repo still does not execute any of this in Figma — the plan is a proposal for whoever owns/edits the
  two local library files. ModUSS's role stays limited to documenting, proposing, and tracking status.

**Open gap the plan cannot fill on its own:** this repo has zero visibility into which downstream projects
consume USS One or Extension Library, or how. The phased plan treats "identify and notify consumers" as an
explicit Phase 0 task for the library owners — it cannot be done from Figma data alone.
