import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/taxa_theme_controller.dart';
import '../../../core/theme/taxa_theme_preset.dart';
import '../../../core/widgets/feature_status_panel.dart';
import '../../../core/widgets/taxa_info_tile.dart';
import '../../../core/widgets/taxa_screen.dart';
import '../../../core/widgets/taxa_section_header.dart';
import '../../identification/presentation/classifier_diagnostics_screen.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(taxaThemeControllerProvider);
    final selectedPreset = TaxaThemePresets.byId(themeSettings.presetId);

    return TaxaScreen(
      children: [
        const TaxaSectionHeader(
          title: 'Account',
          subtitle: 'Sync and personalization settings will live here.',
        ),
        const FeatureStatusPanel(
          icon: Icons.person_outline,
          eyebrow: 'Local profile',
          title: 'Guest explorer',
          body: 'Account and sync controls will connect after auth lands.',
        ),
        TaxaSectionHeader(
          title: 'Appearance',
          subtitle:
              '${selectedPreset.label} theme, ${_themeModeLabel(themeSettings.themeMode)} brightness',
        ),
        TaxaInfoTile(
          icon: Icons.palette_outlined,
          title: selectedPreset.label,
          subtitle: selectedPreset.description,
        ),
        const TaxaSectionHeader(
          title: 'Diagnostics',
          subtitle: 'Local classifier readiness and timing.',
        ),
        FeatureStatusPanel(
          icon: Icons.memory_outlined,
          eyebrow: 'On-device ML',
          title: 'Classifier diagnostics',
          body:
              'Inspect local model metadata and benchmark the active classifier.',
          action: OutlinedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const ClassifierDiagnosticsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.speed_outlined),
            label: const Text('Open'),
          ),
        ),
        const TaxaSectionHeader(
          title: 'Status',
          subtitle: 'Current shell behavior before auth and sync land.',
        ),
        const TaxaInfoTile(
          icon: Icons.cloud_off_outlined,
          title: 'Offline mode',
          subtitle: 'Local progress remains available without the API.',
        ),
        const TaxaInfoTile(
          icon: Icons.lock_outline,
          title: 'Private by default',
          subtitle:
              'No credentials or model secrets are stored in the app shell.',
        ),
      ],
    );
  }

  static String _themeModeLabel(ThemeMode themeMode) {
    return switch (themeMode) {
      ThemeMode.system => 'system',
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
    };
  }
}
