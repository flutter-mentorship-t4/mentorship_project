import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/routing/routes.dart';
import 'package:mentorship_project/features/product_details/ui/product_details_screen.dart';

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
      case Routes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(),
        );

      default:
        return null;
    }
  }
}
