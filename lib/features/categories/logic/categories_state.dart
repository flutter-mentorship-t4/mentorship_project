import '../../../core/networking/api_error_model.dart';

sealed class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState<T> extends CategoriesState {
  final T data;
  CategoriesSuccessState(this.data);
}

class CategoriesErrorState extends CategoriesState {
  final ApiErrorModel apiErrorModel;
  CategoriesErrorState(this.apiErrorModel);
}

