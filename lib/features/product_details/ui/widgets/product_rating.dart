import 'package:flutter/material.dart';
import 'package:mentorship_project/features/product_details/data/models/dummy_product.dart';

import '../../../../core/config/theming/styles.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({Key? key, required this.product}) : super(key: key);
  final DummyProduct product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.star, color: Colors.yellow, size: 24),
        Text(
          '${product.rating["rate"].toString()} (${product.rating["count"]}+)',
          style: TextStyles.font12Grey55SemiBold,
        ),
      ],
    );
  }
}
