import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/helpers/app_regex.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';
import 'package:mentorship_project/core/widgets/app_text_form_field.dart';
import 'package:mentorship_project/features/signup/logic/signup_cubit.dart';
import 'package:mentorship_project/features/signup/ui/widgets/password_validation.dart';

class EmailAndPassFields extends StatefulWidget {
  const EmailAndPassFields({
    super.key,
  });

  @override
  State<EmailAndPassFields> createState() => _EmailAndPassFieldsState();
}

class _EmailAndPassFieldsState extends State<EmailAndPassFields> {
  bool isPassObscured = true;
  late TextEditingController passController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasMinLong = false;
  bool hasSpecChar = false;
  @override
  void initState() {
    super.initState();
    passController = context.read<SignupCubit>().passwordController;
    setUpPassAddListener();
  }

  void setUpPassAddListener() {
    passController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passController.text);
        hasUpperCase = AppRegex.hasUpperCase(passController.text);
        hasMinLong = AppRegex.hasMinLength(passController.text);
        hasSpecChar = AppRegex.hasSpecialCharacter(passController.text);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Please Enter Your Name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
          ),
          verticalSpace(20),
          AppTextFormField(
            hintText: 'E-mail',
            validator: (val) {
              if (val == null || val.isEmpty || !AppRegex.isEmailValid(val)) {
                return 'Please Enter a valid Email';
              }
            },
            controller: context.read<SignupCubit>().emailController,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
          ),
          verticalSpace(20),
          AppTextFormField(
            hintText: 'Password',
            validator: (val) {
              if (val == null ||
                  val.isEmpty ||
                  !AppRegex.isPasswordValid(val)) {
                return 'Please Enter a valid Password';
              }
            },
            controller: context.read<SignupCubit>().passwordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPassObscured = !isPassObscured;
                });
              },
              child: Icon(
                isPassObscured ? Icons.visibility_off : Icons.visibility,
                size: 20,
              ),
            ),
            isObscureText: isPassObscured,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
          ),
          verticalSpace(10),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasMinLong: hasMinLong,
            hasSpecChar: hasSpecChar,
          ),
        ],
      ),
    );
  }
}
