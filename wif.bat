::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcBaNM3+GIrof/eX+4f6UnmkYR+krd5/nybGaKeRd6UviFQ==
::fBE1pAF6MU+EWHreyHcjLQlHcBaNM3+GIrof/eX+4f6UnmkYR+krd5/nybGaMPdd6UviFQ==
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFAlbQxC+GGS5E7gZ5vzo086CsUYJW/IDb4aV36yLQA==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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

set /p ussid=<setid.cnf
set /p upwd=<setpw.cnf
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
echo. Choose Your Option...
echo.
echo. (1) Start HotSpot
echo. (2) Stop HotSpot
echo. (3) HotSpot Stats
echo. (c) Set SSID and Password
echo. (0) Close the Program
echo.
set /p userinp=    ^   Make your selection: 
set userinp=%userinp:~0,1%
if /i "%userinp%"=="1" goto wstart
if /i "%userinp%"=="2" goto wstop
if /i "%userinp%"=="3" goto wstat
if /i "%userinp%"=="c" goto cstart
if /i "%userinp%"=="t" goto test
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
pause
goto mainmenu

:wstop
cls
title stopping Virtual WIFI Network!
echo.
echo stopping Virtual WIFI Network!
echo.
netsh wlan stop hostednetwork
pause
goto mainmenu

:cstart
cls
title SSID and Password!
echo.
echo Enter SSID and Password!
echo.
set /p ussid=    ^   Set SSID:
set /p upwd=    ^   Set Password:
echo %ussid%>setid.cnf
echo %upwd%>setpw.cnf
echo Settings Saved!
pause
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

:test
cls
title Virtual WIFI Network Stats!
echo.
echo Virtual WIFI Network Stats!
echo. %ussid%
echo. %upwd%
pause
goto mainmenu