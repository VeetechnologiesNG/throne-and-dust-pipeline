@echo off
title Kokoro Offline Voice Engine
cd /d "%~dp0"
echo =======================================================
echo        KOKORO OFFLINE VOICE ENGINE
echo =======================================================
echo.
echo Drag and drop your project folder below, then press ENTER:
echo.
set /p "F=>> "
echo.
echo Starting engine for: %F%
echo.
uv run --offline --with openai-whisper --with imageio-ffmpeg --with kokoro --with soundfile --with phonemizer --with torch --with torchvision --with torchaudio --with Kokoro_Offline_Core\en_core_web_sm-3.8.0-py3-none-any.whl python voice_engine.py %F%
echo.
echo =======================================================
echo ENGINE FINISHED.
echo =======================================================
pause
