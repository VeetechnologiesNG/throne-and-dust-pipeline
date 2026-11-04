@echo off
title Full Render Suite Orchestrator
cd /d "%~dp0"
echo =======================================================
echo        FULL RENDER SUITE ORCHESTRATOR
echo =======================================================
echo.
echo Drag and drop your project folder below, then press ENTER:
echo.
set /p "F=>> "
echo.

set IMAGEIO_FFMPEG_EXE=ffmpeg

echo =======================================================
echo [1/3] Starting HOOK ENGINE for: %F%
echo =======================================================
uv run --offline --with moviepy==1.0.3 --with opencv-python --with numpy --with tqdm --with openai-whisper python hook_engine.py %F%
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Hook Engine failed! Stopping orchestrator.
    pause
    exit /b %errorlevel%
)

echo.
echo =======================================================
echo [2/3] Starting MAIN DOCUMENTARY ENGINE for: %F%
echo =======================================================
uv run --offline --with moviepy==1.0.3 --with opencv-python --with numpy --with tqdm --with openai-whisper python finisher_engine.py %F%
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Main Engine failed! Stopping orchestrator.
    pause
    exit /b %errorlevel%
)

echo.
echo =======================================================
echo [3/3] Starting JOINER ENGINE for: %F%
echo =======================================================
uv run --offline --with imageio-ffmpeg --with opencv-python --with numpy python joiner_engine.py %F%
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Joiner Engine failed! Stopping orchestrator.
    pause
    exit /b %errorlevel%
)

echo.
echo =======================================================
echo FULL RENDER SUITE FINISHED SUCCESSFULLY!
echo =======================================================
pause
