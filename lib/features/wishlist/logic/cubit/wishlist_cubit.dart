import 'package:bloc/bloc.dart';

import '../../../home/data/models/products_model.dart';
import '../../data/repo/wishlist_repo.dart';
import 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo _wishlistRepo;
  WishlistCubit(this._wishlistRepo) : super(WishlistInitialState()) {
    loadWishlist();
  }

  List<String> filterCat = [
    "All",
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing",
  ];
  int _selectedFilterIndex = 0;
  int get selectedFilterIndex => _selectedFilterIndex;
  set selectedFilterIndex(int value) {
    _selectedFilterIndex = value;
    // Trigger state update if needed
    if (state is WishlistLoaded) {
      filterProducts(filterCat[value]);
    }
  }

  // Load wishlist items and emit the state
  Future<void> loadWishlist() async {
    emit(WishlistLoading());
    try {
      final wishlistItems = await _wishlistRepo.getWishlistItems();
      emit(WishlistLoaded(
        allItems: wishlistItems,
        filteredItems: wishlistItems,
        selectedCategory: "All",
      ));
    } catch (e) {
      emit(WishlistError(errorMessage: e.toString()));
    }
  }

  void filterProducts(String category) {
    if (state is WishlistLoaded) {
      final currentState = state as WishlistLoaded;
      final filtered = category == "All"
          ? currentState.allItems
          : currentState.allItems.where((product) => product.category.toLowerCase() == category.toLowerCase()).toList();

      emit(WishlistLoaded(
        allItems: currentState.allItems,
        filteredItems: filtered,
        selectedCategory: category,
      ));
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
