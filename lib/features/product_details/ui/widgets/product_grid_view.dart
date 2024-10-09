import 'package:flutter/material.dart';
import 'package:mentorship_project/core/helpers/extensions/context_extensions.dart';

import '../../data/models/dummy_product.dart';
import 'product_card.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .8, // Adjust this height based on your content
      child: GridView.builder(
        itemCount: dummyProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          childAspectRatio: 0.6, // Adjust the aspect ratio as needed
          crossAxisSpacing: 10,
          mainAxisSpacing: 14,
        ),
        itemBuilder: (context, index) {
          return ProductCard(product: dummyProducts[index]);
        },
      ),
    );
  }
}
