import 'package:mentorship_project/features/login/data/models/login_request_body_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/login_api_service.dart';
import '../models/login_response_model.dart';

class LoginRepo {
  final LoginApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponseModel>> login(
      LoginRequestBodyModel loginRequestBodyModel) async {
    try {
      final response = await _apiService.login(loginRequestBodyModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
