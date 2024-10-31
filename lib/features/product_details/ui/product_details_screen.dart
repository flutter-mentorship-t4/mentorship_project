import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/spacing.dart';
import '../../cart/logic/cart_cubit.dart';
import '../../home/data/models/products_model.dart';
import '../../wishlist/logic/cubit/wishlist_cubit.dart';
import 'widgets/product_action_button.dart';
import 'widgets/product_color_selection.dart';
import 'widgets/product_details_top_bar.dart';
import 'widgets/product_grid_view.dart';
import 'widgets/product_images_carousel.dart';
import 'widgets/product_name_review_price_desc.dart';
import 'widgets/product_size_selection.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

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
      child: Scaffold(
        body: SafeArea(
          child: Stack(
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
                maxChildSize: 0.88, // Adjust based on your needs
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
                        ProductActionButtons(productModel: product),
                        ProductGridView(),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//feat(Product-Details) :rocket: Added ..
