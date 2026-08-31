# 010 — Real downstream consumer found: ModUSS Planner token cross-check

**Date:** 2026-08-31

**What happened:** User shared an external doc (*"16.1.10 · Norma Visual — Kit Digital USS"*, a Confluence
export saved locally under `Documents\USS\MODUSS\`) documenting how a separate real app, "ModUSS Planner"
(Next.js dashboard, unrelated to this repo), adopted `@ussebastian/kitdigital` — the **CSS-only** package,
not `kitdigital-react` (which `decisions/009` already pinned). Asked to analyze it as "código de ModUSS."

**Numbers:** Cross-checked its `tailwind.config.ts` token-bridge hex fallbacks (9 mapped classes: paper,
surface, line, line2, navy/navy.head, brand, ink, ok/warn/err) against
`USS Design System Inventory/tokens/colors.json` Light-mode semantic tokens — **100% match, zero drift**.

**Key findings:**
1. First real, citable downstream consumer of the main/core system's tokens (previously only hypothesized —
   `context/consolidation-plan.md` Phase 0 flags "identify real consumers" as an unresolved blocker for the
   *local libraries*; this is evidence for the *main system*, found incidentally).
2. Corroborates, via a second and differently-packaged consumer, the exact-color-match finding
   `decisions/009` already made for `kitdigital-react`.
3. The norm doc's referenced Form/Table/Modal/Tabs CSS classes have no Figma counterpart in USS main's
   captured desktop pages — but this is the already-known "matched to USS One instead" pattern, not a new
   gap.
4. No new anomaly, no change needed to any `tokens/*.json` or `canonical-tokens.md`.

**Action taken:** New `decisions/013`; new "Real-world consumers" section in
`context/code-design-mapping.md` with the full cross-check table; `state/current.md` updated. The source
doc itself was **not** copied into this repo (large, app-specific, out of scope per `AGENTS.md` rule 2) —
only the cross-check findings are persisted.

**Open questions:** None new. The Confluence URL for this same doc (`PT1/pages/2157674497`) is
login-gated and unreadable by this agent — if future sessions need it again, the user will need to paste
content or export it, same as this session.
