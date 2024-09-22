import '../../../utils/capitalize_first_character.dart';

String featureResponseModel(String featureName) {
  return '''
import 'package:json_annotation/json_annotation.dart';
part '${featureName}_response_model.g.dart';

@JsonSerializable()
class ${capitalizeFirstCharacter(featureName)}ResponseModel {
  String? message;

  ${capitalizeFirstCharacter(featureName)}ResponseModel({this.message});

  factory ${capitalizeFirstCharacter(featureName)}ResponseModel.fromJson(Map<String, dynamic> json) =>
      _\$${capitalizeFirstCharacter(featureName)}ResponseModelFromJson(json);
}
''';
}
