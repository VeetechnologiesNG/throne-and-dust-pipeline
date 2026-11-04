@echo off
title Hook & Documentary Joiner Engine
cd /d "%~dp0"
echo =======================================================
echo        HOOK ^& DOCUMENTARY JOINER ENGINE
echo =======================================================
echo.
echo Drag and drop your project folder below, then press ENTER:
echo.
set /p "F=>> "
echo.
echo Starting engine for: %F%
echo.
set IMAGEIO_FFMPEG_EXE=ffmpeg & uv run --offline --with imageio-ffmpeg --with opencv-python --with numpy python joiner_engine.py %F%
echo.
echo =======================================================
echo ENGINE FINISHED.
echo =======================================================
pause
