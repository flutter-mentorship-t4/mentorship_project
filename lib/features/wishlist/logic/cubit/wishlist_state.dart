import 'package:mentorship_project/features/wishlist/data/model/wishlist_item_model.dart';

sealed class WishlistState {}

class WishlistInitialState extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistLoadedState extends WishlistState {
  final List<WishlistItemModel> items;

  WishlistLoadedState({required this.items});
}

class WishlistErrorState extends WishlistState {
  final String errorMessage;
  WishlistErrorState({required this.errorMessage});
}
