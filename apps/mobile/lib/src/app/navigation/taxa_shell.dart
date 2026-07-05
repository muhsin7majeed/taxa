import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/account_screen.dart';
import '../../features/camera_capture/presentation/capture_screen.dart';
import '../../features/checklist/presentation/checklists_screen.dart';
import '../../features/collection/presentation/collection_screen.dart';
import 'app_destination.dart';

final selectedDestinationControllerProvider =
    NotifierProvider<SelectedDestinationController, AppDestination>(
      SelectedDestinationController.new,
    );

class SelectedDestinationController extends Notifier<AppDestination> {
  @override
  AppDestination build() => AppDestination.capture;

  void selectIndex(int index) {
    if (index < 0 || index >= AppDestination.values.length) {
      return;
    }

    state = AppDestination.values[index];
  }
}

class TaxaShell extends ConsumerWidget {
  const TaxaShell({super.key});

  static const _screens = <Widget>[
    CaptureScreen(),
    CollectionScreen(),
    ChecklistsScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final destination = ref.watch(selectedDestinationControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(destination.label)),
      body: IndexedStack(index: destination.index, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: destination.index,
        onDestinationSelected: ref
            .read(selectedDestinationControllerProvider.notifier)
            .selectIndex,
        destinations: [
          for (final destination in AppDestination.values)
            destination.navigationDestination,
        ],
      ),
    );
  }
}
