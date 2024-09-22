import 'dart:io';

void generatingFolders(String featurePath) {
  final List<String> directories = [
    '$featurePath/data/apis',
    '$featurePath/data/models',
    '$featurePath/data/repos',
    '$featurePath/logic',
    '$featurePath/ui/widgets',
  ];

  try {
    for (var dir in directories) {
      final directory = Directory(dir);
      final relativePath = dir.substring(dir.indexOf('/lib'));
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
        print('Created folder: $relativePath ✓');
      } else {
        print('\x1B[31mDirectory already exists:\x1B[0m $relativePath');
      }
    }
    print('\x1B[32mFolders created successfully ✅ 👍\x1B[0m\n');
  } catch (e) {
    print('\x1B[31mFailed created Directory\x1B[0m');
  }
}
