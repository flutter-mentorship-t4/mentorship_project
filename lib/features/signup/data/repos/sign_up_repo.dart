import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../apis/sign_up_services.dart';
import '../models/user_model.dart';

class SignupRepo {
  final SignUpService signUpService;

  SignupRepo(this.signUpService);

  Future<Either> signUp(UserModel user) async {
    try {
      await signUpService.signUp(user);

      return Right('Sign Up Success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return Left(e);
    } catch (e) {
      print('catch $e');
      return Left(e);
    }
  }
}
