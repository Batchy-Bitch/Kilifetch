@echo off
setlocal EnableDelayedExpansion
echo loading...
:: CPU
for /f "usebackq delims=" %%A in (`
  powershell -NoLogo -NoProfile -Command "Get-CimInstance Win32_Processor | Select-Object -ExpandProperty Name"
`) do set "CPU=%%A"

:: RAM (GB, rounded)
for /f "usebackq delims=" %%A in (`
  powershell -NoLogo -NoProfile -Command "(Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB -as [int]"
`) do set "RAMGB=%%A"

:: GPU
for /f "usebackq delims=" %%A in (`
  powershell -NoLogo -NoProfile -Command "Get-CimInstance Win32_VideoController | Select-Object -First 1 -ExpandProperty Name"
`) do set "GPU=%%A"

cls
echo Killifetch
echo ----------
echo CPU: %CPU%
echo RAM: %RAMGB% GB
echo GPU: %GPU%
echo ----------
echo Thank you for choosing
echo Killifetch, the Neofetch
echo that runs on potatoes
echo (~850 bytes)
pause
