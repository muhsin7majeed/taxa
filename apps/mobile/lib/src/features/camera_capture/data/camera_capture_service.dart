import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract interface class CameraCaptureService {
  Future<List<CameraDescription>> loadAvailableCameras();

  CameraController createController(CameraDescription description);
}

class PluginCameraCaptureService implements CameraCaptureService {
  const PluginCameraCaptureService();

  @override
  Future<List<CameraDescription>> loadAvailableCameras() {
    return availableCameras();
  }

  @override
  CameraController createController(CameraDescription description) {
    return CameraController(
      description,
      ResolutionPreset.high,
      enableAudio: false,
    );
  }
}

final cameraCaptureServiceProvider = Provider<CameraCaptureService>((ref) {
  return const PluginCameraCaptureService();
});
