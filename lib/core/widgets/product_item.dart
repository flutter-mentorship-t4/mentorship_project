// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/helpers/extensions/widgets_extentions.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';
import 'package:mentorship_project/core/helpers/strings/app_icons.dart';
import 'package:mentorship_project/core/widgets/app_icon_button.dart';
import 'package:mentorship_project/features/home/data/models/products_model.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.productModel,
    this.CartIcon = AppIcons.cartPlusOutlined,
    this.favIcon = AppIcons.heartOutlined,
    required this.onTapCartIcon,
    required this.onTapFavIcon,
  }) : super(key: key);
  final ProductModel productModel;
  final String CartIcon;
  final String favIcon;
  final Function() onTapCartIcon;
  final Function() onTapFavIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: GridTile(
            header: Row(
              children: [
                AppIconButton(
                  onTap: onTapFavIcon,
                  icon: SvgPicture.asset(
                    favIcon,
                    width: 20.w,
                  ),
                  width: 32.w,
                  backgroundColor: ColorsManager.greyFC,
                  vPadding: 8.w,
                  hPadding: 8.h,
                ).paddingAll(10),
              ],
            ),
            footer: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppIconButton(
                  onTap: onTapCartIcon,
                  icon: SvgPicture.asset(
                    CartIcon,
                    width: 20.w,
                  ),
                  width: 32.w,
                  backgroundColor: ColorsManager.greyFC,
                  vPadding: 8.w,
                  hPadding: 8.h,
                ).paddingAll(10),
              ],
            ),
            child: Image.network(
              productModel.image,
              fit: BoxFit.cover,
              height: 204.h,
              width: 156.w,
            ),
          ),
        ).expanded(),
        verticalSpace(10),
        Text(
          productModel.title,
          style: TextStyles.font14Grey55Regular,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${productModel.price} \$',
          style: TextStyles.font14BlackRegular,
        ),
      ],
    );
  }
}
