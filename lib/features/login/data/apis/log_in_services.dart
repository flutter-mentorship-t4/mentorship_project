import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentorship_project/features/login/data/models/user_login_model.dart';

class LogInServices {
  Future<void> logIn(UserLogInModel userLogInData) async {
    //naming
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userLogInData.email,
        password: userLogInData.password,
      );
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
    // .then((value) => print("User LoggedIn"))
    // .catchError((error) => print("Failed to LogIn user: $error"));
  }
}
