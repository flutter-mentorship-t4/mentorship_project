import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../config/theming/colors.dart';
import '../helpers/extensions/widgets_extentions.dart';
import '../helpers/spacing.dart';

class ProductShimmerLoading extends StatelessWidget {
  const ProductShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 2.5 / 4,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: ColorsManager.grey,
              highlightColor: ColorsManager.white,
              child: Container(
                height: 204.h,
                width: 156.w,
                decoration: BoxDecoration(color: ColorsManager.grey, borderRadius: BorderRadius.circular(13)),
              ),
            ).expanded(),
            verticalSpace(10),
            //title
            Shimmer.fromColors(
                baseColor: ColorsManager.grey,
                highlightColor: ColorsManager.white,
                child: Container(
                  height: 15.h,
                  width: 150.w,
                  decoration: BoxDecoration(color: ColorsManager.grey, borderRadius: BorderRadius.circular(13)),
                )),

            verticalSpace(5),
            //price
            Shimmer.fromColors(
                baseColor: ColorsManager.grey,
                highlightColor: ColorsManager.white,
                child: Container(
                  height: 15.h,
                  width: 60.w,
                  decoration: BoxDecoration(color: ColorsManager.grey, borderRadius: BorderRadius.circular(13)),
                )),
          ],
        );
      },
    );
  }
}
