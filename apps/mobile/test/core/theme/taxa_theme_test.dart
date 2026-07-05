import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/theme/taxa_theme.dart';
import 'package:taxa_mobile/src/core/theme/taxa_theme_preset.dart';
import 'package:taxa_mobile/src/core/theme/taxa_theme_tokens.dart';

void main() {
  test('Field Guide theme includes Taxa-specific extensions', () {
    final theme = TaxaTheme.light(TaxaThemePresets.fieldGuide);

    expect(theme.extension<TaxaThemeColors>(), isNotNull);
    expect(theme.extension<TaxaSpacing>(), isNotNull);
    expect(theme.extension<TaxaRadii>(), isNotNull);
    expect(theme.extension<TaxaMotionTokens>(), isNotNull);
    expect(theme.colorScheme.primary, const Color(0xFF1F6F5B));
  });
}
