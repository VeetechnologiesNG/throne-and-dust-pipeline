# Worker Specification: `pipeline-closer` (Contract Overview)

> **IP Notice:** Raw prompt instructions and thumbnail steganography parameters are maintained in private production builds. This specification documents the worker's state contract and guardrail boundaries.

## 1. Input Contract
- **State Precondition:** `database/Current_Task.json` (`status == "IN_PROGRESS"`), all `N` scene assets, audio tracks, and project files present in `project_path`.

## 2. Output Artifacts
- Full pre-render QA verification report across all `N` scenes.
- 3 Thumbnail variants in `Production Assets/Thumbnails/`.
- 7 Cropped 9:16 vertical trailer visual assets in `Trailer Assets/Visuals/`.
- Atomic transition of `database/Current_Task.json` to `status = "COMPLETED"` and `[COMPLETED]` tag update in `database/topic_queue.txt`.

## 3. Guardrail Checklist
- [x] **Exclusive State Closure Authority:** Only `pipeline-closer` is permitted to transition `Current_Task.json` to `"COMPLETED"`.
- [x] **Zero Missing Scene Tolerance:** If any scene `1..N` is missing either its visual asset or `scene_{i}_vo.mp3` audio asset, abort closure and emit a failure alert.
