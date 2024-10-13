import 'dart:convert';

import 'package:mentorship_project/core/helpers/shared_pref_helper.dart';

import '../../../../core/helpers/strings/shared_pref_keys.dart';
import '../../../product_details/data/models/dummy_product.dart';
import '../models/cart_item_model.dart';

class CartRepo {
  // final CartApiService _apiService;

  final List<CartItemModel> _items = [];

  CartRepo();

  // Simulate network delay
  Future<void> _delay() => Future.delayed(Duration(milliseconds: 300));

  // Additional method to add initial items for testing
  // Future<List<CartItemModel>> addInitialItems() async {
  //   await _delay();
  //   _items.addAll(dummyProducts.map((product) => CartItemModel(product: product)));
  //   clearCart();
  //   saveCartItems(_items);
  //   return _items;
  // }

  // Future<ApiResult<CartResponseModel>> getData() async {
  //   try {
  //     final response = await _apiService.getData();
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     return ApiResult.failure(ApiErrorHandler.handle(error));
  //   }
  // }

  Future<List<CartItemModel>> getCartItems() async {
    final String? cartJson = await SharedPrefHelper.getString(SharedPrefKeys.cartKey);
    // debugPrint('-------------cartJsoncartJsoncartJson---------$cartJson ----------------------');
    if (cartJson != null && cartJson.isNotEmpty) {
      final List<dynamic> decoded = jsonDecode(cartJson);
      return decoded.map((item) => CartItemModel.fromJson(item)).toList();
    }
    return [];
  }

  Future<void> saveCartItems(List<CartItemModel> items) async {
    final String encoded = jsonEncode(items.map((item) => item.toJson()).toList());
    await SharedPrefHelper.setData(SharedPrefKeys.cartKey, encoded);
  }

  Future<void> addToCart(DummyProduct product) async {
    final items = await getCartItems();
    final existingItemIndex = items.indexWhere((item) => item.product.id == product.id);
    if (existingItemIndex != -1) {
      items[existingItemIndex].quantity++;
    } else {
      items.add(CartItemModel(product: product));
    }
    await saveCartItems(items);
  }

  Future<void> removeFromCart(int productId) async {
    final items = await getCartItems();
    items.removeWhere((item) => item.product.id == productId);
    await saveCartItems(items);
  }

  Future<void> updateQuantity(int productId, int newQuantity) async {
    final items = await getCartItems();
    final itemIndex = items.indexWhere((item) => item.product.id == productId);
    if (itemIndex != -1) {
      if (newQuantity > 0) {
        items[itemIndex].quantity = newQuantity;
      } else {
        items.removeAt(itemIndex);
      }
    }
    await saveCartItems(items);
  }

  Future<void> toggleItemSelection(int productId) async {
    final items = await getCartItems();
    final itemIndex = items.indexWhere((item) => item.product.id == productId);
    if (itemIndex != -1) {
      items[itemIndex].isSelected = !items[itemIndex].isSelected;
    }
    await saveCartItems(items);
  }

  Future<void> clearCart() async => await SharedPrefHelper.removeData(SharedPrefKeys.cartKey);
}
