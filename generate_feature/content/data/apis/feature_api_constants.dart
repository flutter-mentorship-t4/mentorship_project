import '../../../utils/capitalize_first_character.dart';

String featureApiConstants(String featureName) {
  return '''
class ${capitalizeFirstCharacter(featureName)}ApiConstants{
  static const String ${featureName}EP = '$featureName';
}
''';
}
