import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/features/cart/ui/widgets/cart_screen_body.dart';

import '../../../core/di/dependency_injection.dart';
import '../logic/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt())..loadCart(),
      child: CartScreenBody(),
    );
  }
}
