import 'package:flutter/material.dart';

import '../../../core/widgets/feature_status_panel.dart';
import '../../../core/widgets/taxa_info_tile.dart';
import '../../../core/widgets/taxa_screen.dart';
import '../../../core/widgets/taxa_section_header.dart';

class IdentificationProcessingScreen extends StatelessWidget {
  const IdentificationProcessingScreen({required this.onCancel, super.key});

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return TaxaScreen(
      children: [
        const TaxaSectionHeader(
          title: 'Analyzing capture',
          subtitle: 'Taxa is checking the local field catalog.',
        ),
        FeatureStatusPanel(
          icon: Icons.center_focus_strong_outlined,
          eyebrow: 'Identification',
          title: 'Looking for a match',
          body:
              'The image is being compared against the bundled taxonomy pack.',
          action: const LinearProgressIndicator(),
        ),
        const TaxaInfoTile(
          icon: Icons.offline_bolt_outlined,
          title: 'Local first',
          subtitle:
              'The attempt is stored on this device before any sync work.',
        ),
        OutlinedButton.icon(
          onPressed: onCancel,
          icon: const Icon(Icons.close),
          label: const Text('Cancel'),
        ),
      ],
    );
  }
}
