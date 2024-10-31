import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/data/models/products_model.dart';
import '../data/models/cart_item_model.dart';
import '../data/models/failure_obj.dart';
import '../data/repos/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;

  CartCubit(this._cartRepo) : super(CartInitialState());

  // Loads cart items and updates state with calculated prices
  Future<void> loadCart() async {
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

  void toggleCartItem(ProductModel product) async {
    try {
      await _cartRepo.toggleCartItem(product);
      await loadCart();
    } catch (error) {
      emit(CartErrorState(FailureObj(errorMessage: error.toString())));
    }
  }

  void removeAllItemsFromCart() async {
    emit(CartLoadingState());
    try {
      await _cartRepo.clearCart();
      emit(CartLoadedState(items: [], totalPrice: 0, selectedTotalPrice: 0));
    } catch (error) {
      emit(CartErrorState(FailureObj(errorMessage: 'Error clearing the cart storage')));
    }
  }

  void addToCart(ProductModel product) async {
    try {
      await _cartRepo.addToCart(product);
      await loadCart();
    } catch (error) {
      emit(CartErrorState(FailureObj(errorMessage: error.toString())));
    }
  }

  void removeFromCart(int productId) async {
    try {
      await _cartRepo.removeFromCart(productId);
      await loadCart();
    } catch (error) {
      emit(CartErrorState(FailureObj(errorMessage: error.toString())));
    }
  }

  void updateQuantity(int productId, int newQuantity) async {
    try {
      await _cartRepo.updateQuantity(productId, newQuantity);
      await loadCart();
    } catch (error) {
      emit(CartErrorState(FailureObj(errorMessage: error.toString())));
    }
  }

  void toggleItemSelection(int productId) async {
    try {
      await _cartRepo.toggleItemSelection(productId);
      await loadCart();
    } catch (error) {
      emit(CartErrorState(FailureObj(errorMessage: error.toString())));
    }
  }

  // Updates state with new cart items and calculated prices
  Future<void> _updatePrices(List<CartItemModel> items) async {
    final (totalPrice, selectedTotalPrice) = await _cartRepo.calculatePrices();
    emit(CartLoadedState(
      items: items,
      totalPrice: totalPrice,
      selectedTotalPrice: selectedTotalPrice,
    ));
  }

  // Synchronous method to check if a product is in the cart
  bool isProductInCart(ProductModel product) {
    return _cartRepo.isProductInCart(product.id);
  }
}
