# 013 — First confirmed real downstream consumer: "ModUSS Planner"

**Date:** 2026-08-31

**Context:** The user shared an external governance doc, *"16.1.10 · Norma Visual — Kit Digital USS"*
(local copy: `Documents\USS\MODUSS\16.1.10 · Norma Visual — Kit Digital USS.md`; Confluence original at
`PT1/pages/2157674497`, not readable by this agent — login-gated). It documents a binding visual norm
(ADR-012 / DDDI-112, dated 2026-08-28) for a real Next.js app, **"ModUSS Planner"** — unrelated to this repo
despite the similar name; it's a dashboard app for tracking institutional indicators, not this
documentation/data repo. It adopts `@ussebastian/kitdigital` (the **CSS-only** distribution, explicitly
**not** `@ussebastian/kitdigital-react`, which is what `decisions/009` already pinned) plus Tailwind for
layout, reconciled through a token bridge (`tailwind.config.ts`) and an adapter layer (`kit-adapter.css`).

**Decision:** Treat this as confirmed, citable evidence of a **real downstream consumer of the main/core
system's tokens** — previously only a stated hypothesis (`context/consolidation-plan.md` Phase 0 lists
"identify real downstream consumers" as a blocker this repo *can't* resolve itself; this is one, found
incidentally, for the main system specifically — not USS One or Extension Library). Cross-checked the
token bridge's hex fallbacks byte-for-byte against `USS Design System Inventory/tokens/colors.json`
(Light mode): **100% match**, no drift (see table now in `context/code-design-mapping.md`). This
independently corroborates the exact-match finding `decisions/009` already made for `kitdigital-react`,
now for the separate CSS-only package too.

The doc itself is **not copied into this repo** (unlike `decisions/009`'s npm package, which is small and
pinned via `package.json`) — it's a large, app-specific Confluence export that lives outside ModUSS's scope.
Only the cross-check findings are persisted here, per `AGENTS.md` rule 2 (never bulk-load / re-paste large
external content).

**Consequence:**
- `context/code-design-mapping.md` gets a new "Real-world consumers" section with the hex cross-check table
  and the note that Forms/Table/Modal/Tabs classes referenced by ModUSS Planner have no counterpart in USS
  main's captured desktop pages (Badges/Buttons/Cards/Divider/Image-video/Tags only) — already-known
  behavior per `decisions/009`'s "matched to USS One instead" pattern, not a new gap.
- No change to any `tokens/*.json`, `context/canonical-tokens.md`, or `reports/figma-data-quality-issues.md`
  — nothing here contradicts existing captured data; this is corroborating evidence, not a new anomaly.
- If more such consumer docs surface, keep appending to the same "Real-world consumers" section rather than
  creating a new file per consumer.
