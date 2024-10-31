import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/theming/colors.dart';
import '../../../../core/helpers/extensions/navigations_extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../generated/localization_keys.g.dart';
import '../../../cart/logic/cart_cubit.dart';
import '../../../home/data/models/products_model.dart';
import '../../../wishlist/logic/cubit/wishlist_cubit.dart';

class ProductActionButtons extends StatelessWidget {
  final ProductModel productModel;

  const ProductActionButtons({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    final isInCart = cartCubit.isProductInCart(productModel);
    final wishlistCubit = context.watch<WishlistCubit>();
    final isInWishlist = wishlistCubit.isProductInWishlist(productModel);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIconButton(
            onTap: () {
              wishlistCubit.toggleWishlist(productModel);
            },
            icon: Icon(
              isInWishlist ? Icons.favorite : Icons.favorite_border,
            ),
            backgroundColor: ColorsManager.greyEC,
          ),
          Column(
            children: [
              AppButton(
                label: LocaleKeys.ProductDetailsScreen_BuyNow.tr(),
                onTap: () {
                  context.pushNamed(Routes.checkoutScreen);
                },
                borderRadius: 24,
                fontSize: 18,
                width: 155,
              ),
              verticalSpace(8),
              Container(
                width: 134,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
              )
            ],
          ),
          AppIconButton(
            onTap: () {
              cartCubit.toggleCartItem(productModel);
            },
            icon: Icon(
              isInCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
            ),
            backgroundColor: ColorsManager.greyEC,
          ),
        ],
      ),
    );
  }
}
