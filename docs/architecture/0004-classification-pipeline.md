# ADR 0004: Classification Pipeline

## Status

Proposed

## Context

The MVP discovery flow captures one photo, asks the user to confirm it, and then classifies that image on-device. The UI must remain smooth, and broad species coverage is too large for a first release.

## Decision

Build the mobile flow against an `ImageClassifier` interface. Start with a fake classifier for the vertical slice, then add a real `tflite_flutter` implementation once the UI, local schema, and taxonomy catalog are stable.

Use a narrow MVP taxonomy pack, store top-k predictions, and treat the 65% confidence threshold as configurable until calibrated against validation data.

## Consequences

- Product flow can be built before the real model is ready.
- Tests can use deterministic classifier results.
- Model implementation can move to isolates and delegates without changing the UI contract.
- Dataset and calibration work remain explicit launch risks.
