import 'package:flutter/material.dart';

import '../../../core/widgets/feature_status_panel.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        FeatureStatusPanel(
          icon: Icons.collections_bookmark_outlined,
          title: 'Species collection',
          body: 'Discovery cards unlock after confirmed camera captures.',
        ),
        SizedBox(height: 16),
        _CollectionMetricRow(),
        SizedBox(height: 16),
        _LockedCollectionTile(
          title: 'Backyard Birds and Bugs',
          subtitle: '0 discovered',
        ),
        SizedBox(height: 8),
        _LockedCollectionTile(
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
          child: _CollectionMetricTile(label: 'Found', value: '0'),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _CollectionMetricTile(label: 'Synced', value: '0'),
        ),
      ],
    );
  }
}

class _CollectionMetricTile extends StatelessWidget {
  const _CollectionMetricTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: textTheme.headlineSmall?.copyWith(
              color: colorScheme.onTertiaryContainer,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: textTheme.labelLarge?.copyWith(
              color: colorScheme.onTertiaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

class _LockedCollectionTile extends StatelessWidget {
  const _LockedCollectionTile({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(Icons.lock_outline, color: colorScheme.primary),
      title: Text(title),
      subtitle: Text(subtitle),
      tileColor: colorScheme.surfaceContainerHighest,
    );
  }
}
