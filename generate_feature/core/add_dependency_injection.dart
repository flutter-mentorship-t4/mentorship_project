import 'dart:io';

import '../utils/capitalize_first_character.dart';

void addDependencyInjection(String featureName) {
  const diFilePath = 'lib/core/di/dependency_injection.dart';
  final diFile = File(diFilePath);

  if (!diFile.existsSync()) {
    print('\x1B[31mError: dependency_injection.dart file not found\x1B[0m');
    return;
  }

  final importLines = '''
import '../../features/$featureName/data/apis/${featureName}_api_service.dart';
import '../../features/$featureName/data/repos/${featureName}_repo.dart';
''';

  final linesToAdd = '''
    
  // ${capitalizeFirstCharacter(featureName)}
  getIt.registerLazySingleton<${capitalizeFirstCharacter(featureName)}ApiService>(() => ${capitalizeFirstCharacter(featureName)}ApiService(dio));
  getIt.registerLazySingleton<${capitalizeFirstCharacter(featureName)}Repo>(() => ${capitalizeFirstCharacter(featureName)}Repo(getIt()));
''';

  var diContent = diFile.readAsStringSync();

  if (!diContent.contains("${featureName}_api_service.dart") &&
      !diContent.contains("${featureName}_repo.dart")) {
    diContent = importLines + diContent;
    print('\x1B[32mImports added successfully for $featureName ✅\x1B[0m');
  } else {
    print('\x1B[33mImports already exist for $featureName\x1B[0m');
  }

  final setupMethodStart = diContent.indexOf('Future<void> setupGetIt');
  final setupMethodEnd = diContent.indexOf('}', setupMethodStart);

  if (setupMethodStart == -1 || setupMethodEnd == -1) {
    print('\x1B[31mError: setupGetIt method not found\x1B[0m');
    return;
  }

  final setupMethodContent = diContent.substring(setupMethodStart, setupMethodEnd);

  if (!setupMethodContent.contains('${capitalizeFirstCharacter(featureName)}ApiService') &&
      !setupMethodContent.contains('${capitalizeFirstCharacter(featureName)}Repo')) {
    diContent =
        diContent.substring(0, setupMethodEnd) + linesToAdd + diContent.substring(setupMethodEnd);

    print(
        '\x1B[32mDependency injection updated successfully for $featureName inside setupGetIt ✅\x1B[0m');
  } else {
    print(
        '\x1B[33mDependency injection already contains registrations for $featureName inside setupGetIt\x1B[0m');
  }

  diFile.writeAsStringSync(diContent);
}
