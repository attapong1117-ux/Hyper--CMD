chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"
$Host.UI.RawUI.WindowTitle = "HYPER GITHUB LOADER"

Clear-Host

Write-Host ""
Write-Host "██╗  ██╗ ██╗   ██╗██████╗ ███████╗██████╗" -ForegroundColor DarkBlue
Write-Host "██║  ██║ ╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗" -ForegroundColor White
Write-Host "███████║  ╚████╔╝ ██████╔╝█████╗  ██████╔╝" -ForegroundColor DarkBlue
Write-Host "██╔══██║   ╚██╔╝  ██╔═══╝ ██╔══╝  ██╔══██╗" -ForegroundColor White
Write-Host "██║  ██║    ██║   ██║     ███████╗██║  ██║" -ForegroundColor DarkBlue
Write-Host "╚═╝  ╚═╝    ╚═╝   ╚═╝     ╚══════╝╚═╝  ╚═╝" -ForegroundColor White

Write-Host ""
Write-Host "[ • ] CONNECTING TO GITHUB..." -ForegroundColor Cyan

for ($i=0; $i -le 100; $i+=5){
    Write-Progress -Activity "LOADING" -Status "$i%" -PercentComplete $i
    Start-Sleep -Milliseconds 20
}

$batUrl  = "https://raw.githubusercontent.com/attapong1117-ux/Hyper--CMD/main/Hyper.bat"
$batPath = "$env:TEMP\Hyper.bat"

Write-Host ""
Write-Host "[ • ] DOWNLOADING FILE..." -ForegroundColor Yellow

Invoke-WebRequest -Uri $batUrl -OutFile $batPath

Write-Host "[ • ] RUNNING..." -ForegroundColor Green

Start-Process $batPath

Write-Host ""
Write-Host "[ DONE ]" -ForegroundColor Green
Pause
