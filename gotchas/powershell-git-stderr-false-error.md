# Gotcha: PowerShell treats git/gh's normal stderr output as a fatal error

**Symptom:** Running a `git push` (directly or via `gh repo create ... --push`) inside PowerShell with
`2>&1` redirection prints a `NativeCommandError` / `RemoteException` wall of text that looks like the push
failed, even though the operation actually succeeded.

**Cause:** `git`/`gh` write normal progress info (e.g. `To https://github.com/...`, branch/object counts) to
stderr, which is standard for these tools. PowerShell's native-command stderr handling can surface that as
a terminating-looking error, especially when combined with `2>&1` and a non-default
`$ErrorActionPreference`.

**Fix:** Don't trust the red error text alone. Verify the real outcome directly:
```powershell
git status        # "Your branch is up to date with 'origin/...'" + "nothing to commit"
git remote -v     # confirms the remote URL is set for both fetch/push
git log --oneline -1
```
If those confirm the expected state, the push succeeded — the console error was just stderr noise, not an
actual failure. Only treat it as real if `git status`/`git remote -v` show a mismatch (e.g. branch not
tracking, commit missing from remote).
