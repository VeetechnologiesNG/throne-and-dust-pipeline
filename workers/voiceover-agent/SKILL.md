# Worker Specification: `voiceover-agent` (Contract Overview)

> **IP Notice:** Raw prompt instructions and voice-blending weights are maintained in private production builds. This specification documents the worker's state contract and guardrail boundaries.

## 1. Input Contract
- **State Precondition:** `database/Current_Task.json` (`status == "IN_PROGRESS"`, `Voiceover.txt` and `Trailer_Script.txt` present in `project_path`).

## 2. Output Artifacts
- `voiceover_audio/hook_continuous.mp3` (Mastered continuous narration for Scenes 1..15)
- `hook_timeline.json` (Word-aligned Whisper timestamp boundaries for Scenes 1..15)
- `voiceover_audio/scene_16_vo.mp3` .. `scene_N_vo.mp3` (Mastered per-scene narration files)
- `Trailer Assets/Audio/trailer_voiceover.mp3` (Mastered 7-scene trailer narration)
- `vo_progress.json` (Idempotent per-scene synthesis checkpoint log)

## 3. Guardrail Checklist
- [x] **Idempotent Resume:** Skip any scene `i` where `scene_{i}_vo.mp3` exists and `size > 1000` bytes.
- [x] **Anti-Loop Circuit Breaker:** Halt execution and emit an operator alert if any single scene fails synthesis twice consecutively.
- [x] **Broadcast Mastering Verification:** Verify FFmpeg `acompressor` and sample-rate normalization (`24000 Hz`) on all output streams.
