import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/features/signup/data/models/user_model.dart';
import 'package:mentorship_project/features/signup/data/repos/sign_up_repo.dart';

import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(SignupInitialState());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUpState() async {
    emit(SignupLoadingState());
    try {
      final data = await _signupRepo.signUp(
        UserModel(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      emit(SignupSuccessState(data));
    } catch (e) {
      emit(SignupErrorState('SignUp Error Cubit'));
    }
  }
}
