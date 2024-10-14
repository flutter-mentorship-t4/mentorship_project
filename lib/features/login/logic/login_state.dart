sealed class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState<T> extends LoginState {
  // final T data;
  LoginSuccessState();
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
