import '../../../utils/capitalize_first_character.dart';

String featureApiService(String featureName) {
  return '''
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part '${featureName}_api_service.g.dart';

@RestApi(baseUrl : 'ENTER_BASE_URL_HERE')
abstract class ${capitalizeFirstCharacter(featureName)}ApiService {
  factory ${capitalizeFirstCharacter(featureName)}ApiService(Dio dio) = _${capitalizeFirstCharacter(featureName)}ApiService;

  // HTTP REQUESTS
  @GET('ENTER_ENDPOINT_HERE')
  Future getData();
}
''';
}
