import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/signup_api_service.dart';
import '../models/signup_response_model.dart';

class SignupRepo {
  final SignupApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponseModel>> getData() async {
    try {
      final response = await _apiService.getData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
