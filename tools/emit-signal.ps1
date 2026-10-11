<#
.SYNOPSIS
    Proxy phat tin hieu sang executive-secretary/tools/emit-signal.ps1
.DESCRIPTION
    Chuyen tiep tin hieu tu Design-Audit-Hub sang bus tap trung cua Thu ky.
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$TaskId,

    [Parameter(Mandatory=$false)]
    [ValidateSet("AUDIT_DONE", "REWORK_DONE", "TASK_DONE", "TASK_DISPATCHED", "REWORK_DISPATCHED", "ARBITER_VERDICT")]
    [string]$Type = "AUDIT_DONE",

    [Parameter(Mandatory=$false)]
    [ValidateSet("PASS", "FAIL", "REWORK_REQUIRED", "IN_PROGRESS", "WARNING")]
    [string]$Status = "PASS",

    [Parameter(Mandatory=$false)]
    [string]$Source = "Design-Audit-Hub",

    [Parameter(Mandatory=$false)]
    [string]$Summary = "",

    [Parameter(Mandatory=$false)]
    [string]$ReportFile = "",

    [Parameter(Mandatory=$false)]
    [string]$Score = "",

    [Parameter(Mandatory=$false)]
    [string]$FailedNodes = "",

    [Parameter(Mandatory=$false)]
    [string]$TicketId = ""
)

$targetScript = Join-Path $PSScriptRoot "..\..\executive-secretary\tools\emit-signal.ps1"
if (!(Test-Path $targetScript)) {
    throw "Khong tim thay script emit-signal.ps1 tai $targetScript"
}

$splat = @{
    TaskId      = $TaskId
    Type        = $Type
    Status      = $Status
    Source      = if ([string]::IsNullOrWhiteSpace($Source)) { "Design-Audit-Hub" } else { $Source }
    Summary     = $Summary
    ReportFile  = $ReportFile
    Score       = $Score
    FailedNodes = $FailedNodes
    TicketId    = $TicketId
}

& $targetScript @splat
