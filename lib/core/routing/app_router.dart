import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/features/checkout/ui/checkout_screen.dart';
import 'package:mentorship_project/features/search/ui/search_screen.dart';

import '../../features/cart/ui/cart_screen.dart';
import '../../features/categories/ui/categories_screen.dart';
import '../../features/home/data/models/products_model.dart';
import '../../features/home/logic/home_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/navigations/navigation_screen.dart';
import '../../features/product_details/data/models/dummy_product.dart';
import '../../features/product_details/ui/product_details_screen.dart';
import '../../features/signup/logic/signup_cubit.dart';
import '../../features/signup/ui/signup_screen.dart';
import '../../features/wishlist/ui/wishlist_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

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
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(getIt()),
            child: const SignUpScreen(),
          ),
        );

      case Routes.navigationScreen:
        return MaterialPageRoute(
          builder: (_) => NavigationScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt(), getIt(), getIt()),
            child: const HomeScreen(),
          ),
        );

      case Routes.wishlistScreen:
        return MaterialPageRoute(builder: (_) => WishListScreen());
      case Routes.cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case Routes.checkoutScreen:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      case Routes.searchScreen:
        return MaterialPageRoute(builder: (_) => SearchScreen());

      case Routes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: settings.arguments as ProductModel),
        );

      case Routes.categoriesScreen:
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      default:
        return null;
    }
  }
}

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
