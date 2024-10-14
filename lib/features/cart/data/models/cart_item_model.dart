import '../../../product_details/data/models/dummy_product.dart';

class CartItemModel {
  final DummyProduct product;
  int quantity;
  bool isSelected;

  CartItemModel({
    required this.product,
    this.quantity = 1,
    this.isSelected = true,
  });

  // Add these methods for JSON serialization
  Map<String, dynamic> toJson() => {
        'product': {
          'id': product.id,
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'category': product.category,
          'image': product.image,
          'rating': product.rating,
        },
        'quantity': quantity,
        'isSelected': isSelected,
      };

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        product: DummyProduct(
          id: json['product']['id'],
          title: json['product']['title'],
          price: json['product']['price'],
          description: json['product']['description'],
          category: json['product']['category'],
          image: json['product']['image'],
          rating: json['product']['rating'],
        ),
        quantity: json['quantity'],
        isSelected: json['isSelected'],
      );
}
