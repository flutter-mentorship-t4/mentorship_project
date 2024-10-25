import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentorship_project/core/helpers/shared_pref_helper.dart';
import 'package:mentorship_project/core/helpers/strings/shared_pref_keys.dart';

import '../models/login_result.dart';
import '../models/user_login_model.dart';

class LogInServices {
  Future<LoginResults> signInWithEmailAndPassword(
      LoginCredentials credentials) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: credentials.email,
        password: credentials.password,
      );
      if (userCredential.user != null) {
        await SharedPrefHelper.setData('UserUid', userCredential.user!.uid);
        return LoginResults(success: true, user: userCredential.user);
      } else {
        return LoginResults(
            success: false, errorMessage: "Login failed. Please try again.");
      }
    } on FirebaseAuthException catch (e) {
      return LoginResults(
          success: false,
          errorMessage: e.message ?? "An error occurred during sign in.");
    } catch (e) {
      return LoginResults(success: false, errorMessage: e.toString());
    }
  }

  Future<LoginResults> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return LoginResults(
            success: false,
            errorMessage: "Google Sign-In was cancelled by the user.");
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user?.email == null ||
          userCredential.user?.displayName == null) {
        return LoginResults(
            success: false, errorMessage: "Missing user information.");
      }
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user?.uid)
          .get();
      if (!userDoc.exists) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userCredential.user?.uid)
            .set({
          'email': userCredential.user?.email,
          'displayName': userCredential.user?.email,
        });
      }
      await SharedPrefHelper.setData(
          SharedPrefKeys.userUid, userCredential.user?.uid);
      return LoginResults(success: true, user: userCredential.user);
    } catch (e) {
      return LoginResults(success: false, errorMessage: e.toString());
    }
  }
}
