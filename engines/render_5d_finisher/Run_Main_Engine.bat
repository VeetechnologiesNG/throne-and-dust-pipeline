@echo off
title Main Documentary Finisher Engine
cd /d "%~dp0"
echo =======================================================
echo        MAIN DOCUMENTARY FINISHER ENGINE
echo =======================================================
echo.
echo Drag and drop your project folder below, then press ENTER:
echo.
set /p "F=>> "
echo.
echo Starting engine for: %F%
echo.
set IMAGEIO_FFMPEG_EXE=ffmpeg & uv run --offline --with moviepy==1.0.3 --with opencv-python --with numpy --with tqdm --with openai-whisper python finisher_engine.py %F%
echo.
echo =======================================================
echo ENGINE FINISHED.
echo =======================================================
pause

