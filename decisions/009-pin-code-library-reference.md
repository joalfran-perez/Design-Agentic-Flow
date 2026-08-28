# 009 — Pin the published code library as a local reference (scope extension)

**Date:** 2026-08-28

**Context:** ModUSS's stated identity (`AGENTS.md` §1) was "documentation/data repo (no app code)." The
user installed `@ussebastian/kitdigital-react` (which pulls in `@ussebastian/kitdigital`, the real
vanilla-JS/SCSS "kit base") via `npm install` at the repo root and asked for its architecture to be
analyzed and cross-referenced against `USS Design System Inventory/`.

**Decision:** Treat this as a **scope extension, not a violation** of the "no app code" rule: ModUSS does
not build, run, or ship this code — it keeps a pinned local copy purely as a reference for code↔design gap
analysis, the same way Figma file keys are pinned in `context/design.md` §Sources. Findings are persisted
in `context/code-design-mapping.md`, not re-derived from `node_modules` each session.

**Consequence:** `node_modules/` stays gitignored (already true before this session). `package.json`
(pins `@ussebastian/kitdigital-react@^0.21.0`) and `package-lock.json` **are committed** to the repo —
the user confirmed (2026-08-28) they should be a durable pinned reference for future code↔design audits,
not treated as scratch. Anyone cloning this repo and running `npm install` reproduces the exact code
version this analysis was run against.

**If code↔design analysis becomes a recurring task**, promote it to a proper skill
(`skills/code-design-audit.md`) the way Figma extraction and canvas creation already are — not done yet
since this was a single ad hoc request.
