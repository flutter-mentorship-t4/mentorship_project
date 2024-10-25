import '../../../home/data/models/products_model.dart';

sealed class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ProductModel> products;
  SearchSuccess(this.products);
}

class SearchEmpty extends SearchState {}
