import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentorship_project/features/login/data/models/user_login_model.dart';

import '../models/login_result.dart';

class LogInServices {
  Future<LoginResult> signIn(LoginCredentials credentials) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: credentials.email,
        password: credentials.password,
      );

      if (userCredential.user != null) {
        return LoginResult(success: true, user: userCredential.user);
      } else {
        return LoginResult(success: false, errorMessage: "Login failed. Please try again.");
      }
    } on FirebaseAuthException catch (e) {
      return LoginResult(success: false, errorMessage: e.message ?? "An error occurred during sign in.");
    } catch (e) {
      return LoginResult(success: false, errorMessage: e.toString());
    }
  }
}
