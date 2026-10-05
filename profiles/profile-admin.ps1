<#
.SYNOPSIS
    Profile Tham Dinh: Admin / Backoffice Operations.
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$TargetDir
)

Write-Host " [Audit:Profile] Kiem dinh Chuyen sau: Admin / Backoffice (Middle-Office Ops)..." -ForegroundColor Cyan

$sourceFiles = Get-ChildItem -Path $TargetDir -Recurse -Include *.html,*.jsx,*.tsx,*.vue,*.json -Exclude node_modules,.git

$checks = @(
    @{ Name = "Hop thoai canh bao pha huy (Destructive Modal Confirmation cho Xoa/Khoa/Force-sell)"; Pass = $false },
    @{ Name = "Bang du lieu co phan trang (Pagination) va bo loc da tieu chi (Filters)"; Pass = $false },
    @{ Name = "Trang thai Semantic ro rang (Active/Pending/Suspended/Failed)"; Pass = $false },
    @{ Name = "Xu ly trang thai Skeleton Loading hoac Empty State"; Pass = $false },
    @{ Name = "Can le so hoc phai (Right-align) va tabular-nums cho so tien/tai san"; Pass = $false }
)

foreach ($file in $sourceFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($content)) { continue }

    if ($content -match '(?i)(modal|dialog|confirm|destructive|alert-dialog)') {
        $checks[0].Pass = $true
    }
    if ($content -match '(?i)(pagination|page-|filter|search-input|table-header)') {
        $checks[1].Pass = $true
    }
    if ($content -match '(?i)(badge|status|active|pending|suspended|success|danger|warning)') {
        $checks[2].Pass = $true
    }
    if ($content -match '(?i)(skeleton|empty-state|no-data|loading-spinner|animate-pulse)') {
        $checks[3].Pass = $true
    }
    if ($content -match '(?i)(text-right|tabular-nums)') {
        $checks[4].Pass = $true
    }
}

$passedCount = ($checks | Where-Object { $_.Pass -eq $true }).Count
$total = $checks.Count
$score = [Math]::Round(($passedCount / $total) * 100, 1)

return [PSCustomObject]@{
    Profile = "ADMIN"
    Score = $score
    Status = if ($score -ge 80) { "PASS" } else { "FAIL" }
    Checks = $checks
}
