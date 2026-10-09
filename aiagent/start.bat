@echo off
cd /d "%~dp0"
echo Installing Python packages...
py -m pip install -r requirements.txt
if errorlevel 1 python -m pip install -r requirements.txt
echo.
echo Report agent is at http://127.0.0.1:8765
echo Open the chat at http://localhost/LMS/aiagent/
echo Set API_KEY and MODEL in config.py if you have not yet.
echo.
py server.py
if errorlevel 1 python server.py
pause
