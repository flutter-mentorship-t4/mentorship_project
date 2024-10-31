import 'package:flutter/material.dart';

import '../../../../core/config/theming/colors.dart';
import '../../../../core/config/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasMinLong,
    required this.hasSpecChar,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasMinLong;
  final bool hasSpecChar;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('8 Character Minimum ', hasMinLong),
        buildValidationRow('One UpperCase Character ', hasUpperCase),
        buildValidationRow('One LowerCase Character ', hasLowerCase),
        buildValidationRow('One Special Character', hasSpecChar),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: hasValidated ? ColorsManager.mainGreen : ColorsManager.primaryColor,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font14PrimaryRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.mainGreen : ColorsManager.primaryColor,
          ),
        )
      ],
    );
  }
}
