import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/home_api_service.dart';
import '../models/products_response_model.dart';

class ProductsRepo {
  final HomeApiService _apiService;

  ProductsRepo(this._apiService);

  Future<ApiResult<ProductsResponseModel>> getProducts() async {
    try {
      final response = await _apiService.getProducts();
      print('$response');
      print('success ----------------------------------');
      return ApiResult.success(response);
    } catch (error) {
      print('error ----------------------------------');
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
