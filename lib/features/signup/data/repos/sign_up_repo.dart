import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../apis/sign_up_services.dart';
import '../models/user_model.dart';

class SignupRepo {
  final SignUpService signUpService;

  SignupRepo(this.signUpService);

  Future<Either> signUp(UserModel user) async {
    try {
      // First, authenticate the user and get the UID
      final uid = await signUpService.signUp(user);

      // If UID is null, handle it as an error
      if (uid == null) {
        throw Exception('Failed to get user UID after signup');
      }

      // Call the method to save the user data into Firestore
      await saveUserToFirestore(uid, user);

      // // Optionally save the UID in shared preferences
      // await SharedPrefHelper.setData(SharedPrefKeys.userUid, uid);

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

  Future<void> saveUserToFirestore(String uid, UserModel user) async {
    try {
      await FirebaseFirestore.instance.collection('Users').doc(uid).set(
        {
          'name': user.name,
          'email': user.email,
          'uid': uid,
        },
      );
      print('User data saved to Firestore');
    } catch (e) {
      print('Failed to save user data to Firestore: $e');
      throw Exception('Firestore save failed');
    }
  }
}
