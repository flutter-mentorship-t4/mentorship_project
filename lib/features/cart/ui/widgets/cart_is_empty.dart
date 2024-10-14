import 'package:flutter/material.dart';

import '../../../../core/config/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';

class CartIsEmpty extends StatelessWidget {
  const CartIsEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 100,
            color: Colors.grey,
          ),
          verticalSpace(16),
          Text(
            'The cart is empty',
            style: TextStyles.font18BlackRegular,
          ),
          verticalSpace(8),
          Text(
            'Try adding some items first.',
            style: TextStyles.font15BlackRegular,
          ),
        ],
      ),
    );
  }
}
