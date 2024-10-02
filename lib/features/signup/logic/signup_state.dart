sealed class SignupState {}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState<T> extends SignupState {
  final T data;
  SignupSuccessState(this.data);
}

class SignupErrorState extends SignupState {
  final String error;
  SignupErrorState(this.error);
}
