import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theming/colors.dart';
import '../../../../core/helpers/strings/app_images.dart';
import '../../../home/data/models/products_model.dart';

class ProductImagesCarousel extends StatefulWidget {
  final ProductModel product;
  ProductImagesCarousel({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductImagesCarousel> createState() => _ProductImagesCarouselState();
}

class _ProductImagesCarouselState extends State<ProductImagesCarousel> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        productImageCarousel(),
        caourselIndecator(),
      ],
    );
  }

  Container productImageCarousel() {
    return Container(
      height: 375.h,
      child: PageView.builder(
        itemCount: 3,
        onPageChanged: (int page) => setState(() => _currentPage = page),
        itemBuilder: (context, index) {
          return Image.network(
            widget.product.image,
            fit: BoxFit.contain,

            loadingBuilder: (context, child, loadingProgress) {
              // Show a loading spinner while the image is being fetched
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            },
            // Fallback widget in case of a network error
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Image.asset(AppImages.placeHolderImage),
              );
            },
          );
        },
      ),
    );
  }

  Positioned caourselIndecator() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return Container(
            width: 10.0,
            height: 10.0,
            margin: EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index ? ColorsManager.primaryColor : ColorsManager.white,
            ),
          );
        }),
      ),
    );
  }
}
