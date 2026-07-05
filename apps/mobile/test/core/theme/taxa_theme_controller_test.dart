import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/theme/taxa_theme_controller.dart';
import 'package:taxa_mobile/src/core/theme/taxa_theme_preset.dart';

void main() {
  test('defaults to Field Guide with system brightness', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final settings = container.read(taxaThemeControllerProvider);

    expect(settings.presetId, TaxaThemePresetId.fieldGuide);
    expect(settings.themeMode, ThemeMode.system);
  });

  test('updates theme preset and brightness mode', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final controller = container.read(taxaThemeControllerProvider.notifier);

    controller.selectPreset(TaxaThemePresetId.tidepool);
    controller.setThemeMode(ThemeMode.dark);

    final settings = container.read(taxaThemeControllerProvider);
    expect(settings.presetId, TaxaThemePresetId.tidepool);
    expect(settings.themeMode, ThemeMode.dark);
  });
}
