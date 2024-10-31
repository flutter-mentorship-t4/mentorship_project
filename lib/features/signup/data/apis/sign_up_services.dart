import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class SignUpService {
  Future<String?> signUp(UserModel userData) async {
    print('SignUp Service - Authentication Started');

    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );

      print("User Created Successfully");

      // Return the UID of the newly created user
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      print('Firebase Auth Exception: $e');
      rethrow;
    } catch (e) {
      // Handle any other general exceptions
      print('An error occurred during sign up: $e');
      rethrow;
    }
  }
}
