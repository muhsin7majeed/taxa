# AGENTS.md

## Project Context

Taxa is a mobile-first, offline-capable "real-life Pokedex" for discovering animals, insects, and fish through live camera capture. The MVP must preserve the anti-cheat rule: discoveries come only from the in-app camera flow, never from gallery uploads.

The current product source of truth is `temp/PRD.md`. Treat this file as planning context, but keep durable engineering decisions in root-level docs and source code because `temp/` is gitignored.

## Operating Principles

- Build the actual mobile product, not a web portal, unless the user explicitly changes scope.
- Keep the code scalable, maintainable, readable, and reliable over cleverness.
- Prefer explicit domain models, typed boundaries, and small feature modules.
- Preserve offline-first behavior: local writes happen before sync writes.
- Keep expensive work off the Flutter UI isolate.
- Do not add gallery import paths for discoveries.
- Do not introduce backend image classification. Classification is on-device for MVP.
- Keep secrets out of the repo. Use environment files or platform secret stores.

## Proposed Repository Layout

Use a monorepo with clear boundaries:

```text
apps/
  mobile/                 # Flutter app
services/
  api/                    # Bun + Elysia sync API
packages/
  shared_contracts/       # Optional OpenAPI/schema artifacts or generated clients
ml/
  models/                 # Model metadata only; large binaries handled via release assets/LFS
  training/               # Training/export scripts and dataset notes
docs/
  architecture/           # ADRs, sync protocol, model notes
```

## Flutter Standards

- Use Flutter and Dart stable releases.
- Use Riverpod for dependency injection and app state.
- Use feature-first organization under `lib/src/features/<feature>/`.
- Keep UI widgets dumb where practical; put workflows in controllers/services.
- Use `camera` for live capture and image confirmation.
- Run image preprocessing and inference in a long-lived isolate or worker abstraction once repeated inference is needed.
- Keep model I/O behind an `ImageClassifier` interface so a fake classifier can drive tests and early UI work.
- Prefer `drift` over Isar for MVP persistence unless a later ADR proves otherwise. Taxa needs relational local data, migrations, queryable sync state, and production stability.
- Use code generation deliberately: generated files are allowed, but domain logic must remain readable.
- Add widget tests for important flows and unit tests for repositories, sync queues, classifiers, and confidence-threshold decisions.

## Design System Standards

- Treat `docs/design/theme-and-motion.md` as the source of truth for Taxa's field-guide visual direction and motion language.
- Use the shared theme architecture in `lib/src/core/theme/` for colors, spacing, radii, and motion. Feature widgets must read from `ColorScheme`, Taxa `ThemeExtension` tokens, and context helpers instead of hardcoding product colors or animation timings.
- Use and extend reusable primitives in `lib/src/core/widgets/` before creating feature-specific UI. Existing primitives include app screen scaffold, section header, status panel, info tile, metric tile, progress tile, capture action, and animated entrance.
- Add new reusable widgets or theme tokens when a UI pattern appears in more than one screen, crosses feature boundaries, or carries product semantics such as discovery, rarity, capture, sync, or checklist progress.
- Keep abstractions small and concrete. Do not create broad UI frameworks before repeated usage proves the shape, but avoid copy-pasting styled containers, tiles, cards, or animation code across features.
- Motion must be purposeful, fast, and performance-safe. Prefer transform-based localized animations, respect reduced-motion settings, and avoid expensive opacity, clipping, intrinsic layout, and broad rebuild patterns in animated paths.
- Add focused widget tests for new shared primitives, theme controllers, and theme tokens when they affect visible behavior or app-wide styling.

Suggested Flutter feature folders:

```text
lib/src/
  app/
  core/
    config/
    errors/
    logging/
    network/
    storage/
    theme/
  features/
    auth/
    camera_capture/
    identification/
    collection/
    checklist/
    sync/
```

## Backend Standards

- Use Bun, TypeScript, Elysia, Drizzle ORM, and PostgreSQL.
- Keep API handlers thin: validate input, call services, return typed responses.
- Use Drizzle migrations for all schema changes.
- Use password hashing with Argon2id or bcrypt through a maintained Bun-compatible package.
- Use short-lived access tokens plus refresh-token/session persistence for auth.
- Design sync endpoints around idempotent client events or versioned deltas.
- Never trust client timestamps alone for conflict resolution. Store server receipt timestamps and monotonic revision/version fields.
- Add tests for auth, sync idempotency, conflict behavior, and authorization boundaries.

Suggested backend folders:

```text
src/
  app.ts
  config/
  db/
    schema/
    migrations/
  modules/
    auth/
    discoveries/
    sync/
  shared/
    errors/
    validation/
```

## Docker Standards

- Use Docker for backend infrastructure, not for day-to-day Flutter mobile development.
- Keep Flutter, Android SDK access, emulator/device workflows, and native mobile debugging outside Docker.
- Use Docker Compose early for local PostgreSQL and optional database admin tools.
- Run the Bun API directly on the host during fast local development unless container parity is being tested.
- Add an API `Dockerfile` once the backend service exists and its runtime needs are clear.
- Add production Compose/systemd deployment files later, when VPS deployment work begins.
- Production PostgreSQL may run as a managed service or a VPS container, but either choice must include a backup and restore runbook.
- Do not bake secrets into images or Compose files. Use environment variables and uncommitted `.env` files.

## ML Standards

- Treat taxonomy class design as a product and data problem, not just a model choice.
- Start with a narrow MVP taxonomy, for example 50-150 common local species/categories, before attempting broad animal coverage.
- Keep a bundled `taxonomy_catalog` with scientific name, common name, rarity, habitat, diet, size, and collection membership.
- Store model label IDs and scientific names in a versioned label map.
- Use a confidence threshold, but calibrate it against validation data. The PRD's 65% threshold is a starting hypothesis, not a proven product rule.
- Track top-k predictions internally for debugging and future UX, even if the UI only shows the top match.
- Measure on real low/mid-range Android devices before promising latency, battery, or thermal behavior.

## Local Development

- The project lives in WSL2 and is edited from Zed on Windows.
- Zed is acceptable for editing, terminal work, and agent-guided coding.
- Android Studio is still recommended for Android SDK, emulator/device manager, Gradle tooling, logcat, and occasional native Android debugging.
- For best mobile iteration, run physical Android devices over USB or Wi-Fi debugging from Windows/WSL once Flutter tooling is configured.
- iOS builds require macOS/Xcode; WSL2 cannot build or run iOS targets directly.
- Local backend dependencies should be started with Docker Compose where practical.
- Avoid Dockerizing mobile development unless a very specific reproducibility problem justifies the extra complexity.

## Quality Gates

Before considering a task done, run the relevant checks:

- Flutter: `dart format`, `flutter analyze`, and targeted `flutter test`.
- Backend: `bun test`, TypeScript typecheck if configured, and migration checks.
- Database: generated migrations committed with schema changes.
- Docs: update `ROADMAP.md` or ADRs when a decision changes.

If a command cannot run in the current environment, document the reason in the final response.

## Agent Workflow

- Read existing files before editing.
- Before making product or source code changes, summarize the intended changes and wait for user confirmation. Documentation-only updates requested by the user may proceed directly.
- Keep changes scoped to the requested task.
- Prefer official docs and primary sources for current Flutter, Bun, Elysia, Drizzle, and ML tooling questions.
- Surface tradeoffs early when a PRD assumption is risky.
- Create ADRs for durable choices such as local database, sync protocol, model architecture, and auth strategy.
- Do not commit unless the user explicitly asks.
- When committing, use detailed commit messages that explain what changed, why it changed, and the verification that was run.
