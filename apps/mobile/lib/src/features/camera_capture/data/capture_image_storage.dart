import 'dart:io';

import 'package:camera/camera.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

abstract interface class CaptureImageStorage {
  Future<String> saveCameraImage(XFile image);
}

class AppSupportCaptureImageStorage implements CaptureImageStorage {
  AppSupportCaptureImageStorage({Uuid? uuid}) : _uuid = uuid ?? const Uuid();

  final Uuid _uuid;

  @override
  Future<String> saveCameraImage(XFile image) async {
    final directory = await getApplicationSupportDirectory();
    final capturesDirectory = Directory(p.join(directory.path, 'captures'));
    await capturesDirectory.create(recursive: true);

    final extension = p.extension(image.path).isEmpty
        ? '.jpg'
        : p.extension(image.path);
    final targetPath = p.join(
      capturesDirectory.path,
      '${_uuid.v4()}$extension',
    );
    await image.saveTo(targetPath);

    return targetPath;
  }
}
