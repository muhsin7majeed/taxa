import 'package:flutter/material.dart';

import '../theme/taxa_theme_extensions.dart';

class TaxaMetricTile extends StatelessWidget {
  const TaxaMetricTile({
    required this.label,
    required this.value,
    this.icon,
    super.key,
  });

  final String label;
  final String value;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final colors = context.taxaColors;
    final spacing = context.taxaSpacing;
    final radii = context.taxaRadii;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: colors.specimenSurfaceHigh,
        borderRadius: BorderRadius.circular(radii.md),
        border: Border.all(color: colors.specimenBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, color: colorScheme.primary, size: 20),
            SizedBox(height: spacing.sm),
          ],
          Text(
            value,
            style: textTheme.headlineSmall?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: spacing.xs),
          Text(
            label,
            style: textTheme.labelLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
