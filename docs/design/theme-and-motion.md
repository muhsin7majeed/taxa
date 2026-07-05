# Taxa Theme And Motion Brief

## Direction

Taxa should feel like a modern field guide built around live discovery. The visual identity should be calm, precise, and outdoors-aware without becoming a generic green app.

The default theme is **Field Guide**:

- botanical greens for primary actions and navigation
- warm paper/specimen-card surfaces for collection and taxonomy content
- water/sky blue accents for habitat and checklist context
- amber/gold accents reserved for discovery, rarity, unlock, and success moments
- charcoal/ink text for readability

## Theme Architecture

Use Material 3 `ColorScheme` roles for standard app and component colors. Use Taxa-specific `ThemeExtension` tokens for product semantics that Material does not know about, including specimen surfaces, discovery accents, rarity colors, spacing, radii, and motion timing.

Feature widgets should read colors, spacing, radii, and motion from theme tokens. They should not hardcode product colors directly.

Theme selection should be represented as app state so user-selectable themes can be added without changing feature widgets. The first implementation can keep persistence in a boundary abstraction and wire durable storage later.

## Motion Principles

Animation should explain what changed:

- Capture motion should feel calm and camera-ready.
- Classification motion should communicate active processing.
- Discovery motion should make a confirmed unlock feel earned.
- Collection and checklist motion should clarify progress changes.
- Navigation motion should be quiet and fast.

Motion must remain performance-safe. Prefer transforms and small localized animations. Avoid broad rebuilds, expensive opacity/clipping patterns, and intrinsic layout work in animated paths. Respect reduced-motion settings.
