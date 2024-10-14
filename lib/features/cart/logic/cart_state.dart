import 'package:mentorship_project/features/cart/data/models/failure_obj.dart';

import '../data/models/cart_item_model.dart';

sealed class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<CartItemModel> items;
  final double totalPrice;
  final double selectedTotalPrice;

  CartLoadedState({
    required this.items,
    required this.totalPrice,
    required this.selectedTotalPrice,
  });
}

class CartErrorState extends CartState {
  final FailureObj failureObj;
  CartErrorState(this.failureObj);
}
