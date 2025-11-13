@echo off
title Safe Windows Optimization
color 0a

echo ============================================
echo     SAFE SYSTEM OPTIMIZATION (AUTO PART)
echo ============================================

echo [1/6] Switching to Ultimate Performance plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1

echo [2/6] Cleaning temporary files...
del /q/f/s "%TEMP%\*" >nul 2>&1
del /q/f/s "C:\Windows\Temp\*" >nul 2>&1

echo [3/6] Flushing DNS and resetting network cache...
ipconfig /flushdns >nul
netsh winsock reset >nul
netsh int ip reset >nul

echo [4/6] Turning off Xbox Game Bar and background recording...
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul

echo [5/6] Freeing standby memory...
%SystemRoot%\System32\rundll32.exe advapi32.dll,ProcessIdleTasks

echo [6/6] Finished automatic cleanup.
echo.
echo Now continue with the manual steps listed below.
pause
exit
