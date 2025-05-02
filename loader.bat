title Vanguard kernel-mode service.

@echo off
sc stop vgc
del /f /q "C:\Windows\vgkbootstatus.dat"
del /f /q "C:\Program Files\Riot Vanguard\Logs\*.log"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v AppInit_DLLs /t REG_SZ /d "C:\Windows\system32\vgc.dll" /f
HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows,AppInit_DLLs
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v LoadAppInit_DLLs /t REG_DWORD /d 1 /f
sc start vgc
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v AppInit_DLLs /t REG_SZ /d "" /f
HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows,AppInit_DLLs
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v LoadAppInit_DLLs /t REG_DWORD /d 0 /f
sc query vgc

echo MsgBox "bypass active", 64, "LEVELUPLABS" > %temp%\msg.vbs
cscript //nologo %temp%\msg.vbs
del %temp%\msg.vbs

pause
