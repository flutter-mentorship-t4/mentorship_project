import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/di/dependency_injection.dart';

import '../../home/logic/home_cubit.dart';
import '../logic/search_cubit/search_cubit.dart';
import 'widgets/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(
            homeCubit: getIt<HomeCubit>(),
          ),
        ),
      ],
      child: const SearchScreenBody(),
    );
  }
}
