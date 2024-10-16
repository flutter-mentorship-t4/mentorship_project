import 'dart:convert';

import 'package:mentorship_project/core/helpers/shared_pref_helper.dart';
import 'package:mentorship_project/features/home/data/models/products_model.dart';

import '../../../../core/helpers/strings/shared_pref_keys.dart';
import '../models/cart_item_model.dart';

class CartRepo {
  // ignore: unused_field
  List<CartItemModel> _cachedItems = [];

  CartRepo() {
    _initCache();
  }
  // Initialize cache on creation
  void _initCache() async {
    _cachedItems = await getCartItems();
  }

  // Simulate network delay
  // Future<void> _delay() => Future.delayed(Duration(milliseconds: 300));

  // Additional method to add initial items for testing
  // Future<List<CartItemModel>> addInitialItems() async {
  //   await _delay();
  //   _items.addAll(dummyProducts.map((product) => CartItemModel(product: product)));
  //   clearCart();
  //   saveCartItems(_items);
  //   return _items;
  // }

  Future<List<CartItemModel>> getCartItems() async {
    if (_cachedItems.isNotEmpty) {
      return _cachedItems;
    }

    final String? cartJson = await SharedPrefHelper.getString(SharedPrefKeys.cartKey);
    if (cartJson != null && cartJson.isNotEmpty) {
      final List<dynamic> decoded = jsonDecode(cartJson);
      _cachedItems = decoded.map((item) => CartItemModel.fromJson(item)).toList();

      return _cachedItems;
    }
    return [];
  }

  Future<void> saveCartItems(List<CartItemModel> items) async {
    _cachedItems = items;

    final String encoded = jsonEncode(items.map((item) => item.toJson()).toList());
    await SharedPrefHelper.setData(SharedPrefKeys.cartKey, encoded);
  }

  Future<void> addToCart(ProductModel product) async {
    final existingItemIndex = _cachedItems.indexWhere((item) => item.product.id == product.id);

    if (existingItemIndex != -1) {
      _cachedItems[existingItemIndex].quantity++;
    } else {
      _cachedItems.add(CartItemModel(product: product));
    }
    await saveCartItems(_cachedItems);
  }

  Future<void> removeFromCart(int productId) async {
    _cachedItems.removeWhere((item) => item.product.id == productId);
    await saveCartItems(_cachedItems);
  }

  Future<void> updateQuantity(int productId, int newQuantity) async {
    final itemIndex = _cachedItems.indexWhere((item) => item.product.id == productId);
    if (itemIndex != -1) {
      if (newQuantity > 0) {
        _cachedItems[itemIndex].quantity = newQuantity;
      } else {
        _cachedItems.removeAt(itemIndex);
      }
    }
    await saveCartItems(_cachedItems);
  }

  Future<void> toggleItemSelection(int productId) async {
    final itemIndex = _cachedItems.indexWhere((item) => item.product.id == productId);
    if (itemIndex != -1) {
      _cachedItems[itemIndex].isSelected = !_cachedItems[itemIndex].isSelected;
    }
    await saveCartItems(_cachedItems);
  }

  Future<void> clearCart() async {
    _cachedItems.clear();
    await SharedPrefHelper.removeData(SharedPrefKeys.cartKey);
  }

  bool isProductInCart(int productId) {
    return _cachedItems.any((item) => item.product.id == productId);
  }

  Future<void> toggleCartItem(ProductModel product) async {
    final isInCart = await isProductInCart(product.id);
    if (isInCart) {
      await removeFromCart(product.id);
    } else {
      await addToCart(product);
    }
  }

  // // Calculates total price and selected items total price
  // // Returns a tuple: (totalPrice, selectedTotalPrice)
  // Future<(double, double)> calculatePrices(List<CartItemModel> items) async {
  //   final totalPrice = items.fold(0.0, (total, item) => total + (item.product.price * item.quantity));
  //   final selectedTotalPrice =
  //       items.where((item) => item.isSelected).fold(0.0, (total, item) => total + (item.product.price * item.quantity));
  //   return (totalPrice, selectedTotalPrice);
  // }

  // Calculates total price and selected items total price
  // Returns a tuple: (totalPrice, selectedTotalPrice)
  (double, double) calculatePrices() {
    final totalPrice = _cachedItems.fold(0.0, (total, item) => total + (item.product.price * item.quantity));
    final selectedTotalPrice =
        _cachedItems.where((item) => item.isSelected).fold(0.0, (total, item) => total + (item.product.price * item.quantity));
    return (totalPrice, selectedTotalPrice);
  }
}
