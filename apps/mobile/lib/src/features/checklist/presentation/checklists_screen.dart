import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/taxa_async_state_panel.dart';
import '../../../core/widgets/feature_status_panel.dart';
import '../../../core/widgets/taxa_progress_tile.dart';
import '../../../core/widgets/taxa_screen.dart';
import '../../../core/widgets/taxa_section_header.dart';
import '../../collection/data/local_catalog_providers.dart';

class ChecklistsScreen extends ConsumerWidget {
  const ChecklistsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(checklistProgressProvider);

    return progress.when(
      data: (groups) => TaxaScreen(
        children: [
          const TaxaSectionHeader(
            title: 'Checklists',
            subtitle: 'Progress will stay queryable and offline-first.',
          ),
          const FeatureStatusPanel(
            icon: Icons.checklist_outlined,
            eyebrow: 'Progress',
            title: 'Field checklists',
            body: 'Checklist progress is backed by the local taxonomy catalog.',
          ),
          for (final group in groups)
            TaxaProgressTile(
              title: group.title,
              subtitle: group.subtitle,
              found: group.found,
              total: group.total,
            ),
        ],
      ),
      loading: () => const TaxaScreen(
        children: [
          TaxaSectionHeader(
            title: 'Checklists',
            subtitle: 'Progress will stay queryable and offline-first.',
          ),
          TaxaAsyncStatePanel.loading(),
        ],
      ),
      error: (error, stackTrace) => const TaxaScreen(
        children: [
          TaxaSectionHeader(
            title: 'Checklists',
            subtitle: 'Progress will stay queryable and offline-first.',
          ),
          TaxaAsyncStatePanel.error(),
        ],
      ),
    );
  }
}
