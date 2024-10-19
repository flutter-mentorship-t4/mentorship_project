import 'package:firebase_auth/firebase_auth.dart';

import '../models/login_result.dart';
import '../models/user_login_model.dart';

class LogInServices {
  Future<LoginResults> signIn(LoginCredentials credentials) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: credentials.email,
        password: credentials.password,
      );

      if (userCredential.user != null) {
        return LoginResults(success: true, user: userCredential.user);
      } else {
        return LoginResults(success: false, errorMessage: "Login failed. Please try again.");
      }
    } on FirebaseAuthException catch (e) {
      return LoginResults(success: false, errorMessage: e.message ?? "An error occurred during sign in.");
    } catch (e) {
      return LoginResults(success: false, errorMessage: e.toString());
    }
  }
}
