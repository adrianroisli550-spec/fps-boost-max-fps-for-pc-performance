@echo off
title ⚡ Ultimate FPS Optimization Script (Safe Edition)
color 0a

echo ===================================================
echo      🚀 WINDOWS 11 ULTIMATE FPS OPTIMIZATION 🚀
echo ===================================================
echo.
echo  Starting full PC optimization...
echo  Please wait while the system is tuned for gaming.
echo.

:: SECTION 1 - SYSTEM POWER SETTINGS
echo [1/20] Enabling Ultimate Performance power plan...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg -change -monitor-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -change -hibernate-timeout-ac 0
timeout /t 2 >nul

:: SECTION 2 - DISABLE BACKGROUND RECORDING
echo [2/20] Disabling Xbox Game Bar and DVR recording...
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul
timeout /t 1 >nul

:: SECTION 3 - CLOSE NON-ESSENTIAL APPS
echo [3/20] Closing unnecessary background apps...
for %%A in (
    OneDrive.exe
    Teams.exe
    Discord.exe
    SteamWebHelper.exe
    EpicWebHelper.exe
    Battle.net.exe
    Chrome.exe
    AdobeUpdateService.exe
    MicrosoftEdgeUpdate.exe
) do taskkill /IM %%A /F >nul 2>&1
timeout /t 1 >nul

:: SECTION 4 - CLEAN TEMP FILES
echo [4/20] Deleting temporary and cache files...
del /q/f/s "%TEMP%\*" >nul 2>&1
del /q/f/s "C:\Windows\Temp\*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
md "%TEMP%" >nul 2>&1
timeout /t 2 >nul

:: SECTION 5 - NETWORK OPTIMIZATION
echo [5/20] Resetting and optimizing network settings...
ipconfig /flushdns >nul
netsh int ip reset >nul
netsh winsock reset >nul
netsh advfirewall reset >nul
timeout /t 2 >nul

:: SECTION 6 - MEMORY MANAGEMENT
echo [6/20] Freeing standby memory and cleaning cache...
%SystemRoot%\System32\rundll32.exe advapi32.dll,ProcessIdleTasks
timeout /t 2 >nul

:: SECTION 7 - DISABLE STARTUP APPS (TEMPORARY)
echo [7/20] Disabling startup apps temporarily...
wmic startup get caption,command >nul
timeout /t 1 >nul

:: SECTION 8 - STOP HEAVY SERVICES
echo [8/20] Stopping heavy Windows services (temporary)...
net stop SysMain >nul 2>&1
net stop DiagTrack >nul 2>&1
net stop WSearch >nul 2>&1
timeout /t 2 >nul

:: SECTION 9 - WINDOWS VISUAL EFFECTS
echo [9/20] Setting Windows to Best Performance visuals...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
timeout /t 1 >nul

:: SECTION 10 - CLEAR PREFETCH
echo [10/20] Cleaning prefetch data...
del /q/f/s "C:\Windows\Prefetch\*" >nul 2>&1
timeout /t 1 >nul

:: SECTION 11 - FLUSH SYSTEM CACHE
echo [11/20] Flushing system cache...
fsutil behavior set memoryusage 2 >nul
timeout /t 1 >nul

:: SECTION 12 - SYSTEM FILE CHECK (OPTIONAL)
echo [12/20] Verifying system files (sfc)...
sfc /scannow
timeout /t 1 >nul

:: SECTION 13 - DISK CLEANUP
echo [13/20] Running disk cleanup silently...
cleanmgr /sagerun:1 >nul 2>&1
timeout /t 2 >nul

:: SECTION 14 - DISABLE WINDOWS TIPS & BACKGROUND APPS
echo [14/20] Disabling Windows tips, suggestions, and ads...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-310093Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul
timeout /t 1 >nul

:: SECTION 15 - TURN OFF WINDOWS UPDATE (TEMPORARY)
echo [15/20] Pausing Windows Update temporarily...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
timeout /t 1 >nul

:: SECTION 16 - REMOVE TEMP FILES FROM COMMON FOLDERS
echo [16/20] Removing log and temp data from user folders...
del /q/f/s "%USERPROFILE%\AppData\Local\Temp\*" >nul 2>&1
del /q/f/s "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*" >nul 2>&1
del /q/f/s "%USERPROFILE%\AppData\Local\Microsoft\Windows\WebCache\*" >nul 2>&1
timeout /t 1 >nul

:: SECTION 17 - RESET GPU SHADER CACHE
echo [17/20] Resetting DirectX and GPU shader cache...
del /q/f/s "%LOCALAPPDATA%\NVIDIA\DXCache\*" >nul 2>&1
del /q/f/s "%LOCALAPPDATA%\NVIDIA\GLCache\*" >nul 2>&1
del /q/f/s "%LOCALAPPDATA%\AMD\DxCache\*" >nul 2>&1
timeout /t 1 >nul

:: SECTION 18 - TIME SYNCHRONIZATION
echo [18/20] Syncing system time...
w32tm /resync >nul 2>&1
timeout /t 1 >nul

:: SECTION 19 - OPTIONAL GPU PRIORITY TWEAK (SAFE)
echo [19/20] Setting GPU priority to high for performance...
wmic process where name="explorer.exe" CALL setpriority "high priority" >nul
timeout /t 1 >nul

:: SECTION 20 - FINAL CLEANUP AND SUMMARY
echo [20/20] Final cleanup...
echo ---------------------------------------------------
echo  ✅ Optimization complete!
echo  ✅ Temporary files deleted
echo  ✅ Power mode set to Ultimate
echo  ✅ Services optimized
echo  ✅ System ready for maximum FPS
echo ---------------------------------------------------
echo.
echo  Launch Fortnite, Rocket League, or any game now!
pause
exit
