import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../collection/data/local_catalog_providers.dart';
import 'capture_attempt_repository.dart';
import 'capture_image_storage.dart';

final captureAttemptRepositoryProvider = Provider<CaptureAttemptRepository>((
  ref,
) {
  return CaptureAttemptRepository(ref.watch(taxaDatabaseProvider));
});

final captureImageStorageProvider = Provider<CaptureImageStorage>((ref) {
  return AppSupportCaptureImageStorage();
});
