<#
.SYNOPSIS
    PANE 4: GATE 4 - FINANCIAL BUSINESS & COMPLIANCE AUDITOR
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
Write-Host " [GATE 4] FINANCIAL BUSINESS & COMPLIANCE AUDITOR" -ForegroundColor Yellow
Write-Host " Muc tieu : $Target" -ForegroundColor White
Write-Host " Trong tam: Toan Hoc Tai Chinh | HKEX Spread 503 | Board Lot | Maker-Checker | Zero-Float" -ForegroundColor DarkCyan
Write-Host " Ky nang  : .agents/skills/business-compliance-audit" -ForegroundColor DarkGray
Write-Host "================================================================================" -ForegroundColor Cyan

$sourceFiles = Get-ChildItem -Path $Target -Recurse -Include *.html,*.jsx,*.tsx,*.vue,*.json -Exclude node_modules,.git

$hasPnlSemantics = $false
$hasTabularNumbers = $false
$hasOrderCheck = $false

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
}

$score = 100
if (!$hasTabularNumbers) { $score -= 30 }
if (!$hasPnlSemantics) { $score -= 20 }

$verdict = if ($score -ge 70) { "PASS" } else { "FAIL" }

Write-Host "`n--- KET QUA GATE 4: BUSINESS COMPLIANCE ---" -ForegroundColor Yellow
Write-Host "1. Can le & Toan hoc Tabular: $(if($hasTabularNumbers){'DAT'}else{'CHUA DAT'})" -ForegroundColor $(if($hasTabularNumbers){"Green"}else{"Red"})
Write-Host "2. Nhan dien P&L / Loi Nhuan : $(if($hasPnlSemantics){'CO'}else{'KHONG AP DUNG'})" -ForegroundColor $(if($hasPnlSemantics){"Green"}else{"Gray"})
Write-Host "3. Diem Tuan thu Nghiep vu  : $score/100 -> $verdict" -ForegroundColor $(if($verdict -eq "PASS"){"Green"}else{"Red"})

Write-Host "------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "PHAN QUYET GATE 4: [$verdict]`n" -ForegroundColor $(if($verdict -eq "PASS"){"Green"}else{"Red"})

if ($NoInteractive) {
    return [PSCustomObject]@{ Gate = "BA-Audit"; Verdict = $verdict; Score = $score }
}

$isContinue = ($args -contains "-c") -or ($args -contains "--continue")
if ($Init -and !$isContinue -and (Get-Command agy.exe -ErrorAction SilentlyContinue)) {
    $prompt = "Ban la Financial Compliance & Securities Business Auditor (Gate 4 tai Design-Audit-Hub). Hay nap ky nang .agents/skills/business-compliance-audit va tieu chuan standards/04-ba-business/ de tham dinh tinh toan gia tri lenh, P&L, bang buoc gia HKEX 503, lo chuan va co che Maker-Checker."
    agy.exe --dangerously-skip-permissions --mode accept-edits -i $prompt $args
}
