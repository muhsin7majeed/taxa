import 'package:flutter/material.dart';

import '../theme/taxa_theme_extensions.dart';

class FeatureStatusPanel extends StatelessWidget {
  const FeatureStatusPanel({
    required this.icon,
    required this.title,
    required this.body,
    this.eyebrow,
    this.action,
    super.key,
  });

  final IconData icon;
  final String title;
  final String body;
  final String? eyebrow;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final colors = context.taxaColors;
    final spacing = context.taxaSpacing;
    final radii = context.taxaRadii;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.lg),
      decoration: BoxDecoration(
        color: colors.specimenSurface,
        border: Border.all(color: colors.specimenBorder),
        borderRadius: BorderRadius.circular(radii.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(radii.md),
                ),
                child: Icon(icon, color: colorScheme.onPrimaryContainer),
              ),
              SizedBox(width: spacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (eyebrow != null) ...[
                      Text(
                        eyebrow!,
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: spacing.xs),
                    ],
                    Text(title, style: textTheme.titleLarge),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: spacing.md),
          Text(
            body,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          if (action != null) ...[SizedBox(height: spacing.lg), action!],
        ],
      ),
    );
  }
}
