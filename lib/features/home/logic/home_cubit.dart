// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/helpers/shared_pref_helper.dart';
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
    // getUserData();
    emit(HomeLoadingState());
    var response = await _productsRepo.getProducts();
    if (response is Success<List<ProductModel>>) {
      emit(ProductsLoaded(
        allProducts: response.data,
        filteredProducts: response.data, // Initially show all products
        selectedCategory: "All",
      ));
    } else if (response is Failure<List<ProductModel>>) {
      emit(ProductFailure(errorMessage: response.apiErrorModel.message ?? ''));
    }
  }

  void filterProducts(String? category) {
    if (state is ProductsLoaded) {
      final currentState = state as ProductsLoaded;
      final filtered = category == null || category == "All"
          ? currentState.allProducts // Show all products
          : currentState.allProducts.where((product) => product.category.toLowerCase() == category.toLowerCase()).toList();

      emit(ProductsLoaded(
        allProducts: currentState.allProducts,
        filteredProducts: filtered,
        selectedCategory: category ?? "All",
      ));
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

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await SharedPrefHelper.clearAllData();
      print('User signed out successfully');
    } catch (e) {
      print('Error during sign-out: $e');
    }
  }

  // Future<void> getUserData() async {
  //   emit(UserLoadingState());
  //   try {
  //     // Get the current user's UID from FirebaseAuth
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user == null) {
  //       throw Exception('No authenticated user found');
  //     }

  //     final uid = user.uid; // Get the UID from the authenticated user
  //     DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(uid).get();

  //     final userData = UserModel.fromJson(userDoc.data() as Map<String, dynamic>); // Convert Firestore document data to UserModel
  //     emit(UserSuccessState(userData));
  //   } catch (e) {
  //     emit(UserErrorState(e.toString()));
  //   }
  // }
}
