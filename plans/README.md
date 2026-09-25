# Plans

Saved implementation plans that are **not yet executed**. Distinct from:

- `context/consolidation-plan.md` — standing roadmap, not a queued session
- `decisions/` — what was already decided
- Cursor's local `.cursor/plans/` — session-ephemeral; do not treat that as repo memory

## Convention

- One file per plan: `NNN-kebab-slug.md`, numbered chronologically.
- Front matter: `status` (`pending` | `in_progress` | `done`) and the original scope one-liner.
- Do not start the work unless the user explicitly asks to execute that plan.
- When a plan is executed, mark `status: done` and point at the resulting `decisions/` / `logs/` / report. Do not delete the file.

## Index

| # | Plan | Status | Execute with |
|---|---|---|---|
| 001 | USS Kit Digital ↔ Figma core component parity report | done (`decisions/024`) | already executed |
