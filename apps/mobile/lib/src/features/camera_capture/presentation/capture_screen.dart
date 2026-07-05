import 'package:flutter/material.dart';

import '../../../core/widgets/taxa_capture_action.dart';
import '../../../core/widgets/feature_status_panel.dart';
import '../../../core/widgets/taxa_info_tile.dart';
import '../../../core/widgets/taxa_screen.dart';
import '../../../core/widgets/taxa_section_header.dart';

class CaptureScreen extends StatelessWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaxaScreen(
      children: [
        TaxaSectionHeader(
          title: 'Camera fieldwork',
          subtitle: 'Discoveries start with a live in-app capture.',
        ),
        FeatureStatusPanel(
          icon: Icons.photo_camera_outlined,
          eyebrow: 'Capture gate',
          title: 'Ready for capture',
          body: 'Discoveries begin from the in-app camera flow only.',
          action: TaxaCaptureAction(
            label: 'Camera module pending',
            subtitle: 'No gallery import or upload path is exposed here.',
          ),
        ),
        TaxaSectionHeader(
          title: 'MVP rules',
          subtitle: 'The shell keeps the anti-cheat boundary visible.',
        ),
        TaxaInfoTile(
          icon: Icons.no_photography_outlined,
          title: 'Gallery imports blocked',
          subtitle: 'The shell exposes no upload or picker entry point.',
        ),
        TaxaInfoTile(
          icon: Icons.offline_bolt_outlined,
          title: 'Offline first',
          subtitle: 'Capture metadata will be written to SQLite first.',
        ),
      ],
    );
  }
}
