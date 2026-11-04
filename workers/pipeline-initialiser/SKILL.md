# Worker Specification: `pipeline-initialiser` (Contract Overview)

> **IP Notice:** Raw system prompt instructions and narrative generation constitutions are maintained in private production builds. This specification documents the worker's state contract and guardrail boundaries.

## 1. Input Contract
- **State Ledger:** `database/Current_Task.json` (must evaluate `status == "COMPLETED"` or `"IDLE"` before acquiring lock)
- **Queue Source:** `database/topic_queue.txt` (selects first `[PENDING]` entry)

## 2. Output Artifacts
- Transitions `database/Current_Task.json` to `status = "IN_PROGRESS"` and `stage = "INITIALISED"`.
- Generates the 7-file project workspace contract:
  1. `Voiceover.txt` (`Scene 1..N` narration script)
  2. `Production_Board.txt` (`Scene 1..N` visual generation specifications)
  3. `Keyframing_Grouping.txt` (`REVEAL_PULL`, `DRONE_DIAGONAL`, `DRONE_SINGLE`, `STATIC_BREATH`, `Z_CRASH_FOCUS`, `TILT_ASCEND` mappings)
  4. `Music_Score.txt` (Section-to-scene background score mappings)
  5. `Audio_Cues.txt` (`SILENCE_BEFORE`, `SILENCE_AFTER`, and `SFX` triggers)
  6. `SEO_Package.txt` (Title, metadata, and thumbnail specifications)
  7. `Trailer_Script.txt` (7-scene 9:16 vertical trailer specification)

## 3. Guardrail Checklist
- [x] **Single-Active-Project Mutex:** Abort immediately if `Current_Task.json` is already `IN_PROGRESS`.
- [x] **Scene Count Parity:** Total scene count `N` (50 to 75 scenes) must match across `Voiceover.txt`, `Production_Board.txt`, and `Keyframing_Grouping.txt`.
- [x] **Zero-Speculation Historical Grounding:** All dates, treaties, and figures must map to verified primary or secondary historical records.
