import '../../../core/networking/api_error_model.dart';

sealed class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState<T> extends LoginState {
  final T data;
  LoginSuccessState(this.data);
}

class LoginErrorState extends LoginState {
  final ApiErrorModel apiErrorModel;
  LoginErrorState(this.apiErrorModel);
}

