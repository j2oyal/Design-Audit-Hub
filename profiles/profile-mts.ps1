<#
.SYNOPSIS
    Profile Tham Dinh: MTS (Mobile Trading System).
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$TargetDir
)

Write-Host " [Audit:Profile] Kiem dinh Chuyen sau: MTS (Mobile Trading System)..." -ForegroundColor Cyan

$sourceFiles = Get-ChildItem -Path $TargetDir -Recurse -Include *.html,*.jsx,*.tsx,*.vue,*.json -Exclude node_modules,.git

$checks = @(
    @{ Name = "Thumb Zone (Nut lenh nam o nua duoi man hinh)"; Pass = $false; Note = "" },
    @{ Name = "Poka-Yoke Mua/Ban (Tach biet mau sac & vi tri nut Mua/Ban)"; Pass = $false; Note = "" },
    @{ Name = "Touch Target an toan (Toi thieu 44x44px cho nut bam)"; Pass = $false; Note = "" },
    @{ Name = "Ban phim so ao (Virtual Keypad) gon gang, khong che so lenh"; Pass = $false; Note = "" },
    @{ Name = "Can le so hoc tai chinh (Right-align so luong, gia, tong tien)"; Pass = $false; Note = "" }
)

foreach ($file in $sourceFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($content)) { continue }

    # Thumb zone / bottom action bar
    if ($content -match '(?i)(fixed\s+bottom-0|sticky\s+bottom-0|action-bar|bottom-sheet|order-pad)') {
        $checks[0].Pass = $true
    }
    # Poka-Yoke Buy/Sell
    if ($content -match '(?i)(btn-buy|btn-sell|bg-emerald|bg-rose|text-emerald|text-rose|poka-yoke)') {
        $checks[1].Pass = $true
    }
    # Touch target 44px
    if ($content -match '(?i)(min-h-\[44px\]|h-11|h-12|py-3|touch-target|p-3)') {
        $checks[2].Pass = $true
    }
    # Keypad
    if ($content -match '(?i)(keypad|numpad|grid-cols-3|number-pad)') {
        $checks[3].Pass = $true
    }
    # Right-align numbers
    if ($content -match '(?i)(text-right|tabular-nums|tnum)') {
        $checks[4].Pass = $true
    }
}

$passedCount = ($checks | Where-Object { $_.Pass -eq $true }).Count
$total = $checks.Count
$score = [Math]::Round(($passedCount / $total) * 100, 1)

return [PSCustomObject]@{
    Profile = "MTS"
    Score = $score
    Status = if ($score -ge 80) { "PASS" } else { "FAIL" }
    Checks = $checks
}
