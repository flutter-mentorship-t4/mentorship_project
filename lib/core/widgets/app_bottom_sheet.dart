import 'package:flutter/material.dart';

import '../config/theming/colors.dart';

abstract class AppBottomSheet {
  static show(
    BuildContext context, {
    required Widget content,
    Color? backgroundColor,
    double borderRadius = 20,
    bool isDismissible = true,
    bool isScrollControlled = true,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      isDismissible: isDismissible,
      useSafeArea: true,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor ?? ColorsManager.white,
      builder: (_) {
        return SizedBox(
          width: double.infinity,
          child: content,
        );
      },
    );
  }
}
