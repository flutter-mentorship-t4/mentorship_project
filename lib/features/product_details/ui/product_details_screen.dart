import 'package:flutter/material.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';
import 'package:mentorship_project/features/product_details/data/models/dummy_product.dart';
import 'package:mentorship_project/features/product_details/ui/widgets/product_color_selection.dart';

import 'widgets/product_action_button.dart';
import 'widgets/product_details_top_bar.dart';
import 'widgets/product_images_carousel.dart';
import 'widgets/product_name_review_price_desc.dart';
import 'widgets/product_size_selection.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
  final DummyProduct product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main scrollable content
          NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      ProductImagesCarousel(product: product),
                      ProductDetailsTopBar(),
                    ],
                  ),
                ),
              ];
            },
            body: ListView(
              // padding: EdgeInsets.only(bottom: 10), // Space for bottom sheet
              children: <Widget>[
                verticalSpace(24),
                ProductNameReviewPriceDesc(product: product),
                verticalSpace(24),
                ProductColorSelection(),
                verticalSpace(16),
                ProductSizeSelection(),
                verticalSpace(16),
                // Add more widgets as needed
              ],
            ),
          ),
          // Draggable bottom sheet
          DraggableScrollableSheet(
            initialChildSize: 0.1, // Start with just the buy now button visible
            minChildSize: 0.1,
            maxChildSize: 0.6, // Adjust based on your needs
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3)),
                  ],
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  controller: scrollController,
                  children: [
                    ProductActionButtons(),
                    // Add more content here that will be revealed when dragged up
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: 400, // Adjust this height based on your content

                        child: GridView.builder(
                          itemCount: dummyProducts.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Two items per row
                            childAspectRatio: 0.6, // Adjust the aspect ratio as needed
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return ProductCard(product: dummyProducts[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

//feat(Product-Details) :rocket: Added ..

class ProductCard extends StatelessWidget {
  final DummyProduct product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 150, // Fixed height

              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 20),
                    Spacer(),
                    Icon(Icons.shopping_cart_outlined, size: 20),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  product.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text('${product.price.toString()} L.E'),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text('${product.rating} (${product.rating})', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
