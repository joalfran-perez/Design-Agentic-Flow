# 007 — Code↔design mapping + main/local-library hierarchy

**Date:** 2026-08-28

**What:** Two related pieces of work in one session.

1. **Code↔design mapping.** User pre-installed `@ussebastian/kitdigital-react@0.21.0` (+ vanilla base
   `@ussebastian/kitdigital`) in `node_modules/`. Analyzed its architecture and cross-referenced tokens/
   components against `USS Design System Inventory/`, then against `USS One Design System Inventory/` for
   the components missing there. Findings → `context/code-design-mapping.md`.

**Numbers:** Colors + font-size scale match exactly (hex/px for hex). Radius: code has 4 steps vs. Figma's
6, plus an unmatched `full` 9999px pill. Spacing: no code equivalent to Figma's 19-step scale at all
(Bootstrap utilities instead). 26 code components total; only 5 (Badge/Button/Card/Divider/Tag) match the
main system's narrow 6-page Desktop capture; 16 of the other 21 matched USS One's fuller catalog; Accordion
+ Modal only trace to unfinished USS One "Testing" pages; AspectRatio/Icon/OpacityLayer are code-only
utilities with no standalone Figma equivalent in either file. `package.json`/`package-lock.json` pinned +
committed as a durable reference (`decisions/009`); `node_modules/` stays gitignored.

2. **Hierarchy redefinition.** User asked to stop treating the 3 systems as flat/parallel and instead model
   USS (original) as the **main/core system**, with USS One and Extension Library as **local libraries
   connected to it** (`decisions/010`). Propagated the new "main / local library" framing across `AGENTS.md`,
   `context/design.md`, `context/decisiones.md`, `state/inventories.md`, `state/current.md`, and all 3
   inventory READMEs (each now states its role + links siblings). Explicitly organizational, not a claim of
   a literal shared Figma library — `decisions/004`'s "don't normalize per-file data" still holds.

**Open questions carried forward:** token-set reconciliation across the hierarchy still undecided; whether
to promote code-design-mapping into a recurring skill if this becomes routine.
