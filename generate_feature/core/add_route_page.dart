import 'dart:io';

import '../utils/capitalize_first_character.dart';

void addRoutePage(String featureName) {
  const appRouterFilePath = 'lib/core/routing/app_router.dart';
  final appRouterFile = File(appRouterFilePath);

  if (!appRouterFile.existsSync()) {
    print('\x1B[31mError: app_router.dart file not found\x1B[0m');
    return;
  }

  final importLines = '''
import '../../features/$featureName/ui/${featureName}_screen.dart';
import '../../features/$featureName/logic/${featureName}_cubit.dart';
''';

  final newRouteCase = '''
      case Routes.${featureName}Screen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ${capitalizeFirstCharacter(featureName)}Cubit(getIt()),
            child: const ${capitalizeFirstCharacter(featureName)}Screen(),
          ),
        );
''';

  var appRouterContent = appRouterFile.readAsStringSync();

  final importLinesList = importLines.split('\n').where((line) => line.trim().isNotEmpty).toList();
  bool importsAdded = false;

  for (final importLine in importLinesList) {
    if (!appRouterContent.contains(importLine)) {
      final updatedContentWithImports = importLines + appRouterContent;
      appRouterContent = updatedContentWithImports;
      importsAdded = true;
      break;
    }
  }

  if (importsAdded) {
    print('\x1B[32mImports added successfully for $featureName ✅\x1B[0m');
  } else {
    print('\x1B[33mImports already exist for $featureName\x1B[0m');
  }

  if (!appRouterContent.contains('${featureName}Screen')) {
    final defaultStart = appRouterContent.indexOf('default:');

    if (defaultStart == -1) {
      print('\x1B[31mError: default statement not found\x1B[0m');
      return;
    }

    final switchStart = appRouterContent.lastIndexOf('switch (settings.name)');

    if (switchStart == -1) {
      print('\x1B[31mError: switch statement not found\x1B[0m');
      return;
    }

    final updatedContent =
        '${appRouterContent.substring(0, defaultStart)}$newRouteCase\n${appRouterContent.substring(defaultStart)}';

    final formattedContent = formatCode(updatedContent);

    appRouterFile.writeAsStringSync(formattedContent);
    print('\x1B[32mRoute case added and formatted successfully for $featureName ✅\x1B[0m');
  } else {
    print('\x1B[33mRoute case already exists for $featureName\x1B[0m');
  }
}

String formatCode(String code) {
  final tempFile = File('temp.dart');
  tempFile.writeAsStringSync(code);

  Process.runSync('dart', ['format', tempFile.path]);

  final formattedCode = tempFile.readAsStringSync();
  tempFile.deleteSync();

  return formattedCode;
}
