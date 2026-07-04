# ADR 0001: Monorepo Layout

## Status

Accepted

## Context

Taxa has a Flutter mobile app, a Bun sync API, shared API contracts, and ML assets/training notes. These parts need to evolve together without hiding ownership boundaries.

## Decision

Use a monorepo with top-level product boundaries:

- `apps/mobile` for the Flutter app.
- `services/api` for the Bun + Elysia backend.
- `packages/shared_contracts` for generated or shared API contracts later.
- `ml` for model metadata, artifact notes, and training/export scripts.
- `docs/architecture` for ADRs and architecture notes.

## Consequences

- Local development has one repository and one source of truth for docs.
- Mobile, backend, and ML work can share versioned contracts.
- CI can run targeted checks by folder.
- We need discipline to keep feature code inside the right boundary.
