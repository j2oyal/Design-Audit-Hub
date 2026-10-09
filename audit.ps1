<#
.SYNOPSIS
    DESIGN-AUDIT-HUB MASTER VERIFICATION RUNNER (QUAD-GATES PIPELINE)
.DESCRIPTION
    He thong tham dinh 4 cong doc lap:
    Gate 1: DS-Audit (Design System & Token Architecture, >95% Component Reuse)
    Gate 2: UI-Audit (Visual Craft, Anti-AI-Slop & Aesthetics)
    Gate 3: UX-Audit (Usability, Ergonomics & Thumb Zone)
    Gate 4: BA-Audit (Financial Business & Compliance)
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$Target,

    [ValidateSet("MTS", "WTS", "Admin", "Landingpage", "Auto")]
    [string]$Profile = "Auto",

    [ValidateSet("Pipeline", "Gate")]
    [string]$Mode = "Pipeline",

    [ValidateSet("All", "DS", "UI", "UX", "BA")]
    [string]$Gate = "All",

    [double]$ComponentThreshold = 95.0,

    [string]$ReportOutput = ""
)

$AuditRoot = $PSScriptRoot

if (!(Test-Path $Target)) {
    Write-Error "Khong tim thay duong dan muc tieu: $Target"
    exit 1
}

# Tu dong nhan dien Profile
if ($Profile -eq "Auto") {
    if ($Target -match '(?i)MAPS-Design' -or $Target -match '(?i)MTS') { $Profile = "MTS" }
    elseif ($Target -match '(?i)WTS' -or $Target -match '(?i)WebTrading') { $Profile = "WTS" }
    elseif ($Target -match '(?i)Admin-Design' -or $Target -match '(?i)Backoffice') { $Profile = "Admin" }
    elseif ($Target -match '(?i)landingpage-builder' -or $Target -match '(?i)Landing') { $Profile = "Landingpage" }
    else { $Profile = "Universal" }
}

Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host " 🛡️ DESIGN-AUDIT-HUB: BO TU CONG THAM DINH (QUAD-GATES VERIFICATION)" -ForegroundColor Yellow
Write-Host " Muc tieu : $Target" -ForegroundColor White
Write-Host " Profile  : $Profile" -ForegroundColor Cyan
Write-Host " Che do   : $Mode $(if($Gate -ne 'All'){"[Gate: $Gate]"})" -ForegroundColor Yellow
Write-Host "================================================================================" -ForegroundColor Cyan

$gateResults = @{}
$isFailFastTriggered = $false

# ----------------- GATE 1: DESIGN SYSTEM & TOKENS -----------------
if ($Gate -eq "All" -or $Gate -eq "DS") {
    Write-Host "`n>>> [GATE 1 / 4] THAM DINH DESIGN SYSTEM & TOKENS..." -ForegroundColor Cyan
    $cov = & "$AuditRoot\core\component-coverage.ps1" -TargetDir $Target -Threshold $ComponentThreshold
    $tok = & "$AuditRoot\core\token-linter.ps1" -TargetDir $Target

    $g1Status = "PASS"
    if ($cov.Status -eq "FAIL" -or $tok.Status -eq "FAIL") {
        $g1Status = "FAIL"
    } elseif ($cov.Status -eq "PASS_WITH_JUSTIFICATION") {
        $g1Status = "PASS_WITH_JUSTIFICATION"
    }

    $gateResults["DS"] = [PSCustomObject]@{
        Gate = "GATE 1: DS-Audit"
        Status = $g1Status
        ComponentRate = $cov.AdoptionRate
        TokenErrors = $tok.HardcodeCount
        Justification = $cov.JustificationDetail
    }

    Write-Host "   - Component Reuse : $($cov.AdoptionRate)% (Chuan: >= $ComponentThreshold%) -> $($cov.Status)" -ForegroundColor $(if($cov.Status -match 'PASS'){"Green"}else{"Red"})
    Write-Host "   - Token Purity    : $($tok.HardcodeCount) loi hardcode -> $($tok.Status)" -ForegroundColor $(if($tok.Status -eq "PASS"){"Green"}else{"Red"})
    Write-Host "   => Ket qua Gate 1: [$g1Status]" -ForegroundColor $(if($g1Status -match 'PASS'){"Green"}else{"Red"})

    # FAIL-FAST: Dung ngay neu Gate 1 hong trong che do Pipeline
    if ($Mode -eq "Pipeline" -and $g1Status -eq "FAIL") {
        $isFailFastTriggered = $true
        Write-Host "`n [!] FAIL-FAST TRIGGERED: Gate 1 (Design System) da truot!" -ForegroundColor Red
        Write-Host "     Nguyen ly he thong: Khong son tuong khi mong nha dang hong." -ForegroundColor Yellow
        Write-Host "     Dung kiem dinh cac Gate tiep theo de tiet kiem token & tai nguyen." -ForegroundColor Yellow
    }
}

# ----------------- GATE 2: UI VISUAL CRAFT & AESTHETICS -----------------
if (!$isFailFastTriggered -and ($Gate -eq "All" -or $Gate -eq "UI")) {
    Write-Host "`n>>> [GATE 2 / 4] THAM DINH MY THUAT THI GIAC & ANTI-AI-SLOP..." -ForegroundColor Cyan
    $ui = & "$AuditRoot\core\ui-visual-craft.ps1" -TargetDir $Target

    $gateResults["UI"] = [PSCustomObject]@{
        Gate = "GATE 2: UI-Audit"
        Status = $ui.Status
        Score = $ui.Score
        SlopCount = $ui.SlopCount
        PolishScore = $ui.PolishScore
    }

    Write-Host "   - Diem My thuat UI: $($ui.Score)/100 -> $($ui.Status)" -ForegroundColor $(if($ui.Status -eq "PASS"){"Green"}elseif($ui.Status -eq "WARNING"){"Yellow"}else{"Red"})
    Write-Host "   - Vi pham AI-Slop : $($ui.SlopCount) vi pham" -ForegroundColor $(if($ui.SlopCount -eq 0){"Green"}else{"Yellow"})
    Write-Host "   => Ket qua Gate 2: [$($ui.Status)]" -ForegroundColor $(if($ui.Status -eq "PASS"){"Green"}elseif($ui.Status -eq "WARNING"){"Yellow"}else{"Red"})
}

# ----------------- GATE 3: UX USABILITY & ERGONOMICS -----------------
if (!$isFailFastTriggered -and ($Gate -eq "All" -or $Gate -eq "UX")) {
    Write-Host "`n>>> [GATE 3 / 4] THAM DINH TRAI NGHIEM NGUOI DUNG & THUMB ZONE ($Profile)..." -ForegroundColor Cyan
    $ux = switch ($Profile) {
        "MTS" { & "$AuditRoot\profiles\profile-mts.ps1" -TargetDir $Target }
        "Admin" { & "$AuditRoot\profiles\profile-admin.ps1" -TargetDir $Target }
        "Landingpage" { & "$AuditRoot\profiles\profile-landing.ps1" -TargetDir $Target }
        Default { & "$AuditRoot\profiles\profile-wts.ps1" -TargetDir $Target }
    }

    $gateResults["UX"] = [PSCustomObject]@{
        Gate = "GATE 3: UX-Audit"
        Status = $ux.Status
        Score = $ux.Score
    }

    Write-Host "   - Diem Cong thai hoc UX: $($ux.Score)/100 -> $($ux.Status)" -ForegroundColor $(if($ux.Status -eq "PASS"){"Green"}else{"Red"})
    Write-Host "   => Ket qua Gate 3: [$($ux.Status)]" -ForegroundColor $(if($ux.Status -eq "PASS"){"Green"}else{"Red"})
}

# ----------------- GATE 4: FINANCIAL BUSINESS COMPLIANCE -----------------
if (!$isFailFastTriggered -and ($Gate -eq "All" -or $Gate -eq "BA")) {
    Write-Host "`n>>> [GATE 4 / 4] THAM DINH NGHIEP VU TAI CHINH & PHAP LY ($Profile)..." -ForegroundColor Cyan
    $ba = & "$AuditRoot\core\run-ba-audit.ps1" -Target $Target -Profile $Profile -NoInteractive

    $gateResults["BA"] = [PSCustomObject]@{
        Gate = "GATE 4: BA-Audit"
        Status = $ba.Verdict
        Score = $ba.Score
    }
}

# ----------------- TONG KET VERDICT -----------------
$finalVerdict = "PASS"
$failedGates = @()

foreach ($key in $gateResults.Keys) {
    $res = $gateResults[$key]
    if ($res.Status -eq "FAIL") {
        $finalVerdict = "REWORK_REQUIRED"
        $failedGates += $res.Gate
    }
}

if ($finalVerdict -ne "REWORK_REQUIRED" -and $gateResults.ContainsKey("DS") -and $gateResults["DS"].Status -eq "PASS_WITH_JUSTIFICATION") {
    $finalVerdict = "PASS_WITH_JUSTIFICATION"
}

Write-Host "`n================================================================================" -ForegroundColor Cyan
Write-Host " TONG HOP BIEN BAN THAM DINH (EXECUTIVE AUDIT SUMMARY)" -ForegroundColor Yellow
Write-Host "================================================================================" -ForegroundColor Cyan

foreach ($key in $gateResults.Keys) {
    $g = $gateResults[$key]
    $color = if ($g.Status -match 'PASS') { "Green" } elseif ($g.Status -eq "WARNING") { "Yellow" } else { "Red" }
    Write-Host " * $($g.Gate): [$($g.Status)]" -ForegroundColor $color
}

Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Yellow
if ($finalVerdict -eq "PASS") {
    Write-Host " PHAN QUYET CUOI CUNG: [ PASS - DAT CHUAN XUAT XUONG ]" -ForegroundColor Green
} elseif ($finalVerdict -eq "PASS_WITH_JUSTIFICATION") {
    Write-Host " PHAN QUYET CUOI CUNG: [ PASS WITH EXCEPTION - DAT KEM GIAI TRINH ]" -ForegroundColor Yellow
} else {
    Write-Host " PHAN QUYET CUOI CUNG: [ REWORK REQUIRED - BAT BUOC SUA LAI ]" -ForegroundColor Red
    Write-Host " Cac cong bi danh truot: $($failedGates -join ', ')" -ForegroundColor Red
}
Write-Host "================================================================================`n" -ForegroundColor Cyan

# Xuat bao cao neu duoc yeu cau
if ($ReportOutput) {
    $reportDir = Split-Path $ReportOutput -Parent
    if ($reportDir -and !(Test-Path $reportDir)) { New-Item -ItemType Directory -Force $reportDir | Out-Null }

    $rows = @()
    foreach ($key in $gateResults.Keys) {
        $g = $gateResults[$key]
        $rows += "| $($g.Gate) | $($g.Status) |"
    }

    $md = @"
# 🛡️ BIÊN BẢN THẨM ĐỊNH BỘ TỨ CỔNG (QUAD-GATES AUDIT REPORT)

- **Mục tiêu**: `$($Target)`
- **Hồ sơ chuyên môn (Profile)**: `$($Profile)`
- **Thời điểm thẩm định**: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
- **Chế độ**: `$($Mode)`
- **Phán quyết cuối cùng**: **`$($finalVerdict)`**

---

## 1. Kết Quả Bốn Cổng Thẩm Định (The Quad Gates)
| Cổng Thẩm Định | Kết Quả |
| :--- | :---: |
$($rows -join "`n")

---

## 2. Kết Luận & Khuyến Nghị
$(if ($failedGates.Count -gt 0) {
    "Sản phẩm bị từ chối tại các cổng: " + ($failedGates -join ", ") + ". Yêu cầu Maker Agent khắc phục ngay."
} else {
    "Sản phẩm đáp ứng đầy đủ tiêu chuẩn chất lượng. Đủ điều kiện trình Chủ nhân phê duyệt."
})

---
*Biên bản được xuất tự động bởi Design-Audit-Hub Engine.*
"@
    Set-Content -Path $ReportOutput -Value $md -Encoding UTF8
    Write-Host " [OK] Da ghi bao cao tham dinh vao: $ReportOutput" -ForegroundColor Green
}

return [PSCustomObject]@{
    Verdict = $finalVerdict
    FailedGates = $failedGates
    GateResults = $gateResults
}
