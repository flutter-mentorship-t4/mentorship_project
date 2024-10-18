import 'package:bloc/bloc.dart';
import 'package:mentorship_project/features/home/data/models/products_model.dart';
import 'package:mentorship_project/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:mentorship_project/features/wishlist/logic/cubit/wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepo _wishlistRepo;
  WishlistCubit(
    this._wishlistRepo,
  ) : super(WishlistInitialState());
  List filterCat = ["All", "Jackets", "Pants", "Accessories", "Hijab"];
  int selectedFilterIndex = 0;

  void emitWishlist() async {
    emit(WishlistLoadingState());
    try {
      final items = await _wishlistRepo.getAllWishlistItems();
      emit(WishlistLoadedState(items: items));
    } catch (error) {
      emit(WishlistErrorState(
          errorMessage: 'Failed to load Wish List items: ${error.toString()}'));
    }
  }

  void toggleWishlistItem(ProductModel product) async {
    final currentState = state;
    if (currentState is WishlistLoadedState) {
      final isInWishlist =
          currentState.items.any((item) => item.product.id == product.id);

      if (isInWishlist) {
        removeFromWishlist(product);
      } else {
        addToWishlist(product);
      }
    }
  }

  void addToWishlist(ProductModel product) async {
    final currentState = state;
    if (currentState is WishlistLoadedState) {
      try {
        if (!isProductInWishlist(product)) {
          await _wishlistRepo.addToWishlist(product);
          emit(WishlistLoadedState(
              items: await _wishlistRepo.getAllWishlistItems()));
        }
      } catch (error) {
        emit(WishlistErrorState(errorMessage: error.toString()));
      }
    }
  }

  void removeFromWishlist(ProductModel product) async {
    final currentState = state;
    if (currentState is WishlistLoadedState) {
      try {
        if (isProductInWishlist(product)) {
          await _wishlistRepo.removeFromWishlist(product.id);
          emit(WishlistLoadedState(
              items: await _wishlistRepo.getAllWishlistItems()));
        }
      } catch (error) {
        emit(WishlistErrorState(errorMessage: error.toString()));
      }
    }
  }

  bool isProductInWishlist(ProductModel product) {
    final currentState = state;

    if (currentState is WishlistLoadedState) {
      return currentState.items.any((item) => item.product.id == product.id);
    }
    return false;
  }
}
