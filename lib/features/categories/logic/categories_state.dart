import '../../home/data/models/products_model.dart';
import '../data/models/cateogory_model.dart';

sealed class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  CategoriesLoaded({required this.categories});
}

class CategoriesErrorState extends CategoriesState {
  final String errorMessage;
  CategoriesErrorState(this.errorMessage);
}

class CategorySelected extends CategoriesState {
  final List<CategoryModel> categories;
  final String selectedCategory;
  CategorySelected({required this.categories, required this.selectedCategory});
}

class ProductsLoadingState extends CategoriesState {
  final List<CategoryModel> categories;
  final String selectedCategory;
  ProductsLoadingState({required this.categories, required this.selectedCategory});
}

class ProductsLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  final String selectedCategory;
  final List<ProductModel> products;
  ProductsLoaded({required this.categories, required this.selectedCategory, required this.products});
}

class ProductsErrorState extends CategoriesState {
  final List<CategoryModel> categories;
  final String selectedCategory;
  final String errorMessage;
  ProductsErrorState({required this.categories, required this.selectedCategory, required this.errorMessage});
}
