import 'dart:io';

void addRoute(String featureName) {
  const routesFilePath = 'lib/core/routing/routes.dart';
  final routesFile = File(routesFilePath);

  if (!routesFile.existsSync()) {
    print('\x1B[31mError: routes.dart file not found\x1B[0m');
    return;
  }

  final newRoute = '  static const String ${featureName}Screen = \'/${featureName}Screen\';\n';

  var routesContent = routesFile.readAsStringSync();

  if (!routesContent.contains('${featureName}Screen')) {
    final classStart = routesContent.indexOf('class Routes');
    final classEnd = routesContent.indexOf('}', classStart);

    if (classStart == -1 || classEnd == -1) {
      print('\x1B[31mError: class Routes not found\x1B[0m');
      return;
    }

    final updatedContent =
        '${routesContent.substring(0, classEnd)}$newRoute${routesContent.substring(classEnd)}';

    routesFile.writeAsStringSync(updatedContent);
    print('\x1B[32mRoute added successfully for $featureName ✅\x1B[0m');
  } else {
    print('\x1B[33mRoute already exists for $featureName\x1B[0m');
  }
}
