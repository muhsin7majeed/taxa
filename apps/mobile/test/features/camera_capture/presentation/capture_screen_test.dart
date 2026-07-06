import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taxa_mobile/src/core/theme/taxa_theme.dart';
import 'package:taxa_mobile/src/features/camera_capture/data/camera_capture_service.dart';
import 'package:taxa_mobile/src/features/camera_capture/presentation/capture_screen.dart';

void main() {
  testWidgets('camera plugin is not touched until capture starts', (
    WidgetTester tester,
  ) async {
    final service = _NoCameraCaptureService();

    await _pumpCaptureScreen(tester, service);

    expect(service.loadCalls, 0);
    expect(find.text('Ready for capture'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Start'));
    await tester.pump();
    await _pumpUntilFound(tester, find.text('Camera unavailable'));

    expect(service.loadCalls, 1);
    expect(find.text('Camera unavailable'), findsOneWidget);
    expect(
      find.text('The device camera could not be started.'),
      findsOneWidget,
    );
  });

  testWidgets('camera unavailable state can return to overview', (
    WidgetTester tester,
  ) async {
    final service = _NoCameraCaptureService();

    await _pumpCaptureScreen(tester, service);

    await tester.tap(find.widgetWithText(FilledButton, 'Start'));
    await tester.pump();
    await _pumpUntilFound(tester, find.text('Camera unavailable'));

    await tester.tap(find.widgetWithText(OutlinedButton, 'Back'));
    await tester.pumpAndSettle();

    expect(find.text('Ready for capture'), findsOneWidget);
    expect(find.text('Gallery imports blocked'), findsOneWidget);
  });

  testWidgets('permission errors show camera-specific guidance', (
    WidgetTester tester,
  ) async {
    final service = _ThrowingCameraCaptureService(
      CameraException('CameraAccessDenied', 'Permission denied'),
    );

    await _pumpCaptureScreen(tester, service);

    await tester.tap(find.widgetWithText(FilledButton, 'Start'));
    await tester.pump();
    await _pumpUntilFound(
      tester,
      find.text('Camera permission is required to create discoveries.'),
    );

    expect(service.loadCalls, 1);
    expect(
      find.text('Camera permission is required to create discoveries.'),
      findsOneWidget,
    );
    expect(find.text('Gallery imports blocked'), findsNothing);

    await tester.tap(find.widgetWithText(OutlinedButton, 'Try again'));
    await tester.pump();
    await _pumpUntilFound(
      tester,
      find.text('Camera permission is required to create discoveries.'),
    );

    expect(service.loadCalls, 2);
  });
}

Future<void> _pumpCaptureScreen(
  WidgetTester tester,
  CameraCaptureService service,
) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [cameraCaptureServiceProvider.overrideWithValue(service)],
      child: MaterialApp(
        theme: TaxaTheme.light(),
        builder: (context, child) {
          final mediaQuery = MediaQuery.of(context);

          return MediaQuery(
            data: mediaQuery.copyWith(disableAnimations: true),
            child: child ?? const SizedBox.shrink(),
          );
        },
        home: const Scaffold(body: CaptureScreen()),
      ),
    ),
  );
}

Future<void> _pumpUntilFound(
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

  expect(
    finder,
    findsWidgets,
    reason: 'Timed out waiting for the expected widget.',
  );
}

class _NoCameraCaptureService implements CameraCaptureService {
  var loadCalls = 0;

  @override
  Future<List<CameraDescription>> loadAvailableCameras() async {
    loadCalls += 1;
    return const [];
  }

  @override
  CameraController createController(CameraDescription description) {
    throw UnsupportedError('No camera controller is created in this test.');
  }
}

class _ThrowingCameraCaptureService implements CameraCaptureService {
  _ThrowingCameraCaptureService(this.error);

  final Object error;
  var loadCalls = 0;

  @override
  Future<List<CameraDescription>> loadAvailableCameras() async {
    loadCalls += 1;
    throw error;
  }

  @override
  CameraController createController(CameraDescription description) {
    throw UnsupportedError('No camera controller is created in this test.');
  }
}
