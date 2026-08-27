<#
.SYNOPSIS
  Archive old session logs once logs/ grows past a threshold (see decisions/007).

.DESCRIPTION
  Moves the oldest logs/NNN-*.md files into logs/archive/ once the count of numbered
  logs in logs/ exceeds -Keep (default 15), so logs/ stays a short, cheap-to-scan
  list of recent sessions. Nothing is deleted -- archived files remain on disk,
  just relocated to logs/archive/.

.PARAMETER Keep
  How many of the most recent logs to keep directly in logs/ (default 15).

.EXAMPLE
  powershell -File scripts/archive-logs.ps1
  powershell -File scripts/archive-logs.ps1 -Keep 10
#>
param(
    [int]$Keep = 15
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$logsDir = Join-Path $repoRoot 'logs'
$archiveDir = Join-Path $logsDir 'archive'

if (-not (Test-Path $logsDir)) {
    Write-Host "No logs/ folder found at $logsDir." -ForegroundColor Yellow
    exit 0
}

$logFiles = Get-ChildItem -Path $logsDir -Filter '*.md' -File |
    Where-Object { $_.Name -match '^\d{3}-' } |
    Sort-Object Name

if ($logFiles.Count -le $Keep) {
    Write-Host "logs/ has $($logFiles.Count) entries (threshold: $Keep) -- nothing to archive." -ForegroundColor Green
    exit 0
}

$toArchive = $logFiles | Select-Object -First ($logFiles.Count - $Keep)

if (-not (Test-Path $archiveDir)) {
    New-Item -ItemType Directory -Path $archiveDir | Out-Null
}

foreach ($f in $toArchive) {
    Move-Item -Path $f.FullName -Destination (Join-Path $archiveDir $f.Name)
    Write-Host "Archived: $($f.Name)" -ForegroundColor Yellow
}

Write-Host "`nArchived $($toArchive.Count) log(s) to logs/archive/. $Keep most recent remain in logs/." -ForegroundColor Green
