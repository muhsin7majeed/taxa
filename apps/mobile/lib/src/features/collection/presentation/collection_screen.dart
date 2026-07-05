import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/taxa_async_state_panel.dart';
import '../../../core/widgets/feature_status_panel.dart';
import '../../../core/widgets/taxa_info_tile.dart';
import '../../../core/widgets/taxa_metric_tile.dart';
import '../../../core/widgets/taxa_screen.dart';
import '../../../core/widgets/taxa_section_header.dart';
import '../data/local_catalog_providers.dart';
import '../domain/collection_models.dart';

class CollectionScreen extends ConsumerWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overview = ref.watch(collectionOverviewProvider);

    return overview.when(
      data: (overview) => TaxaScreen(
        children: [
          const TaxaSectionHeader(
            title: 'Collection',
            subtitle: 'Confirmed captures will unlock field-guide cards.',
          ),
          const FeatureStatusPanel(
            icon: Icons.collections_bookmark_outlined,
            eyebrow: 'Specimen cards',
            title: 'Species collection',
            body: 'Discovery cards unlock after confirmed camera captures.',
          ),
          _CollectionMetricRow(overview: overview),
          const TaxaSectionHeader(
            title: 'Packs',
            subtitle: 'Local taxonomy packs are seeded on this device.',
          ),
          for (final pack in overview.packs)
            TaxaInfoTile(
              icon: pack.found == pack.total
                  ? Icons.collections_bookmark
                  : Icons.lock_outline,
              title: pack.title,
              subtitle: '${pack.found} of ${pack.total} discovered',
            ),
        ],
      ),
      loading: () => const TaxaScreen(
        children: [
          TaxaSectionHeader(
            title: 'Collection',
            subtitle: 'Confirmed captures will unlock field-guide cards.',
          ),
          TaxaAsyncStatePanel.loading(),
        ],
      ),
      error: (error, stackTrace) => const TaxaScreen(
        children: [
          TaxaSectionHeader(
            title: 'Collection',
            subtitle: 'Confirmed captures will unlock field-guide cards.',
          ),
          TaxaAsyncStatePanel.error(),
        ],
      ),
    );
  }
}

class _CollectionMetricRow extends StatelessWidget {
  const _CollectionMetricRow({required this.overview});

  final CollectionOverview overview;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TaxaMetricTile(
            icon: Icons.auto_awesome_outlined,
            label: 'Found',
            value: '${overview.foundSpecies}',
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TaxaMetricTile(
            icon: Icons.collections_bookmark_outlined,
            label: 'Catalog',
            value: '${overview.totalSpecies}',
          ),
        ),
      ],
    );
  }
}
