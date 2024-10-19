import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/theming/colors.dart';
import '../../../../core/config/theming/styles.dart';
import '../../../../core/helpers/extensions/context_extensions.dart';
import '../../../../core/helpers/extensions/navigations_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../logic/signup_cubit.dart';
import '../../logic/signup_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) => current is SignupLoadingState || current is SignupSuccessState || current is SignupErrorState,
      listener: (context, state) {
        if (state is SignupLoadingState) {
          context.showLoading();
        } else if (state is SignupSuccessState) {
          setUpSignUpSeccess(context);
        } else if (state is SignupErrorState) {
          setUpSignUpFailure(context, state.error);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void setUpSignUpSeccess(BuildContext context) {
    context.closeLoading();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.done_all_rounded, color: ColorsManager.mainGreen, size: 30),
        content: Text('Signup Successful', textAlign: TextAlign.center, style: TextStyles.font22BlackSemiBold),
        actions: [
          Text('Congratulations, you have signed up successfully!', textAlign: TextAlign.center, style: TextStyles.font12BlackRegular),
          TextButton(
            onPressed: () {
              context.pushNamed(Routes.loginScreen);
            },
            child: const Text('Continue', style: TextStyle(color: ColorsManager.primaryColor)),
          )
        ],
      ),
    );
  }

  void setUpSignUpFailure(BuildContext context, String error) {
    context.closeLoading();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 30),
        content: Text(error, textAlign: TextAlign.center, style: TextStyles.font14BlackRegular),
        title: Text('error', textAlign: TextAlign.center, style: TextStyles.font24BlackSemiBold),
        actions: [
          Text(error, textAlign: TextAlign.center, style: TextStyles.font12BlackRegular),
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Get It', style: TextStyles.font14RedRegular),
          )
        ],
      ),
    );
  }
}
