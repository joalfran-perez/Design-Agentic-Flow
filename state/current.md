# Current State

**Last updated:** 2026-08-31 (Jira-ready v0→v2 summary report added for ModUSS Planner's dev team)

## Done
- 3/3 requested Figma file-sets fully inventoried: USS (original), USS One, USS Extension Library.
- 3 interactive canvases built, one per system, all compiling with no TypeScript errors.
- Persistent memory system bootstrapped (`AGENTS.md`, `context/`, `decisions/`, `state/`, `skills/`,
  `gotchas/`, `logs/`).
- Definition-of-Done automated: `scripts/validate-dod.ps1` (manual) + `.cursor/hooks.json` `stop` hook
  (automatic, nudges once per failure). All 3 inventories currently pass with zero warnings. See
  `decisions/006`, `skills/dod-validation.md`.
- `USS Design system Inventory/` renamed to `USS Design System Inventory/` (casing fix). See `decisions/008`.
- Pushed to GitHub: `origin` = https://github.com/joalfran-perez/Design-Agentic-Flow (private), `master`
  tracks `origin/master`, working tree clean.
- Code↔design mapping done for `@ussebastian/kitdigital-react` (published npm library) vs.
  `USS Design System Inventory/` and, for the 21 components with no counterpart there, cross-checked
  against `USS One Design System Inventory/` too. Token-level exact match confirmed for colors + font
  sizes, divergence found in radius/spacing, component consolidation pattern documented, 16/21 "extra"
  code components matched to USS One instead. See `context/code-design-mapping.md`, `decisions/009`.
  `package.json`/`package-lock.json` are committed as a permanent pinned reference; `node_modules/` stays
  gitignored.
- Architecture redefined: USS (original) is now the **main/core system**; USS One and Extension Library are
  **local libraries connected to it** (was: 3 flat/independent systems). Updated `AGENTS.md`,
  `context/design.md`, `context/decisiones.md`, `state/inventories.md`, and all 3 inventories' `README.md`.
  See `decisions/010`.
- Reviewed all 5 prior open questions with the user (2026-08-28) and resolved 4/5:
  - Token reconciliation → **start it.** Added `context/canonical-tokens.md` (proposed canonical schema,
    per-category) + `decisions/011`. Surfaced a new, previously-undocumented anomaly while building it
    (main system vs. USS One dark-mode elevation colors are inverted).
  - Data-quality issues → **write a report.** Added `reports/figma-data-quality-issues.md` (8 items,
    severity-tagged) for whoever owns the Figma files.
  - GitHub repo visibility → **flipped to public** (`gh repo edit --visibility public`).
  - Per-faculty theming hypothesis → **confirmed** in `context/design.md` (code's `--custom-secondary-*`
    override pattern is the evidence).
  - Accordion/Modal Testing-page follow-up → **deferred**, per user decision (item 5 below).

- Built a cross-system canvas, `consolidation-status-report`, summarizing hierarchy, token-consolidation
  status per category, all 9 data-quality issues, component-consolidation stats, and a 2-track next-steps
  list (Figma file owners vs. this repo). Compiles with no TypeScript errors.
- **New facts confirmed by the user (2026-08-28), changing scope going forward:** USS One and Extension
  Library are actual branches of the core (not just circumstantially similar); both are actively consumed
  by real downstream projects (unknown to this repo); the main/core system's Figma files are now
  **permanently read-only** — no future session should propose editing them. See `decisions/012`.
- Built `context/consolidation-plan.md`: a 6-phase (0-5) roadmap to **harmonize** (not merge) USS One and
  Extension Library toward a shared Figma-Variables-based token architecture, with a risk register,
  definition of done, and an explicit note on what ModUSS can/cannot do (can't identify real consumers or
  execute any Figma edit). Corrected `context/canonical-tokens.md` and
  `reports/figma-data-quality-issues.md` to remove now-invalid "add to USS main" recommendations. Extended
  the `consolidation-status-report` canvas with a phase-by-phase table and re-tagged the Figma-owner todo
  list by phase.
- **2026-08-31:** First confirmed real downstream consumer found (for the main/core system specifically) —
  "ModUSS Planner" app, via an external visual-norm doc the user shared. Token-bridge hex fallbacks
  cross-checked byte-for-byte against `USS Design System Inventory/tokens/colors.json`: 100% match, no
  drift. No new gaps or anomalies — corroborates `decisions/009`'s color-match finding via a second,
  differently-packaged consumer (`@ussebastian/kitdigital` CSS-only, not `kitdigital-react`). See
  `decisions/013`, `context/code-design-mapping.md` "Real-world consumers" section.
- **2026-08-31:** First *authored* (not just audited) deliverable produced: `deliverables/kitdigital.md`, a
  v2 Kiro steering file for ModUSS Planner, synthesizing the confirmed token bridge + the spec-vs-as-built
  drift found by comparing that app's original steering rule against its post-hoc verified norm doc (icon
  `!important` sizing, unplanned CSS adapter layer, Tailwind/Kit spacing-utility name collision, etc.). New
  `deliverables/` folder (distinct from `reports/`) added to `AGENTS.md`'s Memory Map + routing table. See
  `decisions/014`. Point-in-time snapshot — no auto-sync mechanism to ModUSS Planner's real code.
- **2026-08-31:** Second deliverable variant produced: `deliverables/kitdigital-v2.md`, a Bootstrap-native
  alternative to the Tailwind-first `-v1.md` (renamed for explicit versioning). Instead of an adapter
  fighting the Kit's utility-name collisions, v2 adopts the Kit's native Bootstrap 5 utilities directly for
  spacing + structural grid, with Tailwind's colliding core plugins (`padding`/`margin`/`gap`/`width`/
  `height`) disabled in config so the collision becomes structurally impossible rather than patched after
  the fact. Required inspecting the pinned package's SCSS **source** and — critically — verifying every
  claim against its **compiled** `dist/css/main.css` (source ≠ shipped output turned out to matter: a whole
  Tailwind-clone utility file in source is dead code, never compiled). Surfaced several previously-
  undocumented native-architecture facts (Bootstrap 5 real, utility categories deliberately stripped, a
  second icon-sizing utility system, a 3-way width-scale mismatch, spacing/radius scale gaps vs. the Figma
  canonical scale) — persisted in `context/code-design-mapping.md`'s new "Kit Digital native architecture"
  section before writing the deliverable, since future tasks will need this too. See `decisions/015`.
- **2026-08-31:** Typography section of `deliverables/kitdigital-v2.md` rewritten to consolidate fully onto
  the Kit's native CSS, reversing the part of `decisions/015`'s scope that had left typography on Tailwind.
  The Kit ships a complete responsive semantic type system (`h1..h6`, `.uss-display`, `.uss-intro`, `p`,
  `blockquote`, `.overline`, `code`) whose font-size scale has **zero drift** against the Figma canonical
  scale (first scale in this whole investigation to match exactly — spacing/radius both diverge). Confirmed
  no JS/React typography API exists in `kitdigital-react` (no `Typography`/`Heading`/`Text` export) — the
  only method is a semantic tag or Kit class, no imperative equivalent. Found a new cascade risk specific to
  typography: its rules carry no `!important`, so Tailwind's Preflight (loaded after the Kit's CSS per the
  documented order) would silently erase heading styles on any tag with no explicit class — fixed by a rule
  requiring the Kit class on every heading/paragraph/blockquote, not by reordering imports. Flagged two
  Figma-vs-code drifts (`.uss-h4` desktop weight, `.uss-display` desktop size — the latter has an explicit
  `// antes era 60` comment in the Kit's own source). See `decisions/016`,
  `context/code-design-mapping.md` "Kit Digital native typography" section.
- **2026-08-31:** Color section of `deliverables/kitdigital-v2.md` rewritten to consolidate onto the Kit's
  native CSS variables — full 7×10 base-ramp table plus a category-grouped ~60-token-per-mode semantic
  catalogue (light + dark), both confirmed with zero drift against the Figma-audited hex/category shape.
  Confirmed no JS/React color or theme API exists in `kitdigital-react` — light/dark switching is a plain
  DOM class toggle, same "CSS-only, no imperative API" pattern already found for typography. Found the
  Tailwind-collision fix here is structurally different from spacing/typography: the `colors` core plugin
  must stay enabled (still needed for `bg-*`/`text-*`), so the fix is **replacing** `theme.colors` (not
  extending it) with only Kit-mapped names, removing Tailwind's stock palette as a class entirely.
  Explicitly scoped out an exhaustive token-by-token Figma cross-check (would require bulk-loading all
  three systems' `colors.json`, against `AGENTS.md` rule 2) — only the category-level shape was confirmed.
  See `decisions/017`, `context/code-design-mapping.md` "Kit Digital native color architecture" section.
- **2026-08-31:** Wrote `reports/kitdigital-v0-to-v2-jira-summary.md` — a dev-facing (not internal-audit)
  summary of everything that changed between the original seed rules file used for ModUSS Planner's
  vibe-coding (`kit-digital.md`, out of this repo's scope) and `deliverables/kitdigital-v2.md`, framed as
  Jira-ticket-ready content: a per-area before/after table plus 5 concrete technical findings (icon
  `!important` sizing bug, the Preflight typography-cascade risk, removed Bootstrap color/border utilities,
  percentage-based width/height, 2 Figma-vs-code drifts). See `logs/015`.

## Pending
- Nothing actively requested right now. Data-quality report (`reports/figma-data-quality-issues.md`) is
  written but has not been sent anywhere — up to the user to route it to the actual Figma file owners.
- `context/consolidation-plan.md` Phase 0 (identify real downstream consumers, confirm edit ownership) is a
  **blocking prerequisite** the library owners need to close before Phases 1+ can safely proceed — this
  repo cannot do that step itself.

## Blockers
- None active.
- Historical, deferred by user decision (2026-08-27): the original `USS Design System Inventory/` Mobile
  file only exposes its "Comenzar" index page under the account used for that session — per-component
  Mobile pages (Buttons, Cards, Tags, etc.) were never enumerated. User decided **not to retry** this
  extraction for now. Re-open only if the user asks again or Figma access to that file changes. See
  `state/inventories.md` row 1 and `gotchas/figma-read-only-access.md`.

## Open questions for the user (resolved 2026-08-28, kept for history)
1. ~~Should USS / USS One / Extension Library be reconciled into one canonical token set?~~ **Decided:**
   hierarchy = main system + 2 local libraries (`decisions/010`); token sets **should be reconciled** —
   see the proposed schema in `context/canonical-tokens.md` (`decisions/011`). Note: this is a *proposal*,
   not a live edit to any Figma file — implementing it there is a separate initiative for the file owners.
2. ~~Should the flagged data-quality issues be reported back to whoever owns those Figma files?~~
   **Decided: yes** — written up in `reports/figma-data-quality-issues.md` (8 items). Not yet sent to
   anyone outside this repo; that's on the user.
3. ~~Repo is private on GitHub by default — flip to public?~~ **Decided: made public**
   (`gh repo edit --visibility public`, 2026-08-28).
4. ~~The code's `--custom-secondary-*` theming-override pattern — worth confirming per-faculty
   customization?~~ **Decided: confirmed.** Updated in `context/design.md`.
5. Accordion and Modal in code only trace back to unfinished "Testing 🟡" pages in USS One's Figma —
   **deferred** per user decision (2026-08-28): revisit only once/if those Testing pages are promoted to
   core pages, no action needed now.

## New open questions (surfaced 2026-08-28)
1. ~~Radius "full" canonical value — `1000px` (Extension Library Figma) vs. `9999px` (shipped code)?~~
   **Decided: `9999px`, the published code's value** (rationale: code is what's actually shipped/running;
   Figma should be corrected to match, not the reverse). Updated `context/canonical-tokens.md` and
   `reports/figma-data-quality-issues.md` item 6 accordingly — Extension Library's `Radius-1000` now needs
   renaming/updating to `Radius-Full = 9999px`, and USS/USS One each need that token added (neither has one
   today).
2. ~~Should Extension Library's orphaned purple `Terciary` ramp be deleted or wired up as a real third
   accent?~~ **Decided: wired up.** Formalized as `Themes/Amatista` (new top-level `Themes/` group,
   replacing `_Base/Terciary`), with its duplicate-step bug fixed (step 100: `#402851` → `#2f1d3c`, step 90
   unchanged). See `context/canonical-tokens.md` "Accent / per-faculty theming" and
   `reports/figma-data-quality-issues.md` item 4.
2b. Follow-up decided the same day: freeing the `Terciary` slot left Extension Library's Facultad
    blue-gray values with no formal `_Base/Secondary` ramp (hardcoded only). **Decision: keep the values
    unchanged, add creating that ramp as a pending task** — tracked in the `uss-extension-library-
    inventory` canvas and `reports/figma-data-quality-issues.md` item 9.
3. Still open — 1 remaining item from `context/canonical-tokens.md`'s "Open follow-ups": which pairing of
   the main-system/USS-One dark-mode elevation colors is correct — they're inverted relative to each other
   (`reports/...` item 5). **Explicitly reviewed and deferred by the user (2026-08-28)**, not just
   unaddressed — kept as-is for the design team to answer. Context for next time: USS One's pairing
   (Elevation 1 = darker `#202a37`, Elevation 2 = lighter `#242f3c`) follows the common "higher elevation =
   lighter in dark mode" convention; the main system's is the reverse. Not confirmed as "correct," just the
   more conventional-looking option if this needs a tie-breaker later.
4. Should `reports/figma-data-quality-issues.md` actually be sent/shared with the Figma file owners now, or
   is writing it enough for this session?

## Next-session bootstrap

**What to tell the agent at the start of a new session:** nothing more than *"Lee AGENTS.md y
state/current.md antes de empezar"* — or nothing at all, since this is now a standing rule the agent
should follow proactively (`AGENTS.md` §3 reading order). You never need to paste prior context or
re-summarize past sessions; it lives on disk.

What that unlocks, by task type:
- New Figma extraction request → agent loads `skills/figma-inventory-extraction.md`.
- "How does the main system differ from its local libraries?" → agent reads `context/design.md`'s diff
  tables, not raw JSON (hierarchy: USS = main/core, USS One + Extension Library = local libraries, per
  `decisions/010`).
- A Figma/MCP tool call fails → agent checks `gotchas/` before retrying blind.
- Canvas create/update → agent loads `skills/canvas-creation.md`.
- Checking an inventory folder is complete → agent runs `scripts/validate-dod.ps1`
  (`skills/dod-validation.md`); also runs automatically via the `stop` hook.
- End of any session that changes state → agent updates `state/`, adds a `decisions/` entry if a new
  pattern/anomaly was found, and appends a compressed `logs/` entry — without being asked.
