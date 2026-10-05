<#
.SYNOPSIS
    Do luong ty le tai su dung Design System Component (> 95%).
.DESCRIPTION
    Kiem tra muc do su dung cac Master Components tu Design System chuan.
    Neu ty le < 95%, bat buoc phai co van ban giai trinh ly do hop le, neu khong se tu dong REJECT.
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$TargetDir,

    [double]$Threshold = 95.0,
    [string]$JustificationFile = ""
)

Write-Host " [Audit:Core] Kiem tra Ty le Su dung Design System Component (Target: > $Threshold%)..." -ForegroundColor Cyan

$sourceFiles = Get-ChildItem -Path $TargetDir -Recurse -Include *.html,*.jsx,*.tsx,*.vue,*.json -Exclude node_modules,.git,package-lock.json

if ($sourceFiles.Count -eq 0) {
    return [PSCustomObject]@{
        Status = "SKIPPED"
        AdoptionRate = 100.0
        TotalComponents = 0
        StandardComponents = 0
        DetachedCount = 0
        Message = "Khong tim thay tap tin ma nguon giao dien de do luong."
    }
}

$standardCount = 0
$detachedCount = 0
$detectedAdHoc = @()

# Mau nhan dien Standard Components (DS Library classes / tags)
$standardPatterns = @(
    'class="[^"]*(btn-|ds-|c-|ui-|table-|modal-|badge-|card-|input-|select-|toggle-)[^"]*"',
    '<(Button|Badge|Modal|Table|Card|Input|Select|Toggle|Dropdown|Pagination|Sidebar|Tabs)\b',
    '"component":\s*"(Button|Badge|Modal|Table|Card|Input|Select|Toggle|Dropdown|Tabs)'
)

# Mau nhan dien Ad-hoc / Detached custom controls (tu che UI khong qua DS)
$detachedPatterns = @(
    '<div\s+[^>]*onclick=[^>]*>',
    '<div\s+[^>]*class="[^"]*(custom-btn|my-btn|raw-button|btn-adhoc)[^"]*"',
    'style="[^"]*(cursor:\s*pointer|border-radius:[^"]*padding:[^"]*background:)[^"]*"',
    '"is_detached":\s*true'
)

foreach ($file in $sourceFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($content)) { continue }

    foreach ($pat in $standardPatterns) {
        $matches = [regex]::Matches($content, $pat, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        $standardCount += $matches.Count
    }

    foreach ($pat in $detachedPatterns) {
        $matches = [regex]::Matches($content, $pat, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
        if ($matches.Count -gt 0) {
            $detachedCount += $matches.Count
            $detectedAdHoc += [PSCustomObject]@{
                File = $file.Name
                Occurrences = $matches.Count
            }
        }
    }
}

$total = $standardCount + $detachedCount
if ($total -eq 0) {
    # Default to 100 if no interactive controls found
    $rate = 100.0
} else {
    $rate = [Math]::Round(($standardCount / $total) * 100, 2)
}

# Kiem tra van ban giai trinh neu rate < Threshold
$hasValidJustification = $false
$justificationDetail = ""

# Tim kiem justification trong thu muc hoac file doc
$candidateDocs = Get-ChildItem -Path $TargetDir -Recurse -Include README.md,briefing.md,audit-justification.md,TASK-*.md -Exclude node_modules,.git
foreach ($doc in $candidateDocs) {
    $docText = Get-Content $doc.FullName -Raw -ErrorAction SilentlyContinue
    if ($docText -match '(?i)\[?(COMPONENT_EXCEPTION_JUSTIFICATION|GIẢI TRÌNH NGOẠI LỆ COMPONENT)\]?[:\s]+(.+)') {
        $hasValidJustification = $true
        $justificationDetail = $matches[2].Trim().Substring(0, [Math]::Min(200, $matches[2].Trim().Length))
        break
    }
}

$status = "PASS"
if ($rate -lt $Threshold) {
    if ($hasValidJustification) {
        $status = "PASS_WITH_JUSTIFICATION"
    } else {
        $status = "FAIL"
    }
}

return [PSCustomObject]@{
    Status = $status
    AdoptionRate = $rate
    TotalComponents = $total
    StandardCount = $standardCount
    DetachedCount = $detachedCount
    AdHocDetails = $detectedAdHoc
    HasJustification = $hasValidJustification
    JustificationDetail = $justificationDetail
    Threshold = $Threshold
}
