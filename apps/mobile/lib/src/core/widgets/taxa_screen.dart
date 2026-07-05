import 'package:flutter/material.dart';

import '../theme/taxa_theme_extensions.dart';
import 'taxa_animated_entrance.dart';

class TaxaScreen extends StatelessWidget {
  const TaxaScreen({required this.children, this.padding, super.key});

  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final spacing = context.taxaSpacing;

    return ListView.separated(
      padding:
          padding ??
          EdgeInsets.fromLTRB(spacing.lg, spacing.lg, spacing.lg, spacing.xxl),
      itemBuilder: (context, index) {
        return TaxaAnimatedEntrance(order: index, child: children[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: spacing.md),
      itemCount: children.length,
    );
  }
}
