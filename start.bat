@echo off
chcp 65001 >nul
title Design-Audit-Hub (Quad-Gates 4-Pane Splitview)
cd /d "%~dp0"

where herdr >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    herdr workspace focus wC >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        echo [OK] Da chuyen focus sang Workspace Design-Audit trong Herdr (4 Cua so Quad-Splitview)!
        start herdr
        exit /b 0
    )
)

where wt.exe >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [*] Dang khoi dong 4 Cua so Quad-Splitview trong Windows Terminal...
    start wt.exe -w 0 -d "%~dp0" --title "ds-audit" powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0core\run-ds-audit.ps1" ; split-pane -d "%~dp0" -V --title "ui-audit" powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0core\run-ui-audit.ps1" ; split-pane -d "%~dp0" -V --title "ux-audit" powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0core\run-ux-audit.ps1" ; split-pane -d "%~dp0" -V --title "ba-audit" powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0core\run-ba-audit.ps1"
    exit /b 0
)

echo [*] Mo 4 cua so PowerShell doc lap...
start powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0core\run-ds-audit.ps1"
start powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0core\run-ui-audit.ps1"
start powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0core\run-ux-audit.ps1"
start powershell -NoExit -ExecutionPolicy Bypass -File "%~dp0core\run-ba-audit.ps1"
