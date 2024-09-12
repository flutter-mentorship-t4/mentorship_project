import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/di/dependency_injection.dart' as di;
import 'package:mentorship_project/core/helpers/extensions/check_null_extension.dart';
import 'package:mentorship_project/core/helpers/shared_pref_helper.dart';
import 'package:mentorship_project/core/helpers/strings/constants.dart';
import 'package:mentorship_project/core/routing/app_router.dart';
import 'package:mentorship_project/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  di.setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MyApp(appRouter: AppRouter()),
    ),
  );
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

// dart run build_runner build --delete-conflicting-outputs