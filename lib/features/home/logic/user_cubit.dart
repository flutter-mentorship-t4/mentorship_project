import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/helpers/shared_pref_helper.dart';
import 'package:mentorship_project/core/helpers/strings/shared_pref_keys.dart';

class UserCubit extends Cubit<Map<String, String?>> {
  UserCubit()
      : super({SharedPrefKeys.userName: null, SharedPrefKeys.userEmail: null});

  Future<void> loadUserData() async {
   String? userName =await SharedPrefHelper.getString(SharedPrefKeys.userName);
   String? userEmail =await  SharedPrefHelper.getString(SharedPrefKeys.userEmail);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userName = prefs.getString(SharedPrefKeys.userName);
    // String? userEmail = prefs.getString(SharedPrefKeys.userEmail);

    emit({
      SharedPrefKeys.userName: userName,
      SharedPrefKeys.userEmail: userEmail
    });
  }
}
