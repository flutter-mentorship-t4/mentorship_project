// products_state.dart
import '../../../home/data/models/products_model.dart';

sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;

  ProductsLoaded({required this.products});
}

class ProductsError extends ProductsState {
  final String errorMessage;

  ProductsError(this.errorMessage);
}
