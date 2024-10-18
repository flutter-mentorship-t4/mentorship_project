import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/di/dependency_injection.dart';
import 'package:mentorship_project/core/helpers/strings/app_icons.dart';
import 'package:mentorship_project/core/widgets/product_item.dart';
import 'package:mentorship_project/features/cart/logic/cart_cubit.dart';
import 'package:mentorship_project/features/wishlist/data/model/wishlist_item_model.dart';
import 'package:mentorship_project/features/wishlist/logic/cubit/wishlist_cubit.dart';

class WishlistGridView extends StatelessWidget {
  const WishlistGridView({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<WishlistItemModel> items;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CartCubit>()..loadCart(),
      child: Expanded(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            childAspectRatio: 2.5 / 4,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index].product;
            return ProductItem(
              productModel: item,
              CartIcon: context.watch<CartCubit>().isProductInCart(item)
                  ? AppIcons.cartPlus
                  : AppIcons.cartPlusOutlined,
              onTapCartIcon: () {
                context.read<CartCubit>().toggleCartItem(item);
              },
              favIcon: AppIcons.heart,
              onTapFavIcon: () {
                context.read<WishlistCubit>().removeFromWishlist(item);
              },
            );
          },
        ),
      ),
    );
  }
}
