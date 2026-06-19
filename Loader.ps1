# =========================
# LOADING
# =========================

# UTF-8
chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Console สีดำ
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"
$Host.UI.RawUI.WindowTitle = "LOADING"

Clear-Host

Write-Host ""
Write-Host "██╗      ██████╗  █████╗ ██████╗ ██╗███╗   ██╗ ██████╗ " -ForegroundColor DarkBlue
Write-Host "██║     ██╔═══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ " -ForegroundColor White
Write-Host "██║     ██║   ██║███████║██║  ██║██║██╔██╗ ██║██║  ███╗" -ForegroundColor DarkBlue
Write-Host "██║     ██║   ██║██╔══██║██║  ██║██║██║╚██╗██║██║   ██║" -ForegroundColor White
Write-Host "███████╗╚██████╔╝██║  ██║██████╔╝██║██║ ╚████║╚██████╔╝" -ForegroundColor DarkBlue
Write-Host "╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ " -ForegroundColor White
Write-Host ""

for ($i = 0; $i -le 100; $i += 2) {
    Write-Progress -Activity "LOADING..." -Status "$i%" -PercentComplete $i
    Start-Sleep -Milliseconds 25
}

Write-Host ""
Write-Host "[ • ] SOURCE FILE" -ForegroundColor Cyan
Write-Host "https://raw.githubusercontent.com/attapong1117-ux/Hyper--CMD/main/Hyper.bat" -ForegroundColor Gray
Write-Host ""
Write-Host "[ • ] LOADING COMPLETE" -ForegroundColor Green
Write-Host ""

pause
