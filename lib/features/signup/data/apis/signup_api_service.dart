import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'signup_api_service.g.dart';

@RestApi(baseUrl : 'ENTER_BASE_URL_HERE')
abstract class SignupApiService {
  factory SignupApiService(Dio dio) = _SignupApiService;

  // HTTP REQUESTS
  @GET('ENTER_ENDPOINT_HERE')
  Future getData();
}
