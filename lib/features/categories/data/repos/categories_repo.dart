import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/categories_api_service.dart';
import '../models/categories_response_model.dart';

class CategoriesRepo {
  final CategoriesApiService _apiService;

  CategoriesRepo(this._apiService);

  Future<ApiResult<CategoriesResponseModel>> getData() async {
    try {
      final response = await _apiService.getData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
