import 'package:flutter/material.dart';

import 'taxa_theme_preset.dart';
import 'taxa_theme_tokens.dart';

abstract final class TaxaTheme {
  static ThemeData light([TaxaThemePreset? preset]) {
    return _build(
      preset: preset ?? TaxaThemePresets.fieldGuide,
      brightness: Brightness.light,
    );
  }

  static ThemeData dark([TaxaThemePreset? preset]) {
    return _build(
      preset: preset ?? TaxaThemePresets.fieldGuide,
      brightness: Brightness.dark,
    );
  }

  static ThemeData _build({
    required TaxaThemePreset preset,
    required Brightness brightness,
  }) {
    final colorScheme = preset.colorScheme(brightness);
    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
    );
    final radii = TaxaRadii.standard;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: _textTheme(base.textTheme, colorScheme),
      scaffoldBackgroundColor: colorScheme.surface,
      extensions: [
        preset.taxaColors(brightness),
        TaxaSpacing.standard,
        radii,
        TaxaMotionTokens.standardTokens,
      ],
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: _polishTextStyle(
          base.textTheme.titleLarge,
        )?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w700),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerLow,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii.md),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(48, 48),
          textStyle: _polishTextStyle(
            base.textTheme.labelLarge,
          )?.copyWith(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radii.md),
          ),
        ),
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radii.md),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.secondaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final color = states.contains(WidgetState.selected)
              ? colorScheme.onSecondaryContainer
              : colorScheme.onSurfaceVariant;

          return _polishTextStyle(base.textTheme.labelMedium)?.copyWith(
            color: color,
            fontWeight: states.contains(WidgetState.selected)
                ? FontWeight.w700
                : FontWeight.w500,
          );
        }),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          textStyle: _polishTextStyle(
            base.textTheme.labelLarge,
          )?.copyWith(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radii.md),
          ),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.surfaceContainerHighest,
      ),
    );
  }

  static TextTheme _textTheme(TextTheme base, ColorScheme colorScheme) {
    final textTheme = base.copyWith(
      displayLarge: _polishTextStyle(base.displayLarge),
      displayMedium: _polishTextStyle(base.displayMedium),
      displaySmall: _polishTextStyle(
        base.displaySmall,
      )?.copyWith(fontWeight: FontWeight.w800),
      headlineLarge: _polishTextStyle(
        base.headlineLarge,
      )?.copyWith(fontWeight: FontWeight.w800),
      headlineMedium: _polishTextStyle(
        base.headlineMedium,
      )?.copyWith(fontWeight: FontWeight.w800),
      headlineSmall: _polishTextStyle(
        base.headlineSmall,
      )?.copyWith(fontWeight: FontWeight.w700),
      titleLarge: _polishTextStyle(
        base.titleLarge,
      )?.copyWith(fontWeight: FontWeight.w700),
      titleMedium: _polishTextStyle(
        base.titleMedium,
      )?.copyWith(fontWeight: FontWeight.w700),
      titleSmall: _polishTextStyle(
        base.titleSmall,
      )?.copyWith(fontWeight: FontWeight.w700),
      bodyLarge: _polishTextStyle(base.bodyLarge),
      bodyMedium: _polishTextStyle(base.bodyMedium),
      bodySmall: _polishTextStyle(base.bodySmall),
      labelLarge: _polishTextStyle(
        base.labelLarge,
      )?.copyWith(fontWeight: FontWeight.w700),
      labelMedium: _polishTextStyle(base.labelMedium),
      labelSmall: _polishTextStyle(base.labelSmall),
    );

    return textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );
  }

  static TextStyle? _polishTextStyle(TextStyle? style) {
    return style?.copyWith(letterSpacing: 0);
  }
}
