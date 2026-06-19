# =========================
# LOADING SCREEN + RUN SCRIPT
# =========================

chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Force TLS (สำคัญมากสำหรับ GitHub)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"
$Host.UI.RawUI.WindowTitle = "LOADING"

Clear-Host

Write-Host ""
Write-Host "                    ██╗      ██████╗  █████╗ ██████╗ ██╗███╗   ██╗ ██████╗ " -ForegroundColor DarkBlue
Write-Host "                    ██║     ██╔═══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ " -ForegroundColor White
Write-Host "                    ██║     ██║   ██║███████║██║  ██║██║██╔██╗ ██║██║  ███╗" -ForegroundColor DarkBlue
Write-Host "                    ██║     ██║   ██║██╔══██║██║  ██║██║██║╚██╗██║██║   ██║" -ForegroundColor White
Write-Host "                    ███████╗╚██████╔╝██║  ██║██████╔╝██║██║ ╚████║╚██████╔╝" -ForegroundColor DarkBlue
Write-Host "                    ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ " -ForegroundColor White

Write-Host ""
Write-Host "[ • ] SOURCE :" -ForegroundColor Cyan
Write-Host "https://raw.githubusercontent.com/attapong1117-ux/Hyper--CMD/main/Hyper.bat" -ForegroundColor Gray
Write-Host ""

# LOADING BAR
for ($i = 0; $i -le 100; $i += 2) {
    Write-Progress -Activity "LOADING..." -Status "$i%" -PercentComplete $i
    Start-Sleep -Milliseconds 25
}

Write-Host ""
Write-Host "                           [ • ] LOADING COMPLETE" -ForegroundColor Green
Write-Host "                           [ • ] LAUNCHING SCRIPT..." -ForegroundColor Cyan
Write-Host ""

# =========================
# DOWNLOAD + RUN BAT FROM GITHUB
# =========================

$url = "https://raw.githubusercontent.com/attapong1117-ux/Hyper--CMD/main/Hyper.bat"
$batFile = "$env:TEMP\Hyper.bat"

Invoke-WebRequest -Uri $url -OutFile $batFile -UseBasicParsing

Start-Process "cmd.exe" -ArgumentList "/c `"$batFile`""

Pause
