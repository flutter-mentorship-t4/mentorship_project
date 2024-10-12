import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/helpers/extensions/context_extensions.dart';
import 'package:mentorship_project/core/helpers/extensions/navigations_extensions.dart';
import 'package:mentorship_project/core/routing/routes.dart';
import 'package:mentorship_project/features/login/logic/login_cubit.dart';
import 'package:mentorship_project/features/login/logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoadingState ||
          current is LoginSuccessState ||
          current is LoginErrorState,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          context.showLoading();
        } else if (state is LoginSuccessState) {
          setUpLoginSeccess(context);
        } else if (state is LoginErrorState) {
          setUpLoginFailure(context, state.error);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void setUpLoginSeccess(BuildContext context) {
    context.closeLoading();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.done_all_rounded,
            color: ColorsManager.mainGreen, size: 30),
        content: Text('LogIn Successful',
            textAlign: TextAlign.center, style: TextStyles.font22BlackSemiBold),
        actions: [
          Text('Congratulations, you have Logged In successfully!',
              textAlign: TextAlign.center,
              style: TextStyles.font12BlackRegular),
          TextButton(
            onPressed: () {
              context.pushNamed(Routes.home); //untill making Home Page
            },
            child: const Text('Continue',
                style: TextStyle(color: ColorsManager.primaryColor)),
          )
        ],
      ),
    );
  }

  void setUpLoginFailure(BuildContext context, error) {
    context.closeLoading();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 30),
        content: Text(error,
            textAlign: TextAlign.center, style: TextStyles.font14BlackRegular),
        title: Text('error',
            textAlign: TextAlign.center, style: TextStyles.font24BlackSemiBold),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child:  Text('Get It', style: TextStyles.font14RedRegular),
          )
        ],
      ),
    );
  }
}
