import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.backgroundColor,
    this.width = 0,
    this.vPadding = 15,
    this.hPadding = 15,
    this.borderColor = Colors.transparent,
    this.elevation = 0.5,
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
      color: backgroundColor ?? Theme.of(context).primaryColor,
      minWidth: width,
      elevation: elevation,
      highlightElevation: 0,
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(color: borderColor),
      ),
      child: icon,
    );
  }
}
