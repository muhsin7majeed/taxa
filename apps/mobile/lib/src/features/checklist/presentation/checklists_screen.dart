import 'package:flutter/material.dart';

import '../../../core/widgets/feature_status_panel.dart';

class ChecklistsScreen extends StatelessWidget {
  const ChecklistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        FeatureStatusPanel(
          icon: Icons.checklist_outlined,
          title: 'Field checklists',
          body:
              'Checklist progress will be backed by the local taxonomy catalog.',
        ),
        SizedBox(height: 16),
        _ChecklistProgressTile(
          title: 'Backyard Birds and Bugs',
          subtitle: 'MVP taxonomy pack placeholder',
          found: 0,
          total: 45,
        ),
        SizedBox(height: 8),
        _ChecklistProgressTile(
          title: 'Freshwater Sightings',
          subtitle: 'Fish and amphibian pack placeholder',
          found: 0,
          total: 30,
        ),
      ],
    );
  }
}

class _ChecklistProgressTile extends StatelessWidget {
  const _ChecklistProgressTile({
    required this.title,
    required this.subtitle,
    required this.found,
    required this.total,
  });

  final String title;
  final String subtitle;
  final int found;
  final int total;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: total == 0 ? 0 : found / total,
            minHeight: 6,
            borderRadius: BorderRadius.circular(8),
          ),
        ],
      ),
      trailing: Text('$found / $total'),
      tileColor: colorScheme.surfaceContainerHighest,
    );
  }
}
