import 'package:flutter/material.dart';

import '../theme/taxa_theme_extensions.dart';

class TaxaCaptureAction extends StatelessWidget {
  const TaxaCaptureAction({
    required this.label,
    required this.subtitle,
    this.enabled = false,
    this.onPressed,
    super.key,
  });

  final String label;
  final String subtitle;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final colors = context.taxaColors;
    final spacing = context.taxaSpacing;
    final radii = context.taxaRadii;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(spacing.md),
      decoration: BoxDecoration(
        color: colors.lockedSurface,
        borderRadius: BorderRadius.circular(radii.md),
        border: Border.all(color: colors.fieldLine),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: enabled ? colors.captureGlow : colorScheme.surface,
              borderRadius: BorderRadius.circular(radii.md),
              border: Border.all(color: colors.fieldLine),
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              color: enabled ? colorScheme.onPrimary : colorScheme.primary,
            ),
          ),
          SizedBox(width: spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: textTheme.titleSmall),
                SizedBox(height: spacing.xs),
                Text(
                  subtitle,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: spacing.sm),
          FilledButton(
            onPressed: enabled ? onPressed : null,
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
