import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';
import 'package:mentorship_project/core/helpers/strings/app_icons.dart';

class EmptyWishList extends StatelessWidget {
  const EmptyWishList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.wishlist,
            width: 100.w,
            color: Colors.grey,
          ),
          verticalSpace(16),
          Text(
            'My WishList is Empty',
            style: TextStyles.font20BlackSemiBold,
          ),
          verticalSpace(8),
          Text(
            'Tab Heart button to start Saving Your Favourite items',
            textAlign: TextAlign.center,
            style: TextStyles.font18Grey79Regular,
          ),
        ],
      ),
    );
  }
}
