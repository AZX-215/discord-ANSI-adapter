@echo off
REM setup.bat — initialize Python virtual environment and install dependencies

:: Change to script’s directory
cd /d %~dp0

:: 1) Create a virtual environment (in "venv" folder) if it doesn't exist
if not exist venv (
    python -m venv venv
    echo Created virtual environment at %cd%\venv
) else (
    echo Virtual environment already exists.
)

:: 2) Activate the virtual environment
call venv\Scripts\activate

:: 3) Upgrade pip to latest
pip install --upgrade pip

:: 4) Install dependencies from requirements.txt
if exist requirements.txt (
    pip install -r requirements.txt
) else (
    echo requirements.txt not found — skipping pip install.
)

echo.
echo Setup complete!
echo To start using your environment, run:
echo    call venv\Scripts\activate
echo Then use run.bat or your Python scripts as needed.
pause
