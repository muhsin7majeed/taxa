import 'package:flutter/material.dart';

import 'taxa_theme_tokens.dart';

enum TaxaThemePresetId { fieldGuide, tidepool, nocturne }

@immutable
class TaxaThemePreset {
  const TaxaThemePreset({
    required this.id,
    required this.label,
    required this.description,
    required this.seedColor,
  });

  final TaxaThemePresetId id;
  final String label;
  final String description;
  final Color seedColor;

  ColorScheme colorScheme(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );

    return switch ((id, brightness)) {
      (TaxaThemePresetId.fieldGuide, Brightness.light) => scheme.copyWith(
        primary: const Color(0xFF1F6F5B),
        onPrimary: const Color(0xFFFFFFFF),
        primaryContainer: const Color(0xFFD7F2E6),
        onPrimaryContainer: const Color(0xFF07392F),
        secondary: const Color(0xFF326A87),
        onSecondary: const Color(0xFFFFFFFF),
        secondaryContainer: const Color(0xFFD2EAF6),
        onSecondaryContainer: const Color(0xFF0E3345),
        tertiary: const Color(0xFF9A6A1F),
        onTertiary: const Color(0xFFFFFFFF),
        tertiaryContainer: const Color(0xFFF6E2B7),
        onTertiaryContainer: const Color(0xFF332104),
        surface: const Color(0xFFFBF7EE),
        surfaceContainerLowest: const Color(0xFFFFFFFF),
        surfaceContainerLow: const Color(0xFFF7F0E4),
        surfaceContainer: const Color(0xFFF1E8DA),
        surfaceContainerHigh: const Color(0xFFEADFCC),
        surfaceContainerHighest: const Color(0xFFE3D5BF),
        onSurface: const Color(0xFF1E211D),
        onSurfaceVariant: const Color(0xFF565F55),
        outline: const Color(0xFF748177),
        outlineVariant: const Color(0xFFC6D0C3),
      ),
      (TaxaThemePresetId.fieldGuide, Brightness.dark) => scheme.copyWith(
        primary: const Color(0xFF8DD7C2),
        onPrimary: const Color(0xFF00382D),
        primaryContainer: const Color(0xFF185A4B),
        onPrimaryContainer: const Color(0xFFD7F2E6),
        secondary: const Color(0xFFA7CBE1),
        onSecondary: const Color(0xFF0B3448),
        secondaryContainer: const Color(0xFF254E65),
        onSecondaryContainer: const Color(0xFFD2EAF6),
        tertiary: const Color(0xFFE5C06F),
        onTertiary: const Color(0xFF3D2B02),
        tertiaryContainer: const Color(0xFF6E4A11),
        onTertiaryContainer: const Color(0xFFF6E2B7),
        surface: const Color(0xFF111713),
        surfaceContainerLowest: const Color(0xFF0B100D),
        surfaceContainerLow: const Color(0xFF171E19),
        surfaceContainer: const Color(0xFF1D261F),
        surfaceContainerHigh: const Color(0xFF273126),
        surfaceContainerHighest: const Color(0xFF323B31),
        onSurface: const Color(0xFFE8EEE7),
        onSurfaceVariant: const Color(0xFFC3CEC1),
        outline: const Color(0xFF8A9788),
        outlineVariant: const Color(0xFF424D42),
      ),
      (TaxaThemePresetId.tidepool, Brightness.light) => scheme.copyWith(
        primary: const Color(0xFF0B6F7C),
        secondary: const Color(0xFF51783D),
        tertiary: const Color(0xFFAA6E3E),
        surface: const Color(0xFFF3FAF8),
      ),
      (TaxaThemePresetId.tidepool, Brightness.dark) => scheme.copyWith(
        primary: const Color(0xFF8AD8E0),
        secondary: const Color(0xFFB5D39D),
        tertiary: const Color(0xFFE6B58D),
        surface: const Color(0xFF0E1718),
      ),
      (TaxaThemePresetId.nocturne, Brightness.light) => scheme.copyWith(
        primary: const Color(0xFF4D6354),
        secondary: const Color(0xFF625B7F),
        tertiary: const Color(0xFF8B6040),
        surface: const Color(0xFFF8F6EF),
      ),
      (TaxaThemePresetId.nocturne, Brightness.dark) => scheme.copyWith(
        primary: const Color(0xFFB7CCB9),
        secondary: const Color(0xFFC9C0EA),
        tertiary: const Color(0xFFE4B98D),
        surface: const Color(0xFF101214),
      ),
    };
  }

  TaxaThemeColors taxaColors(Brightness brightness) {
    return switch ((id, brightness)) {
      (TaxaThemePresetId.fieldGuide, Brightness.light) => const TaxaThemeColors(
        specimenSurface: Color(0xFFFFFBF3),
        specimenSurfaceHigh: Color(0xFFF3E7D2),
        specimenBorder: Color(0xFFD3C2A5),
        captureOverlay: Color(0xB30B1510),
        captureGlow: Color(0xFF67C5A8),
        discovery: Color(0xFFD99B2B),
        onDiscovery: Color(0xFF281800),
        success: Color(0xFF2F7D4F),
        onSuccess: Color(0xFFFFFFFF),
        fieldLine: Color(0xFFC6D0C3),
        lockedSurface: Color(0xFFE8E0D1),
        rarityCommon: Color(0xFF517D58),
        rarityUncommon: Color(0xFF2E718B),
        rarityRare: Color(0xFF9B5D1D),
      ),
      (TaxaThemePresetId.fieldGuide, Brightness.dark) => const TaxaThemeColors(
        specimenSurface: Color(0xFF1A211B),
        specimenSurfaceHigh: Color(0xFF283225),
        specimenBorder: Color(0xFF596653),
        captureOverlay: Color(0xCC050806),
        captureGlow: Color(0xFF8DD7C2),
        discovery: Color(0xFFE5B75E),
        onDiscovery: Color(0xFF291900),
        success: Color(0xFF8FCFA5),
        onSuccess: Color(0xFF0B2A17),
        fieldLine: Color(0xFF424D42),
        lockedSurface: Color(0xFF252D26),
        rarityCommon: Color(0xFFA8CFA9),
        rarityUncommon: Color(0xFFA7CBE1),
        rarityRare: Color(0xFFE6B36A),
      ),
      (TaxaThemePresetId.tidepool, Brightness.light) => const TaxaThemeColors(
        specimenSurface: Color(0xFFFFFFFF),
        specimenSurfaceHigh: Color(0xFFDFF1ED),
        specimenBorder: Color(0xFFB5D6D2),
        captureOverlay: Color(0xB3061214),
        captureGlow: Color(0xFF7DD3DA),
        discovery: Color(0xFFCF8D49),
        onDiscovery: Color(0xFF2B1603),
        success: Color(0xFF4D7A45),
        onSuccess: Color(0xFFFFFFFF),
        fieldLine: Color(0xFFB5D6D2),
        lockedSurface: Color(0xFFE2ECEA),
        rarityCommon: Color(0xFF51783D),
        rarityUncommon: Color(0xFF0B6F7C),
        rarityRare: Color(0xFFAA6E3E),
      ),
      (TaxaThemePresetId.tidepool, Brightness.dark) => const TaxaThemeColors(
        specimenSurface: Color(0xFF142021),
        specimenSurfaceHigh: Color(0xFF203033),
        specimenBorder: Color(0xFF466166),
        captureOverlay: Color(0xCC040A0B),
        captureGlow: Color(0xFF8AD8E0),
        discovery: Color(0xFFE6B58D),
        onDiscovery: Color(0xFF2C1706),
        success: Color(0xFFB5D39D),
        onSuccess: Color(0xFF17260E),
        fieldLine: Color(0xFF40565A),
        lockedSurface: Color(0xFF1D292B),
        rarityCommon: Color(0xFFB5D39D),
        rarityUncommon: Color(0xFF8AD8E0),
        rarityRare: Color(0xFFE6B58D),
      ),
      (TaxaThemePresetId.nocturne, Brightness.light) => const TaxaThemeColors(
        specimenSurface: Color(0xFFFFFBF2),
        specimenSurfaceHigh: Color(0xFFEDE7D9),
        specimenBorder: Color(0xFFC7BEAC),
        captureOverlay: Color(0xB30C0F12),
        captureGlow: Color(0xFF9AB6A4),
        discovery: Color(0xFFC99252),
        onDiscovery: Color(0xFF2B1804),
        success: Color(0xFF607D58),
        onSuccess: Color(0xFFFFFFFF),
        fieldLine: Color(0xFFC8C0D6),
        lockedSurface: Color(0xFFE7E2D8),
        rarityCommon: Color(0xFF607D58),
        rarityUncommon: Color(0xFF625B7F),
        rarityRare: Color(0xFF8B6040),
      ),
      (TaxaThemePresetId.nocturne, Brightness.dark) => const TaxaThemeColors(
        specimenSurface: Color(0xFF181B1D),
        specimenSurfaceHigh: Color(0xFF262A2E),
        specimenBorder: Color(0xFF575C64),
        captureOverlay: Color(0xD9040506),
        captureGlow: Color(0xFFB7CCB9),
        discovery: Color(0xFFE4B98D),
        onDiscovery: Color(0xFF2B1804),
        success: Color(0xFFB7CCB9),
        onSuccess: Color(0xFF152116),
        fieldLine: Color(0xFF47444F),
        lockedSurface: Color(0xFF222528),
        rarityCommon: Color(0xFFB7CCB9),
        rarityUncommon: Color(0xFFC9C0EA),
        rarityRare: Color(0xFFE4B98D),
      ),
    };
  }
}

abstract final class TaxaThemePresets {
  static const fieldGuide = TaxaThemePreset(
    id: TaxaThemePresetId.fieldGuide,
    label: 'Field Guide',
    description: 'Botanical, paper-backed, and built for outdoor discovery.',
    seedColor: Color(0xFF1F6F5B),
  );

  static const tidepool = TaxaThemePreset(
    id: TaxaThemePresetId.tidepool,
    label: 'Tidepool',
    description: 'Cooler aquatic accents for water-first collections.',
    seedColor: Color(0xFF0B6F7C),
  );

  static const nocturne = TaxaThemePreset(
    id: TaxaThemePresetId.nocturne,
    label: 'Nocturne',
    description: 'Quieter contrast for night walks and low-light field notes.',
    seedColor: Color(0xFF4D6354),
  );

  static const values = [fieldGuide, tidepool, nocturne];

  static TaxaThemePreset byId(TaxaThemePresetId id) {
    return values.firstWhere((preset) => preset.id == id);
  }
}
