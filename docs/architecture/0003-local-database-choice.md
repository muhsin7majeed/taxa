# ADR 0003: Local Database Choice

## Status

Proposed

## Context

Taxa is offline-first. The mobile app must store taxonomy catalog entries, discoveries, checklist progress, identification attempts, and sync outbox state. The backend uses PostgreSQL, so relational modeling and migrations matter.

## Decision

Prefer Drift on SQLite for the MVP unless implementation work reveals a strong reason to change.

## Consequences

- Local schema can mirror backend concepts where useful.
- Migrations and queryable sync state are first-class.
- Reactive reads support collection and checklist UI.
- We accept more schema discipline compared with schemaless/object-store approaches.
