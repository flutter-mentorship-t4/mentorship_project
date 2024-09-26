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

