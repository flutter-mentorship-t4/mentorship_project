import 'package:bloc/bloc.dart';

import '../../../home/data/models/products_model.dart';
import '../../data/repo/wishlist_repo.dart';
import 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo _wishlistRepo;
  WishlistCubit(this._wishlistRepo) : super(WishlistInitialState()) {
    loadWishlist();
  }

  List filterCat = ["All", "electronics", "jewelery", "men's clothing", "women's clothing"];
  int selectedFilterIndex = 0;

  // Load wishlist items and emit the state
  Future<void> loadWishlist() async {
    emit(WishlistLoading());
    try {
      final wishlistItems = await _wishlistRepo.getWishlistItems();
      emit(WishlistLoaded(items: wishlistItems));
    } catch (e) {
      emit(WishlistError(errorMessage: e.toString()));
    }
  }

  void toggleWishlist(ProductModel product) async {
    try {
      await _wishlistRepo.toggleWishlistItem(product);
      loadWishlist();
    } catch (error) {
      emit(WishlistError(errorMessage: 'Failed to update wishlist: ${error.toString()}'));
    }
  }

  bool isProductInWishlist(ProductModel product) {
    return _wishlistRepo.isProductInWishlist(product.id);
  }
}
