import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/cart_api_service.dart';
import '../models/cart_response_model.dart';

class CartRepo {
  final CartApiService _apiService;

  CartRepo(this._apiService);

  Future<ApiResult<CartResponseModel>> getData() async {
    try {
      final response = await _apiService.getData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
