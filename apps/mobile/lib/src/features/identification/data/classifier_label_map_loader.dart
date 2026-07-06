import 'package:flutter/services.dart';

import '../domain/classifier_label_map.dart';

abstract interface class ClassifierLabelMapLoader {
  Future<ClassifierLabelMap> load(String assetPath);
}

class AssetClassifierLabelMapLoader implements ClassifierLabelMapLoader {
  AssetClassifierLabelMapLoader({AssetBundle? bundle})
    : _bundle = bundle ?? rootBundle;

  final AssetBundle _bundle;

  @override
  Future<ClassifierLabelMap> load(String assetPath) async {
    final source = await _bundle.loadString(assetPath);
    return ClassifierLabelMap.fromJsonString(source);
  }
}
