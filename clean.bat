@echo off
REM Clean up LaTeX auxiliary files
echo Cleaning LaTeX auxiliary files...

del /q main.aux main.log main.toc main.out main.mtc* main.maf main.blg main.bbl main.bcf 2>nul

echo Cleanup complete. Ready for fresh compilation.
pause
