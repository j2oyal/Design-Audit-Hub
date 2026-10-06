<#
.SYNOPSIS
    BO PHAT TIN HIEU LIEN KHONG GIAN (CROSS-SPACE SIGNAL EMITTER)
.DESCRIPTION
    Cong cu chuan hoa de cac Agent (Design-Audit-Hub, Admin-Design, executive-secretary)
    phat tin hieu vao bus/signals/ sau khi hoan thanh nhiem vu.
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$TaskId,

    [Parameter(Mandatory=$false)]
    [ValidateSet("AUDIT_DONE", "REWORK_DONE", "TASK_DISPATCHED", "REWORK_DISPATCHED", "ARBITER_VERDICT")]
    [string]$Type = "AUDIT_DONE",

    [Parameter(Mandatory=$false)]
    [ValidateSet("PASS", "FAIL", "REWORK_REQUIRED", "IN_PROGRESS", "WARNING")]
    [string]$Status = "PASS",

    [Parameter(Mandatory=$false)]
    [string]$Source = "",

    [Parameter(Mandatory=$false)]
    [string]$Summary = "",

    [Parameter(Mandatory=$false)]
    [string]$ReportFile = "",

    [Parameter(Mandatory=$false)]
    [string]$Score = "",

    [Parameter(Mandatory=$false)]
    [string]$FailedNodes = ""
)

$SecretaryRoot = "D:\Github\executive-secretary"
$SignalsDir = "$SecretaryRoot\bus\signals"

if (!(Test-Path $SignalsDir)) {
    New-Item -ItemType Directory -Force $SignalsDir | Out-Null
}

# Tu dong nhan dien nguon phat neu de trong
if ([string]::IsNullOrWhiteSpace($Source)) {
    $currentDir = (Get-Location).Path
    if ($currentDir -match '(?i)Design-Audit-Hub') { $Source = "Design-Audit-Hub" }
    elseif ($currentDir -match '(?i)Admin-Design') { $Source = "Admin-Design" }
    elseif ($currentDir -match '(?i)MAPS-Design') { $Source = "MAPS-Design" }
    elseif ($currentDir -match '(?i)executive-secretary') { $Source = "executive-secretary" }
    else { $Source = "Unknown-Agent" }
}

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$signalId = "SIG-$timestamp-$TaskId-$Type"

$signalData = [ordered]@{
    signal_id   = $signalId
    timestamp   = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
    task_id     = $TaskId
    source      = $Source
    type        = $Type
    status      = $Status
    score       = $Score
    summary     = $Summary
    report_file = $ReportFile
    failed_nodes= $FailedNodes
    processed   = $false
}

$signalJson = $signalData | ConvertTo-Json -Depth 5
$signalFile = Join-Path $SignalsDir "$signalId.json"

[System.IO.File]::WriteAllText($signalFile, $signalJson, (New-Object System.Text.UTF8Encoding $true))

Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host " [SIGNAL EMIT] PING-PONG CROSS-SPACE BUS" -ForegroundColor Yellow
Write-Host " Signal ID : $signalId" -ForegroundColor White
Write-Host " Source    : $Source -> Target: executive-secretary" -ForegroundColor Cyan
Write-Host " Type/Stat : $Type | Status: $Status $(if($Score){"($Score)"})" -ForegroundColor $(if($Status -eq "PASS"){"Green"}elseif($Status -eq "WARNING"){"Yellow"}else{"Red"})
if ($ReportFile) { Write-Host " Report    : $ReportFile" -ForegroundColor Gray }
if ($Summary) { Write-Host " Summary   : $Summary" -ForegroundColor White }
Write-Host " File Path : $signalFile" -ForegroundColor DarkGray
Write-Host "================================================================================" -ForegroundColor Cyan

return [PSCustomObject]@{
    SignalId   = $signalId
    SignalFile = $signalFile
    Status     = $Status
    TaskId     = $TaskId
}
