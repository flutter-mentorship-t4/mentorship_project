import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentorship_project/features/login/data/models/user_login_model.dart';

class LogInServices {
  Future<void> logIn(UserLogInModel userLogInData) async {

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: userLogInData.email,
          password: userLogInData.password,
        )
        .then((value) => print("User LoggedIn"))
        .catchError((error) => print("Failed to LogIn user: $error"));
  }
}
