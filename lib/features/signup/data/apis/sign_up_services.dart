import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentorship_project/features/signup/data/models/user_model.dart';

class SignUpService {
  Future<void> signUp(UserModel userData) async {
    var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userData.email,
      password: userData.password,
    );
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(data.user!.uid)
        .set({
      'name': userData.name,
      'email': userData.email,
    });
  }
}
