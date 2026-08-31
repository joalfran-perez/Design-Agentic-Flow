# AGENTS.md — ModUSS Control File

## 1. Identity & Purpose
ModUSS is a **documentation/data repo** (no app code) that maintains audited inventories of design-system
tokens, styles, and components extracted from Figma for the USS (Universidad San Sebastián) brand family.

**Hierarchy (see `decisions/010`):** one **main/core system** plus two **local libraries** — confirmed
(2026-08-28) to be actual branches of the core, not independent builds — connected to it. Each still has
its own 3 Figma files (Foundations, Desktop components, Mobile components) and its own genuinely different
token architecture (`decisions/004`, though this is now being actively harmonized, see below).

**The main/core system's Figma files are READ-ONLY as of 2026-08-28 (`decisions/012`).** Never propose or
imply an edit to `USS Design System Inventory/`'s underlying Figma files in any future session — all
canonical additions/fixes land only in USS One and/or Extension Library.

**Consolidation in progress:** the 2 local libraries are being harmonized (not merged — each stays
independently consumable) toward a shared Figma-Variables-based token architecture. See
`context/consolidation-plan.md` (phased roadmap) and `decisions/012` (scope decisions) before proposing any
token/component change to either local library.

| Role | System | Folder | Status |
|---|---|---|---|
| **Main / core** | USS (original) | `USS Design System Inventory/` | Done, Mobile access-limited |
| Local library | USS One | `USS One Design System Inventory/` | Done |
| Local library | USS Extension Library | `USS Extension Library Design System Inventory/` | Done |

Job of this repo: keep a low-noise, resolved (no unresolved aliases), machine+human-readable record of what
actually exists in each Figma file-set and the deltas between systems — without re-deriving everything from
Figma every session.

Since 2026-08-28, a pinned local reference copy of the published code implementation
(`@ussebastian/kitdigital-react` + `@ussebastian/kitdigital`) is also kept in `node_modules/` (gitignored)
for code↔design gap analysis — see `decisions/009` and `context/code-design-mapping.md`. This does not
make ModUSS an app-code repo: nothing here is built, run, or shipped.

## 2. Hard Rules (never break)
1. **Context is expensive and volatile.** Real memory lives in files under `state/`, `decisions/`, `gotchas/`,
   `logs/`, `context/`. Never assume chat history survives across sessions.
2. **Never bulk-load.** Don't open all three inventories' full token files to answer a narrow question — read
   only the one `tokens/*.json` or `components/*.md` needed. Use `context/design.md`'s diff tables for
   cross-system questions instead of recomputing from raw JSON.
3. **Don't re-extract without cause.** Check `state/inventories.md` before touching Figma again — re-extract a
   file-set only if the user confirms the Figma source changed.
4. **Fixed inventory shape**, no exceptions: `README.md`, `tokens/{spacing,radius,colors,typography,effects}.json`,
   `components/{desktop,mobile}-components.md`.
5. **Folder naming**: `<System Display Name> Design System Inventory` (Title Case, matches the Figma file
   family name, no abbreviations).
6. **One canvas per file-set**, kebab-case, in the fixed Cursor canvases dir (§5). Edit the existing canvas,
   never create a duplicate for the same system.
7. **Flag anomalies, never silently fix them.** Duplicate styles, value drift, misnamed/misplaced tokens →
   add an explicit `note`/callout. This repo audits Figma state; it doesn't correct it.
8. **Adaptive compression is mandatory** for any Figma read >~50 items (see `decisions/001`). Never paste a
   raw large array into a file or the chat.
9. **Close every session that changes state**: update `state/`, add a `decisions/` entry if a new
   pattern/anomaly was found, append a compressed `logs/` entry.
10. **Keep `logs/` short.** Once it holds >15 numbered entries, run `scripts/archive-logs.ps1` (see
    `skills/logs-archival.md`, `decisions/007`) before adding more.

## 3. Preferred Reading Order
1. This file — always, first.
2. `state/current.md` — what's done/pending/blocked right now.
3. Task-specific, only as needed:
   - New/updated Figma extraction → `skills/figma-inventory-extraction.md`
   - Canvas create/edit → `skills/canvas-creation.md`
   - "How does X differ between the main system and its local libraries" → `context/design.md`
   - A `use_figma`/MCP call fails → `gotchas/` (match by symptom) before retrying blind
   - "What did we decide / why is it built this way" → `context/decisiones.md` index → the specific
     `decisions/NNN-*.md`
4. Only then, the specific inventory file the task needs. Never open an entire inventory folder at once.

## 4. Skill Routing
| Task type | Use |
|---|---|
| Extract a new/updated Figma file-set | `skills/figma-inventory-extraction.md` + external `figma-use` skill |
| Create/update an inventory's canvas | `skills/canvas-creation.md` + external `canvas` skill |
| Check/verify an inventory folder is complete | `skills/dod-validation.md` (`scripts/validate-dod.ps1`) |
| `logs/` has grown large | `skills/logs-archival.md` (`scripts/archive-logs.ps1`) |
| Cross-system comparison | `context/design.md` pre-computed tables — don't recompute from raw JSON |
| "Does the published code match the Figma inventory?" | `context/code-design-mapping.md` — don't re-scan `node_modules` from scratch |
| "What should token X be, going forward?" (target/canonical value) | `context/canonical-tokens.md` (`decisions/011`) — a proposal, not a live change to any system's `tokens/*.json` |
| "What's the plan to harmonize the 2 local libraries?" | `context/consolidation-plan.md` (`decisions/012`) — phased roadmap, not yet executed |
| Need a data-quality issue written up for the Figma file owners | `reports/figma-data-quality-issues.md` — append new items, don't duplicate existing ones |
| Produce an authored guidance artifact for an external consumer's dev workflow (not a Figma-owner report) | `deliverables/` (`decisions/014`) — plan first (sources, structure, diff vs. any prior version), confirm scope/location with the user, then write. Synthesis of already-captured context only, never invented rules |
| Diagnose a Figma/MCP tool error | `gotchas/*.md` first, then the external skill's own error table |
| Record a new architectural/process decision | New `decisions/NNN-slug.md` (date, context, decision,
  consequence) + update the index in `context/decisiones.md` |

## 5. Conventions
- Canvases: `~/.cursor/projects/c-Users-Genesys-ModUSS/canvases/<kebab-name>.canvas.tsx`. Existing:
  `uss-design-system-inventory`, `uss-one-design-system-inventory`, `uss-extension-library-inventory` (one
  per file-set, rule 6), plus `consolidation-status-report` (cross-system status report, not tied to a
  single inventory — refresh it, don't duplicate, if asked for an updated consolidation report).
- Figma file keys/URLs/access levels for all 9 files are catalogued once in `context/design.md` §Sources —
  copy from there, don't re-derive from URLs each time.
- All color values in this repo are **resolved** (final hex), never a raw `VARIABLE_ALIAS`.
- Spanish is fine in Figma-native names/quotes; write prose (README/context/decisions) in English for
  consistency with existing inventory docs, except `context/decisiones.md` which is Spanish by request.

## 6. Definition of Done (per inventory extraction/update)
Run `powershell -File scripts/validate-dod.ps1` to check items 1-2 automatically (structure + valid JSON +
`state/inventories.md` reference). A `stop` hook (`.cursor/hooks.json`) also runs this after every agent
response and nudges once if it fails — see `skills/dod-validation.md`.
- [ ] `README.md`: sources table, key-metrics table, "what's new vs. prior system" section, contents list.
- [ ] All 5 `tokens/*.json` present, values resolved, anomalies flagged with a `note`.
- [ ] `components/desktop-components.md` + `mobile-components.md`: page-by-page, counts verified by sum.
- [ ] Canvas created/updated; tool result shows "Canvas TypeScript check: no errors".
- [ ] `state/inventories.md` row updated.
- [ ] `context/design.md` diff table updated if a new cross-system difference was found.
- [ ] `decisions/` entry added for any new pattern/anomaly/convention.
- [ ] `logs/NNN-*.md` appended (≤30 lines: what, numbers, key findings, open questions).

## 7. Agent Behavior With Context (golden rules)
- The context window is expensive and volatile — durable memory lives on disk, not in conversation.
- Never load the full project history or every file "just in case." Load only what the current task needs.
- After any session that produces something worth keeping: update `state/`, log the decision, compress the
  outcome into `logs/` — do this proactively, don't wait to be asked.
- Prefer a file reference/pointer over pasting long content into a prompt or a chat response.
- A procedure used more than once belongs in `skills/`, not re-explained inline each time.
- Keep this file ≤300 lines. If it grows, move detail into `context/` or `decisions/` and leave a pointer.

## 8. Memory Map
```
AGENTS.md      you are here — control file
context/       synthesized cross-system reference: design.md (architecture+diffs), canonical-tokens.md
               (proposed unified schema, decisions/011), decisiones.md (index, ES), code-design-mapping.md
decisions/     dated ADR-style entries, one file per decision
state/         current.md (status/blockers), inventories.md (per-system completeness table)
skills/        reusable step-by-step procedures specific to this repo
gotchas/       known Figma/Canvas API failures + fixes, one file per symptom
logs/          compressed per-session summaries, numbered chronologically
reports/       external-facing deliverables meant to leave this repo (e.g. figma-data-quality-issues.md) —
               distinct from context/decisions/, which are internal memory
deliverables/  authored guidance artifacts for an external consumer's own dev workflow (e.g. kitdigital-v1.md
               /-v2.md, decisions/014, 015) — point-in-time snapshots, not auto-synced; distinct from
               reports/ (Figma-owner-facing, not consumer-dev-workflow-facing). Alternative approaches for
               the same consumer get a new `-vN.md` suffix, never overwrite an existing one
scripts/       validate-dod.ps1 (DoD checker), archive-logs.ps1 (logs/ pruning, decisions/007)
.cursor/       hooks.json + hooks/ — runs validate-dod.ps1 on every agent stop
USS*/          the actual inventory deliverables — data, not memory
```
