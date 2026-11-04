@echo off
title Cinematic Hook Engine
cd /d "%~dp0"
echo =======================================================
echo        CINEMATIC HOOK ENGINE
echo =======================================================
echo.
echo Drag and drop your project folder below, then press ENTER:
echo.
set /p "F=>> "
echo.
echo Starting engine for: %F%
echo.
set IMAGEIO_FFMPEG_EXE=ffmpeg & uv run --offline --with moviepy==1.0.3 --with opencv-python --with numpy --with tqdm --with openai-whisper python hook_engine.py %F%
echo.
echo =======================================================
echo ENGINE FINISHED.
echo =======================================================
pause

