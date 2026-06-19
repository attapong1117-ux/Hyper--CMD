# =========================
# TRUE BLACK CONSOLE FIX
# =========================

# เปิด CMD สีดำจริงก่อน
cmd /c "color 01 && title HYPER LOADER && mode con: cols=120 lines=30"

chcp 65001 > $null
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = New-Object System.Text.UTF8Encoding
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

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

Write-Host $logo -ForegroundColor Green
Write-Host ""

# =========================
# LOADING
# =========================
for ($i = 0; $i -le 100; $i += 5) {
    Write-Progress -Activity "BOOTING HYPER" -Status "$i%" -PercentComplete $i
    Start-Sleep -Milliseconds 30
}

Write-Host "[✔] READY" -ForegroundColor Green
Write-Host "[✔] CONNECTING GITHUB..." -ForegroundColor Cyan

# =========================
# GITHUB RUN
# =========================
$url = "https://raw.githubusercontent.com/attapong1117-ux/Hyper--CMD/main/Hyper.bat"
$file = "$env:TEMP\Hyper.bat"

try {
    Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing -ErrorAction Stop
    Start-Process "cmd.exe" -ArgumentList "/c `"$file`""
}
catch {
    Write-Host "[X] ERROR LOADING GITHUB" -ForegroundColor Red
}

pause
