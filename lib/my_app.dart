import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/cubits/theme/theme_cubit.dart';
import 'package:mentorship_project/core/cubits/theme/theme_state.dart';
import 'package:mentorship_project/core/routing/app_router.dart';

import 'core/routing/routes.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Mentorship App',
              // theme: ThemeData(
              //   primaryColor: ColorsManager.mainBlue,
              //   scaffoldBackgroundColor: Colors.white,
              // ),
              theme: context.read<ThemeCubit>().themeData,
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.onBoardingScreen,
              onGenerateRoute: appRouter.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
