// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/networking/api_result.dart';
import 'package:mentorship_project/features/home/data/models/products_model.dart';
import 'package:mentorship_project/features/home/data/repos/categories_repo.dart';
import 'package:mentorship_project/features/home/data/repos/products_repo.dart';
import 'package:mentorship_project/features/wishlist/logic/cubit/wishlist_cubit.dart';

import '../../cart/logic/cart_cubit.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductsRepo productsRepo;
  final CategoriesRepo categoriesRepo;
  final CartCubit cartCubit;
  final WishlistCubit wishlistCubit;

  HomeCubit(
    this.productsRepo,
    this.categoriesRepo,
    this.cartCubit,
    this.wishlistCubit,
  ) : super(HomeInitialState());

  Future<void> getProducts() async {
    emit(HomeLoadingState());
    var response = await productsRepo.getProducts();
    if (response is Success<List<ProductModel>>) {
      emit(ProductsLoaded(products: response.data));
    } else if (response is Failure<List<ProductModel>>) {
      emit(ProductFailure(errorMessage: response.apiErrorModel.message ?? ''));
    }
  }

  Future<void> getCategories() async {
    emit(HomeLoadingState());
    ApiResult<List<String>> response = await categoriesRepo.getCategories();
    if (response is Success<List<String>>) {
      emit(CategoriesLoaded(categories: response.data));
    } else if (response is Failure<List<String>>) {
      emit(CategoriesFailure(
          errorMessage: response.apiErrorModel.message ?? ''));
    }
  }

  // void toggleAddOrRemoveProductFromCart(ProductModel product) {
  //   cartCubit.toggleCartItem(product);
  // }

  // bool isProductInCart(ProductModel product) {
  //   return cartCubit.isProductInCart(product);
  // }

  void clearCart() {
    print("Removed all items from cart ");
    cartCubit.removeAllItemsFromCart();
  }

  // void toggleAddOrRemoveProductFromWishlist(ProductModel product) {
  //   wishlistCubit.toggleWishlistItem(product);
  // }

  // bool isProductInWishList(ProductModel product) {
  //   return wishlistCubit.isProductInWishlist(product);
  // }
  // int getProductQuantityInCart(ProductModel product) {
  //   return cartCubit.getProductQuantity(product);
  // }
}
