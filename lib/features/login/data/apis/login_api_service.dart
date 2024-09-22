import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl : 'ENTER_BASE_URL_HERE')
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  // HTTP REQUESTS
  @GET('ENTER_ENDPOINT_HERE')
  Future getData();
}
