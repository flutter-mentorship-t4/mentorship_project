import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository) : super(LoginInitialState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> authenticateUser() async {
    emit(LoginLoadingState());

    final result = await _loginRepository.loginWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) => emit(LoginErrorState(failure.errMessage)),
      (_) => emit(LoginSuccessState()),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoadingState());
    try {
      await _loginRepository.loginWithGoogle();
      emit(LoginSuccessState());
    } catch (e) {
      LoginErrorState(e.toString());
      print(e);
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
