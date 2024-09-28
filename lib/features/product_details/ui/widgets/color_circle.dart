import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/theming/colors.dart';
import '../../../../core/config/theming/styles.dart';
import '../../../../generated/localization_keys.g.dart';

class ColorCircle extends StatelessWidget {
  final bool outerBorder;
  final Color color;
  final bool showLabel;

  const ColorCircle({
    required this.color,
    required this.outerBorder,
    required this.showLabel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: outerBorder ? Border.all(color: color, width: 2) : null,
          ),
          child: SizedBox(
            width: 32,
            height: 32,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        if (showLabel)
          Positioned(
            top: -5,
            right: -5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: ColorsManager.lightPrimary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                LocaleKeys.ProductDetailsScreen_Best.tr(),
                style: TextStyles.font10PrimaryRegular,
              ),
            ),
          ),
      ],
    );
  }
}
