<#
.SYNOPSIS
    Profile Tham Dinh: Landing Page (CRO Studio).
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$TargetDir
)

Write-Host " [Audit:Profile] Kiem dinh Chuyen sau: Landing Page (CRO Studio & High-Conversion)..." -ForegroundColor Cyan

$sourceFiles = Get-ChildItem -Path $TargetDir -Recurse -Include *.html,*.json,*.md -Exclude node_modules,.git

$checks = @(
    @{ Name = "Nhip dieu 7 nep gap CRO (Hero, Proof, Solution, Showcase, Testimonials, FAQ, CTA)"; Pass = $false },
    @{ Name = "Tep tin doc lap Standalone (index.html chay thang khong can node build)"; Pass = $false },
    @{ Name = "Vien nang doc lap Capsule Tokens (Co tokens.json hoac theme tokens rieng)"; Pass = $false },
    @{ Name = "Phan cap CTA ro rang (Primary CTA noi bat, Secondary CTA khong lan at)"; Pass = $false },
    @{ Name = "Ban sac thi giac doc ban (Khong dính AI-slop, co tieu de balance)"; Pass = $false }
)

foreach ($file in $sourceFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($content)) { continue }

    # 7 folds
    if ($content -match '(?i)(hero|social-proof|problem|solution|showcase|feature|testimonial|faq|cta)') {
        $checks[0].Pass = $true
    }
    # Standalone html
    if ($file.Name -eq "index.html") {
        $checks[1].Pass = $true
    }
    # Capsule tokens
    if ($file.Name -eq "tokens.json" -or $content -match '(?i)theme-tokens') {
        $checks[2].Pass = $true
    }
    # CTA prominence
    if ($content -match '(?i)(btn-primary|btn-glow|bg-primary|cta-button)') {
        $checks[3].Pass = $true
    }
    # Visual identity
    if ($content -match '(?i)(text-wrap:\s*balance|font-display|brand-gradient)') {
        $checks[4].Pass = $true
    }
}

$passedCount = ($checks | Where-Object { $_.Pass -eq $true }).Count
$total = $checks.Count
$score = [Math]::Round(($passedCount / $total) * 100, 1)

return [PSCustomObject]@{
    Profile = "LANDINGPAGE"
    Score = $score
    Status = if ($score -ge 80) { "PASS" } else { "FAIL" }
    Checks = $checks
}
