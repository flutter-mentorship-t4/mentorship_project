import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/product_item.dart';
import '../../../cart/logic/cart_cubit.dart';
import '../../../home/data/models/products_model.dart';
import '../../logic/cubit/wishlist_cubit.dart';

class WishlistGridView extends StatelessWidget {
  final List<ProductModel> products;
  const WishlistGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<CartCubit>()),
        BlocProvider.value(value: getIt<WishlistCubit>()),
      ],
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 2.5 / 4,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(productModel: products[index]);
        },
      ),
    );
  }
}
