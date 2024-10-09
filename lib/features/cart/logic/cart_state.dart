import '../../../core/networking/api_error_model.dart';

sealed class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState<T> extends CartState {
  final T data;
  CartSuccessState(this.data);
}

class CartErrorState extends CartState {
  final ApiErrorModel apiErrorModel;
  CartErrorState(this.apiErrorModel);
}

