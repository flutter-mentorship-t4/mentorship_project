import 'package:flutter/material.dart';
import 'package:mentorship_project/features/home/data/models/products_model.dart';

import '../../../../core/config/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import 'product_rating_and_review.dart';

class ProductNameReviewPriceDesc extends StatelessWidget {
  const ProductNameReviewPriceDesc({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductNameAndReview(product: product),
          verticalSpace(16),
          Text('${product.price.toString()} L.E', style: TextStyles.font20BlackSemiBold),
          verticalSpace(16),
          Text(product.description, style: TextStyles.font12Grey55SemiBold),
        ],
      ),
    );
  }
}
