import '../../../signup/data/models/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final UserModel userModel;
  UserSuccessState(this.userModel);
}

class UserErrorState extends UserState {
  final String errorMessage;
  UserErrorState(this.errorMessage);
}
