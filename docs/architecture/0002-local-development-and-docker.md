# ADR 0002: Local Development And Docker

## Status

Accepted

## Context

The project is developed in WSL2 and edited with Zed on Windows. The backend needs PostgreSQL locally. Flutter mobile development needs Android SDK access, device/emulator workflows, Gradle tooling, and native debugging.

## Decision

Use Docker Compose for backend infrastructure, starting with PostgreSQL. Keep Flutter mobile development outside Docker. Run the Bun API directly on the host during fast local development, and add an API container later when deployment parity matters.

## Consequences

- PostgreSQL setup is reproducible across machines.
- Flutter device and emulator workflows stay practical.
- The backend can be containerized later for production VPS deployment.
- Production database deployment still needs a backup and restore runbook before launch.
