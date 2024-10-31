import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../home/data/models/products_model.dart';

part 'categories_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class CategoriesApiService {
  factory CategoriesApiService(Dio dio) = _CategoriesApiService;

  // HTTP REQUESTS
  @GET(ApiConstants.categories)
  Future<List<String>> getCategories();

  @GET('${ApiConstants.products}/category/{categoryName}')
  Future<List<ProductModel>> getProductsByCategory(@Path('categoryName') String categoryName);
}
