import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theming/styles.dart';
import '../../data/models/dummy_product.dart';

class ProductNameAndReview extends StatelessWidget {
  const ProductNameAndReview({super.key, required this.product});

  final DummyProduct product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxWidth: 220.w),
              child: Text(
                product.title,
                style: TextStyles.font16Grey55Regular,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: <Widget>[
                Icon(Icons.star, color: Colors.yellow, size: 24),
                Text(
                  '${product.rating["rate"].toString()} (${product.rating["count"]}+)',
                  style: TextStyles.font12Grey55SemiBold,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
