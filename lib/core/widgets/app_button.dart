import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theming/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.backgroundColor,
    this.textColor,
    this.width = 0,
    this.vPadding = 14,
    this.hPadding = 20,
    this.borderRadius = 10,
    this.borderColor = ColorsManager.transparent,
    this.elevation = 0.5,
    this.fontSize = 14,
    required this.onTap,
    this.icon,
    this.textStyle,
    this.isIconEnd = false,
    this.iconSpacing = 10,
  });

  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final double width;
  final double vPadding;
  final double hPadding;
  final double borderRadius;
  final Color borderColor;
  final double elevation;
  final double fontSize;
  final Function() onTap;
  final Widget? icon;
  final bool isIconEnd;
  final double iconSpacing;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: backgroundColor ?? ColorsManager.primaryColor,
      minWidth: width,
      elevation: elevation,
      highlightElevation: 0,
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isIconEnd ? const SizedBox.shrink() : icon ?? const SizedBox.shrink(),
          isIconEnd
              ? const SizedBox.shrink()
              : icon == null
                  ? const SizedBox.shrink()
                  : SizedBox(width: iconSpacing),
          Text(
            label,
            style: textStyle ??
                TextStyle(color: textColor ?? ColorsManager.white, fontSize: fontSize.sp),
          ),
          !isIconEnd
              ? const SizedBox.shrink()
              : icon == null
                  ? const SizedBox.shrink()
                  : SizedBox(width: iconSpacing),
          !isIconEnd ? const SizedBox.shrink() : icon ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
