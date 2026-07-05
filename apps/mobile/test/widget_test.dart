import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taxa_mobile/src/app/taxa_app.dart';
import 'package:taxa_mobile/src/features/collection/data/local_catalog_providers.dart';
import 'package:taxa_mobile/src/features/collection/domain/collection_models.dart';

void main() {
  testWidgets('Taxa shell starts on Capture and switches tabs', (
    WidgetTester tester,
  ) async {
    const checklistProgress = [
      ChecklistProgress(
        id: 'backyard',
        title: 'Backyard Birds and Bugs',
        subtitle: 'Common species for the first local field pack.',
        found: 0,
        total: 5,
        sortOrder: 0,
      ),
      ChecklistProgress(
        id: 'freshwater',
        title: 'Freshwater Sightings',
        subtitle: 'Fish and amphibian pack placeholder.',
        found: 0,
        total: 3,
        sortOrder: 1,
      ),
    ];
    const collectionOverview = CollectionOverview(
      foundSpecies: 0,
      totalSpecies: 8,
      localDiscoveryCount: 0,
      packs: checklistProgress,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          collectionOverviewProvider.overrideWithValue(
            const AsyncValue.data(collectionOverview),
          ),
          checklistProgressProvider.overrideWithValue(
            const AsyncValue.data(checklistProgress),
          ),
        ],
        child: const TaxaApp(),
      ),
    );
    await pumpUntilFound(tester, find.text('Ready for capture'));

    expect(find.text('Ready for capture'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsNothing);
    expect(find.text('Camera module pending'), findsOneWidget);

    await tester.tap(find.text('Collection'));
    await pumpUntilFound(tester, find.text('Species collection'));
    expect(find.text('Species collection'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);

    await tester.tap(find.text('Checklists'));
    await pumpUntilFound(tester, find.text('Field checklists'));
    expect(find.text('Field checklists'), findsOneWidget);
    expect(find.text('0 / 5'), findsOneWidget);

    await tester.tap(find.text('Account'));
    await pumpUntilFound(tester, find.text('Guest explorer'));
    expect(find.text('Guest explorer'), findsOneWidget);
  });
}

Future<void> pumpUntilFound(
  WidgetTester tester,
  Finder finder, {
  int maxPumps = 20,
}) async {
  for (var i = 0; i < maxPumps; i += 1) {
    await tester.pump(const Duration(milliseconds: 50));
    if (finder.evaluate().isNotEmpty) {
      return;
    }
  }
}
