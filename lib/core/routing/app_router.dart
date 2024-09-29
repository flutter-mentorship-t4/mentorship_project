import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/routing/routes.dart';
import 'package:mentorship_project/features/product_details/ui/product_details_screen.dart';

import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/product_details/data/models/dummy_product.dart';
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
        final product = DummyProduct.fromJson({
          "id": 1,
          "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
          "price": 109.95,
          "description":
              "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          "category": "men's clothing",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 120}
        });
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: product),
        );

      default:
        return null;
    }
  }
}
