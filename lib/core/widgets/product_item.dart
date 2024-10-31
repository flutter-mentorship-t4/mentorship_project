import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/cart/logic/cart_cubit.dart';
import '../../features/home/data/models/products_model.dart';
import '../../features/wishlist/logic/cubit/wishlist_cubit.dart';
import '../config/theming/colors.dart';
import '../config/theming/styles.dart';
import '../helpers/extensions/navigations_extensions.dart';
import '../helpers/extensions/widgets_extentions.dart';
import '../helpers/spacing.dart';
import '../helpers/strings/app_icons.dart';
import '../routing/routes.dart';
import 'app_icon_button.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;

  ProductItem({required this.productModel});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    final wishlistCubit = context.watch<WishlistCubit>();

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.productDetailsScreen,
          arguments: productModel,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: GridTile(
              header: Row(
                children: [
                  AppIconButton(
                    onTap: () {
                      wishlistCubit.toggleWishlist(productModel);
                    },
                    icon: SvgPicture.asset(
                      wishlistCubit.isProductInWishlist(productModel) ? AppIcons.heart : AppIcons.heartOutlined,
                      // AppIcons.heart,
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
                    onTap: () {
                      cartCubit.toggleCartItem(productModel);
                    },
                    icon: SvgPicture.asset(
                      cartCubit.isProductInCart(productModel) ? AppIcons.cartPlus : AppIcons.cartPlusOutlined,
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
      ),
    );
  }
}
