# Taxa

Taxa is a mobile-first, offline-capable "real-life Pokedex" for discovering animals, insects, and fish through live camera capture.

## Current Phase

Phase 1 is repository foundation:

- monorepo structure
- backend service skeleton
- local PostgreSQL with Docker Compose
- architecture decision records
- setup notes

The Flutter app scaffold lives in `apps/mobile`.

## Repository Layout

```text
apps/
  mobile/                 # Flutter app, scaffold pending
services/
  api/                    # Bun + Elysia sync API
packages/
  shared_contracts/       # Shared schemas/generated clients later
ml/
  models/                 # Model metadata and artifact notes
  training/               # Training/export scripts later
docs/
  architecture/           # ADRs and architecture notes
```

## Prerequisites

- WSL2 on Windows
- Zed for editing
- Android Studio on Windows for Android SDK, emulator/device tooling, Gradle tools, and logcat
- Flutter SDK installed in WSL and available as `flutter`
- Bun installed in WSL
- Docker Desktop with WSL integration enabled

Check installed tools:

```sh
flutter --version
bun --version
docker --version
docker compose version
```

## Local Backend Database

Start PostgreSQL:

```sh
docker compose up -d postgres
```

Stop PostgreSQL:

```sh
docker compose down
```

Remove local database data:

```sh
docker compose down -v
```

## Backend API

The API lives in `services/api`.

```sh
cd services/api
bun install
bun run dev
```

The default local health endpoint is:

```text
http://localhost:3000/health
```

If port 3000 is already in use:

```sh
PORT=3100 bun run dev
```

## Mobile App

Run Flutter checks:

```sh
cd apps/mobile
flutter analyze
flutter test
```

Run the app:

```sh
cd apps/mobile
flutter run
```

The mobile app should follow the architecture in `AGENTS.md`.

## Development Rules

- Flutter mobile development stays host-native, outside Docker.
- Docker is used for backend dependencies such as PostgreSQL.
- The Bun API can run directly on the host during local development.
- Classification remains on-device for MVP.
- Gallery uploads are not part of the discovery flow.
