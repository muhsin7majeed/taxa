import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taxa_mobile/src/core/theme/taxa_theme.dart';
import 'package:taxa_mobile/src/core/widgets/taxa_progress_tile.dart';

void main() {
  testWidgets('TaxaProgressTile renders progress count and copy', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: TaxaTheme.light(),
        home: const Scaffold(
          body: TaxaProgressTile(
            title: 'Backyard Birds and Bugs',
            subtitle: 'MVP taxonomy pack placeholder',
            found: 2,
            total: 5,
          ),
        ),
      ),
    );

    expect(find.text('Backyard Birds and Bugs'), findsOneWidget);
    expect(find.text('2 / 5'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });
}
