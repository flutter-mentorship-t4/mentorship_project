import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../signup/data/models/user_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  Future<void> getUserData() async {
    emit(UserLoadingState());
    try {
      // Get the current user's UID from FirebaseAuth
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('No authenticated user found');
      }

      final uid = user.uid; // Get the UID from the authenticated user
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(uid).get();

      if (!userDoc.exists) {
        throw Exception('User data not found');
      }

      final userData = UserModel.fromJson(userDoc.data() as Map<String, dynamic>); // Convert Firestore document data to UserModel
      emit(UserSuccessState(userData));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
