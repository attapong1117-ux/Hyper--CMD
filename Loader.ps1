# =========================
# HYPER LOADER
# =========================

Set-ExecutionPolicy Bypass -Scope Process -Force -ErrorAction SilentlyContinue

# UTF-8
chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Clear-Host

Write-Host ""
Write-Host "██╗      ██████╗  █████╗ ██████╗ ██╗███╗   ██╗ ██████╗ " -ForegroundColor DarkBlue
Write-Host "██║     ██╔═══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ " -ForegroundColor White
Write-Host "██║     ██║   ██║███████║██║  ██║██║██╔██╗ ██║██║  ███╗" -ForegroundColor DarkBlue
Write-Host "██║     ██║   ██║██╔══██║██║  ██║██║██║╚██╗██║██║   ██║" -ForegroundColor White
Write-Host "███████╗╚██████╔╝██║  ██║██████╔╝██║██║ ╚████║╚██████╔╝" -ForegroundColor DarkBlue
Write-Host "╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ " -ForegroundColor White
Write-Host ""
Write-Host "                        [ • ] LOADING..." -ForegroundColor Cyan
Write-Host ""

for ($i = 0; $i -le 100; $i += 2)
{
    Write-Progress -Activity "LOADING..." -Status "$i%" -PercentComplete $i
    Start-Sleep -Milliseconds 25
}

try {

    Write-Host ""
    Write-Host "[ • ] Downloading..." -ForegroundColor Cyan

    $url = "https://raw.githubusercontent.com/attapong1117-ux/Hyper-CMD/main/Hyper.bat"
    $bat = "$env:TEMP\Hyper.bat"

    Invoke-WebRequest -Uri $url -OutFile $bat -UseBasicParsing

    if (!(Test-Path $bat)) {
        throw "Download failed."
    }

    Write-Host "[ • ] Launching..." -ForegroundColor Green

    Start-Process cmd.exe -ArgumentList "/k `"$bat`"" -Wait

}
catch {

    Write-Host ""
    Write-Host "[ ERROR ]" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor DarkGray

}

Write-Host ""
Write-Host "Press any key to exit..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") > $null
