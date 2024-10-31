import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/products_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  // // HTTP REQUESTS
  // @GET(ApiConstants.categories)
  // Future<List<String>> getCategories();

  @GET(ApiConstants.products)
  Future<List<ProductModel>> getProducts();
}
