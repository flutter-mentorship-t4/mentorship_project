import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/user_model.dart';
import '../data/repos/sign_up_repo.dart';
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

    final data = await _signupRepo.signUp(
      UserModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    data.fold((error) {
      emit(SignupErrorState(error));
    }, (data) {
      emit(SignupSuccessState());
    });
  }
}
