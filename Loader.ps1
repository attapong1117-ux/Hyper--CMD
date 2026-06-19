# =========================
# HYPER LOADER ASCII SAFE
# =========================

chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = New-Object System.Text.UTF8Encoding
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Clear-Host

# =========================
# SAFE ASCII LOGO (NO BREAK)
# =========================
$logo = @"

HH   HH  Y   Y  PPPPP   EEEEE  RRRRR
HH   HH   Y Y   PP  PP  EE     RR  RR
HHHHHHH    Y    PPPPP   EEEEE  RRRRR
HH   HH    Y    PP      EE     RR RR
HH   HH    Y    PP      EEEEE  RR  RR

            H Y P E R   L O A D E R
              S Y S T E M   B O O T
"@

Write-Host $logo -ForegroundColor Cyan
Write-Host ""

Start-Sleep -Milliseconds 500

# =========================
# BOOT EFFECT
# =========================
for ($i = 0; $i -le 100; $i += 5) {
    Write-Progress -Activity "SYSTEM BOOTING" -Status "$i% COMPLETE" -PercentComplete $i
    Start-Sleep -Milliseconds 35
}

Write-Host ""
Write-Host "[✔] CONNECT TO SERVER" -ForegroundColor Yellow
Write-Host "[✔] SUCCESFULLY TO CONNECT..." -ForegroundColor Green

Start-Sleep -Milliseconds 600

# =========================
# DOWNLOAD + RUN
# =========================
$url = "https://raw.githubusercontent.com/attapong1117-ux/Hyper--CMD/main/Hyper.bat"
$file = "$env:TEMP\Hyper.bat"

try {
    Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing -ErrorAction Stop

    Write-Host "[✔] DOWNLOAD OK" -ForegroundColor Green
    Write-Host "[✔] RUNNING..." -ForegroundColor Cyan

    Start-Process "cmd.exe" -ArgumentList "/c `"$file`""
    [console]::beep(1000,300)
}
catch {
    Write-Host "[X] LOAD FAILED" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor DarkRed
    [console]::beep(200,500)
}

Write-Host ""
Write-Host "SYSTEM ACTIVE" -ForegroundColor Green
pause
