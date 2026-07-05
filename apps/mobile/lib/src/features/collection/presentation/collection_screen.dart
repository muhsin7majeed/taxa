import 'package:flutter/material.dart';

import '../../../core/widgets/feature_status_panel.dart';
import '../../../core/widgets/taxa_info_tile.dart';
import '../../../core/widgets/taxa_metric_tile.dart';
import '../../../core/widgets/taxa_screen.dart';
import '../../../core/widgets/taxa_section_header.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaxaScreen(
      children: [
        TaxaSectionHeader(
          title: 'Collection',
          subtitle: 'Confirmed captures will unlock field-guide cards.',
        ),
        FeatureStatusPanel(
          icon: Icons.collections_bookmark_outlined,
          eyebrow: 'Specimen cards',
          title: 'Species collection',
          body: 'Discovery cards unlock after confirmed camera captures.',
        ),
        _CollectionMetricRow(),
        TaxaSectionHeader(
          title: 'Packs',
          subtitle: 'Local taxonomy packs will fill these shelves.',
        ),
        TaxaInfoTile(
          icon: Icons.lock_outline,
          title: 'Backyard Birds and Bugs',
          subtitle: '0 discovered',
        ),
        TaxaInfoTile(
          icon: Icons.lock_outline,
          title: 'Freshwater Sightings',
          subtitle: '0 discovered',
        ),
      ],
    );
  }
}

class _CollectionMetricRow extends StatelessWidget {
  const _CollectionMetricRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: TaxaMetricTile(
            icon: Icons.auto_awesome_outlined,
            label: 'Found',
            value: '0',
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: TaxaMetricTile(
            icon: Icons.sync_outlined,
            label: 'Synced',
            value: '0',
          ),
        ),
      ],
    );
  }
}
