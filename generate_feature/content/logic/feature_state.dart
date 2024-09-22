import '../../utils/capitalize_first_character.dart';

String featureState(String featureName) {
  return '''
import '../../../core/networking/api_error_model.dart';

sealed class ${capitalizeFirstCharacter(featureName)}State {}

class ${capitalizeFirstCharacter(featureName)}InitialState extends ${capitalizeFirstCharacter(featureName)}State {}

class ${capitalizeFirstCharacter(featureName)}LoadingState extends ${capitalizeFirstCharacter(featureName)}State {}

class ${capitalizeFirstCharacter(featureName)}SuccessState<T> extends ${capitalizeFirstCharacter(featureName)}State {
  final T data;
  ${capitalizeFirstCharacter(featureName)}SuccessState(this.data);
}

class ${capitalizeFirstCharacter(featureName)}ErrorState extends ${capitalizeFirstCharacter(featureName)}State {
  final ApiErrorModel apiErrorModel;
  ${capitalizeFirstCharacter(featureName)}ErrorState(this.apiErrorModel);
}

''';
}
