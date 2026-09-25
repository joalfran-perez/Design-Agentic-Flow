# 023 — Persist queued implementation plans in `plans/`

**Date:** 2026-09-25

**Context:** A full component-parity report (Kit Digital 0.21.0 vs main-system Figma) was planned
but not executed in the same session. Cursor's local `.cursor/plans/` file is not repo memory
(`AGENTS.md` rule 1). The user asked for a durable directory so a later session can run the plan
without reconstructing it.

**Decision:** Add a top-level `plans/` folder for implementation plans that are **queued, not yet
run**. Numbered `NNN-kebab-slug.md`, indexed in `plans/README.md`. Distinct from `context/`
roadmaps (standing reference), `decisions/` (already decided), and `deliverables/` (authored
consumer artifacts).

**Consequence:** First member is `plans/001-uss-kit-figma-component-parity.md`. Executed 2026-09-25
(`status: done`, `decisions/024`). `AGENTS.md` Memory Map + routing table point here.
