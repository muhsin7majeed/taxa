import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/theme/taxa_theme.dart';
import '../core/theme/taxa_theme_controller.dart';
import '../core/theme/taxa_theme_preset.dart';
import '../core/theme/taxa_theme_tokens.dart';
import 'navigation/taxa_shell.dart';

class TaxaApp extends ConsumerWidget {
  const TaxaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(taxaThemeControllerProvider);
    final preset = TaxaThemePresets.byId(settings.presetId);
    const motion = TaxaMotionTokens.standardTokens;

    return MaterialApp(
      title: 'Taxa',
      debugShowCheckedModeBanner: false,
      theme: TaxaTheme.light(preset),
      darkTheme: TaxaTheme.dark(preset),
      themeMode: settings.themeMode,
      themeAnimationDuration: motion.standard,
      themeAnimationCurve: motion.progressCurve,
      home: const TaxaShell(),
    );
  }
}
