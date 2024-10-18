import 'package:flutter/material.dart';

import '../../../home/data/models/products_model.dart';

class ProductsGrid extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 20,
      width: 20,
    );
    // BlocProvider.value(
    //   value: getIt<CartCubit>(),
    //   child: GridView.builder(
    //     // padding: EdgeInsets.symmetric(horizontal: 24.w),
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 2,
    //       crossAxisSpacing: 10.w,
    //       mainAxisSpacing: 10.h,
    //       childAspectRatio: 2.5 / 4,
    //     ),
    //     itemCount: products.length,
    //     itemBuilder: (context, index) {
    //       return ProductItem(
    //         productModel: products[index],
    //       );
    //     },
    //   ),
    // );
  }
}
