import 'package:flutter/material.dart';

import '../../../core/widgets/feature_status_panel.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        FeatureStatusPanel(
          icon: Icons.person_outline,
          title: 'Guest explorer',
          body: 'Account and sync controls will connect after auth lands.',
        ),
        SizedBox(height: 16),
        _AccountStatusTile(
          icon: Icons.cloud_off_outlined,
          title: 'Offline mode',
          subtitle: 'Local progress remains available without the API.',
        ),
        SizedBox(height: 8),
        _AccountStatusTile(
          icon: Icons.lock_outline,
          title: 'Private by default',
          subtitle:
              'No credentials or model secrets are stored in the app shell.',
        ),
      ],
    );
  }
}

class _AccountStatusTile extends StatelessWidget {
  const _AccountStatusTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(icon, color: colorScheme.primary),
      title: Text(title),
      subtitle: Text(subtitle),
      tileColor: colorScheme.surfaceContainerHighest,
    );
  }
}
