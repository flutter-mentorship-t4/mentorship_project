import '../../../home/data/models/products_model.dart';

sealed class WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<ProductModel> allItems;
  final List<ProductModel> filteredItems;
  final String selectedCategory;

  WishlistLoaded({
    required this.allItems,
    required this.filteredItems,
    required this.selectedCategory,
  });
}

class WishlistError extends WishlistState {
  final String errorMessage;
  WishlistError({required this.errorMessage});
}
