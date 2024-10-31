import '../../../home/data/models/products_model.dart';

class WishlistItemModel {
  final ProductModel product;
  bool isSelected;

  WishlistItemModel({
    required this.product,
    this.isSelected = true,
  });

  Map<String, dynamic> toJson() => {
        'product': product.toJson(),
        'isSelected': isSelected,
      };

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) =>
      WishlistItemModel(
        product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
        isSelected: json['isSelected'] as bool,
      );
}
