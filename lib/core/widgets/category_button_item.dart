import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../config/theming/colors.dart';
import '../config/theming/styles.dart';
import '../helpers/strings/app_icons.dart';

class CategoryButtonItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function() onTap;

  const CategoryButtonItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.primaryColor : ColorsManager.lightPrimary,
          borderRadius: BorderRadius.circular(13.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: isSelected ? TextStyles.font16LightPrimaryRegular : TextStyles.font12PrimaryRegular,
            ),
            isSelected
                ? SizedBox(
                    width: 22.w,
                    height: 22.h,
                    child: SvgPicture.asset(
                      AppIcons.stars,
                      color: ColorsManager.white,
                      width: 22.w,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
