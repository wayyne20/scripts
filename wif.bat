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

echo. HotSpot Activator

echo.

echo.
echo. Choose Your Option...
echo.
echo. (1) Start HotSpot
echo. (2) Stop HotSpoy
echo. (3) HotSpot Stats
echo. (0) Close the Program

set /p userinp=    ^   Make your selection: 
set userinp=%userinp:~0,1%
if /i "%userinp%"=="1" goto wstart
if /i "%userinp%"=="2" goto wstop
if /i "%userinp%"=="3" goto wstat
if /i "%userinp%"=="0" exit

GOTO mainmenu

:wstart
cls
title Starting Virtual WIFI Network!
echo.
echo Starting Virtual WIFI Network!
echo.
netsh wlan set hostednetwork mode=allow ssid=home key=wonker666
netsh wlan start hostednetwork
goto mainmenu

:wstop
cls
title stopping Virtual WIFI Network!
echo.
echo stopping Virtual WIFI Network!
echo.
netsh wlan stop hostednetwork
goto mainmenu

:wstat
cls
title Virtual WIFI Network Stats!
echo.
echo Virtual WIFI Network Stats!
echo.
netsh wlan show hostednetwork
pause
goto mainmenu