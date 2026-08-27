# Skill: Logs Archival

`logs/` holds one compressed summary per significant session (`NNN-slug.md`). Left unbounded, it becomes
expensive to list/scan and works against the "load only what the current task needs" rule in `AGENTS.md`.

## Policy
- Keep the most recent **15** logs directly in `logs/`.
- Once the count exceeds 15, run `scripts/archive-logs.ps1` to move the oldest ones into `logs/archive/`.
  Content is preserved verbatim, just relocated — nothing is deleted or summarized away.
- `context/design.md` and `state/*.md` must never depend on unsummarized `logs/` content — logs/ is a
  session diary, not a source of truth. If something in a log matters long-term, it belongs in `context/`,
  `decisions/`, or `state/` instead, with the log entry as just a pointer.

## Run it
```powershell
powershell -File scripts/archive-logs.ps1          # keeps 15 most recent (default)
powershell -File scripts/archive-logs.ps1 -Keep 10 # custom threshold
```

## When to run it
Deliberately manual, not hooked — archiving is infrequent (~every 15 sessions) and low-risk to defer a
session or two. Check `logs/` entry count as part of any periodic repo housekeeping pass, or when
`AGENTS.md`'s reading-order pass feels slower than expected.
