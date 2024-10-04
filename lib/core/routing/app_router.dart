import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/routing/routes.dart';
import 'package:mentorship_project/features/navigations/navigation_screen.dart';

import '../../features/home/logic/home_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/login_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: const LoginScreen(),
          ),
        );
      case Routes.navigationScreen:
        return MaterialPageRoute(
          builder: (_) => NavigationScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
