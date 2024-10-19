import 'package:mentorship_project/features/home/data/models/products_model.dart';

sealed class WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<ProductModel> items;

  WishlistLoaded({required this.items});
}

class WishlistError extends WishlistState {
  final String errorMessage;
  WishlistError({required this.errorMessage});
}
