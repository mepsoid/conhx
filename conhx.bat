@echo off
if %1 == debug (
	bin\CExample-debug.exe
) else (
	bin\CExample.exe
)
pause