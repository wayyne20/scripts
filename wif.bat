@echo off&color a&mode con: cols=90 lines=29
cls
pushd "%~dp0"
title wif
fltmc >nul 2>&1 || (
	echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	echo UAC.ShellExecute "%~fs0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs"
	del /f /q "%temp%\getadmin.vbs"
	exit /b
)
REG QUERY "HKU\S-1-5-19" >NUL 2>&1 && (
GOTO mainmenu
) || (
echo Right click and run as administrator...
echo.
pause
GOTO exit
)

:mainmenu
cls

echo. Your Windows edition is compatible

echo.

echo.
echo. Choose Your Option...
echo.
echo. (1) Activate %SYSTEMID% %WINVER% with KMS
echo. (2) Permanently Activate with a Digital License
echo. (0) Close the Program

set /p userinp=    ^   Make your selection: 
set userinp=%userinp:~0,1%
if /i "%userinp%"=="1" goto wstart
if /i "%userinp%"=="2" goto wstop
if /i "%userinp%"=="0" exit

GOTO mainmenu

:wstart
cls
title Starting Virtual WIFI Network!
echo Starting Virtual WIFI Network!
netsh wlan set hostednetwork mode=allow ssid=home key=wonker666
netsh wlan start hostednetwork
netsh wlan show hostednetwork
netsh wlan stop hostednetwork
goto mainmenu

:wstop
cls
title stopping Virtual WIFI Network!
echo stopping Virtual WIFI Network!
netsh wlan stop hostednetwork
goto mainmenu

:wstat
cls
title stopping Virtual WIFI Network!
echo stopping Virtual WIFI Network!
netsh wlan stop hostednetwork
goto mainmenu