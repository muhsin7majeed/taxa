import 'package:flutter/material.dart';

import '../../../core/widgets/feature_status_panel.dart';
import '../../../core/widgets/taxa_progress_tile.dart';
import '../../../core/widgets/taxa_screen.dart';
import '../../../core/widgets/taxa_section_header.dart';

class ChecklistsScreen extends StatelessWidget {
  const ChecklistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaxaScreen(
      children: [
        TaxaSectionHeader(
          title: 'Checklists',
          subtitle: 'Progress will stay queryable and offline-first.',
        ),
        FeatureStatusPanel(
          icon: Icons.checklist_outlined,
          eyebrow: 'Progress',
          title: 'Field checklists',
          body:
              'Checklist progress will be backed by the local taxonomy catalog.',
        ),
        TaxaProgressTile(
          title: 'Backyard Birds and Bugs',
          subtitle: 'MVP taxonomy pack placeholder',
          found: 0,
          total: 45,
        ),
        TaxaProgressTile(
          title: 'Freshwater Sightings',
          subtitle: 'Fish and amphibian pack placeholder',
          found: 0,
          total: 30,
        ),
      ],
    );
  }
}
