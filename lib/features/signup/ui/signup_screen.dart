import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/theming/styles.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/sign_with_social.dart';
import '../logic/signup_cubit.dart';
import 'widgets/already_have_an_account.dart';
import 'widgets/email_and_pass_fields.dart';
import 'widgets/signup_bloc_listener.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //ToDo Localization
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 20.h,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyles.font24BlackRegular,
                    ),
                    verticalSpace(15),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Image.asset('assets/images/signup.png'),
                    ),
                    verticalSpace(8),
                    EmailAndPassFields(),
                    verticalSpace(20),
                    AppButton(
                      label: 'Sign Up',
                      textStyle: TextStyles.font18WhiteRegular,
                      onTap: () {
                        finishingSignUpAndCreateAccount(context);
                      }, //////////////////////////////now manage it
                      width: double.infinity,
                      borderRadius: 30.r,
                    ),
                    verticalSpace(20),
                    Text(
                      '-------------- OR --------------',
                      style: TextStyles.font18Grey79Regular,
                    ),
                    verticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignWithSocial(
                          assetsName: 'assets/icons/google.svg',
                          ontap: () {},
                        ),
                        horizontalSpace(20),
                        SignWithSocial(
                          assetsName: 'assets/icons/facebook.svg',
                          ontap: () {},
                        ),
                        horizontalSpace(20),
                        SignWithSocial(
                          assetsName: 'assets/icons/apple.svg',
                          ontap: () {},
                        ),
                      ],
                    ),
                    verticalSpace(15),
                    AlreadyHaveAnAccount(),
                    const SignUpBlocListener(),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void finishingSignUpAndCreateAccount(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignUpState();
    }
  }
}
