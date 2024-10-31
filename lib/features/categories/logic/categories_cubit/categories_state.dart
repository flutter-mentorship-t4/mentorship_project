import '../../data/models/cateogory_model.dart';

sealed class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  CategoriesLoaded({required this.categories});
}

class CategoriesError extends CategoriesState {
  final String errorMessage;
  CategoriesError(this.errorMessage);
}
