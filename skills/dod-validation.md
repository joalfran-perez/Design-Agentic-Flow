# Skill: Definition-of-Done Validation

Automates the checklist in `AGENTS.md` §6 (structure + valid JSON + `state/inventories.md` reference) for
every `*Design System Inventory` folder.

## Run it yourself (manual, on demand)
```powershell
powershell -File scripts\validate-dod.ps1
```
Exit code `0` = all inventory folders pass. Exit code `1` = at least one failure, printed in a `---
FAILURES ---` block. Non-blocking naming-convention lints print separately under `--- Warnings ---` and
never fail the run.

## What it checks per inventory folder
1. `README.md` present and non-empty.
2. `components/desktop-components.md` present and non-empty.
3. `components/mobile-components.md` present and non-empty, OR the documented exception
   `components/mobile-notes.md` (see `decisions/002-inventory-folder-structure.md`).
4. All 5 `tokens/{spacing,radius,colors,typography,effects}.json` present, valid JSON, non-empty.
5. The folder is referenced by name in `state/inventories.md`.
6. (Lint only) folder name ends in `Design System Inventory` (capital S) per `decisions/002`.

## Automatic trigger (Cursor hook)
`.cursor/hooks.json` registers `scripts/validate-dod.ps1` on the `stop` event via
`.cursor/hooks/validate-inventories-hook.ps1`. It runs after every agent response:
- **All pass** → silent, no effect on the conversation.
- **Any failure** → emits one `followup_message` nudging the agent to run the script, read the report, and
  either fix the gap or update `state/inventories.md` if the folder is intentionally still in progress.
  `loop_limit: 1` caps this to one nudge per stop so it can't loop forever on a legitimately incomplete,
  in-progress folder.

The hook fails open (no `failClosed`) — if the script itself errors, the agent is not blocked.

## When to update the validator
If `decisions/002`'s fixed folder shape ever changes, update `scripts/validate-dod.ps1` in the same change
(it hardcodes the 5 token filenames and the desktop/mobile component-file check) — keep it and
`AGENTS.md` §6 in sync.
