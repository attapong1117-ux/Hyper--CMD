chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"
$Host.UI.RawUI.WindowTitle = "HYPER LOADING"

Clear-Host

# =========================
# SOUND (ตึ๊ด)
# =========================
[console]::beep(1000,200)

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
Write-Host "[ • ] CONNECTING GITHUB..." -ForegroundColor Cyan

# =========================
# LOADING BAR
# =========================

for ($i=0; $i -le 100; $i+=2){
    Write-Progress -Activity "LOADING..." -Status "$i%" -PercentComplete $i
    Start-Sleep -Milliseconds 20
}

# =========================
# DOWNLOAD FROM GITHUB
# =========================

$batUrl  = "https://raw.githubusercontent.com/attapong1117-ux/Hyper--CMD/main/Hyper.bat"
$batPath = "$env:TEMP\Hyper.bat"

Write-Host ""
Write-Host "[ • ] DOWNLOADING..." -ForegroundColor Yellow

Invoke-WebRequest -Uri $batUrl -OutFile $batPath

# =========================
# SOUND (ตึ๊ดตอนเสร็จ)
# =========================
[console]::beep(1200,200)

Write-Host "[ • ] STARTING FILE..." -ForegroundColor Green

Start-Sleep 1

# =========================
# RUN BAT
# =========================

Start-Process $batPath

Write-Host ""
Write-Host "[ DONE ]" -ForegroundColor Green
Pause
