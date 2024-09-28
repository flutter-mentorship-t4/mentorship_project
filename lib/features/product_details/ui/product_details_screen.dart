import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../generated/localization_keys.g.dart';
import 'widgets/product_details_top_bar.dart';
import 'widgets/product_images_carousell.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              ProductDetailsTopBar(),
              ProductImagesCarousell(),
              // Text('Product Details Screen'),
              Text(LocaleKeys.ProductDetailsScreen.tr()), // Using the generated key and .tr() for translation
            ],
          )
        ],
      ),
    );
  }
}
