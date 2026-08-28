# Canonical Token Schema (Proposal)

**Status: proposal / target reference, not yet implemented in any Figma file.** Per `decisions/011`, this
synthesizes the three already-captured inventories into one recommended unified schema. It does not modify,
and is not a substitute for, each system's own `tokens/*.json` (those stay as-is per `decisions/004`).
Applying this back into Figma is a separate initiative for whoever owns the USS/USS One/Extension Library
files — this repo only proposes the target.

**Hierarchy reminder (`decisions/010`):** USS = main/core, USS One + Extension Library = local libraries.
Canonical defaults to the main system's naming wherever all three agree; deviations are called out
explicitly with a recommendation.

## Spacing (19 steps)

All three systems define the identical 19-step scale, **except one drift**:

| Token | Canonical px | USS (main) | USS One | Extension Library |
|---|---|---|---|---|
| spacing-04 … spacing-160 (17 steps) | 4,8,12,16,20,24,28,32,36,44,48,56,64,80,96,112,128,160 | ✅ match | ✅ match | ✅ match |
| spacing-216 | **216** | 216 | 216 | **220** ⚠️ |

**Canonical value: 216px** (2 of 3 systems agree; name literally says "216"). Extension Library's 220px is a
data-quality bug, not an intentional variant — see `reports/figma-data-quality-issues.md` item 1.

## Radius

USS and USS One share an identical 6-step scale. Extension Library adds two more entries — one worth
adopting, one a bug:

| Token | Canonical px | USS (main) | USS One | Extension Library | Recommendation |
|---|---|---|---|---|---|
| Radius-1..6 | 0,2,4,8,12,16 | ✅ | ✅ | ✅ | Keep as-is |
| Radius-Full (pill) | **9999** ✅ decided | — | — | `Radius-1000` = 1000px ⚠️ | **Adopt** as a 7th canonical step, using the published code's value |
| `Boolean` variable | n/a | — | — | present, unrelated to radius | **Discard** — flag as a misplaced variable, don't canonicalize (`reports/...` item 2) |

**Note on the pill value — decided 2026-08-28:** the shipped code (`context/code-design-mapping.md`)
already implements a "full" radius as `--border-radius-full: 9999px`. User decision: **the published code
is the canonical source of truth** for this token — 9999px, not Extension Library's `Radius-1000` (1000px).
Rationale: the code is what's actually running in production; Figma should catch up to it, not the other
way around. Extension Library's `Radius-1000` token is therefore a value that needs correcting to 9999 (see
`reports/figma-data-quality-issues.md` item 6, updated), and USS/USS One should each add a matching
`Radius-Full = 9999px` token since neither has one yet.

## Color — base palettes

Neutral, Primary, Secondary-Verde, Info, Success, Warning, and Error ramps are **byte-for-byte identical**
across all three systems everywhere they were sampled (see `context/design.md` and each system's
`colors.json`). Canonical = adopt as-is, no changes needed. Naming convention: use USS main's
`_Base/<Ramp>/<Ramp> NN` pattern (already followed by USS One; Extension Library renames the second ramp to
`Terciary` — see divergence below).

## Color — semantic tokens

USS One's semantic set (66 tokens: Background/Surface/Border/Text/Links/Text interactive/Icons/Feedback/
Focus/Buttons) is a **superset** of USS main's and Extension Library's — recommend it as the canonical
semantic layer, since going from USS main's set to USS One's only ever *adds* tokens (e.g. an expanded
`Text interactive` subgroup), never renames or removes existing ones.

| Category | Canonical count | USS main | USS One | Extension Library |
|---|---|---|---|---|
| Background | 4 | 4 | 4 | 3 (missing "Background 4") |
| All other categories | matches USS One | subset | full (66 total) | 65 distinct (missing Background 4 only) |

**Recommendation:** adopt USS One's 66-token semantic set as canonical; flag Extension Library's missing
"Background 4" as a gap to close (not urgent — likely just not yet ported), not a conflict.

## Accent / per-faculty theming

**Confirmed intentional** (per user decision, 2026-08-28 — see `state/current.md` open question #4): the
Facultad accent system is a deliberate per-faculty/tenant theming layer, corroborated by the shipped code's
`--custom-secondary-*` CSS override pattern in `context/code-design-mapping.md`. Canonical:

- **Mechanism:** CSS-custom-property override point, one per Secondary/Facultad ramp step (already the
  shipped pattern — `var(--custom-secondary-N, <brand-default>)`). Recommend Figma-side tokens follow the
  same "has a default, expects override" framing rather than hardcoded per-faculty values.
- **Values:** USS One's Facultad/USS/Tono-Exito/Tono-Alerta/Tono-Error tables are canonical — Extension
  Library's copies resolve to identical hex, so no data conflict there.
- **Resolved (2026-08-28):** Extension Library's orphaned purple ramp is **not deleted** — it's formalized
  as an intentional new accent, moved out of `_Base/` (which is reserved for the shared brand palette) into
  a new top-level group **`Themes/`**, renamed **`Themes/Amatista`** ("Amethyst"), with its duplicate-step
  bug fixed:

  | Step | 10 | 20 | 30 | 40 | 50 | 60 | 70 | 80 | 90 | 100 |
  |---|---|---|---|---|---|---|---|---|---|---|
  | Hex | `#f5eff9` | `#dfceec` | `#d0b6e3` | `#ba94d6` | `#ad80ce` | `#9860c2` | `#8a57b1` | `#6c448a` | `#402851` | **`#2f1d3c`** |

  (Steps 10-90 unchanged from the original ramp; step 100 changed from the duplicate `#402851` to a new,
  distinct darker purple `#2f1d3c`, matching the 10-step light→dark progression every other ramp follows.)
  `Themes/` is now the designated home for any future accent-color ramp that isn't the shared brand
  palette (`_Base/`) or the per-faculty system (`Facultad_base`/`USS`/`Tono-*`) — this is its first member.
  Still Extension Library-only: USS main and USS One have no equivalent ramp today, and nothing requires
  them to add one (this is a net-new theme, not a cross-system gap to close).
- **New pending task (2026-08-28):** freeing up the `Terciary` slot for `Themes/Amatista` leaves Extension
  Library's Facultad blue-gray values with **no formal base ramp at all** — unlike USS One, where
  `_Base/Secondary` is a real 10-step ramp (`10=#f6f8fb` … `100=#293f56`) that the Facultad accent tokens
  alias to. In Extension Library those same values are only hardcoded directly on the Facultad accent
  tokens (per `context/design.md`/`colors.json`), with no backing ramp. **Decision: keep the Facultad
  values as-is** (same hex, don't move them into `Themes/`) but flag creating a proper `_Base/Secondary`
  ramp — matching USS One's values exactly — as a pending task for whoever owns the Extension Library
  file. Tracked in `reports/figma-data-quality-issues.md` item 9 and in the
  `uss-extension-library-inventory` canvas.

## Typography

Font-size scale is **identical** across all three Figma files and the shipped code (10, 12, 14, 16, 18, 20,
25, 28, 32, 36, 40, 48, 56, 60, 72, 80 — confirmed in `context/code-design-mapping.md`). Canonical: adopt
USS main's named style scale (`Títulos/H1`-`H6`, `Contenido/Body(-L/-S)`, `Contenido/Link(-L/-S)`,
`Otros/*`) as the reference naming, since it's the smallest, cleanest set (18 desktop + 6 mobile named
styles) that the other two systems' larger style counts are elaborations of, not replacements for.

## Effects / elevation

USS One and Extension Library both expanded USS main's legacy 2-level shadow scale into an identical
4-level scale (`Elevacion/1`-`4`), keeping the legacy 2-level styles for backward compatibility. Canonical:
**adopt the 4-level scale** as the forward-looking standard (superset, not a replacement — USS main's
`Elevación 1/2` can stay mapped as legacy aliases of `Elevacion/1` and `Elevacion/2`).

**New anomaly found while building this proposal (not previously documented):** the dark-mode "elevation
replacement" flat-color tokens are **inverted** between the main system and USS One:

| Token | USS main (hex) | USS One (hex, `aliasOf`) |
|---|---|---|
| Elevation 1 (reemplazo a sombra) | `#242f3c` | `#202a37` (`_Base/Neutral/Neutral 85`) |
| Elevation 2 (reemplazo a sombra) | `#202a37` | `#242f3c` (`_Base/Neutral/Neutral 82`) |

Same two hex values, opposite pairing to the token number. Extension Library sidesteps the question
entirely with a single flat `#121c27` across all 4 levels (a third, different value). **Not resolved here**
— genuinely ambiguous which pairing is "correct" without asking the design team; flagged to
`reports/figma-data-quality-issues.md` item 4 rather than silently picking one (`decisions/005`).

## Open follow-ups (need a real design decision, not just data synthesis)
1. ~~Radius-Full canonical value: `1000px` (Figma, Extension Library) vs. `9999px` (shipped code)?~~
   **Decided (2026-08-28): `9999px`, the published code's value.** See Radius section above.
2. Elevation 1/2 dark-mode replacement color pairing: main system's mapping vs. USS One's inverted mapping
   — which is correct? **Explicitly deferred by the user (2026-08-28)** — see `state/current.md` for
   context on which pairing looks more conventional, kept as a tie-breaker hint, not a decision.
3. ~~Should Extension Library's orphaned purple `Terciary` ramp be deleted, or wired up as a real third
   accent?~~ **Decided (2026-08-28): wired up as a real accent.** See "Accent / per-faculty theming"
   section above — renamed `Themes/Amatista`, duplicate step fixed.

Item 2 is listed in the data-quality report (`reports/figma-data-quality-issues.md`) for whoever owns the
Figma files to weigh in on — this repo flags, it doesn't decide unilaterally (`decisions/005`).
