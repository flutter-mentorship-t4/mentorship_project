import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';
import 'package:mentorship_project/core/widgets/app_text_form_field.dart';
import 'package:mentorship_project/features/signup/logic/signup_cubit.dart';

class EmailAndPassFields extends StatefulWidget {
  const EmailAndPassFields({
    super.key,
  });

  @override
  State<EmailAndPassFields> createState() => _EmailAndPassFieldsState();
}

class _EmailAndPassFieldsState extends State<EmailAndPassFields> {
  bool isobscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'E-mail',
            validator: (val) {},
            controller: context.read<SignupCubit>().userNameController,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
          ),
          verticalSpace(20),
          AppTextFormField(
            hintText: 'Password',
            validator: (val) {},
            controller: context.read<SignupCubit>().passwordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isobscureText = !isobscureText;
                });
              },
              child: Icon(
                isobscureText ? Icons.visibility_off : Icons.visibility,
                size: 20,
              ),
            ),
            isObscureText: isobscureText,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
          ),          verticalSpace(20),

          AppTextFormField(
            hintText: 'Confirm Password',
            validator: (val) {},
            controller: context.read<SignupCubit>().ConfirmPasswordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isobscureText = !isobscureText;
                });
              },
              child: Icon(
                isobscureText ? Icons.visibility_off : Icons.visibility,
                size: 20,
              ),
            ),
            isObscureText: isobscureText,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
          ),
        ],
      ),
    );
  }
}
