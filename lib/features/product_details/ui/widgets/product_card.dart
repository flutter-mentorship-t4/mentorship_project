import 'package:flutter/material.dart';
import 'package:mentorship_project/core/helpers/strings/app_images.dart';

import '../../data/models/dummy_product.dart';

class ProductCard extends StatelessWidget {
  final DummyProduct product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 2, blurRadius: 8),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: FadeInImage.assetNetwork(
                  placeholder: AppImages.placeHolderImage, // Add a placeholder image
                  image: product.image,
                  fit: BoxFit.cover,
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
                  // Row(
                  //   children: [
                  //     Icon(Icons.star, color: Colors.amber, size: 16),
                  //     SizedBox(width: 4),
                  //     Expanded(
                  //       child: Text(
                  //         product.rating['rate'].toString(),
                  //         style: TextStyle(fontSize: 12),
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
