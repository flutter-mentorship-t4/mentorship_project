import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theming/colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.backgroundColor,
    this.width = 0,
    this.vPadding = 15,
    this.hPadding = 15,
    this.borderColor = ColorsManager.transparent,
    this.elevation = 0,
    required this.onTap,
    required this.icon,
  });

  final Color? backgroundColor;
  final double width;
  final double vPadding;
  final double hPadding;
  final Color borderColor;
  final double elevation;
  final Function() onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: backgroundColor ?? ColorsManager.primaryColor,
      minWidth: width,
      elevation: elevation,
      highlightElevation: 0,
      padding: EdgeInsets.symmetric(vertical: vPadding.h, horizontal: hPadding.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(color: borderColor),
      ),
      child: icon,
    );
  }
}
