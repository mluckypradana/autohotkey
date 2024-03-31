@echo off
echo "Starting AutoHotkey scripts..."
set "ahkDir=C:\Program Files\AutoHotkey\v2"
for %%i in ("%~dp0startup\*.ahk") do (
    echo %%~fi
    @REM start "" "%ahkDir%\AutoHotkey64.exe" "%%~fi"
    start "" "AutoHotkey64" "%%~fi"
)
