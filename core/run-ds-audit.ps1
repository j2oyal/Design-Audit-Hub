<#
.SYNOPSIS
    PANE 1: GATE 1 - DESIGN SYSTEM & TOKEN ARCHITECTURE AUDITOR
#>
param(
    [string]$Path = "D:\Github\Design-Audit-Hub",
    [string]$Target = "",
    [switch]$Init,
    [switch]$NoInteractive
)

if ([string]::IsNullOrWhiteSpace($Target)) { $Target = $Path }
if (Test-Path $Target) { Set-Location $Target }

Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host " [GATE 1] DESIGN SYSTEM & TOKEN ARCHITECTURE GATEKEEPER" -ForegroundColor Yellow
Write-Host " Muc tieu : $Target" -ForegroundColor White
Write-Host " Trong tam: Component Adoption >= 95% | Token 3-Tier | 0 Raw Hex | No Detach" -ForegroundColor DarkCyan
Write-Host " Ky nang  : .agents/skills/audit-design-system" -ForegroundColor DarkGray
Write-Host "================================================================================" -ForegroundColor Cyan

$coverage = & "$PSScriptRoot\component-coverage.ps1" -TargetDir $Target -Threshold 95.0
$tokens = & "$PSScriptRoot\token-linter.ps1" -TargetDir $Target

Write-Host "`n--- KET QUA GATE 1: DESIGN SYSTEM ---" -ForegroundColor Yellow
Write-Host "1. Ty le Component Reuse: $($coverage.AdoptionRate)% (Chuan: >= 95%) -> $($coverage.Status)" -ForegroundColor $(if($coverage.Status -match 'PASS'){"Green"}else{"Red"})
if ($coverage.HasJustification) {
    Write-Host "   [Giai trinh]: $($coverage.JustificationDetail)" -ForegroundColor Gray
}
Write-Host "2. Token Purity: $($tokens.HardcodeCount) loi raw hex -> $($tokens.Status)" -ForegroundColor $(if($tokens.Status -eq "PASS"){"Green"}else{"Red"})

$verdict = if ($coverage.Status -match 'PASS' -and $tokens.Status -eq "PASS") { "PASS" } else { "FAIL" }
Write-Host "------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "PHAN QUYET GATE 1: [$verdict]`n" -ForegroundColor $(if($verdict -eq "PASS"){"Green"}else{"Red"})

if ($NoInteractive) {
    return [PSCustomObject]@{ Gate = "DS-Audit"; Verdict = $verdict; AdoptionRate = $coverage.AdoptionRate }
}

$isContinue = ($args -contains "-c") -or ($args -contains "--continue")
if ($Init -and !$isContinue -and (Get-Command agy.exe -ErrorAction SilentlyContinue)) {
    $prompt = "Ban la Design System & Token Gatekeeper (Gate 1 tai Design-Audit-Hub). Hay nap ky nang .agents/skills/audit-design-system va tieu chuan standards/01-design-system/ de kiem soat ty le Component >= 95%, do sach token 3 tang va chong detach component."
    agy.exe --dangerously-skip-permissions --mode accept-edits -i $prompt $args
}
