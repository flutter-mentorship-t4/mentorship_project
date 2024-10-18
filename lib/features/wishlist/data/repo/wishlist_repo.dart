import 'dart:convert';

import 'package:mentorship_project/core/helpers/shared_pref_helper.dart';
import 'package:mentorship_project/core/helpers/strings/shared_pref_keys.dart';
import 'package:mentorship_project/features/home/data/models/products_model.dart';
import 'package:mentorship_project/features/wishlist/data/model/wishlist_item_model.dart';

class WishlistRepo {
  Future<List<WishlistItemModel>> getAllWishlistItems() async {
    final String? favJson =
        await SharedPrefHelper.getString(SharedPrefKeys.favKey);
    if (favJson != null && favJson.isNotEmpty) {
      final List<dynamic> decoded = jsonDecode(favJson);
      return decoded.map((item) => WishlistItemModel.fromJson(item)).toList();
    }
    return [];
  }

  Future<void> saveWishlistItems(List<WishlistItemModel> items) async {
    final String encoded =
        jsonEncode(items.map((item) => item.toJson()).toList());
    await SharedPrefHelper.setData(SharedPrefKeys.favKey, encoded);
  }

  Future<void> addToWishlist(ProductModel product) async {
    final items = await getAllWishlistItems();
    items.add(WishlistItemModel(product: product));
    await saveWishlistItems(items);
  }

  Future<void> removeFromWishlist(int productId) async {
    final items = await getAllWishlistItems();
    items.removeWhere((item) => item.product.id == productId);
    await saveWishlistItems(items);
  }
}
