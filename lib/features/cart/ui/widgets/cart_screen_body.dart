import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/helpers/extensions/navigations_extensions.dart';
import 'package:mentorship_project/core/helpers/extensions/widgets_extentions.dart';
import 'package:mentorship_project/core/routing/routes.dart';
import 'package:mentorship_project/features/cart/ui/widgets/remove_confermation_dialog.dart';

import '../../../../core/config/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../logic/cart_cubit.dart';
import '../../logic/cart_state.dart';
import 'cart_is_empty.dart';
import 'cart_item.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        title: Text('Cart', style: TextStyles.font22BlackSemiBold),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pushNamed(Routes.navigationScreen),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return Center(child: CircularProgressIndicator().center());
            } else if (state is CartLoadedState) {
              if (state.items.isEmpty) {
                return CartIsEmpty();
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return CartItemWidget(
                            item: item,
                            onQuantityChanged: (newQuantity) {
                              context.read<CartCubit>().updateQuantity(item.product.id, newQuantity);
                            },
                            onSelectionChanged: () {
                              context.read<CartCubit>().toggleItemSelection(item.product.id);
                            },
                            onRemove: () {
                              showRemoveConfirmationDialog(context, item);
                              // context.read<CartCubit>().removeFromCart(item.product.id);
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyles.font15BlackSemiBold,
                              ),
                              Text(
                                '${state.totalPrice.toStringAsFixed(2)} L.E',
                                style: TextStyles.font15BlackRegular,
                              ),
                            ],
                          ),
                          verticalSpace(8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Selected Total', style: TextStyles.font15BlackSemiBold),
                              Text(
                                '${state.selectedTotalPrice.toStringAsFixed(2)} L.E',
                                style: TextStyles.font15BlackRegular,
                              ),
                            ],
                          ),
                          verticalSpace(16),
                          AppButton(
                            label: 'Checkout',
                            textStyle: TextStyles.font20WhiteSemiBold,
                            onTap: () {
                              // Go to checkout screen
                            },
                            borderRadius: 24,
                            width: 328.w,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            } else if (state is CartErrorState) {
              debugPrint('----------------------${state.failureObj.errorMessage} ----------------------');
              return Center(child: Text('Error: ${state.failureObj.errorMessage}'));
            } else {
              return CartIsEmpty();
            }
          },
        ),
      ),
    );
  }
}
