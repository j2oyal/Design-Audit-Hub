<#
.SYNOPSIS
    Kiem tra cac tieu chuan vi mo (Micro-Polish Vercel Style).
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$TargetDir
)

Write-Host " [Audit:Core] Kiem tra Tieu chuan Vi mo Vercel (tabular-nums, text-wrap, &nbsp;)..." -ForegroundColor Cyan

$sourceFiles = Get-ChildItem -Path $TargetDir -Recurse -Include *.html,*.css,*.jsx,*.tsx -Exclude node_modules,.git

$missingTabularNums = 0
$hasTabularNums = $false
$hasTextWrapBalance = $false
$hasNbsp = $false

foreach ($file in $sourceFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($content)) { continue }

    if ($content -match '(?i)(tabular-nums|tnum|font-variant-numeric:\s*tabular-nums)') {
        $hasTabularNums = $true
    }
    if ($content -match '(?i)(text-wrap:\s*balance|balance)') {
        $hasTextWrapBalance = $true
    }
    if ($content -match '(?i)(&nbsp;|\u00A0)') {
        $hasNbsp = $true
    }
}

$score = 0
if ($hasTabularNums) { $score += 40 }
if ($hasTextWrapBalance) { $score += 30 }
if ($hasNbsp) { $score += 30 }

return [PSCustomObject]@{
    Score = $score
    HasTabularNums = $hasTabularNums
    HasTextWrapBalance = $hasTextWrapBalance
    HasNbsp = $hasNbsp
    Status = if ($score -ge 70) { "PASS" } else { "WARNING" }
}
