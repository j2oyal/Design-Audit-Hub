<#
.SYNOPSIS
    Profile Tham Dinh: WTS (Web Trading System).
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$TargetDir
)

Write-Host " [Audit:Profile] Kiem dinh Chuyen sau: WTS (Web Trading System Workstation)..." -ForegroundColor Cyan

$sourceFiles = Get-ChildItem -Path $TargetDir -Recurse -Include *.html,*.jsx,*.tsx,*.vue,*.json -Exclude node_modules,.git

$checks = @(
    @{ Name = "Mat do thong tin sieu cao (Ultra-density Layout)"; Pass = $false },
    @{ Name = "Chia khung da nhiem (Multi-panel / Split-pane Grid)"; Pass = $false },
    @{ Name = "Chi dan phim tat giao dich (Hotkey Cues: F1/F2/Enter/Esc)"; Pass = $false },
    @{ Name = "Ghim cot bang so lenh & danh muc (Column Pinning)"; Pass = $false },
    @{ Name = "So lieu can phai & che do tuong phan toi giam moi mat"; Pass = $false }
)

foreach ($file in $sourceFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($content)) { continue }

    if ($content -match '(?i)(grid-cols-|col-span-|split-|h-screen|overflow-hidden)') {
        $checks[0].Pass = $true
    }
    if ($content -match '(?i)(panel|widget|pane|flex-row|workspace)') {
        $checks[1].Pass = $true
    }
    if ($content -match '(?i)(kbd|hotkey|shortcut|key-|\[F1\]|\[F2\]|\[Esc\])') {
        $checks[2].Pass = $true
    }
    if ($content -match '(?i)(sticky\s+left-0|sticky\s+right-0|pin-column|pinned)') {
        $checks[3].Pass = $true
    }
    if ($content -match '(?i)(text-right|tabular-nums|dark|bg-slate-900|bg-zinc-950)') {
        $checks[4].Pass = $true
    }
}

$passedCount = ($checks | Where-Object { $_.Pass -eq $true }).Count
$total = $checks.Count
$score = [Math]::Round(($passedCount / $total) * 100, 1)

return [PSCustomObject]@{
    Profile = "WTS"
    Score = $score
    Status = if ($score -ge 80) { "PASS" } else { "FAIL" }
    Checks = $checks
}
