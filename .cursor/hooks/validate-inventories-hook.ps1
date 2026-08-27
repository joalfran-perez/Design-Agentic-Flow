<#
  Cursor "stop" hook: runs scripts/validate-dod.ps1 after every agent response and,
  only when it fails, nudges the agent with a follow-up message (capped by
  loop_limit: 1 in .cursor/hooks.json so it nags at most once per stop, not forever).
  Silent (empty JSON) when everything passes, so normal turns are unaffected.
  See skills/dod-validation.md for details and manual usage.
#>

$null = [Console]::In.ReadToEnd()  # consume hook stdin payload (unused)

$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$validator = Join-Path $repoRoot 'scripts\validate-dod.ps1'

if (-not (Test-Path $validator)) {
    Write-Output '{}'
    exit 0
}

$output = & powershell -NoProfile -ExecutionPolicy Bypass -File $validator 2>&1 | Out-String
$exitCode = $LASTEXITCODE

if ($exitCode -ne 0) {
    $message = "Definition-of-Done check failed for one or more USS inventory folders (AGENTS.md #6). " +
        "Run scripts/validate-dod.ps1 for the full report, fix the gaps (or update state/inventories.md " +
        "if the folder is intentionally still in progress), then continue.`n`n$output"
    @{ followup_message = $message } | ConvertTo-Json -Compress
} else {
    '{}'
}
exit 0
