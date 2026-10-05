<#
.SYNOPSIS
    GATE 2: UI VISUAL CRAFT & AESTHETICS ENGINE
.DESCRIPTION
    Kiem tra toan dien chat luong my thuat thi giac, do tinh te cua UI,
    tieu diet triet de AI-Slop, dam bao can bang quang hoc va do min Vercel.
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$TargetDir
)

Write-Host " [Audit:Gate-2-UI] Kiem tra My thuat Thi giac & Visual Craftmanship..." -ForegroundColor Cyan

$AuditRoot = Split-Path $PSScriptRoot -Parent
if (!(Test-Path "$PSScriptRoot\anti-ai-slop.ps1")) {
    $AuditRoot = $PSScriptRoot
}

# 1. Quet Anti-AI-Slop
$slop = & "$PSScriptRoot\anti-ai-slop.ps1" -TargetDir $TargetDir

# 2. Quet Vercel Micro-Polish
$polish = & "$PSScriptRoot\vercel-micro-polish.ps1" -TargetDir $TargetDir

# 3. Quet Thu bac Thi giac & Nhap dieu Typography (Visual Hierarchy)
$sourceFiles = Get-ChildItem -Path $TargetDir -Recurse -Include *.html,*.jsx,*.tsx,*.vue,*.css -Exclude node_modules,.git

$hasHierarchy = $false
$hasSurfaceDepth = $false
$radiusConsistency = $true

foreach ($file in $sourceFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($content)) { continue }

    # Kiem tra co su phan tang font size ro ret (Display / Heading / Body / Caption)
    if ($content -match '(?i)(text-2xl|text-3xl|text-4xl|text-xl)' -and $content -match '(?i)(text-sm|text-xs)') {
        $hasHierarchy = $true
    }

    # Kiem tra chieu sau phan lop (Surface depth / Elevation / Backdrop blur)
    if ($content -match '(?i)(backdrop-blur|shadow-|border-white\/|border-slate-|bg-gradient-to)') {
        $hasSurfaceDepth = $true
    }
}

# 4. Tinh toan diem My thuat (Thang diem 100)
$score = 100

# Tru diem AI-slop
if ($slop.HighSeverityCount -gt 0) {
    $score -= ($slop.HighSeverityCount * 25)
} elseif ($slop.TotalViolations -gt 0) {
    $score -= ($slop.TotalViolations * 10)
}

# Tru diem Vercel Polish
if ($polish.Score -lt 70) {
    $score -= 20
}

# Tru diem Hierarchy
if (!$hasHierarchy) {
    $score -= 15
}

# Tru diem Surface Depth
if (!$hasSurfaceDepth) {
    $score -= 10
}

if ($score -lt 0) { $score = 0 }

$status = "PASS"
if ($score -lt 80 -or $slop.HighSeverityCount -gt 0) {
    $status = "FAIL"
} elseif ($score -lt 90) {
    $status = "WARNING"
}

return [PSCustomObject]@{
    Gate = "GATE-2-UI"
    Name = "UI Visual Craft & Aesthetics"
    Score = $score
    Status = $status
    SlopViolations = $slop.Violations
    SlopCount = $slop.TotalViolations
    PolishScore = $polish.Score
    HasHierarchy = $hasHierarchy
    HasSurfaceDepth = $hasSurfaceDepth
}
