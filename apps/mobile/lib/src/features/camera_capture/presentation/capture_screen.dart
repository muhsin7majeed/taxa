import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/taxa_theme_extensions.dart';
import '../../../core/widgets/feature_status_panel.dart';
import '../../../core/widgets/taxa_capture_action.dart';
import '../../../core/widgets/taxa_info_tile.dart';
import '../../../core/widgets/taxa_screen.dart';
import '../../../core/widgets/taxa_section_header.dart';
import '../data/camera_capture_service.dart';
import '../data/capture_attempt_providers.dart';
import '../domain/pending_camera_capture.dart';

enum _CaptureMode { overview, liveCamera, preview }

class CaptureScreen extends ConsumerStatefulWidget {
  const CaptureScreen({super.key});

  @override
  ConsumerState<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends ConsumerState<CaptureScreen> {
  _CaptureMode _mode = _CaptureMode.overview;
  PendingCameraCapture? _pendingCapture;
  String? _lastSavedCaptureId;
  bool _isConfirming = false;

  @override
  Widget build(BuildContext context) {
    return switch (_mode) {
      _CaptureMode.overview => _CaptureOverview(
        lastSavedCaptureId: _lastSavedCaptureId,
        onStartCapture: () {
          setState(() {
            _lastSavedCaptureId = null;
            _mode = _CaptureMode.liveCamera;
          });
        },
      ),
      _CaptureMode.liveCamera => _LiveCameraCapture(
        onCancel: _returnToOverview,
        onCaptured: (capture) {
          setState(() {
            _pendingCapture = capture;
            _mode = _CaptureMode.preview;
          });
        },
      ),
      _CaptureMode.preview => _CapturedImagePreview(
        capture: _pendingCapture,
        isConfirming: _isConfirming,
        onRetake: () {
          setState(() {
            _pendingCapture = null;
            _mode = _CaptureMode.liveCamera;
          });
        },
        onConfirm: _confirmCapture,
      ),
    };
  }

  Future<void> _confirmCapture() async {
    final capture = _pendingCapture;
    if (capture == null || _isConfirming) {
      return;
    }

    setState(() {
      _isConfirming = true;
    });

    try {
      final storedPath = await ref
          .read(captureImageStorageProvider)
          .saveCameraImage(capture.image);
      final attempt = await ref
          .read(captureAttemptRepositoryProvider)
          .recordCameraCapture(
            imagePath: storedPath,
            capturedAt: capture.capturedAt,
            metadataJson: capture.metadataJson,
          );

      if (!mounted) {
        return;
      }

      setState(() {
        _lastSavedCaptureId = attempt.id;
        _pendingCapture = null;
        _isConfirming = false;
        _mode = _CaptureMode.overview;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isConfirming = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Capture could not be saved locally.')),
      );
    }
  }

  void _returnToOverview() {
    setState(() {
      _pendingCapture = null;
      _mode = _CaptureMode.overview;
    });
  }
}

class _CaptureOverview extends StatelessWidget {
  const _CaptureOverview({
    required this.onStartCapture,
    required this.lastSavedCaptureId,
  });

  final VoidCallback onStartCapture;
  final String? lastSavedCaptureId;

  @override
  Widget build(BuildContext context) {
    return TaxaScreen(
      children: [
        const TaxaSectionHeader(
          title: 'Camera fieldwork',
          subtitle: 'Discoveries start with a live in-app capture.',
        ),
        FeatureStatusPanel(
          icon: Icons.photo_camera_outlined,
          eyebrow: 'Capture gate',
          title: 'Ready for capture',
          body: 'Discoveries begin from the in-app camera flow only.',
          action: TaxaCaptureAction(
            label: 'Camera module ready',
            subtitle: 'No gallery import or upload path is exposed here.',
            enabled: true,
            onPressed: onStartCapture,
          ),
        ),
        if (lastSavedCaptureId != null)
          TaxaInfoTile(
            icon: Icons.task_alt_outlined,
            title: 'Capture saved locally',
            subtitle:
                'Capture attempt ${lastSavedCaptureId!} is ready for identification.',
          ),
        const TaxaSectionHeader(
          title: 'MVP rules',
          subtitle: 'The shell keeps the anti-cheat boundary visible.',
        ),
        const TaxaInfoTile(
          icon: Icons.no_photography_outlined,
          title: 'Gallery imports blocked',
          subtitle: 'The shell exposes no upload or picker entry point.',
        ),
        const TaxaInfoTile(
          icon: Icons.offline_bolt_outlined,
          title: 'Offline first',
          subtitle: 'Capture metadata is written to SQLite first.',
        ),
      ],
    );
  }
}

class _LiveCameraCapture extends ConsumerStatefulWidget {
  const _LiveCameraCapture({required this.onCancel, required this.onCaptured});

  final VoidCallback onCancel;
  final ValueChanged<PendingCameraCapture> onCaptured;

  @override
  ConsumerState<_LiveCameraCapture> createState() => _LiveCameraCaptureState();
}

class _LiveCameraCaptureState extends ConsumerState<_LiveCameraCapture>
    with WidgetsBindingObserver {
  CameraController? _controller;
  CameraDescription? _camera;
  Object? _error;
  bool _isInitializing = true;
  bool _isTakingPicture = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initialize();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;

    if (_isInitializing) {
      return const TaxaScreen(
        children: [
          TaxaSectionHeader(
            title: 'Camera',
            subtitle: 'Opening the device camera.',
          ),
          FeatureStatusPanel(
            icon: Icons.photo_camera_outlined,
            title: 'Preparing camera',
            body: 'Taxa is connecting to the live camera feed.',
          ),
        ],
      );
    }

    if (_error != null ||
        controller == null ||
        !controller.value.isInitialized) {
      return TaxaScreen(
        children: [
          const TaxaSectionHeader(
            title: 'Camera',
            subtitle: 'Live capture is required for discoveries.',
          ),
          FeatureStatusPanel(
            icon: Icons.error_outline,
            title: 'Camera unavailable',
            body: _cameraErrorMessage(_error),
            action: OutlinedButton.icon(
              onPressed: _initialize,
              icon: const Icon(Icons.refresh),
              label: const Text('Try again'),
            ),
          ),
          OutlinedButton.icon(
            onPressed: widget.onCancel,
            icon: const Icon(Icons.arrow_back),
            label: const Text('Back'),
          ),
        ],
      );
    }

    return TaxaScreen(
      children: [
        TaxaSectionHeader(
          title: 'Live camera',
          subtitle: _camera == null
              ? 'Frame the animal clearly.'
              : 'Using ${_camera!.name}. Frame the animal clearly.',
        ),
        _CameraPreviewPanel(controller: controller),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _isTakingPicture ? null : widget.onCancel,
                icon: const Icon(Icons.close),
                label: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: _isTakingPicture ? null : _takePicture,
                icon: _isTakingPicture
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.camera_alt_outlined),
                label: Text(_isTakingPicture ? 'Capturing' : 'Capture'),
              ),
            ),
          ],
        ),
        const TaxaInfoTile(
          icon: Icons.no_photography_outlined,
          title: 'Camera only',
          subtitle: 'Discoveries cannot be created from gallery uploads.',
        ),
      ],
    );
  }

  Future<void> _initialize() async {
    setState(() {
      _isInitializing = true;
      _error = null;
    });

    try {
      await _controller?.dispose();
      final service = ref.read(cameraCaptureServiceProvider);
      final cameras = await service.loadAvailableCameras();
      if (!mounted) {
        return;
      }

      if (cameras.isEmpty) {
        setState(() {
          _error = StateError('No cameras found');
          _isInitializing = false;
        });
        return;
      }

      final camera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      final controller = service.createController(camera);
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }

      setState(() {
        _camera = camera;
        _controller = controller;
        _isInitializing = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _error = error;
        _isInitializing = false;
      });
    }
  }

  Future<void> _takePicture() async {
    final controller = _controller;
    final camera = _camera;
    if (controller == null || camera == null || _isTakingPicture) {
      return;
    }

    setState(() {
      _isTakingPicture = true;
    });

    try {
      final image = await controller.takePicture();
      if (!mounted) {
        return;
      }

      widget.onCaptured(
        PendingCameraCapture(
          image: image,
          capturedAt: DateTime.now().toUtc(),
          cameraName: camera.name,
          lensDirection: camera.lensDirection,
        ),
      );
    } catch (_) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not capture an image.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isTakingPicture = false;
        });
      }
    }
  }

  String _cameraErrorMessage(Object? error) {
    if (error is CameraException) {
      return switch (error.code) {
        'CameraAccessDenied' || 'CameraAccessDeniedWithoutPrompt' =>
          'Camera permission is required to create discoveries.',
        'CameraAccessRestricted' =>
          'Camera access is restricted on this device.',
        _ =>
          'The camera could not be started: ${error.description ?? error.code}.',
      };
    }

    return 'The device camera could not be started.';
  }
}

class _CameraPreviewPanel extends StatelessWidget {
  const _CameraPreviewPanel({required this.controller});

  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    final colors = context.taxaColors;
    final radii = context.taxaRadii;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radii.lg),
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: DecoratedBox(
          decoration: BoxDecoration(color: colors.captureOverlay),
          child: CameraPreview(controller),
        ),
      ),
    );
  }
}

class _CapturedImagePreview extends StatelessWidget {
  const _CapturedImagePreview({
    required this.capture,
    required this.isConfirming,
    required this.onRetake,
    required this.onConfirm,
  });

  final PendingCameraCapture? capture;
  final bool isConfirming;
  final VoidCallback onRetake;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final capture = this.capture;

    if (capture == null) {
      return TaxaScreen(
        children: [
          const FeatureStatusPanel(
            icon: Icons.error_outline,
            title: 'Preview unavailable',
            body: 'The captured image is no longer available.',
          ),
          OutlinedButton.icon(
            onPressed: onRetake,
            icon: const Icon(Icons.refresh),
            label: const Text('Retake'),
          ),
        ],
      );
    }

    return TaxaScreen(
      children: [
        const TaxaSectionHeader(
          title: 'Confirm capture',
          subtitle: 'Save this live camera image before identification.',
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(context.taxaRadii.lg),
          child: Image.file(
            File(capture.image.path),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const FeatureStatusPanel(
                icon: Icons.image_not_supported_outlined,
                title: 'Preview image unavailable',
                body: 'The capture can be retaken from the live camera.',
              );
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: isConfirming ? null : onRetake,
                icon: const Icon(Icons.refresh),
                label: const Text('Retake'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: isConfirming ? null : onConfirm,
                icon: isConfirming
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.check),
                label: Text(isConfirming ? 'Saving' : 'Confirm'),
              ),
            ),
          ],
        ),
        const TaxaInfoTile(
          icon: Icons.offline_bolt_outlined,
          title: 'Saved locally first',
          subtitle: 'Confirming stores the capture attempt in SQLite.',
        ),
      ],
    );
  }
}
