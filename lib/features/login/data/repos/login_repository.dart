import 'package:dartz/dartz.dart';

import '../apis/log_in_services.dart';
import '../models/failure.dart';
import '../models/user_login_model.dart';

class LoginRepository {
  final LogInServices _loginService;

  LoginRepository(this._loginService);

  Future<Either<Failure, Unit>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    final credentials = LoginCredentials(email: email, password: password);

    final result = await _loginService.signInWithEmailAndPassword(credentials);
    if (result.success && result.user != null) {
      return Right(unit);
    } else {
      return Left(Failure(result.errorMessage ?? "Login failed"));
      // return Left(Failure(getMessageFromErrorCode(result.errorMessage ?? "unknown")));
    }
  }

  Future<Either<Failure, Unit>> loginWithGoogle() async {
    final result = await _loginService.signInWithGoogle();
    if (result.success && result.user != null) {
      return Right(unit);
    } else {
      return Left(Failure(result.errorMessage ?? "Login With Google failed"));
    }
  }

  String getMessageFromErrorCode(String errorCode) {
    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
      default:
        return "Login failed. Please try again.";
    }
  }
}
