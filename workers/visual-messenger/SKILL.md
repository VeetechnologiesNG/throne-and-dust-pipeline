# Worker Specification: `visual-messenger` (Contract Overview)

> **IP Notice:** Raw prompt instructions and visual styling directives are maintained in private production builds. This specification documents the worker's state contract and guardrail boundaries.

## 1. Input Contract
- **State Precondition:** `database/Current_Task.json` (`status == "IN_PROGRESS"`), `Production_Board.txt`, and `Production Assets/Images/`.

## 2. Output Artifacts
- Verified 1:1 scene-to-image mapping across `Scene 1..N` in `Production Assets/Images/`.
- Batch prompt manifests formatted in 15-scene windows for any missing or rejected scene indices.

## 3. Guardrail Checklist
- [x] **Completeness Audit:** Confirm every scene index `1..N` has a valid non-zero image asset before permitting transition to the rendering stage.
- [x] **Prompt Uniqueness Validation:** Reject duplicate scene descriptions or malformed scene headers prior to batch dispatch.
- [x] **Resolution & Aspect Check:** Ensure harvested assets meet the 16:9 2K upscale threshold before invoking `finisher_engine.py`.
