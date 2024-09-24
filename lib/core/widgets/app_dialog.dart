import 'package:flutter/material.dart';

abstract class AppDialog {
  static show(
    BuildContext context, {
    required Widget content,
    Color? backgroundColor,
    double borderRadius = 20,
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: isDismissible,
      builder: (_) {
        return Dialog(
          backgroundColor: backgroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          child: SizedBox(
            width: double.infinity,
            child: content,
          ),
        );
      },
    );
  }
}
