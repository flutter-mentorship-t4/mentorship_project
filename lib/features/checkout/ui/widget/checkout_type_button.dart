import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/widgets/app_button.dart';

class CheckoutTypeButton extends StatelessWidget {
  const CheckoutTypeButton({
    Key? key,
    required this.isSelected,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: label,
      textStyle: isSelected
          ? TextStyles.font18WhiteRegular
          : TextStyles.font18PrimaryRegular,
      onTap: onTap,
      width: 150.w,
      borderRadius: 25,
      backgroundColor:
          isSelected ? ColorsManager.primaryColor : ColorsManager.white,
      borderColor: ColorsManager.primaryColor,
    );
  }
}
