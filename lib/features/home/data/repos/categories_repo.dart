import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/home_api_service.dart';
import '../models/categories_response_model.dart';

class CategoriesRepo {
  final HomeApiService _apiService;

  CategoriesRepo(this._apiService);

  Future<ApiResult<CategoriesResponseModel>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
