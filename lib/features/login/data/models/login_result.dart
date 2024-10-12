// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

class LoginResult {
  final bool success;
  final User? user;
  final String? errorMessage;

  LoginResult({required this.success, this.user, this.errorMessage});

  @override
  String toString() => 'LoginResult(success: $success, user: $user, errorMessage: $errorMessage)';
}
