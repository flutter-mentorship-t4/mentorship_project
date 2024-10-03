import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/features/login/data/models/user_login_model.dart';
import 'package:mentorship_project/features/login/data/repos/log_in_repo.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LogInRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  void emitLoginState() async {
    emit(LoginLoadingState());

    final data = await _loginRepo.logIn(UserLogInModel(
      email: emailController.text,
      password: passwordController.text,
    ));
    data.fold((error) {
      emit(LoginErrorState(error));
    }, (data) {
      emit(LoginSuccessState());
    });
  }
}
