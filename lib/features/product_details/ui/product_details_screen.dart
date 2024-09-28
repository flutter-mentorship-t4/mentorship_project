import 'package:flutter/material.dart';
import 'package:mentorship_project/features/product_details/data/models/dummy_product.dart';
import 'package:mentorship_project/features/product_details/ui/widgets/product_color_selection.dart';

import 'widgets/product_details_top_bar.dart';
import 'widgets/product_images_carousel.dart';
import 'widgets/product_name_review_price_desc.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key}) : super(key: key);
  final DummyProduct product = DummyProduct.fromJson({
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description":
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": {"rate": 3.9, "count": 120}
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              ProductImagesCarousel(product: product),
              ProductDetailsTopBar(),
              // Text(LocaleKeys.ProductDetailsScreen.tr()), // Using the generated key and .tr() for translation
            ],
          ),
          ProductNameReviewPriceDesc(product: product),
          ProductColorSelection(),
        ],
      ),
    );
  }
}



//feat(Product-Details) :rocket: Added ..
