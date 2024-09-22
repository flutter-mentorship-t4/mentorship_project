import 'dart:io';

import 'core/add_dependency_injection.dart';
import 'core/add_route.dart';
import 'core/add_route_page.dart';
import 'utils/generating_files.dart';
import 'utils/generating_folder.dart';
import 'utils/is_english_name.dart';
import 'utils/run_commands.dart';

void main() {
  stdout.write('\x1B[32mEnter feature name:\x1B[0m ');
  String? featureName = stdin.readLineSync()?.trim() ?? '';

  if (featureName.isEmpty) {
    print('\x1B[31mError: Feature name cannot be empty. Exiting...\x1B[0m');
    exit(1);
  }

  if (!isEnglishName(featureName)) {
    print('\x1B[31mError: Feature name must be in English. Exiting...\x1B[0m');
    exit(1);
  }

  final String featurePath = "${Directory.current.path}/lib/features/$featureName";

  if (Directory(featurePath).existsSync()) {
    print('\x1B[31mFeature already exists: $featureName\x1B[0m');
    return;
  }

  generatingFolders(featurePath);

  generatingFiles(featureName);

  runCommands(featurePath, onSuccess: () {
    addDependencyInjection(featureName);
    addRoute(featureName);
    addRoutePage(featureName);
  });
}
