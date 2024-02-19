@echo off
SETLOCAL

REM Define the paths for Roaming and Local nvim-data directories
SET NVIM_ROAMING=%APPDATA%\nvim-data
SET NVIM_LOCAL=%LOCALAPPDATA%\nvim-data

REM Check and remove the Roaming nvim-data directory
IF EXIST "%NVIM_ROAMING%" (
    ECHO Deleting Roaming nvim-data directory...
    RMDIR /S /Q "%NVIM_ROAMING%"
) ELSE (
    ECHO Roaming nvim-data directory not found.
)

REM Check and remove the Local nvim-data directory
IF EXIST "%NVIM_LOCAL%" (
    ECHO Deleting Local nvim-data directory...
    RMDIR /S /Q "%NVIM_LOCAL%"
) ELSE (
    ECHO Local nvim-data directory not found.
)

ECHO Done.
ENDLOCAL

pause