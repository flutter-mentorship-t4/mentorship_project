import 'dart:convert';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/strings/shared_pref_keys.dart';
import '../../../home/data/models/products_model.dart';

class WishlistRepo {
  // Future<List<WishlistItemModel>> getAllWishlistItems() async {
  //   final String? favJson =
  //       await SharedPrefHelper.getString(SharedPrefKeys.favKey);
  //   if (favJson != null && favJson.isNotEmpty) {
  //     final List<dynamic> decoded = jsonDecode(favJson);
  //     return decoded.map((item) => WishlistItemModel.fromJson(item)).toList();
  //   }
  //   return [];
  // }

  // Future<void> saveWishlistItems(List<WishlistItemModel> items) async {
  //   final String encoded =
  //       jsonEncode(items.map((item) => item.toJson()).toList());
  //   await SharedPrefHelper.setData(SharedPrefKeys.favKey, encoded);
  // }

  // Future<void> addToWishlist(ProductModel product) async {
  //   final items = await getAllWishlistItems();
  //   items.add(WishlistItemModel(product: product));
  //   await saveWishlistItems(items);
  // }

  // Future<void> removeFromWishlist(int productId) async {
  //   final items = await getAllWishlistItems();
  //   items.removeWhere((item) => item.product.id == productId);
  //   await saveWishlistItems(items);
  // }
  List<ProductModel> _cachedWishlistItems = [];

  WishlistRepo() {
    _initCache();
  }

  void _initCache() async {
    _cachedWishlistItems = await getWishlistItems();
  }

  // Retrieve wishlist items from local storage
  Future<List<ProductModel>> getWishlistItems() async {
    if (_cachedWishlistItems.isNotEmpty) {
      return _cachedWishlistItems;
    }

    final String? wishlistJson = await SharedPrefHelper.getString(SharedPrefKeys.wishlistKey);
    if (wishlistJson != null && wishlistJson.isNotEmpty) {
      final List<dynamic> decoded = jsonDecode(wishlistJson);
      _cachedWishlistItems = decoded.map((item) => ProductModel.fromJson(item)).toList();
      return _cachedWishlistItems;
    }

    return [];
  }

  // Save wishlist items to local storage
  Future<void> saveWishlistItems(List<ProductModel> items) async {
    _cachedWishlistItems = items;
    final String encoded = jsonEncode(items.map((item) => item.toJson()).toList());
    await SharedPrefHelper.setData(SharedPrefKeys.wishlistKey, encoded);
  }

  // Add an item to the wishlist
  Future<void> addToWishlist(ProductModel product) async {
    if (!isProductInWishlist(product.id)) {
      _cachedWishlistItems.add(product);
      await saveWishlistItems(_cachedWishlistItems);
    }
  }

  // Remove an item from the wishlist
  Future<void> removeFromWishlist(int productId) async {
    _cachedWishlistItems.removeWhere((item) => item.id == productId);
    await saveWishlistItems(_cachedWishlistItems);
  }

  // Check if a product is in the wishlist
  bool isProductInWishlist(int productId) {
    return _cachedWishlistItems.any((item) => item.id == productId);
  }

  // Toggle an item's presence in the wishlist
  Future<void> toggleWishlistItem(ProductModel product) async {
    final isInWishlist = isProductInWishlist(product.id);
    if (isInWishlist) {
      await removeFromWishlist(product.id);
    } else {
      await addToWishlist(product);
    }
  }
}
