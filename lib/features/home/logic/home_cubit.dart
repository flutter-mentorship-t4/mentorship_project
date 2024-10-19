// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/networking/api_result.dart';
import 'package:mentorship_project/features/home/data/models/products_model.dart';
import 'package:mentorship_project/features/home/data/repos/products_repo.dart';
import 'package:mentorship_project/features/wishlist/data/repo/wishlist_repo.dart';

import '../../cart/data/repos/cart_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductsRepo _productsRepo;
  final CartRepo _cartRepo;
  final WishlistRepo _wishlistRepo;

  HomeCubit(this._productsRepo, this._cartRepo, this._wishlistRepo) : super(HomeInitialState());

  Future<void> getProducts() async {
    emit(HomeLoadingState());
    var response = await _productsRepo.getProducts();
    if (response is Success<List<ProductModel>>) {
      emit(ProductsLoaded(products: response.data));
    } else if (response is Failure<List<ProductModel>>) {
      emit(ProductFailure(errorMessage: response.apiErrorModel.message ?? ''));
    }
  }

  void toggleAddOrRemoveProductFromCart(ProductModel product) {
    _cartRepo.toggleCartItem(product);
  }

  Future<bool> isProductInCart(ProductModel product) async {
    return await _cartRepo.isProductInCart(product.id);
  }

  // Toggle a product's presence in the wishlist
  void toggleAddOrRemoveProductFromWishlist(ProductModel product) {
    _wishlistRepo.toggleWishlistItem(product);
  }

  // Synchronous method to check if a product is in the wishlist
  bool isProductInWishlist(ProductModel product) {
    return _wishlistRepo.isProductInWishlist(product.id);
  }

  void clearCart() {
    print("Removed all items from cart ");
    _cartRepo.clearCart();
  }
}
