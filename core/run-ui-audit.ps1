<#
.SYNOPSIS
    PANE 2: GATE 2 - UI VISUAL CRAFT & AESTHETICS AUDITOR
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
Write-Host " [GATE 2] UI VISUAL CRAFT & ANTI-AI-SLOP AESTHETICS AUDITOR" -ForegroundColor Yellow
Write-Host " Muc tieu : $Target" -ForegroundColor White
Write-Host " Trong tam: Anti-AI-Slop | Modular Scale | Bo Goc Dong Tam | WCAG >= 4.5:1 | Vercel Polish" -ForegroundColor DarkCyan
Write-Host " Ky nang  : .agents/skills/ui-visual-audit" -ForegroundColor DarkGray
Write-Host "================================================================================" -ForegroundColor Cyan

$ui = & "$PSScriptRoot\ui-visual-craft.ps1" -TargetDir $Target

Write-Host "`n--- KET QUA GATE 2: UI VISUAL CRAFT ---" -ForegroundColor Yellow
Write-Host "1. Diem My thuat Tong hop   : $($ui.Score)/100 -> $($ui.Status)" -ForegroundColor $(if($ui.Status -eq "PASS"){"Green"}elseif($ui.Status -eq "WARNING"){"Yellow"}else{"Red"})
Write-Host "2. Vi pham AI-Slop          : $($ui.SlopCount) vi pham" -ForegroundColor $(if($ui.SlopCount -eq 0){"Green"}else{"Yellow"})
Write-Host "3. Tieu chuan Vi mo Vercel  : $($ui.PolishScore)/100" -ForegroundColor $(if($ui.PolishScore -ge 70){"Green"}else{"Yellow"})
Write-Host "4. Thu bac Thi giac (Hierarchy): $(if($ui.HasHierarchy){'CO'}else{'CHUA RO RET'})" -ForegroundColor $(if($ui.HasHierarchy){"Green"}else{"Yellow"})

Write-Host "------------------------------------------------------------------------" -ForegroundColor Yellow
Write-Host "PHAN QUYET GATE 2: [$($ui.Status)]`n" -ForegroundColor $(if($ui.Status -eq "PASS"){"Green"}elseif($ui.Status -eq "WARNING"){"Yellow"}else{"Red"})

if ($NoInteractive) {
    return [PSCustomObject]@{ Gate = "UI-Audit"; Verdict = $ui.Status; Score = $ui.Score }
}

$isContinue = ($args -contains "-c") -or ($args -contains "--continue")
if ($Init -and !$isContinue -and (Get-Command agy.exe -ErrorAction SilentlyContinue)) {
    $prompt = "Ban la Chief Art Director & Visual Polish Auditor (Gate 2 tai Design-Audit-Hub). Hay nap ky nang .agents/skills/ui-visual-audit va tieu chuan standards/02-ui-craft/ de kiem tra my thuat thi giac, triet tieu 5 loi AI-slop, do tuong phan WCAG va chi tiet vi mo Vercel."
    agy.exe --dangerously-skip-permissions --mode accept-edits -i $prompt $args
}
