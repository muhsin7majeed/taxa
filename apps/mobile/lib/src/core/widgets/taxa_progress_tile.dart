import 'package:flutter/material.dart';

import '../theme/taxa_theme_extensions.dart';

class TaxaProgressTile extends StatelessWidget {
  const TaxaProgressTile({
    required this.title,
    required this.subtitle,
    required this.found,
    required this.total,
    super.key,
  });

  final String title;
  final String subtitle;
  final int found;
  final int total;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final colors = context.taxaColors;
    final spacing = context.taxaSpacing;
    final radii = context.taxaRadii;
    final textTheme = Theme.of(context).textTheme;
    final value = total == 0 ? 0.0 : found / total;
    final duration = context.taxaReduceMotion
        ? Duration.zero
        : context.taxaMotion.standard;

    return Container(
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(radii.md),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(title, style: textTheme.titleSmall)),
              SizedBox(width: spacing.md),
              Text(
                '$found / $total',
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing.xs),
          Text(
            subtitle,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: spacing.md),
          TweenAnimationBuilder<double>(
            tween: Tween(end: value),
            duration: duration,
            curve: context.taxaMotion.progressCurve,
            builder: (context, animatedValue, child) {
              return LinearProgressIndicator(
                value: animatedValue,
                minHeight: 6,
                borderRadius: BorderRadius.circular(radii.sm),
                color: colors.success,
              );
            },
          ),
        ],
      ),
    );
  }
}
