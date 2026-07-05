import 'dart:convert';

import 'package:camera/camera.dart';

class PendingCameraCapture {
  const PendingCameraCapture({
    required this.image,
    required this.capturedAt,
    required this.cameraName,
    required this.lensDirection,
  });

  final XFile image;
  final DateTime capturedAt;
  final String cameraName;
  final CameraLensDirection lensDirection;

  String get metadataJson {
    return jsonEncode({
      'source': 'camera',
      'cameraName': cameraName,
      'lensDirection': lensDirection.name,
      'capturedAt': capturedAt.toUtc().toIso8601String(),
    });
  }
}
