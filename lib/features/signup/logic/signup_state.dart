import '../../../core/networking/api_error_model.dart';

sealed class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState<T> extends SignupState {
  final T data;
  SignupSuccessState(this.data);
}

class SignupErrorState extends SignupState {
  final ApiErrorModel apiErrorModel;
  SignupErrorState(this.apiErrorModel);
}

