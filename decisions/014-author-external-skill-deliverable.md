# 014 — First authored (not just audited) deliverable for an external consumer

**Date:** 2026-08-31

**Context:** Following `decisions/013` (first confirmed real downstream consumer, "ModUSS Planner"), the
user asked for a **plan to generate `kitdigital.md`** — an improved Kiro steering file (`inclusion: always`)
meant to be dropped into that *other* app's repo (`.kiro/steering/`), synthesizing:
1. This repo's Figma-derived token audit (`USS Design System Inventory/tokens/colors.json`,
   `context/canonical-tokens.md`).
2. The spec-vs-as-built drift found by comparing ModUSS Planner's original steering file (v1, shared as
   `kit-digital.md`) against its post-hoc verified norm doc (`16.1.10 · Norma Visual`, shared as a local
   Confluence export) — icon-sizing `!important` collision, an unplanned CSS adapter layer, Tailwind/Kit
   spacing-utility name collisions, etc.

Presented a plan (sources, structure, diff-vs-v1) and asked the user 2 scoping questions before writing:

**Decision:**
1. **Location:** a new top-level folder, `deliverables/`, distinct from `reports/` — `reports/` stays
   scoped to Figma-file-owner-facing findings (data-quality issues); `deliverables/` is for authored
   guidance artifacts meant to be copied into and used by an external repo's own dev workflow. First (and
   so far only) member: `deliverables/kitdigital.md`.
2. **Scope:** *synthesis, not invention* — the generated file only reorganizes and reinforces rules already
   evidenced by the two documents the user shared plus this repo's own token audit. No general Tailwind/
   design-token best practices were added from the model's own judgment beyond what was already observed.

**Consequence:**
- New `deliverables/` folder added to the Memory Map (`AGENTS.md` §8) and a routing-table row added (§4)
  for "produce an authored guidance artifact for an external consumer."
- `deliverables/kitdigital.md` is a **point-in-time snapshot** — there is no mechanism to keep it
  auto-synced with ModUSS Planner's real code (this repo has no access to that codebase). It must be
  manually regenerated if `context/canonical-tokens.md` or `context/code-design-mapping.md` change
  materially, or if a new consumer doc surfaces with new lessons. The file itself carries a provenance
  footer saying so.
- Precedent for future asks of the same shape ("write a skill/rule for repo X based on what ModUSS knows
  about the design system"): follow this same pattern — plan first (sources, structure, diff), confirm
  location + scope with the user, then write to `deliverables/`.
