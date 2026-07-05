import 'package:flutter/material.dart';

import 'feature_status_panel.dart';

class TaxaAsyncStatePanel extends StatelessWidget {
  const TaxaAsyncStatePanel.loading({
    this.title = 'Loading local field data',
    this.body = 'Preparing the offline catalog on this device.',
    super.key,
  }) : icon = Icons.hourglass_empty_outlined;

  const TaxaAsyncStatePanel.error({
    this.title = 'Local data unavailable',
    this.body = 'The offline catalog could not be prepared.',
    super.key,
  }) : icon = Icons.error_outline;

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return FeatureStatusPanel(icon: icon, title: title, body: body);
  }
}
