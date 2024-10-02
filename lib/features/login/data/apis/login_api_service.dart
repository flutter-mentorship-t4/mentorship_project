import 'package:dio/dio.dart';
import 'package:mentorship_project/core/networking/api_constants.dart';
import 'package:mentorship_project/features/login/data/apis/login_api_constants.dart';
import 'package:mentorship_project/features/login/data/models/login_request_body_model.dart';
import 'package:mentorship_project/features/login/data/models/login_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl :ApiConstants.apiBaseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST(LoginApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestBodyModel loginRequestBodyModel);
  
}
