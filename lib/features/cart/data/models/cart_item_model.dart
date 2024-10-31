import '../../../home/data/models/products_model.dart';

class CartItemModel {
  final ProductModel product;
  int quantity;
  bool isSelected;

  CartItemModel({
    required this.product,
    this.quantity = 1,
    this.isSelected = true,
  });

  // Correct JSON serialization
  Map<String, dynamic> toJson() => {
        'product': product.toJson(), // Use product's own toJson method
        'quantity': quantity,
        'isSelected': isSelected,
      };

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        product: ProductModel.fromJson(json['product'] as Map<String, dynamic>), // Deserialize product properly
        quantity: json['quantity'] as int,
        isSelected: json['isSelected'] as bool,
      );
}
