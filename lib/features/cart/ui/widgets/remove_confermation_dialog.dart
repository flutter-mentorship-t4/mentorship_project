import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_dialog.dart';
import '../../data/models/cart_item_model.dart';
import '../../logic/cart_cubit.dart';

void showRemoveConfirmationDialog(BuildContext context, CartItemModel item) {
  AppDialog.show(
    context,
    content: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Remove Item', style: TextStyles.font16BlackSemiBold),
          verticalSpace(16),
          Text('Are you sure you want to remove this item from your cart?',
              style: TextStyles.font14BlackRegular, textAlign: TextAlign.center),
          verticalSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancel', style: TextStyles.font14PrimaryRegular),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CartCubit>().removeFromCart(item.product.id);
                  Navigator.of(context).pop();
                },
                child: Text('Remove', style: TextStyles.font14WhiteRegular),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
