import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentorship_project/features/signup/data/models/user_model.dart';

class SignUpService {
  Future<void> signUp(UserModel userData) async {
    print('SignUp Services1');
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: userData.email,
          password: userData.password,
        )
        .then((value) => print("User Created"))
        .catchError((error) => print("Failed to Create user: $error"));
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('Users').doc(uid).set(
      {
        'name': userData.name,
        'email': userData.email,
      },
    );
  }
}
