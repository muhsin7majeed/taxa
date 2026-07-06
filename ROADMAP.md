# ROADMAP.md

## Current Status

Phase 1 repository foundation, Phase 2B mobile shell work, Phase 2C theme/motion/design foundation, Phase 2D local-first data foundation, and Milestone 3 camera capture vertical slice are complete. The Flutter app now has a Riverpod bootstrap, scalable theme preset state, Taxa-specific theme extensions, a field-guide visual direction, reusable UI primitives, transform-based shell motion, Drift/SQLite local persistence, a seeded fake taxonomy catalog, upgraded placeholder screens backed by local data, a live in-app camera screen, captured-image preview, camera-only guardrails, local capture-attempt persistence, the first fake-classifier identification slice, typed model asset configuration, a bundled label-map asset, a TFLite classifier scaffold, local classifier diagnostics, image preprocessing for model input tensors, isolate-backed preprocessing/inference boundaries, and output-decoding helpers for future model scores.

The next implementation focus is extending Milestone 4 from TFLite scaffolding toward real on-device inference: a bundled MVP model asset, model/catalog compatibility checks, and physical Android validation. Backend, auth, cloud backup, and cross-device sync remain deferred until the offline loop is valuable.

## Research Notes And Recommendations

- **Zed vs Android Studio:** Zed can be used to edit the project and run terminal commands from WSL2. Android Studio is still recommended for Android SDK installation, emulator/device management, Gradle tooling, and native debugging. iOS requires macOS/Xcode.
- **Local database:** Prefer `drift`/SQLite for MVP over Isar. Drift is current, relational, migration-friendly, reactive, and matches the backend's relational model. For now, the local database is the app source of truth, not just a cache.
- **On-device ML:** `tflite_flutter` is appropriate, but delegate support is not magic "NPU everywhere." It supports NNAPI/GPU on Android and Metal/Core ML delegates on iOS, with device/model-specific behavior. Build a benchmark screen early.
- **Model choice:** Use a classifier for the MVP flow, not object detection, because the UX confirms a single photo and returns one likely species. Consider YOLO classify or MobileNet/EfficientNet-style backbones after dataset constraints are known. Do not lock to YOLO11 without benchmarking current export/runtime behavior.
- **Taxonomy scope:** Broad "all animals/insects/fish" is too large for MVP. Start with a curated local pack such as "Backyard Birds and Bugs" with known labels, local metadata, and validation images.
- **Confidence threshold:** 65% should be configurable and validated. Store top-k predictions, raw confidence, model version, and threshold used for each attempt.
- **Anti-cheat:** In-app camera only prevents casual gallery upload, but it does not prove the photo is live. For MVP, enforce no gallery path and capture metadata; later add heuristics such as capture timestamps, session nonce, and optional server-side anomaly checks.
- **Backend:** Bun + Elysia + Drizzle + PostgreSQL remains the intended future sync stack, but backend/auth/sync work is deferred until the offline mobile discovery loop is useful. Do not block mobile MVP work on API, PostgreSQL, account, or network availability.
- **Docker:** Use Docker Compose for backend dependencies immediately, especially PostgreSQL. Keep Flutter mobile development outside Docker because Android SDK, emulators, physical devices, and native debugging work better on the host. Add an API container after the backend exists, and add production Compose/VPS deployment files later.
- **Theme direction:** Use a calm field-guide identity rather than a generic green app. The default theme should combine botanical greens, warm specimen-card neutrals, water/sky accents, and sparing discovery highlights. Keep theme colors expressed through Material 3 `ColorScheme` roles plus Taxa-specific `ThemeExtension` tokens so alternate themes can be added later.
- **Motion direction:** Animation should explain state changes, not decorate screens. Navigation can be quiet; capture, classification, progress, and card unlock moments should have more intentional motion. Keep animations performance-safe, respect reduced-motion settings, and profile frame timing on emulator and physical devices.

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
- [x] Add local database bootstrap with drift migrations.
- [x] Add base error/loading state widgets for async workflows.
- [x] Add feature folders for auth, camera capture, collection, checklist, and identification.
- [ ] Add feature folder for sync.
- [x] Add fake data seed for taxonomy catalog and collection progress.
- [x] Build bottom navigation or equivalent primary app structure: Capture, Collection, Checklists, Account.

## Milestone 2C: Theme, Motion, And Design Foundation

- [x] Create a short design brief for Taxa's eco-dex/field-guide visual direction.
- [x] Define scalable theme architecture with named theme presets, light/dark variants, Riverpod theme selection state, and a persistence boundary for future settings storage.
- [x] Add Taxa theme tokens with `ThemeExtension` for app-specific colors, spacing, radii, elevation, illustration/accent colors, and motion timings/curves.
- [x] Build the default "Field Guide" theme with accessible Material 3 color roles, readable typography, and restrained surfaces that work on mobile.
- [x] Keep the theme architecture ready for future user-selectable themes without hardcoding colors in feature widgets.
- [x] Create reusable UI primitives: app screen scaffold, section header, status panel, metric tile, progress tile, info tile, and primary capture action.
- [x] Define a motion language for navigation, capture readiness, classification processing, collection progress, and discovery card unlocks.
- [x] Add reduced-motion handling and avoid animation patterns that rely on expensive opacity, clipping, intrinsic layout passes, or broad rebuilds.
- [x] Upgrade placeholder Capture, Collection, Checklists, and Account screens to use the design system.
- [x] Add widget tests for theme selection defaults, shell rendering, and key reusable components.
- [x] Run `dart format`, `flutter analyze`, targeted `flutter test`, and a debug APK build after implementation.

## Milestone 2D: Local-First Data Foundation

- [x] Add Drift dependencies and generated database bootstrap.
- [x] Define sync-ready local IDs, timestamps, and version fields without requiring server IDs.
- [x] Create local tables for taxonomy entries, checklist groups, discovery records, identification attempts, and capture attempts.
- [x] Add repository/provider boundaries so features read/write through typed interfaces.
- [x] Seed a narrow fake taxonomy catalog and checklist pack for early UI and flow work.
- [x] Add focused unit tests for database migrations, seed loading, repository reads/writes, and checklist progress calculations.
- [x] Keep backend, auth, cloud backup, and cross-device sync out of this phase.

## Milestone 3: Camera Capture Vertical Slice

- [x] Integrate Flutter `camera` plugin.
- [x] Request and handle camera permissions.
- [x] Build live camera screen with capture control.
- [x] Build captured-image preview screen with Retake and Confirm.
- [x] Ensure no gallery picker dependency or upload path exists.
- [x] Persist capture attempt metadata locally.
- [x] Add focused repository test for local capture attempt persistence.
- [x] Add tests for camera flow state transitions where plugin boundaries can be faked.

## Milestone 4: Identification Pipeline

- [x] Define `ImageClassifier` interface and fake classifier implementation.
- [x] Build processing/loading screen with cancellable workflow.
- [x] Implement confidence-threshold routing: discovery success vs unidentified.
- [x] Store identification attempt, model version, top-k predictions, and result state.
- [x] Add typed model asset configuration for the future real classifier.
- [x] Add `tflite_flutter`, label-map asset parsing, and a non-default TFLite classifier scaffold.
- [x] Add image decoding, square crop/resize, and RGB normalization for model input tensors.
- [x] Add output-decoding helpers for model score vectors and top-k predictions.
- [ ] Add real `tflite_flutter` classifier behind the interface.
- [x] Move preprocessing/inference off the UI isolate.
- [x] Add a local benchmark/debug screen for latency and delegate behavior.
- [ ] Validate on at least one physical Android device.

## Milestone 5: Collection And Checklist

- [ ] Define local schema for taxonomy entries, discoveries, checklist groups, and progress.
- [ ] Build discovery card unlock screen.
- [ ] Build collection grid/list with locked and unlocked states.
- [ ] Build discovery detail page with taxonomy, rarity, diet, habitat, and size.
- [ ] Build checklist progress screens with counts such as `12 out of 45 Found`.
- [ ] Ensure all collection and checklist screens load offline from local DB.
- [ ] Add unit tests for progress calculations and unlock idempotency.

## Milestone 6: Authentication (Deferred Until Local MVP)

Defer this milestone until the local camera-to-discovery loop, local collection, and checklist progress work offline.

- [ ] Design username/password auth contract.
- [ ] Implement backend users, password hashing, sessions/tokens, and migrations.
- [ ] Implement Flutter sign-up, sign-in, sign-out, and secure token storage.
- [ ] Add auth guards for sync endpoints.
- [ ] Add backend tests for invalid credentials, duplicate usernames, token expiry, and authorization.

## Milestone 7: Cloud Sync (Deferred Until Local MVP)

Defer this milestone until local persistence is stable and users have meaningful discovery data to back up or sync between devices.

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
- [x] Build scalable theme, motion, and design foundation.
- [x] Choose and integrate drift schema.
- [x] Implement local taxonomy catalog seed.
- [x] Build fake-classifier camera-to-discovery vertical slice.
- [x] Persist discoveries and checklist progress locally.
- [ ] Integrate first real TFLite model.
- [ ] Benchmark on physical Android hardware.
- [ ] Revisit username/password auth after the local MVP loop works.
- [ ] Revisit cloud backup and cross-device sync after the local MVP loop works.

## Open Questions

- What country/region should the first taxonomy pack target?
- Should MVP identify exact species only, or allow grouped labels such as "sparrow species" when exact classification is unreliable?
- Is the first beta Android-only, or should iOS be supported from the first milestone?
- Will model binaries live in git LFS, release assets, or a private artifact store?
- What level of anti-cheat is acceptable for MVP beyond blocking gallery uploads?
