# ROADMAP.md

## Current Status

Phase 1 repository foundation is scaffolded and Phase 2B mobile shell work is complete. The Flutter app now has a Riverpod bootstrap, Material 3 theme, feature-first `lib/src` structure, bottom navigation, and placeholder screens for Capture, Collection, Checklists, and Account.

The next implementation focus is the camera capture vertical slice: integrate the camera plugin, request permissions, build live capture and confirmation screens, and preserve the no-gallery-upload rule.

## Research Notes And Recommendations

- **Zed vs Android Studio:** Zed can be used to edit the project and run terminal commands from WSL2. Android Studio is still recommended for Android SDK installation, emulator/device management, Gradle tooling, and native debugging. iOS requires macOS/Xcode.
- **Local database:** Prefer `drift`/SQLite for MVP over Isar. Drift is current, relational, migration-friendly, reactive, and matches the backend's relational model. Isar is fast, but its latest stable package is old enough that it adds maintenance risk for a new long-lived product.
- **On-device ML:** `tflite_flutter` is appropriate, but delegate support is not magic "NPU everywhere." It supports NNAPI/GPU on Android and Metal/Core ML delegates on iOS, with device/model-specific behavior. Build a benchmark screen early.
- **Model choice:** Use a classifier for the MVP flow, not object detection, because the UX confirms a single photo and returns one likely species. Consider YOLO classify or MobileNet/EfficientNet-style backbones after dataset constraints are known. Do not lock to YOLO11 without benchmarking current export/runtime behavior.
- **Taxonomy scope:** Broad "all animals/insects/fish" is too large for MVP. Start with a curated local pack such as "Backyard Birds and Bugs" with known labels, local metadata, and validation images.
- **Confidence threshold:** 65% should be configurable and validated. Store top-k predictions, raw confidence, model version, and threshold used for each attempt.
- **Anti-cheat:** In-app camera only prevents casual gallery upload, but it does not prove the photo is live. For MVP, enforce no gallery path and capture metadata; later add heuristics such as capture timestamps, session nonce, and optional server-side anomaly checks.
- **Backend:** Bun + Elysia + Drizzle + PostgreSQL is a sound lightweight sync stack. Keep sync idempotent and test conflict cases before adding app polish.
- **Docker:** Use Docker Compose for backend dependencies immediately, especially PostgreSQL. Keep Flutter mobile development outside Docker because Android SDK, emulators, physical devices, and native debugging work better on the host. Add an API container after the backend exists, and add production Compose/VPS deployment files later.

## Milestone 0: Product And Architecture Decisions

- [x] Create ADR for monorepo layout and tooling.
- [x] Create ADR choosing `drift`/SQLite vs Isar.
- [ ] Create ADR for sync model: client event log, versioned deltas, or last-write-wins records.
- [ ] Create ADR for model format, label map, and taxonomy catalog versioning.
- [ ] Define MVP taxonomy pack size and target geography.
- [ ] Define success metrics: capture-to-result latency, app cold start, offline load time, sync reliability, and classification acceptance rate.

## Milestone 1: Repository Foundation

- [x] Scaffold monorepo directories: `apps/mobile`, `services/api`, `packages`, `ml`, and `docs`.
- [x] Scaffold Flutter app in `apps/mobile`.
- [x] Configure Flutter linting, formatting, and test conventions.
- [x] Scaffold Bun/Elysia API in `services/api`.
- [x] Configure backend typecheck, tests, and env loading.
- [ ] Add backend linting and formatting conventions.
- [x] Add Docker Compose for local PostgreSQL.
- [ ] Optionally add Adminer or pgAdmin for local database inspection.
- [x] Document that Flutter mobile development runs outside Docker.
- [x] Add root README with setup commands for WSL2, Android SDK, Flutter, Bun, and PostgreSQL.
- [ ] Add CI workflow for Flutter analyze/tests and backend tests.

## Milestone 2: Mobile App Shell

- [x] Implement app theme, typography, navigation, and base placeholder states.
- [x] Add Riverpod app bootstrap and dependency providers.
- [ ] Add local database bootstrap with drift migrations.
- [ ] Add base error/loading state widgets for async workflows.
- [x] Add feature folders for auth, camera capture, collection, and checklist.
- [ ] Add feature folders for identification and sync.
- [ ] Add fake data seed for taxonomy catalog and collection progress.
- [x] Build bottom navigation or equivalent primary app structure: Capture, Collection, Checklists, Account.

## Milestone 3: Camera Capture Vertical Slice

- [ ] Integrate Flutter `camera` plugin.
- [ ] Request and handle camera permissions.
- [ ] Build live camera screen with capture control.
- [ ] Build captured-image preview screen with Retake and Confirm.
- [ ] Ensure no gallery picker dependency or upload path exists.
- [ ] Persist capture attempt metadata locally.
- [ ] Add tests for camera flow state transitions where plugin boundaries can be faked.

## Milestone 4: Identification Pipeline

- [ ] Define `ImageClassifier` interface and fake classifier implementation.
- [ ] Build processing/loading screen with cancellable workflow.
- [ ] Implement confidence-threshold routing: discovery success vs unidentified.
- [ ] Store identification attempt, model version, top-k predictions, and result state.
- [ ] Add real `tflite_flutter` classifier behind the interface.
- [ ] Move preprocessing/inference off the UI isolate.
- [ ] Add a local benchmark/debug screen for latency and delegate behavior.
- [ ] Validate on at least one physical Android device.

## Milestone 5: Collection And Checklist

- [ ] Define local schema for taxonomy entries, discoveries, checklist groups, and progress.
- [ ] Build discovery card unlock screen.
- [ ] Build collection grid/list with locked and unlocked states.
- [ ] Build discovery detail page with taxonomy, rarity, diet, habitat, and size.
- [ ] Build checklist progress screens with counts such as `12 out of 45 Found`.
- [ ] Ensure all collection and checklist screens load offline from local DB.
- [ ] Add unit tests for progress calculations and unlock idempotency.

## Milestone 6: Authentication

- [ ] Design username/password auth contract.
- [ ] Implement backend users, password hashing, sessions/tokens, and migrations.
- [ ] Implement Flutter sign-up, sign-in, sign-out, and secure token storage.
- [ ] Add auth guards for sync endpoints.
- [ ] Add backend tests for invalid credentials, duplicate usernames, token expiry, and authorization.

## Milestone 7: Offline-First Sync

- [ ] Define local outbox table for pending sync events.
- [ ] Implement backend sync endpoint with idempotency keys.
- [ ] Implement client sync worker triggered by connectivity and app lifecycle.
- [ ] Handle retry, backoff, and partial failures.
- [ ] Implement server-to-client restore for a fresh device login.
- [ ] Add conflict tests and multi-device sync tests.
- [ ] Add user-visible sync status only where useful; keep normal sync silent.

## Milestone 8: ML Dataset And Model Hardening

- [ ] Choose initial taxonomy pack and gather lawful training/validation image sources.
- [ ] Build label map using scientific names as stable keys.
- [ ] Train or fine-tune candidate classifiers.
- [ ] Export candidate models to LiteRT/TFLite with quantization.
- [ ] Compare accuracy, model size, latency, memory, and battery impact.
- [ ] Calibrate confidence threshold with validation data.
- [ ] Document model card: dataset, limitations, supported species, false-positive risks.
- [ ] Add app-side model/catalog version compatibility checks.

## Milestone 9: Reliability, Accessibility, And Polish

- [ ] Add structured logging and crash-safe error reporting strategy.
- [ ] Add accessibility labels and scalable text checks for core screens.
- [ ] Profile frame timing during capture, processing, and card reveal.
- [ ] Add release build smoke tests.
- [ ] Add privacy copy for on-device classification and sync data.
- [ ] Validate offline behavior by disabling network during capture, collection browsing, and sign-in edge cases.

## Milestone 10: MVP Release Preparation

- [ ] Configure Android app ID, signing, app icons, splash screen, and release flavors.
- [ ] Add production backend deployment plan for a low-cost VPS.
- [ ] Add API `Dockerfile` once the backend runtime is stable.
- [ ] Add production Compose or systemd deployment files for the Bun API.
- [ ] Add database backup and migration runbook.
- [ ] Decide whether production PostgreSQL is managed or containerized on the VPS.
- [ ] Add App Store / Play Store privacy and permissions notes.
- [ ] Run closed beta on multiple Android devices.
- [ ] Triage beta feedback into launch-blocking vs post-MVP issues.

## Initial Task Backlog

- [x] Scaffold Flutter app under `apps/mobile`.
- [x] Scaffold Bun API under `services/api`.
- [x] Add Docker Compose PostgreSQL for local backend development.
- [x] Keep Flutter development host-native; do not containerize the mobile app.
- [x] Replace default Flutter counter app with Taxa mobile shell.
- [ ] Implement local taxonomy catalog seed.
- [ ] Build fake-classifier camera-to-discovery vertical slice.
- [ ] Choose and integrate drift schema.
- [ ] Implement username/password auth.
- [ ] Implement local outbox and basic sync.
- [ ] Integrate first real TFLite model.
- [ ] Benchmark on physical Android hardware.

## Open Questions

- What country/region should the first taxonomy pack target?
- Should MVP identify exact species only, or allow grouped labels such as "sparrow species" when exact classification is unreliable?
- Is the first beta Android-only, or should iOS be supported from the first milestone?
- Will model binaries live in git LFS, release assets, or a private artifact store?
- What level of anti-cheat is acceptable for MVP beyond blocking gallery uploads?
