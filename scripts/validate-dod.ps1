<#
.SYNOPSIS
  Definition-of-Done validator for ModUSS inventory folders (see AGENTS.md #6).

.DESCRIPTION
  Checks every "<System> Design System Inventory" folder at the repo root against
  the fixed shape required by decisions/002-inventory-folder-structure.md:
    - README.md present and non-empty
    - components/desktop-components.md present and non-empty
    - components/mobile-components.md OR components/mobile-notes.md present and
      non-empty (mobile-notes.md is a documented exception, decisions/002)
    - tokens/{spacing,radius,colors,typography,effects}.json present, valid JSON,
      and non-empty
    - state/inventories.md references the folder by name

  Also lints (non-blocking) folder-name casing against the "Design System
  Inventory" (capital S) convention from decisions/002.

.OUTPUTS
  Human-readable report to stdout. Exit code 0 = all pass, 1 = at least one failure.

.EXAMPLE
  powershell -File scripts/validate-dod.ps1
#>

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

$inventoryDirs = Get-ChildItem -Path $repoRoot -Directory |
    Where-Object { $_.Name -match 'Design [Ss]ystem Inventory$' }

if (-not $inventoryDirs) {
    Write-Host "No inventory folders found matching '*Design System Inventory'." -ForegroundColor Yellow
    exit 0
}

$stateFile = Join-Path $repoRoot 'state\inventories.md'
$stateContent = if (Test-Path $stateFile) { Get-Content $stateFile -Raw } else { '' }
if (-not $stateContent) {
    Write-Host "WARNING: state/inventories.md is missing or empty -- all folder-reference checks will fail." -ForegroundColor Yellow
}

$requiredTokens = @('spacing.json', 'radius.json', 'colors.json', 'typography.json', 'effects.json')
$failures = @()
$warnings = @()

foreach ($dir in $inventoryDirs) {
    $name = $dir.Name
    Write-Host "`n=== $name ===" -ForegroundColor Cyan

    if ($name -cnotmatch 'Design System Inventory$') {
        $warnings += "$name -- casing inconsistency: expected '...Design System Inventory' (capital S)"
    }

    $readme = Join-Path $dir.FullName 'README.md'
    if (-not (Test-Path $readme) -or (Get-Item $readme).Length -eq 0) {
        $failures += "$name -- missing or empty README.md"
    } else { Write-Host "  [OK] README.md" }

    $desktop = Join-Path $dir.FullName 'components\desktop-components.md'
    if (-not (Test-Path $desktop) -or (Get-Item $desktop).Length -eq 0) {
        $failures += "$name -- missing or empty components/desktop-components.md"
    } else { Write-Host "  [OK] components/desktop-components.md" }

    $mobile = Join-Path $dir.FullName 'components\mobile-components.md'
    $mobileNotes = Join-Path $dir.FullName 'components\mobile-notes.md'
    if ((Test-Path $mobile) -and (Get-Item $mobile).Length -gt 0) {
        Write-Host "  [OK] components/mobile-components.md"
    } elseif ((Test-Path $mobileNotes) -and (Get-Item $mobileNotes).Length -gt 0) {
        Write-Host "  [OK] components/mobile-notes.md (documented exception, decisions/002)"
    } else {
        $failures += "$name -- missing components/mobile-components.md (or the mobile-notes.md exception)"
    }

    foreach ($tok in $requiredTokens) {
        $tokPath = Join-Path $dir.FullName "tokens\$tok"
        if (-not (Test-Path $tokPath)) {
            $failures += "$name -- missing tokens/$tok"
            continue
        }
        try {
            $raw = Get-Content $tokPath -Raw
            if ([string]::IsNullOrWhiteSpace($raw)) {
                $failures += "$name -- tokens/$tok is empty"
                continue
            }
            $null = $raw | ConvertFrom-Json
            Write-Host "  [OK] tokens/$tok"
        } catch {
            $failures += "$name -- tokens/$tok is not valid JSON: $($_.Exception.Message)"
        }
    }

    if ($stateContent -notmatch [regex]::Escape($name)) {
        $failures += "$name -- not referenced in state/inventories.md"
    } else {
        Write-Host "  [OK] referenced in state/inventories.md"
    }
}

if ($warnings) {
    Write-Host "`n--- Warnings (non-blocking) ---" -ForegroundColor Yellow
    $warnings | ForEach-Object { Write-Host "  $_" -ForegroundColor Yellow }
}

if ($failures) {
    Write-Host "`n--- FAILURES ---" -ForegroundColor Red
    $failures | ForEach-Object { Write-Host "  $_" -ForegroundColor Red }
    Write-Host "`n$($failures.Count) Definition-of-Done check(s) failed." -ForegroundColor Red
    exit 1
} else {
    Write-Host "`nAll inventory folders satisfy the Definition of Done (AGENTS.md #6)." -ForegroundColor Green
    exit 0
}
