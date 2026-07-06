import 'package:flutter/material.dart';

import '../../../core/theme/taxa_theme_extensions.dart';
import '../../../core/widgets/feature_status_panel.dart';
import '../../../core/widgets/taxa_info_tile.dart';
import '../../../core/widgets/taxa_metric_tile.dart';
import '../../../core/widgets/taxa_screen.dart';
import '../../../core/widgets/taxa_section_header.dart';
import '../domain/identification_outcome.dart';

class IdentificationResultScreen extends StatelessWidget {
  const IdentificationResultScreen({
    required this.outcome,
    required this.error,
    required this.onCaptureAgain,
    required this.onBackToOverview,
    super.key,
  });

  final PersistedIdentificationOutcome? outcome;
  final Object? error;
  final VoidCallback onCaptureAgain;
  final VoidCallback onBackToOverview;

  @override
  Widget build(BuildContext context) {
    final persistedOutcome = outcome;

    if (error != null || persistedOutcome == null) {
      return TaxaScreen(
        children: [
          const TaxaSectionHeader(
            title: 'Identification stopped',
            subtitle: 'This capture can be tried again from the camera.',
          ),
          const FeatureStatusPanel(
            icon: Icons.error_outline,
            title: 'Could not identify capture',
            body: 'The local identification attempt could not be completed.',
          ),
          _ResultActions(
            primaryLabel: 'Try again',
            primaryIcon: Icons.photo_camera_outlined,
            onPrimary: onCaptureAgain,
            onSecondary: onBackToOverview,
          ),
        ],
      );
    }

    if (!persistedOutcome.isIdentified) {
      final confidence = persistedOutcome.topConfidence;

      return TaxaScreen(
        children: [
          const TaxaSectionHeader(
            title: 'Needs another look',
            subtitle: 'The result stayed below the confidence threshold.',
          ),
          FeatureStatusPanel(
            icon: Icons.help_outline,
            eyebrow: 'Unidentified',
            title: 'No confident match',
            body: confidence == null
                ? 'The classifier did not return a usable prediction.'
                : 'Top confidence was ${_formatPercent(confidence)}, below ${_formatPercent(persistedOutcome.decision.threshold)}.',
          ),
          const TaxaInfoTile(
            icon: Icons.no_photography_outlined,
            title: 'Discovery not created',
            subtitle: 'Only confident in-app camera results unlock species.',
          ),
          _ResultActions(
            primaryLabel: 'Retake',
            primaryIcon: Icons.refresh,
            onPrimary: onCaptureAgain,
            onSecondary: onBackToOverview,
          ),
        ],
      );
    }

    final taxonomy = persistedOutcome.taxonomyEntry!;
    final confidence = persistedOutcome.topConfidence ?? 0;

    return TaxaScreen(
      children: [
        const TaxaSectionHeader(
          title: 'Species identified',
          subtitle: 'A local discovery was added to your field record.',
        ),
        FeatureStatusPanel(
          icon: Icons.auto_awesome_outlined,
          eyebrow: taxonomy.rarity,
          title: taxonomy.commonName,
          body: taxonomy.scientificName,
          action: FilledButton.icon(
            onPressed: onCaptureAgain,
            icon: const Icon(Icons.photo_camera_outlined),
            label: const Text('Capture another'),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TaxaMetricTile(
                label: 'Confidence',
                value: _formatPercent(confidence),
                icon: Icons.verified_outlined,
              ),
            ),
            SizedBox(width: context.taxaSpacing.md),
            Expanded(
              child: TaxaMetricTile(
                label: 'Category',
                value: taxonomy.category,
                icon: Icons.category_outlined,
              ),
            ),
          ],
        ),
        TaxaInfoTile(
          icon: Icons.park_outlined,
          title: taxonomy.habitat,
          subtitle: taxonomy.sizeDescription,
        ),
        TaxaInfoTile(
          icon: Icons.restaurant_outlined,
          title: 'Diet',
          subtitle: taxonomy.diet,
        ),
        const TaxaInfoTile(
          icon: Icons.offline_bolt_outlined,
          title: 'Saved locally',
          subtitle: 'Collection and checklist progress update from SQLite.',
        ),
        OutlinedButton.icon(
          onPressed: onBackToOverview,
          icon: const Icon(Icons.arrow_back),
          label: const Text('Back to Capture'),
        ),
      ],
    );
  }

  String _formatPercent(double value) {
    return '${(value * 100).round()}%';
  }
}

class _ResultActions extends StatelessWidget {
  const _ResultActions({
    required this.primaryLabel,
    required this.primaryIcon,
    required this.onPrimary,
    required this.onSecondary,
  });

  final String primaryLabel;
  final IconData primaryIcon;
  final VoidCallback onPrimary;
  final VoidCallback onSecondary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onSecondary,
            icon: const Icon(Icons.arrow_back),
            label: const Text('Back'),
          ),
        ),
        SizedBox(width: context.taxaSpacing.md),
        Expanded(
          child: FilledButton.icon(
            onPressed: onPrimary,
            icon: Icon(primaryIcon),
            label: Text(primaryLabel),
          ),
        ),
      ],
    );
  }
}
