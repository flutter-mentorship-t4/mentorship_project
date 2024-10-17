import 'package:mentorship_project/features/home/data/models/products_model.dart';

import '../../../core/networking/api_error_model.dart';

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

// class CategoriesLoaded extends HomeState {
//   final List<String> categories;

//   CategoriesLoaded({required this.categories});
// }

// class CategoriesFailure extends HomeState {
//   final String errorMessage;
//   CategoriesFailure({required this.errorMessage});
// }
