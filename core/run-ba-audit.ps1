<#
.SYNOPSIS
    PANE 4: GATE 4 - FINANCIAL BUSINESS & COMPLIANCE AUDITOR (DOMAIN-AWARE)
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

if ($Profile -eq "Auto") {
    if ($Target -match '(?i)Admin-Design' -or $Target -match '(?i)Backoffice') { $Profile = "Admin" }
    elseif ($Target -match '(?i)MAPS-Design' -or $Target -match '(?i)MTS') { $Profile = "MTS" }
    elseif ($Target -match '(?i)landingpage') { $Profile = "Landingpage" }
    else { $Profile = "WTS" }
}

Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host " [GATE 4] FINANCIAL BUSINESS & COMPLIANCE AUDITOR" -ForegroundColor Yellow
Write-Host " Muc tieu : $Target" -ForegroundColor White
Write-Host " Profile  : $Profile" -ForegroundColor Cyan
if ($Profile -eq "Admin") {
    Write-Host " Trong tam: Maker-Checker (Quy tac 4 mat) | PDPO HK Privacy | Content State Machine" -ForegroundColor DarkCyan
} else {
    Write-Host " Trong tam: Toan Hoc Tai Chinh | HKEX Spread 503 | Board Lot | Maker-Checker | Zero-Float" -ForegroundColor DarkCyan
}
Write-Host " Ky nang  : .agents/skills/business-compliance-audit" -ForegroundColor DarkGray
Write-Host "================================================================================" -ForegroundColor Cyan

$sourceFiles = Get-ChildItem -Path $Target -Recurse -Include *.html,*.jsx,*.tsx,*.vue,*.json -Exclude node_modules,.git

$hasPnlSemantics = $false
$hasTabularNumbers = $false
$hasOrderCheck = $false
$hasMakerChecker = $false

foreach ($file in $sourceFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($content)) { continue }

    if ($content -match '(?i)(pnl|profit|loss|gain|roi|unrealized|realized)') {
        $hasPnlSemantics = $true
    }
    if ($content -match '(?i)(tabular-nums|tnum)') {
        $hasTabularNumbers = $true
    }
    if ($content -match '(?i)(confirm|order-value|lot-size|board-lot|gross-value)') {
        $hasOrderCheck = $true
    }
    if ($content -match '(?i)(maker-checker|approve|reject|audit-trail|privacy|consent)') {
        $hasMakerChecker = $true
    }
}

$score = 100
if ($Profile -eq "Admin") {
    if (!$hasTabularNumbers) { $score -= 15 }
    if (!$hasMakerChecker) { $score -= 15 }
} else {
    if (!$hasTabularNumbers) { $score -= 30 }
    if (!$hasPnlSemantics) { $score -= 20 }
}

$verdict = if ($score -ge 70) { "PASS" } else { "FAIL" }

Write-Host "`n--- KET QUA GATE 4: BUSINESS COMPLIANCE ($Profile) ---" -ForegroundColor Yellow
Write-Host "1. Can le & Toan hoc Tabular: $(if($hasTabularNumbers){'DAT'}else{'CHUA DAT'})" -ForegroundColor $(if($hasTabularNumbers){"Green"}else{"Red"})
if ($Profile -eq "Admin") {
    Write-Host "2. Co che Maker-Checker & Audit: $(if($hasMakerChecker){'CO'}else{'CHUA RO RET'})" -ForegroundColor $(if($hasMakerChecker){"Green"}else{"Yellow"})
} else {
    Write-Host "2. Nhan dien P&L / Loi Nhuan : $(if($hasPnlSemantics){'CO'}else{'KHONG AP DUNG'})" -ForegroundColor $(if($hasPnlSemantics){"Green"}else{"Gray"})
}
Write-Host "3. Diem Tuan thu Nghiep vu  : $score/100 -> $verdict" -ForegroundColor $(if($verdict -eq "PASS"){"Green"}else{"Red"})

Write-Host "------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "PHAN QUYET GATE 4: [$verdict]`n" -ForegroundColor $(if($verdict -eq "PASS"){"Green"}else{"Red"})

if ($NoInteractive) {
    return [PSCustomObject]@{ Gate = "BA-Audit"; Verdict = $verdict; Score = $score; Profile = $Profile }
}

$isContinue = ($args -contains "-c") -or ($args -contains "--continue")
if ($Init -and !$isContinue -and (Get-Command agy.exe -ErrorAction SilentlyContinue)) {
    if ($Profile -eq "Admin") {
        $prompt = "Ban la Financial Compliance & Business Governance Auditor (Gate 4 tai Design-Audit-Hub). Muc tieu: $Target. Profile: ADMIN. Hay nap ky nang .agents/skills/business-compliance-audit va domain rule .agents/skills/business-compliance-audit/domains/admin-ba.md. TUYET DOI CAM kiem tra buoc gia HKEX 503 hay volume chung khoan tren Admin. Trong tam: Maker-Checker 4 mat, PDPO HK Privacy, Content State Machine va Audit Trail."
    } else {
        $prompt = "Ban la Financial Compliance & Securities Business Auditor (Gate 4 tai Design-Audit-Hub). Muc tieu: $Target. Profile: $Profile. Hay nap ky nang .agents/skills/business-compliance-audit va tieu chuan standards/04-ba-business/ de tham dinh tinh toan gia tri lenh, P&L, bang buoc gia HKEX 503, lo chuan va co che Maker-Checker."
    }
    agy.exe --dangerously-skip-permissions --mode accept-edits -i $prompt $args
}
