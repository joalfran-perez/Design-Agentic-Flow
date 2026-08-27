# 007 — Logs archival policy (threshold-based, manual)

**Date:** 2026-08-27

**Context:** `logs/` grows by one file per significant session with no upper bound. Left unchecked, it
becomes noisy to scan and works against the "load only what's needed" context rule in `AGENTS.md`.

**Decision:** Keep at most 15 numbered logs directly in `logs/`; once past that, move the oldest into
`logs/archive/` (content untouched, just relocated). Implemented as an on-demand script
(`scripts/archive-logs.ps1 -Keep <n>`, default 15), not a hook — archiving is infrequent (~every 15
sessions) and safe to run manually whenever `logs/` feels large, rather than adding another automatic
trigger on top of the `stop` hook from `decisions/006`.

**Consequence:** `logs/` stays short-lived and cheap to read in full; `logs/archive/` becomes the
long-term cold storage. Nothing in `context/` or `state/` may depend on unsummarized log content, since
older logs may move out of the default `logs/` listing.
