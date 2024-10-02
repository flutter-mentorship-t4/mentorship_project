import 'package:dio/dio.dart';
import 'package:mentorship_project/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../models/categories_response_model.dart';
import '../models/products_response_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  // HTTP REQUESTS
  @GET(ApiConstants.categories)
  Future<CategoriesResponseModel> getCategories();

  @GET(ApiConstants.products)
  Future<ProductsResponseModel> getProducts();
}
