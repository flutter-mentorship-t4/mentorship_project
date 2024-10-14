import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/features/cart/data/models/cart_item_model.dart';

import '../../product_details/data/models/dummy_product.dart';
import '../data/models/failure_obj.dart';
import '../data/repos/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;

  CartCubit(this._cartRepo) : super(CartInitialState());

  // This method is just for initial tests=>poulating the shrared preff storage
  // void addInitialDummyProductsForTest() async {
  //   emit(CartLoadingState());
  //   try {
  //     final cartItems = await _cartRepo.addInitialItems();
  //     _updatePrices(cartItems);
  //   } catch (error) {
  //     emit(CartErrorState(FailureObj(errorMessage: error.toString())));
  //   }
  // }

  void removeAllItemsFromCart() async {
    emit(CartLoadingState());
    try {
      await _cartRepo.clearCart();
      _updatePrices([]);
    } catch (errror) {
      print('Error clearing the cart storage  $errror'); // For debugging
      emit(CartErrorState(FailureObj(errorMessage: 'Error clearing the cart storag')));
    }
  }

  void loadCart() async {
    emit(CartLoadingState());
    try {
      // debugPrint('----------------------entering loadCart ----------------------');
      final cartItems = await _cartRepo.getCartItems();
      _updatePrices(cartItems);
    } catch (error) {
      // print('Error loading cart: $error'); // For debugging
      emit(CartErrorState(FailureObj(errorMessage: 'Failed to load cart items: ${error.toString()}')));
    }
  }

  void addToCart(DummyProduct product) async {
    final currentState = state;
    if (currentState is CartLoadedState) {
      try {
        await _cartRepo.addToCart(product);
        final updatedItems = List<CartItemModel>.from(currentState.items);
        final existingItemIndex = updatedItems.indexWhere((item) => item.product.id == product.id);
        if (existingItemIndex != -1) {
          updatedItems[existingItemIndex].quantity++;
        } else {
          updatedItems.add(CartItemModel(product: product));
        }
        _updatePrices(updatedItems);
      } catch (error) {
        emit(CartErrorState(FailureObj(errorMessage: error.toString())));
      }
    }
  }

  void removeFromCart(int productId) async {
    final currentState = state;
    if (currentState is CartLoadedState) {
      try {
        await _cartRepo.removeFromCart(productId);
        final updatedItems = currentState.items.where((item) => item.product.id != productId).toList();
        _updatePrices(updatedItems);
      } catch (error) {
        emit(CartErrorState(FailureObj(errorMessage: error.toString())));
      }
    }
  }

  void updateQuantity(int productId, int newQuantity) async {
    final currentState = state;
    if (currentState is CartLoadedState) {
      try {
        await _cartRepo.updateQuantity(productId, newQuantity);
        final updatedItems = List<CartItemModel>.from(currentState.items);
        final itemIndex = updatedItems.indexWhere((item) => item.product.id == productId);
        if (itemIndex != -1) {
          if (newQuantity > 0) {
            updatedItems[itemIndex].quantity = newQuantity;
          } else {
            updatedItems.removeAt(itemIndex);
          }
        }
        _updatePrices(updatedItems);
      } catch (error) {
        emit(CartErrorState(FailureObj(errorMessage: error.toString())));
      }
    }
  }

  void toggleItemSelection(int productId) {
    final currentState = state;
    if (currentState is CartLoadedState) {
      final updatedItems = List<CartItemModel>.from(currentState.items);
      final itemIndex = updatedItems.indexWhere((item) => item.product.id == productId);
      if (itemIndex != -1) {
        updatedItems[itemIndex].isSelected = !updatedItems[itemIndex].isSelected;
        _updatePrices(updatedItems);
      }
      _cartRepo.saveCartItems(updatedItems);
    }
  }

  //This method returns the total price of items in the cart
  void _updatePrices(List<CartItemModel> items) {
    final totalPrice = items.fold(0.0, (total, item) => total + (item.product.price * item.quantity));
    final selectedTotalPrice =
        items.where((item) => item.isSelected).fold(0.0, (total, item) => total + (item.product.price * item.quantity));
    // debugPrint('----------------------Updating Total Price to $totalPrice----------------------');
    emit(
      CartLoadedState(
        items: items,
        totalPrice: totalPrice,
        selectedTotalPrice: selectedTotalPrice,
      ),
    );
  }
}
