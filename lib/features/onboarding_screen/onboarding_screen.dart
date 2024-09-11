import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/app_localization.dart';
import 'package:mentorship_project/core/cubits/theme/theme_cubit.dart';
import 'package:mentorship_project/core/helpers/strings/localization_keys.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationKeys.hello.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () async {
              await AppLocalization.changeLanguage(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.mode_night),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('This is the Onboarding Screen'),
      ),
    );
  }
}
