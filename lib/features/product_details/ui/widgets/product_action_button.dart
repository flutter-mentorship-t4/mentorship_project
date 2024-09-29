import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/theming/colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../generated/localization_keys.g.dart';

class ProductActionButtons extends StatelessWidget {
  const ProductActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          AppButton(
            label: LocaleKeys.ProductDetailsScreen_BuyNow.tr(),
            onTap: () {},
            borderRadius: 24,
            // hPadding: 30,
            fontSize: 18,
            width: 155,
          ),
          AppIconButton(
            onTap: () {},
            icon: Icon(Icons.shopping_cart_outlined),
            backgroundColor: ColorsManager.greyEC,
          ),
        ],
      ),
    );
  }
}
