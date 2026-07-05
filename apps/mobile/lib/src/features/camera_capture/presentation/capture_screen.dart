import 'package:flutter/material.dart';

import '../../../core/widgets/feature_status_panel.dart';

class CaptureScreen extends StatelessWidget {
  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        FeatureStatusPanel(
          icon: Icons.photo_camera_outlined,
          title: 'Ready for capture',
          body: 'Discoveries begin from the in-app camera flow only.',
          action: _DisabledCaptureButton(),
        ),
        SizedBox(height: 16),
        _CaptureRuleTile(
          icon: Icons.no_photography_outlined,
          title: 'Gallery imports blocked',
          subtitle: 'The shell exposes no upload or picker entry point.',
        ),
        SizedBox(height: 8),
        _CaptureRuleTile(
          icon: Icons.offline_bolt_outlined,
          title: 'Offline first',
          subtitle: 'Capture metadata will be written locally before sync.',
        ),
      ],
    );
  }
}

class _DisabledCaptureButton extends StatelessWidget {
  const _DisabledCaptureButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: null,
      icon: const Icon(Icons.camera_alt_outlined),
      label: const Text('Start capture'),
    );
  }
}

class _CaptureRuleTile extends StatelessWidget {
  const _CaptureRuleTile({
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
