# =========================
# HYPER LOADER ALL IN ONE
# =========================

chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# ตั้งค่าหน้าจอ
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"
$Host.UI.RawUI.WindowTitle = "HYPER LOADING"

Clear-Host

# =========================
# LOGO
# =========================

Write-Host ""
Write-Host "██╗  ██╗ ██╗   ██╗██████╗ ███████╗██████╗" -ForegroundColor DarkBlue
Write-Host "██║  ██║ ╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗" -ForegroundColor White
Write-Host "███████║  ╚████╔╝ ██████╔╝█████╗  ██████╔╝" -ForegroundColor DarkBlue
Write-Host "██╔══██║   ╚██╔╝  ██╔═══╝ ██╔══╝  ██╔══██╗" -ForegroundColor White
Write-Host "██║  ██║    ██║   ██║     ███████╗██║  ██║" -ForegroundColor DarkBlue
Write-Host "╚═╝  ╚═╝    ╚═╝   ╚═╝     ╚══════╝╚═╝  ╚═╝" -ForegroundColor White

Write-Host ""
Write-Host "──────────────────────────────────────────────" -ForegroundColor DarkBlue
Write-Host "[ • ] HYPER LOADING SYSTEM" -ForegroundColor Cyan
Write-Host "[ • ] STATUS : STARTING..." -ForegroundColor White
Write-Host ""

# =========================
# LOADING BAR
# =========================

for ($i = 0; $i -le 100; $i += 2) {
    Write-Progress -Activity "LOADING HYPER" -Status "$i%" -PercentComplete $i
    Start-Sleep -Milliseconds 25
}

Write-Host ""
Write-Host "[ • ] LOADING COMPLETE" -ForegroundColor Green
Write-Host "[ • ] STARTING HYPER.BAT..." -ForegroundColor Cyan
Write-Host ""

Start-Sleep 1

# =========================
# RUN BAT (LOCAL FILE)
# =========================

$bat = Join-Path $PSScriptRoot "Hyper.bat"

if (Test-Path $bat) {
    Start-Process -FilePath $bat -WorkingDirectory $PSScriptRoot
} else {
    Write-Host "[ ERROR ] Hyper.bat NOT FOUND" -ForegroundColor Red
    Pause
}
