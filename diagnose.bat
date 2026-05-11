@echo off
REM Diagnostic script to check what's causing xelatex to fail
echo Checking for required images...
echo.

setlocal enabledelayedexpansion

if not exist "img\arch-physical.png" echo MISSING: img\arch-physical.png
if not exist "img\usecase-global.jpg" echo MISSING: img\usecase-global.jpg
if not exist "img\logo-react.png" echo MISSING: img\logo-react.png
if not exist "img\logo-vite.png" echo MISSING: img\logo-vite.png
if not exist "img\logo-nestjs.png" echo MISSING: img\logo-nestjs.png
if not exist "img\logo-nodejs.png" echo MISSING: img\logo-nodejs.png
if not exist "img\logo-sqlserver.png" echo MISSING: img\logo-sqlserver.png
if not exist "img\logo-typescript.png" echo MISSING: img\logo-typescript.png
if not exist "img\logo-sqlite.png" echo MISSING: img\logo-sqlite.png
if not exist "img\logo-gemini.png" echo MISSING: img\logo-gemini.png

echo.
echo Now attempting xelatex compilation and capturing all errors...
echo Output will be saved to xelatex-full.log
echo.

xelatex -interaction=nonstopmode main.tex > xelatex-full.log 2>&1

echo.
echo Extracting errors and warnings from xelatex output...
echo.

findstr /c:"Error" xelatex-full.log
findstr /c:"error" xelatex-full.log
findstr /c:"undefined" xelatex-full.log
findstr /c:"Undefined" xelatex-full.log
findstr /c:"Missing" xelatex-full.log
findstr /c:"! " xelatex-full.log

echo.
echo Full log saved to: xelatex-full.log
echo You can view it with: type xelatex-full.log | more
pause
