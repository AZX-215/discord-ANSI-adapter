@echo off
REM run.bat — converts ANSI-colored input into Discord-safe escape codes and sends to your Discord channel.

:: Ensure we're in the script directory
cd /d "%~dp0"

:: Activate virtual environment if it exists
if exist venv\Scripts\activate.bat (
    echo Activating virtual environment...
    call venv\Scripts\activate.bat
) else (
    echo No virtual environment found. To set one up, run setup.bat.
)

echo.

:: Determine which command to run
if "%~1"=="" (
    echo No command provided; defaulting to: git diff --color=always
    echo.
    git diff --color=always ^
        | python discord-ansi-adapter.py ^
        | python discord-message.py
) else (
    echo Running: %*
    echo.
    "%~1" %:* | python discord-ansi-adapter.py | python discord-message.py
)

echo.
echo Pipeline exited with code %ERRORLEVEL%.
pause
