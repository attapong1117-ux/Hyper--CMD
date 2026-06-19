# =========================
# HYPER ALL IN ONE + GITHUB
# =========================

chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = New-Object System.Text.UTF8Encoding

# =========================
# CONSOLE BLACK MODE
# =========================
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "Green"
$Host.UI.RawUI.WindowTitle = "HYPER LOADER"
mode con: cols=120 lines=30
Clear-Host

# =========================
# ASCII LOGO
# =========================
$logo = @"
HH   HH  Y   Y  PPPPP   EEEEE  RRRRR
HH   HH   Y Y   PP  PP  EE     RR  RR
HHHHHHH    Y    PPPPP   EEEEE  RRRRR
HH   HH    Y    PP      EE     RR RR
HH   HH    Y    PP      EEEEE  RR  RR

        H Y P E R   L O A D E R
"@

Write-Host $logo -ForegroundColor Cyan
Write-Host ""

# =========================
# LOADING
# =========================
Write-Host "[+] BOOTING SYSTEM..." -ForegroundColor Yellow
Start-Sleep -Milliseconds 500

for ($i = 0; $i -le 100; $i += 5) {
    Write-Progress -Activity "LOADING HYPER SYSTEM" -Status "$i% COMPLETE" -PercentComplete $i
    Start-Sleep -Milliseconds 25
}

Write-Host ""
Write-Host "[✔] SYSTEM READY" -ForegroundColor Green
Write-Host "[✔] CONNECTING GITHUB..." -ForegroundColor Cyan

# =========================
# GITHUB PAYLOAD
# =========================
$url = "https://raw.githubusercontent.com/attapong1117-ux/Hyper--CMD/main/Hyper.bat"
$file = "$env:TEMP\Hyper.bat"

try {
    Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing -ErrorAction Stop

    Write-Host "[✔] DOWNLOAD COMPLETE" -ForegroundColor Green
    Write-Host "[✔] EXECUTING PAYLOAD..." -ForegroundColor Cyan

    Start-Process "cmd.exe" -ArgumentList "/c `"$file`""
    [console]::beep(1000,200)
}
catch {
    Write-Host "[X] FAILED TO LOAD FROM GITHUB" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor DarkRed
    [console]::beep(200,500)
}

Write-Host ""
Write-Host ">>> HYPER LOADER ACTIVE <<<" -ForegroundColor Green
pause
