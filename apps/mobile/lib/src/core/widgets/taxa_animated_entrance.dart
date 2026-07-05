import 'package:flutter/material.dart';

import '../theme/taxa_theme_extensions.dart';

class TaxaAnimatedEntrance extends StatelessWidget {
  const TaxaAnimatedEntrance({
    required this.child,
    this.order = 0,
    this.distance = 12,
    super.key,
  });

  final Widget child;
  final int order;
  final double distance;

  @override
  Widget build(BuildContext context) {
    if (context.taxaReduceMotion) {
      return child;
    }

    final motion = context.taxaMotion;
    final delay = Duration(milliseconds: order * 35);
    final duration = motion.standard + delay;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration,
      curve: motion.entranceCurve,
      child: child,
      builder: (context, value, child) {
        final dy = (1 - value) * distance;

        return Transform.translate(offset: Offset(0, dy), child: child);
      },
    );
  }
}
