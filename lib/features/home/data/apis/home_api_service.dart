import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl : 'ENTER_BASE_URL_HERE')
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  // HTTP REQUESTS
  @GET('ENTER_ENDPOINT_HERE')
  Future getData();
}
