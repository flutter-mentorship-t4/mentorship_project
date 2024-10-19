import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/theming/styles.dart';
import '../../../core/helpers/extensions/navigations_extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/sign_with_social.dart';
import '../logic/login_cubit.dart';
import '../logic/login_state.dart';
import 'widget/donot_have_account.dart';
import 'widget/email_and_pass_fields.dart';
import 'widget/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //ToDo Localization
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.pushReplacementNamed(Routes.homeScreen);
        } else if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 24.h,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome back',
                          style: TextStyles.font24BlackRegular,
                        ),
                        verticalSpace(15),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50.w),
                          child: Image.asset('assets/images/login.png'),
                        ),
                        verticalSpace(15),
                        EmailAndPassFields(),
                        verticalSpace(5),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            'Forget Password ? ',
                            style: TextStyles.font14PrimaryRegular,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              shape: CircleBorder(),
                              value: false,
                              onChanged: (bool? value) {},
                            ),
                            Text(
                              'Remember me',
                              style: TextStyles.font14BlackRegular,
                            ),
                          ],
                        ),
                        verticalSpace(10),
                        AppButton(
                          label: 'Sign In',
                          textStyle: TextStyles.font18WhiteRegular,
                          onTap: () {
                            validateAndLogin(context);
                          },
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
                              ontap: () async {
                                await context.read<LoginCubit>().signInWithGoogle();
                              },
                            ),
                            horizontalSpace(20),
                            SignWithSocial(
                              assetsName: 'assets/icons/facebook.svg',
                              ontap: () async {
                                await context.read<LoginCubit>().signInWithFacebook();
                              },
                            ),
                            horizontalSpace(20),
                            SignWithSocial(
                              assetsName: 'assets/icons/apple.svg',
                              ontap: () {},
                            ),
                          ],
                        ),
                        verticalSpace(15),
                        DonotHaveAnAccouts(),
                        LoginBlocListener(),
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }

  void validateAndLogin(BuildContext context) {
    // context.showLoading();
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().authenticateUser();
      // context.closeLoading();
    }
  }
}
