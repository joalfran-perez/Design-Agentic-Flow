# 018 — ModUSS Planner UI review session: desktop component-specification gap confirmed

**Date:** 2026-08-31

**Context:** The user shared a Teams transcript of a 1h01m product-review call held **2026-08-27** between
Javier Teillier (developer of **ModUSS Planner**, sharing his screen) and Joalfran Pérez (observer from the
design area). Local source: `Downloads/Llamada con Javier Teillier.docx`. This is the **first direct
observation of that app's running UI** available to this repo — `decisions/013` only had its Confluence
visual-norm doc, and `decisions/015`-`017` only its pinned CSS/SCSS implementation.

The transcript is a dual-channel auto-transcription: every utterance is duplicated and attributed to both
participants, so **speaker attribution is unreliable**. Findings were reconstructed by content and
timestamp, not by speaker label. Heavy ASR noise (MODUSS → "modos"/"moods", bitácora → "vitadora", carta
Gantt → "carta grande", spurious English fragments). "Banner" throughout means the Ellucian Banner SIS, not
a visual component. The `.docx` is **not** copied into this repo, per `AGENTS.md` rule 2 — same treatment as
`decisions/013`'s norm doc.

**Decision:** Record the session as evidence and persist only the analysis, in three parts:

1. **Product model** of ModUSS Planner as demonstrated (roles, two planning tracks, convenio, seguimiento,
   Gantt, import/export, admin, read-only Banner sync) — new context this repo did not have.
2. **Findings inventory**: 15 defects observed live, 10 UX gaps raised by design, 4 business rules nobody in
   the call could answer. These belong to ModUSS Planner's own backlog, **not** to this repo's audit trail —
   ModUSS neither owns nor tracks that app's bugs. They are captured only because the design-system
   implication below depends on them.
3. **New documented gap** (the part that is genuinely ModUSS's business): ModUSS Planner is a **desktop**
   dashboard, and of the 12 UI patterns the review asks for, **11 have no specification in any captured
   Desktop file** of any of the three systems. All three Desktop captures hold only Badges, Buttons, Cards,
   Divider, Image/video and Tags; Toast, Modal, Alert message, Empty state, Stepper, Select, Select date
   range, searchable Dropdown, Tooltip, Tabs, Table and the Filters/Forms patterns exist **only in the
   Mobile files of the two local libraries**. Badge is the sole recommended pattern with a Desktop spec.

Stated honestly: this repo's Desktop captures are known-narrow (`decisions/009`), so the correct reading is
"absent from the captured Desktop pages", not "absent from Figma". Even under that caveat the asymmetry is
new and worth recording — every prior gap finding was token-level, this is the first
**component-specification** gap traced to a named real consumer.

**Consequence:**
- Reopens open question 5 in `state/current.md` (Accordion + Modal deferred 2026-08-28 because they only
  trace to unfinished "Testing 🟡" pages). Modal **and** Empty state are both still in Testing in the local
  libraries, and both are central to this review's recommendations (U2, U3, U5). A real consumer needing them
  now is sufficient cause to un-defer.
- Strengthens Phase 0 of `context/consolidation-plan.md`: previously the only confirmed real consumer
  (`decisions/013`) was evidence of **token** consumption. This is the first with identified **component**
  needs.
- New canvas `moduss-planner-review-session` (cross-cutting report, not tied to one inventory file-set —
  same exception as `consolidation-status-report`, per `AGENTS.md` rule 6).
- No change to any `tokens/*.json`, `context/canonical-tokens.md`, or
  `reports/figma-data-quality-issues.md` — nothing observed contradicts captured Figma data.
- User chose `reports/` as the external destination (not `deliverables/`), so the findings are written up
  dev-facing and ticket-ready in `reports/moduss-planner-review-findings.md`, in Spanish to match
  `reports/kitdigital-v0-to-v2-jira-summary.md`'s audience convention. It includes a component-reuse section
  telling the dev team which of the requested patterns already exist in the design system, so they don't
  build Toast/Modal/Stepper/Select from scratch. A `deliverables/` spec for the design side was declined.
- **Video-citation convention** (added the same day, reusable if another call transcript is ever analyzed):
  every finding in that report carries a playback **window**, not a point timestamp — `mm:ss–mm:ss` plus
  `clave mm:ss`. The window starts at the utterance where the presenter *announces the action*, not where the
  finding is discussed, because in a live walkthrough the commentary always trails the on-screen event; a
  point timestamp would land after the evidence. Suffixes: `(hablado)` where there is no visual evidence at
  all (all design recommendations plus D14), `(aprox.)` where no action announcement existed to anchor the
  start. Precision is ±5s because the dual-channel transcript records each utterance twice — convention is to
  take the earliest occurrence. The report states the alignment basis (duration 1:01:31, first utterance 0:05,
  last 1:01:27) so a reader with a trimmed copy can detect the block offset immediately.
- **Deep links implemented** (same day, after the user supplied the Teams recap URL). The recap link itself
  (`teams.microsoft.com/l/meetingrecap?...`) takes no time parameter — the usable base is the `sitePath`
  sharing link nested inside it, `correouss-my.sharepoint.com/:v:/g/personal/ext_joalfran_perez_uss_cl/IQD...`,
  chosen over the sibling `fileUrl` path link because only the sharing form works for anyone but the owner.
  Time is set with Stream-on-SharePoint's `nav` parameter carrying URL-encoded JSON
  (`{"playbackOptions":{"startTimeInSeconds":N}}`). **This parameter is undocumented and unsupported by
  Microsoft** — verified as working practice, not spec; it fails in embedded views and can break without
  notice. A competing variant (`{"playlistOptions":{"startTimes":N}}`) is what Stream's own "copy link at
  current time" emits, and is the fallback if `playbackOptions` stops working. Could not be tested from here
  (tenant auth required) — the user verifies.
  Implemented as **Markdown reference-style links**: 59 definitions in a generated block at the end of the
  file, 64 usages in the tables, so rows stay readable and diffable instead of carrying 200-char inline URLs.
  Both the window start **and** the `clave` mark are linked (the user chose both over start-only); secondary
  occurrences were linked too, slightly beyond what was asked, because leaving 3 of D4's 4 marks unclickable
  would have been a worse artifact.
- **Accepted exposure, flagged before writing:** this repo is public on GitHub, so those links publish the
  recording's tenant path and share token. Raised with the user before committing anything; the user
  explicitly accepted, on the basis that SharePoint still enforces USS authentication. Recorded here because
  the decision was deliberate, not an oversight — if the repo's visibility policy is ever revisited, this file
  is one of the reasons to re-check.
- If a **second** call transcript ever gets analyzed, promote this procedure to `skills/transcript-analysis.md`
  per `AGENTS.md` §7 (a procedure used more than once belongs in `skills/`). Used once so far, so not yet.
