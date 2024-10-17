import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/features/categories/logic/categories_cubit.dart';
import 'package:mentorship_project/features/categories/ui/widgets/cateogries_screen_body.dart';

import '../../../core/di/dependency_injection.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CategoriesCubit>()..getCategories(),
      child: const CateogriesScreenBody(),
    );
  }
}
