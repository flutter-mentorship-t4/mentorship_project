import 'dart:io';

void deleteFeature(String featurePath) {
  final featureDirectory = Directory(featurePath);
  if (featureDirectory.existsSync()) {
    featureDirectory.deleteSync(recursive: true);
    print('\x1B[31mFeature deleted due to command failure\x1B[0m');
  }
}
