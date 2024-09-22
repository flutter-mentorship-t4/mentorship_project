import 'dart:io';

import '../content/data/apis/feature_api_constants.dart';
import '../content/data/apis/feature_api_service.dart';
import '../content/data/models/feature_response_model.dart';
import '../content/data/repos/feature_repo.dart';
import '../content/logic/feature_cubit.dart';
import '../content/logic/feature_state.dart';
import '../content/ui/feature_screen.dart';

void generatingFiles(String featureName) {
  final Map<String, String> files = {
    'lib/features/$featureName/data/apis/${featureName}_api_constants.dart':
        featureApiConstants(featureName),
    'lib/features/$featureName/data/apis/${featureName}_api_service.dart':
        featureApiService(featureName),
    'lib/features/$featureName/ui/${featureName}_screen.dart': featureScreen(featureName),
    'lib/features/$featureName/logic/${featureName}_cubit.dart': featureCubit(featureName),
    'lib/features/$featureName/logic/${featureName}_state.dart': featureState(featureName),
    'lib/features/$featureName/data/repos/${featureName}_repo.dart': featureRepo(featureName),
    'lib/features/$featureName/data/models/${featureName}_response_model.dart':
        featureResponseModel(featureName),
  };

  try {
    files.forEach((filePath, content) {
      final file = File(filePath);
      if (!file.existsSync()) {
        file.createSync(recursive: true);
        file.writeAsStringSync(content);

        print('Created and formatted file: $filePath ✓');
      } else {
        print('\x1B[31mFile already exists:\x1B[0m $filePath');
      }
    });
    print('\x1B[32mFiles created successfully ✅ 👍\x1B[0m\n');
  } catch (e) {
    print('\x1B[31mFailed created Files\x1B[0m');
  }
}
