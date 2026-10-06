<#
.SYNOPSIS
    PANE 3: GATE 3 - UX TRADING & USABILITY AUDITOR (DOMAIN-AWARE)
#>
param(
    [string]$Path = "D:\Github\Design-Audit-Hub",
    [string]$Target = "",
    [string]$Profile = "Auto",
    [switch]$Init,
    [switch]$NoInteractive
)

if ([string]::IsNullOrWhiteSpace($Target)) { $Target = $Path }
if (Test-Path $Target) { Set-Location $Target }

$AuditRoot = Split-Path $PSScriptRoot -Parent
if ($Profile -eq "Auto") {
    if ($Target -match '(?i)MAPS-Design' -or $Target -match '(?i)MTS') { $Profile = "MTS" }
    elseif ($Target -match '(?i)Admin-Design' -or $Target -match '(?i)Backoffice') { $Profile = "Admin" }
    elseif ($Target -match '(?i)landingpage') { $Profile = "Landingpage" }
    else { $Profile = "WTS" }
}

Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host " [GATE 3] UX TRADING, THUMB ZONE & USABILITY AUDITOR" -ForegroundColor Yellow
Write-Host " Muc tieu : $Target" -ForegroundColor White
Write-Host " Profile  : $Profile" -ForegroundColor Cyan
if ($Profile -eq "Admin") {
    Write-Host " Trong tam: 3 Archetypes (Table/Form/Dashboard) | Bulk Action Bar | Unsaved Guards" -ForegroundColor DarkCyan
} else {
    Write-Host " Trong tam: Thumb Zone | Tap Targets >= 44px | Poka-Yoke | Keyboard-First | No Disabled" -ForegroundColor DarkCyan
}
Write-Host " Ky nang  : .agents/skills/ux-usability-audit" -ForegroundColor DarkGray
Write-Host "================================================================================" -ForegroundColor Cyan

$ux = switch ($Profile) {
    "MTS" { & "$AuditRoot\profiles\profile-mts.ps1" -TargetDir $Target }
    "Admin" { & "$AuditRoot\profiles\profile-admin.ps1" -TargetDir $Target }
    "Landingpage" { & "$AuditRoot\profiles\profile-landing.ps1" -TargetDir $Target }
    Default { & "$AuditRoot\profiles\profile-wts.ps1" -TargetDir $Target }
}

Write-Host "`n--- KET QUA GATE 3: UX & USABILITY ($Profile) ---" -ForegroundColor Yellow
Write-Host "1. Diem UX Thao tac         : $($ux.Score)/100 -> $($ux.Status)" -ForegroundColor $(if($ux.Status -eq "PASS"){"Green"}else{"Red"})

foreach ($c in $ux.Checks) {
    Write-Host "   - $($c.Name): $(if($c.Pass){'[OK]'}else{'[CHUA DAT]'})" -ForegroundColor $(if($c.Pass){"Green"}else{"Gray"})
}

Write-Host "------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "PHAN QUYET GATE 3: [$($ux.Status)]`n" -ForegroundColor $(if($ux.Status -eq "PASS"){"Green"}else{"Red"})

if ($NoInteractive) {
    return [PSCustomObject]@{ Gate = "UX-Audit"; Verdict = $ux.Status; Score = $ux.Score; Profile = $Profile }
}

$isContinue = ($args -contains "-c") -or ($args -contains "--continue")
if ($Init -and !$isContinue -and (Get-Command agy.exe -ErrorAction SilentlyContinue)) {
    if ($Profile -eq "Admin") {
        $prompt = "Ban la Senior UX & Usability Auditor (Gate 3 tai Design-Audit-Hub). Muc tieu: $Target. Profile: ADMIN. Hay nap ky nang .agents/skills/ux-usability-audit va domain rule .agents/skills/ux-usability-audit/domains/admin-ux.md. TUYET DOI CAM bat loi Mobile Thumb Zone hay ban phim ao tren Desktop Admin. Trong tam: 3 Archetypes (Table/Form/Dashboard), Bulk Action Bar, Unsaved Changes Guard va Poka-Yoke an toan."
    } else {
        $prompt = "Ban la Senior UX & Usability Auditor (Gate 3 tai Design-Audit-Hub). Muc tieu: $Target. Profile: $Profile. Hay nap ky nang .agents/skills/ux-usability-audit va tieu chuan standards/03-ux-usability/ de tham dinh cong thai hoc Thumb zone tren mobile, keyboard-first tren WTS, bulk actions tren Admin va CRO funnel tren Landing page."
    }
    agy.exe --dangerously-skip-permissions --mode accept-edits -i $prompt $args
}
