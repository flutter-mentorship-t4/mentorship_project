import '../../../utils/capitalize_first_character.dart';

String featureRepo(String featureName) {
  return '''
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/${featureName}_api_service.dart';
import '../models/${featureName}_response_model.dart';

class ${capitalizeFirstCharacter(featureName)}Repo {
  final ${capitalizeFirstCharacter(featureName)}ApiService _apiService;

  ${capitalizeFirstCharacter(featureName)}Repo(this._apiService);

  Future<ApiResult<${capitalizeFirstCharacter(featureName)}ResponseModel>> getData() async {
    try {
      final response = await _apiService.getData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
''';
}
