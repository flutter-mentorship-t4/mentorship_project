import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/di/dependency_injection.dart' as di;
import 'package:mentorship_project/core/helpers/bloc_observer.dart';
import 'package:mentorship_project/core/helpers/strings/shared_pref_keys.dart';
import 'package:mentorship_project/core/routing/app_router.dart';
import 'package:mentorship_project/firebase_options.dart';
import 'package:mentorship_project/my_app.dart';

import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  await EasyLocalization.ensureInitialized();

  di.setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: MyApp(appRouter: AppRouter()),
    ),
  );
}

Future<void> checkIfLoggedInUser() async {
  if (FirebaseAuth.instance.currentUser != null) {
    log('true ====current User=========${FirebaseAuth.instance.currentUser}');
    log('true ========email===== ${FirebaseAuth.instance.currentUser!.email}');
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
  // String? userToken =
  //     await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  // if (!userToken.isNullOrEmpty()) {
  //   isLoggedInUser = true;
  // } else {
  //   isLoggedInUser = false;
  // }
}

// dart run build_runner build --delete-conflicting-outputs

/// USE THIS COMMAND FOR GENERATE (CodegenLoader)
// flutter pub run easy_localization:generate --source-dir ./assets/translations

/// USE THIS COMMAND FOR GENERATE (LocalizationKeys)
// flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o localization_keys.g.dart
