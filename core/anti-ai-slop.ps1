<#
.SYNOPSIS
    Phat hien va tieu diet cac mau hinh AI-Slop (thiet ke rap khuon tu AI).
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$TargetDir
)

Write-Host " [Audit:Core] Quet phat hien mau hinh thiet ke rap khuon AI-Slop..." -ForegroundColor Cyan

$sourceFiles = Get-ChildItem -Path $TargetDir -Recurse -Include *.html,*.css,*.jsx,*.tsx,*.vue -Exclude node_modules,.git

$slopViolations = @()

$slopRules = @(
    @{
        Id = "SLOP-01"
        Name = "Mau nen kem dat set rap khuon (#F4F1EA / #D97757)"
        Pattern = '(?i)#(f4f1ea|d97757|faf8f5|f5f2eb|e8d8c8)'
        Severity = "HIGH"
    },
    @{
        Id = "SLOP-02"
        Name = "Nhan ALL-CAPS gia tao spam tren moi tieu de"
        Pattern = '(?i)class="[^"]*(uppercase\s+tracking-(widest|wider)){2,}[^"]*"'
        Severity = "MEDIUM"
    },
    @{
        Id = "SLOP-03"
        Name = "Gan mui ten -> vo toi va o tat ca nut bam"
        Pattern = '(?i)>(Learn more|Get started|Explore|Click here)\s*(&rarr;|->)'
        Severity = "LOW"
    },
    @{
        Id = "SLOP-04"
        Name = "Card SaaS bo tron deu voi bong mo xam duc rgba(0,0,0,0.1)"
        Pattern = '(?i)box-shadow:\s*0\s+[0-9]+px\s+[0-9]+px\s+rgba\(0,\s*0,\s*0,\s*0\.1\)'
        Severity = "MEDIUM"
    },
    @{
        Id = "SLOP-05"
        Name = "Don dieu Den - Neon (Black canvas voi 1 mau neon duy nhat)"
        Pattern = '(?i)#(00ffcc|00ff66|39ff14)'
        Severity = "LOW"
    }
)

foreach ($file in $sourceFiles) {
    $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
    if ([string]::IsNullOrWhiteSpace($content)) { continue }

    foreach ($rule in $slopRules) {
        $matches = [regex]::Matches($content, $rule.Pattern)
        if ($matches.Count -gt 0) {
            $slopViolations += [PSCustomObject]@{
                RuleId = $rule.Id
                RuleName = $rule.Name
                File = $file.Name
                Count = $matches.Count
                Severity = $rule.Severity
            }
        }
    }
}

$highCount = ($slopViolations | Where-Object { $_.Severity -eq "HIGH" }).Count
$status = if ($highCount -gt 0) { "FAIL" } elseif ($slopViolations.Count -gt 0) { "WARNING" } else { "PASS" }

return [PSCustomObject]@{
    Status = $status
    Violations = $slopViolations
    TotalViolations = $slopViolations.Count
    HighSeverityCount = $highCount
}
