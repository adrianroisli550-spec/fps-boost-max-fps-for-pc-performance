@echo off
title Ultimate FPS Booster (Safe Edition)
color 0a

echo ===============================================
echo          🕹️  Windows 11 FPS Booster
echo ===============================================
echo.
echo  Starting optimization...
echo.

:: STEP 1 - Switch to High Performance mode
echo [1/10] Setting power mode to HIGH PERFORMANCE...
powercfg -setactive SCHEME_MIN
timeout /t 1 >nul

:: STEP 2 - Stop non-essential background processes
echo [2/10] Closing background processes...
for %%G in (
    OneDrive.exe
    Teams.exe
    Discord.exe
    SteamWebHelper.exe
    EpicWebHelper.exe
    AdobeUpdateService.exe
    MicrosoftEdgeUpdate.exe
) do taskkill /IM %%G /F >nul 2>&1
timeout /t 1 >nul

:: STEP 3 - Clear temporary files
echo [3/10] Cleaning temporary files...
del /q/f/s "%TEMP%\*" >nul 2>&1
del /q/f/s "C:\Windows\Temp\*" >nul 2>&1
timeout /t 1 >nul

:: STEP 4 - Flush DNS and reset network cache
echo [4/10] Refreshing network settings...
ipconfig /flushdns >nul
netsh winsock reset >nul
netsh int ip reset >nul
timeout /t 1 >nul

:: STEP 5 - Disable Xbox Game Bar and background recording
echo [5/10] Disabling Xbox Game Bar (recording can lower FPS)...
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul
timeout /t 1 >nul

:: STEP 6 - Enable Ultimate Performance plan (if available)
echo [6/10] Enabling Ultimate Performance plan (if supported)...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
timeout /t 1 >nul

:: STEP 7 - Optimize memory
echo [7/10] Freeing standby memory...
%SystemRoot%\System32\rundll32.exe advapi32.dll,ProcessIdleTasks
timeout /t 1 >nul

:: STEP 8 - Stop SysMain (superfetch) temporarily
echo [8/10] Temporarily stopping SysMain to reduce disk usage...
net stop SysMain >nul 2>&1
timeout /t 1 >nul

:: STEP 9 - Turn off visual effects (temporary performance mode)
echo [9/10] Switching Windows to best performance visual mode...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
timeout /t 1 >nul

:: STEP 10 - Done
echo [10/10] Optimization complete!
echo.
echo Your PC is now optimized for gaming.
echo Launch Fortnite or Rocket League and enjoy smoother performance!
echo.
pause

