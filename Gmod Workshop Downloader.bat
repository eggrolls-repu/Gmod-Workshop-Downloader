@echo off
set scriptpath=%~dp0
title "Garry's Mod Workshop Downloader - Made by Eggroll (STEAM_0:0:38357989)"
:restart
echo Please enter item ID (ex. https://steamcommunity.com/sharedfiles/filedetails/?id=XXXXXXXXXX OR XXXXXXXXXX)
set /p id=Workshop item ID: 
for /f "tokens=2 delims==&" %%a in ("%id%") do set id=%%a
cls
echo.
steamcmd.exe +force_install_dir .\workshop_items +login anonymous +workshop_download_item 4000 %id% +exit
echo.
cd .\workshop_items\steamapps\workshop\content\4000\%id%
for %%a in (*) do set gma=%%a
cd "%scriptpath%"
gmad.exe extract -file .\workshop_items\steamapps\workshop\content\4000\%id%\%gma% -out .\Extracted_%id%
start .\Extracted_%id%
echo.
echo Download another workshop addon? y/n
set /p quest=
echo.
cls
if %quest% == y goto restart
if %quest% == Y goto restart
if %quest% == yy goto restart
if %quest% == YY goto restart
if %quest% == yes goto restart
if %quest% == YES goto restart
if %quest% == yeah goto restart
if %quest% == YEAH goto restart
if %quest% == yea goto restart
if %quest% == YEA goto restart
if %quest% == no echo fine :/&ping localhost -n 3 >nul&exit
else exit