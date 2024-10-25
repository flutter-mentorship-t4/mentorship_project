import '../../../core/networking/api_error_model.dart';
import '../data/models/products_model.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState<T> extends HomeState {
  final T data;
  HomeSuccessState(this.data);
}

class HomeErrorState extends HomeState {
  final ApiErrorModel apiErrorModel;
  HomeErrorState(this.apiErrorModel);
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------

final class ProductsLoaded extends HomeState {
  final List<ProductModel> products;

  ProductsLoaded({required this.products});
}

final class ProductFailure extends HomeState {
  final String errorMessage;
  ProductFailure({required this.errorMessage});
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------

// class UserInitialState extends HomeState {}

// class UserLoadingState extends HomeState {}

// class UserSuccessState<T> extends HomeState {
//   final UserModel userModel;
//   UserSuccessState(this.userModel);
// }

// class UserErrorState extends HomeState {
//   final String UserError;
//   UserErrorState(this.UserError);
// }
// class CategoriesLoaded extends HomeState {
//   final List<String> categories;

//   CategoriesLoaded({required this.categories});
// }

// class CategoriesFailure extends HomeState {
//   final String errorMessage;
//   CategoriesFailure({required this.errorMessage});
// }
