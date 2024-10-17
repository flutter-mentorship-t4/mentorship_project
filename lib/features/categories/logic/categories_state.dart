import '../../home/data/models/products_model.dart';
import '../data/models/cateogory_model.dart';

sealed class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  CategoriesLoaded({required this.categories});
}

class CategorySelected extends CategoriesState {
  final List<CategoryModel> categories;
  final String selectedCategory;
  CategorySelected({required this.categories, required this.selectedCategory});
}

class ProductsLoadingState extends CategoriesState {}

class ProductsLoaded extends CategoriesState {
  final List<ProductModel> products;
  ProductsLoaded({required this.products});
}

class ProductsErrorState extends CategoriesState {
  final String errorMessage;
  ProductsErrorState(this.errorMessage);
}
