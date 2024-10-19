import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/features/cart/logic/cart_cubit.dart';
import 'package:mentorship_project/features/home/data/models/products_model.dart';
import 'package:mentorship_project/features/wishlist/logic/cubit/wishlist_cubit.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../home/ui/widgets/product_item.dart';

// class WishlistGridView extends StatelessWidget {
//   const WishlistGridView({Key? key, required this.items}) : super(key: key);
//   final List<ProductModel> items;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GridView.builder(
//         padding: EdgeInsets.symmetric(horizontal: 24.w),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10.w,
//           mainAxisSpacing: 10.h,
//           childAspectRatio: 2.5 / 4,
//         ),
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final item = items[index];
//           return ProductItem(
//             productModel: item,
//             CartIcon: context.watch<CartCubit>().isProductInCart(item) ? AppIcons.cartPlus : AppIcons.cartPlusOutlined,
//             onTapCartIcon: () {
//               context.read<CartCubit>().toggleCartItem(item);
//             },
//             favIcon: AppIcons.heart,
//             onTapFavIcon: () {
//               context.read<WishlistCubit>().toggleWishlist(item);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

class WishlistGridView extends StatelessWidget {
  final List<ProductModel> products;
  const WishlistGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<CartCubit>(),
        ),
        BlocProvider.value(
          value: getIt<WishlistCubit>(),
        ),
      ],
      child: GridView.builder(
        // padding: EdgeInsets.symmetric(horizontal: 24.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 2.5 / 4,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItems(
            productModel: products[index],
          );
        },
      ),
    );
  }
}
