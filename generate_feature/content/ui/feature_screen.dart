import '../../utils/capitalize_first_character.dart';

String featureScreen(String featureName) {
  return '''
import 'package:flutter/material.dart';

class ${capitalizeFirstCharacter(featureName)}Screen extends StatelessWidget {
  const ${capitalizeFirstCharacter(featureName)}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
''';
}
