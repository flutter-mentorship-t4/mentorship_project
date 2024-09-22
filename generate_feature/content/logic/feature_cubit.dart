import '../../utils/capitalize_first_character.dart';

String featureCubit(String featureName) {
  return '''
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/${featureName}_repo.dart';
import '${featureName}_state.dart';

class ${capitalizeFirstCharacter(featureName)}Cubit extends Cubit<${capitalizeFirstCharacter(featureName)}State> {
  final ${capitalizeFirstCharacter(featureName)}Repo _${featureName}Repo;
  ${capitalizeFirstCharacter(featureName)}Cubit(this._${featureName}Repo) : super(${capitalizeFirstCharacter(featureName)}InitialState());
}

''';
}
