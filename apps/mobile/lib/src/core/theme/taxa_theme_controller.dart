import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'taxa_theme_preset.dart';

@immutable
class TaxaThemeSettings {
  const TaxaThemeSettings({
    this.presetId = TaxaThemePresetId.fieldGuide,
    this.themeMode = ThemeMode.system,
  });

  final TaxaThemePresetId presetId;
  final ThemeMode themeMode;

  TaxaThemeSettings copyWith({
    TaxaThemePresetId? presetId,
    ThemeMode? themeMode,
  }) {
    return TaxaThemeSettings(
      presetId: presetId ?? this.presetId,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

abstract interface class TaxaThemePreferences {
  TaxaThemeSettings read();

  Future<void> save(TaxaThemeSettings settings);
}

class InMemoryTaxaThemePreferences implements TaxaThemePreferences {
  TaxaThemeSettings _settings = const TaxaThemeSettings();

  @override
  TaxaThemeSettings read() => _settings;

  @override
  Future<void> save(TaxaThemeSettings settings) async {
    _settings = settings;
  }
}

final taxaThemePreferencesProvider = Provider<TaxaThemePreferences>(
  (ref) => InMemoryTaxaThemePreferences(),
);

final taxaThemeControllerProvider =
    NotifierProvider<TaxaThemeController, TaxaThemeSettings>(
      TaxaThemeController.new,
    );

class TaxaThemeController extends Notifier<TaxaThemeSettings> {
  @override
  TaxaThemeSettings build() {
    return ref.read(taxaThemePreferencesProvider).read();
  }

  void selectPreset(TaxaThemePresetId presetId) {
    state = state.copyWith(presetId: presetId);
    _persist();
  }

  void setThemeMode(ThemeMode themeMode) {
    state = state.copyWith(themeMode: themeMode);
    _persist();
  }

  void _persist() {
    ref.read(taxaThemePreferencesProvider).save(state);
  }
}
