# Local-Library Consolidation Plan — USS One + Extension Library

**Status:** proposed plan, not executed. Per `decisions/012`: harmonize (don't merge) the 2 local
libraries, target token mechanism = Figma Variables, migration must be phased with deprecation (both
libraries have real, unidentified downstream consumers). The main/core system is **read-only** and is not
part of any phase below — it stays frozen as the historical reference point.

This repo does not edit Figma. Every phase's "who does it" is whoever owns/maintains the USS One and
Extension Library files; ModUSS's role is limited to defining the plan and tracking status here.

## 0. Constraints that shape every phase

1. **Core is read-only.** No phase touches `USS Design System Inventory/`'s Figma files.
2. **Real consumers exist, unknown to this repo.** Neither library's downstream usage (which projects,
   how many, via what mechanism — direct Figma "insert instance," a published npm package, or both) is
   visible from Figma data alone. Every phase assumes this gap gets closed by the library owners before
   anything risky ships — see Phase 0.
3. **Harmonize, not merge.** USS One and Extension Library stay 2 separate libraries after this plan
   completes. Success = consistent schemas, not one fewer file.
4. **Target mechanism = Figma Variables.** Extension Library's 529 legacy paint styles are being retired,
   not preserved as a second valid pattern.

## 1. Current-state gap (baseline, from `context/design.md` + `context/canonical-tokens.md`)

| Dimension | USS One (today) | Extension Library (today) | Gap to close |
|---|---|---|---|
| Color delivery | 343 canonical + 144 sync variables | 0 variables — 529 paint styles (334 distinct, 195 dup.) | Build an equivalent variable collection in Extension Library |
| Dark/light mechanism | `Color` collection encodes mode in variable NAMES; `Figma-Color` sync collection uses true Figma modes | Folder-prefixed paint style names (`Light mode/`, `☾ Dark mode/`) | New variables must bind through a true-mode collection (see Phase 3 note) to keep dark-mode toggling automatic |
| Spacing | 19 steps, values correct | 19 steps, `spacing-216` = 220px (bug) | 1-value fix |
| Radius | 6 steps, no "full" token | 8 entries: 6 steps + `Radius-1000` (should be 9999) + stray `Boolean` var | Fix value, discard stray var, add `Radius-Full` to USS One too |
| Accent/Facultad base ramp | `_Base/Secondary`, real 10-step ramp, aliased by Facultad tokens | No formal ramp — Facultad values hardcoded; ramp slot repurposed as unrelated `Terciary` purple (duplicate-step bug) | Add `_Base/Secondary` ramp; rename `Terciary`→`Themes/Amatista`, fix duplicate step |
| Component sets | Clean (no known duplicates) | 2 duplicate-named sets (`Button icon 📱`, `Card Persona S horizontal`) | De-duplicate |
| Testing→core maturity | Buttons(Desktop) in Testing; most Mobile core | Cards(Desktop) in Testing; Buttons/Modals(Mobile) core | Not a defect — just track, no fix required by this plan |

## 2. Target state ("harmonized")

Both libraries expose the **same token names, same values, same delivery mechanism** for everything in
`context/canonical-tokens.md`, while remaining independently publishable/consumable:
- Spacing: 19-step scale, both = 216px on step 216.
- Radius: 6 steps + `Radius-Full = 9999px`, both as Figma Variables.
- Color: both deliver semantic + base-palette tokens as Figma Variables (not paint styles), both bound
  through a true-mode collection for automatic light/dark toggling.
- Accent/Facultad: both have a real `_Base/Secondary` ramp backing the Facultad tokens; Extension Library
  additionally keeps its own `Themes/Amatista` ramp (net-new, no USS One equivalent required).
  Typography: already aligned (font-size scale), no action needed.
- Effects: 4-level `Elevacion/1-4` scale in both (already true); dark-mode elevation-color pairing aligned
  once the deferred open question (`reports/figma-data-quality-issues.md` item 5) is resolved.
- No duplicate paint styles, no duplicate component sets, no stray/misplaced variables in either file.

## 3. Phased roadmap

### Phase 0 — Discovery & governance (blocking prerequisite)
*Owner: whoever administers the USS One / Extension Library Figma projects — cannot be done from this
repo's data.*
- Identify actual downstream consumers of each library: which teams/projects insert these components or
  import a published package built from them, and how many.
- Confirm edit ownership/approval process for each of the 6 non-core Figma files (2 libraries × Foundations/
  Desktop/Mobile).
- Freeze scope for the duration of the migration: no new components/tokens added to either library
  mid-flight (avoids chasing a moving target through Phases 1-5).
- **This repo cannot set a real timeline for Phases 4-5 without this data** — durations below are
  placeholders pending real consumer counts.

### Phase 1 — Zero-risk hygiene fixes (no mechanism change, no consumer-facing schema change)
Low risk: every fix here corrects a value to what was already the *intended* meaning, so any consumer
relying on the token's name already expects the corrected behavior.
- Extension Library: `spacing-216` → 216px.
- Extension Library: remove/relocate the stray `Boolean` variable from the Radius collection.
- Extension Library: `Radius-1000` → `Radius-Full` = 9999px (visually identical at any real component size;
  no regression).
- Extension Library: rename `_Base/Terciary` → `Themes/Amatista`; fix step 100 (`#402851`→`#2f1d3c`).
- Extension Library: de-duplicate the 195 duplicate Light-mode paint styles down to 1 per name (repoint any
  layers using a duplicate to the survivor first).
- Extension Library + USS One: resolve the 2 duplicate-named component sets.
- USS One: add `Radius-Full = 9999px` as a new variable (it has none today).

### Phase 2 — Build parallel Variable collections in Extension Library (additive only)
Extension Library only — USS One already has this mechanism. Nothing here touches or removes an existing
paint style yet, so it's non-breaking by construction.
- Create `Color` + `Figma-Color`-equivalent variable collections, structured like USS One's (semantic tokens
  + base palettes), **bound through a true-mode collection** (see Phase 3 note below), populated with the
  exact hex values already confirmed identical to USS One's.
- Add the `_Base/Secondary` blue-gray ramp (10 steps, USS One's exact values) and re-point the Facultad
  accent tokens to alias it instead of hardcoding.
- Result after this phase: Extension Library has 2 parallel, equally-valid color systems (old paint styles
  + new variables) — components still render from paint styles; nothing consumer-facing has changed yet.

### Phase 3 — Component rewiring (highest-risk phase — needs per-component QA)
- Swap each component's fill/stroke bindings from paint styles to the new equivalent variables, one
  component set at a time. Recommended order: primitives first (Badge, Tag, Divider), then composites
  (Cards) last, since composites have the most nested/repeated color usage and the highest chance of a
  missed binding.
- **Technical note (must get right):** USS One's dark/light toggling today works two different ways
  depending on the collection — true Figma modes on the sync collection, vs. name-encoded variants on the
  canonical one. Whichever collection Extension Library's components bind to must preserve the **same
  automatic dark-mode toggling behavior** its paint styles have today (currently driven by the `☾ Dark
  mode` boolean variant property present on nearly every component set). Binding to the wrong collection
  type would silently break dark-mode switching even though every individual color value is correct —
  verify this explicitly per component, not just the resolved hex.
- **Blocked on one open decision:** any component using the dark-mode "Elevation 1/2 (reemplazo a sombra)"
  replacement colors cannot be finalized here until `reports/figma-data-quality-issues.md` item 5 (the
  main-system/USS-One pairing inversion) is resolved — otherwise Extension Library would harmonize toward
  an still-undecided target. Everything else in Phase 3 can proceed independently.

### Phase 4 — Deprecation window (communication + monitoring, no further edits beyond marking)
- Once Phase 3 is complete for a given paint style (no component references it anymore), mark it
  deprecated — Figma has no native flag for this, so use a clear naming/location convention (e.g. move to a
  dedicated "Deprecated" page or prefix the name) so it's unmistakable in the picker.
- Notify the consumers identified in Phase 0 directly, with a concrete sunset date.
- Periodically check remaining usage (Figma's "select all with this style" / library usage stats) to
  confirm the count is trending to zero before Phase 5.
- **Duration is a placeholder** (e.g. "2 sprint cycles") until Phase 0 supplies a real consumer count —
  don't commit to a date without that data.

### Phase 5 — Removal & documentation lock-in
- Delete the (by-then-unused) legacy paint styles from Extension Library.
- Update `USS Extension Library Design System Inventory/`'s own `README.md`/`tokens/colors.json` in this
  repo to reflect the new variable-based architecture (a real re-extraction, not just a note — schedule via
  `skills/figma-inventory-extraction.md` once Phase 5 actually ships in Figma).
- **Revisit `decisions/004`** ("each system's color architecture is genuinely different, don't normalize")
  — once this migration ships, that finding will be partly obsolete: the 2 local libraries would then
  genuinely share the same delivery mechanism. File a follow-up decision at that point; don't pre-empt it
  now since nothing has shipped yet.

## 4. Risk register

| Risk | Phase | Mitigation |
|---|---|---|
| Unknown consumer count → can't size the deprecation window correctly | 4 | Phase 0 must close this gap before committing to a sunset date |
| Dark-mode toggling silently breaks after rewiring to variables | 3 | Explicit per-component QA against the true-mode vs. name-encoded distinction (see Phase 3 note) |
| De-duplicating paint styles (Phase 1) accidentally re-points a layer to the wrong survivor | 1 | Diff each duplicate group before deleting; keep the one with the most existing usages as survivor |
| Elevation dark-mode color decision (item 5) stays unresolved indefinitely, blocking a Phase 3 subset | 3 | Escalate to the design team explicitly; don't let it silently stall the rest of Phase 3 |
| Scope creep — new components/tokens added mid-migration | 0-5 | Phase 0's scope freeze; re-baseline this plan if the freeze is broken |

## 5. Definition of done

- [ ] Every item in `reports/figma-data-quality-issues.md` marked resolved (except item 8, informational).
- [ ] Extension Library's color/radius/spacing delivered via Figma Variables, structurally equivalent to
      USS One's.
- [ ] Zero legacy paint styles remaining in Extension Library (or an explicit, documented exception).
- [ ] Both libraries' Radius collections include `Radius-Full = 9999px`.
- [ ] Both libraries' dark-mode elevation-replacement colors use the same, explicitly-decided pairing.
- [ ] `USS Extension Library Design System Inventory/` re-extracted and updated to reflect the new
      architecture; `decisions/004` revisited.
- [ ] No known downstream consumer reported a break during Phases 3-5 (requires Phase 0's consumer list).

## 6. What ModUSS can and cannot do here

**Can:** define this plan, keep it updated as decisions are made, track phase status in
`state/current.md`, re-extract and re-document each library once changes actually ship in Figma.
**Cannot:** edit any Figma file, identify real downstream consumers, set a real calendar timeline, or
approve/execute any phase. All of that belongs to whoever owns the USS One and Extension Library Figma
projects.
