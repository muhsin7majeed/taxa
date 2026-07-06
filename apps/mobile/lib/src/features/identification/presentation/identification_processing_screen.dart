import 'package:flutter/material.dart';

import '../../../core/theme/taxa_theme_extensions.dart';
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
        const _ScanningFieldGuidePanel(),
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

class _ScanningFieldGuidePanel extends StatefulWidget {
  const _ScanningFieldGuidePanel();

  @override
  State<_ScanningFieldGuidePanel> createState() =>
      _ScanningFieldGuidePanelState();
}

class _ScanningFieldGuidePanelState extends State<_ScanningFieldGuidePanel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.taxaReduceMotion) {
      _controller.stop();
      _controller.value = 0.5;
    } else if (!_controller.isAnimating) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.taxaColors;
    final spacing = context.taxaSpacing;
    final radii = context.taxaRadii;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 164,
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: colors.specimenSurface,
        borderRadius: BorderRadius.circular(radii.lg),
        border: Border.all(color: colors.specimenBorder),
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final scanAlignment = Alignment(
            0,
            context.taxaReduceMotion ? 0 : -0.78 + (_controller.value * 1.56),
          );

          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.filter_center_focus_outlined,
                  color: colors.captureGlow,
                  size: 72,
                ),
              ),
              Align(
                alignment: scanAlignment,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: colors.discovery,
                    borderRadius: BorderRadius.circular(radii.xs),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.memory_outlined,
                      size: 18,
                      color: colorScheme.primary,
                    ),
                    SizedBox(width: spacing.sm),
                    Text(
                      'On-device classifier boundary',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
