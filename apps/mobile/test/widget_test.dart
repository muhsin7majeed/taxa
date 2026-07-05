import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taxa_mobile/src/app/taxa_app.dart';

void main() {
  testWidgets('Taxa shell starts on Capture and switches tabs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: TaxaApp()));

    expect(find.text('Ready for capture'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsNothing);
    expect(find.text('Camera module pending'), findsOneWidget);

    await tester.tap(find.text('Collection'));
    await tester.pumpAndSettle();
    expect(find.text('Species collection'), findsOneWidget);

    await tester.tap(find.text('Checklists'));
    await tester.pumpAndSettle();
    expect(find.text('Field checklists'), findsOneWidget);

    await tester.tap(find.text('Account'));
    await tester.pumpAndSettle();
    expect(find.text('Guest explorer'), findsOneWidget);
  });
}
