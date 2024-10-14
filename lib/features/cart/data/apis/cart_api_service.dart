import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api_service.g.dart';

@RestApi(baseUrl : 'ENTER_BASE_URL_HERE')
abstract class CartApiService {
  factory CartApiService(Dio dio) = _CartApiService;

  // HTTP REQUESTS
  @GET('ENTER_ENDPOINT_HERE')
  Future getData();
}
