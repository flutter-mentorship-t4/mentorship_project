import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';
import 'package:mentorship_project/features/home/data/models/products_model.dart';

import '../../../../core/config/theming/colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../generated/localization_keys.g.dart';
import '../../../cart/logic/cart_cubit.dart';

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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIconButton(
            onTap: () {},
            icon: Icon(Icons.favorite_border),
            backgroundColor: ColorsManager.greyEC,
          ),
          Column(
            children: [
              AppButton(
                label: LocaleKeys.ProductDetailsScreen_BuyNow.tr(),
                onTap: () {},
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
