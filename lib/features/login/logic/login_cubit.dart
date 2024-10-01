import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/networking/api_error_handler.dart';
import 'package:mentorship_project/features/login/data/models/login_request_body_model.dart';

import '../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitialState());
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitLoginState() async {
    emit(LoginLoadingState());
    try {
      final response = await _loginRepo.login(LoginRequestBodyModel(
        userName: userNameController.text,
        password: passwordController.text,
      ));
      emit(
        LoginSuccessState(response),
      );
    } catch (error) {
      emit(
        LoginErrorState(ApiErrorHandler.handle(error)),
      );
    }
  }
}
