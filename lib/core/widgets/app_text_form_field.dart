import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theming/colors.dart';
import '../config/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final bool enabled;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.mainRed,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.greyD9,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
        disabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.greyD9,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.mainRed,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        hintStyle: hintStyle ?? TextStyles.font18Grey79Regular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        fillColor: backgroundColor ?? ColorsManager.transparent,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font18BlackRegular,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
