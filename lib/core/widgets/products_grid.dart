import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/cart/logic/cart_cubit.dart';
import '../../features/home/data/models/products_model.dart';
import '../../features/wishlist/logic/cubit/wishlist_cubit.dart';
import '../di/dependency_injection.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsGrid({super.key, required this.products});

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
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 2.5 / 4,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            productModel: products[index],
          );
        },
      ),
    );
  }
}
