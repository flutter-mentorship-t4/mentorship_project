import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../product_details/data/models/dummy_product.dart';
import '../apis/cart_api_service.dart';
import '../models/cart_item_model.dart';
import '../models/cart_response_model.dart';

class CartRepo {
  final CartApiService _apiService;

  // In-memory storage for cart items
  final List<CartItemModel> _items = [];
  static const String _cartKey = 'cart_items';
  // Simulate network delay
  Future<void> _delay() => Future.delayed(Duration(milliseconds: 300));

  CartRepo(this._apiService);

  Future<ApiResult<CartResponseModel>> getData() async {
    try {
      final response = await _apiService.getData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<List<CartItemModel>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cartJson = prefs.getString(_cartKey);
    if (cartJson != null) {
      final List<dynamic> decoded = jsonDecode(cartJson);
      return decoded.map((item) => CartItemModel.fromJson(item)).toList();
    }
    return [];
  }

  Future<void> saveCartItems(List<CartItemModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(items.map((item) => item.toJson()).toList());
    await prefs.setString(_cartKey, encoded);
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

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }

  // Additional method to add initial items for testing
  Future<List<CartItemModel>> addInitialItems(List<DummyProduct> products) async {
    await _delay();
    _items.addAll(products.map((product) => CartItemModel(product: product)));
    return _items;
  }
}
