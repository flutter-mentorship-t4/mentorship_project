import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../logic/categories_cubit/categories_cubit.dart';
import 'widgets/cateogries_screen_body.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CategoriesCubit>(),
      child: const CategoriesScreenBody(),
    );
  }
}
