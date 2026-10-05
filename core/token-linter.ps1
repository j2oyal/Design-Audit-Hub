<#
.SYNOPSIS
    Kiem tra tinh sach se cua Design Tokens (Token Purity).
.DESCRIPTION
    Phat hien cac ma mau hardcode tuy tien (raw hex / rgb) thay vi dung bien CSS hoac class token.
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$TargetDir,

    [string]$TokenSource = "system:MASHK"
)

Write-Host " [Audit:Core] Quet kiem tra Design Token Purity (Nguon: $TokenSource)..." -ForegroundColor Cyan

$sourceFiles = Get-ChildItem -Path $TargetDir -Recurse -Include *.html,*.css,*.jsx,*.tsx,*.vue -Exclude node_modules,.git,tokens.json,theme-tokens.md

$hardcodeViolations = @()

# Mau phat hien raw hex hoac rgb hardcode truc tiep trong class/inline style
$rawHexPattern = '(?i)(style="[^"]*#(?:[0-9a-f]{3}|[0-9a-f]{6})\b[^"]*"|bg-\[#(?:[0-9a-f]{3}|[0-9a-f]{6})\]|text-\[#(?:[0-9a-f]{3}|[0-9a-f]{6})\]|border-\[#(?:[0-9a-f]{3}|[0-9a-f]{6})\])'

foreach ($file in $sourceFiles) {
    $lines = Get-Content $file.FullName -ErrorAction SilentlyContinue
    if (!$lines) { continue }

    $lineNum = 0
    foreach ($line in $lines) {
        $lineNum++
        $matches = [regex]::Matches($line, $rawHexPattern)
        foreach ($m in $matches) {
            $hardcodeViolations += [PSCustomObject]@{
                File = $file.Name
                Line = $lineNum
                Code = $m.Value
            }
        }
    }
}

$status = if ($hardcodeViolations.Count -eq 0) { "PASS" } else { "FAIL" }

return [PSCustomObject]@{
    Status = $status
    HardcodeCount = $hardcodeViolations.Count
    Violations = $hardcodeViolations
    TokenSource = $TokenSource
}
