import 'dart:io';

import 'delete_feature.dart';

List<String> commands = [
  'flutter pub run build_runner build --delete-conflicting-outputs',
];

void runCommands(String featurePath, {Function()? onSuccess}) {
  for (var command in commands) {
    _runCommand(
      command,
      featurePath,
      onSuccess: onSuccess,
    );
  }
}

void _runCommand(String command, String featurePath, {Function()? onSuccess}) {
  try {
    // print('🚀 \x1B[32mRunning command:\x1B[0m $command');
    print('🚀 \x1B[32m$command\x1B[0m');
    var parts = command.split(' ');
    var result = Process.runSync(parts[0], parts.sublist(1));

    if (result.exitCode == 0) {
      print(result.stdout);
      print('\x1B[32mGenerated files successfully ✅ 👍\x1B[0m');
      onSuccess?.call();
    } else {
      print('\x1B[31mError running command "$command": ${result.stderr}\x1B[0m');
      deleteFeature(featurePath);
    }
  } catch (e) {
    print('Failed to run command: $command');
    print('\x1B[31mFailed to run command: $command\x1B[0m');
    print(e);
  }
}
