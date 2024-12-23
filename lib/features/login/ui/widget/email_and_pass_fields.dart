import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/login_cubit.dart';

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
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'E-mail',
            validator: (val) {
              if (val == null || val.isEmpty || !AppRegex.isEmailValid(val)) {
                return 'Please Enter a valid Email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
            contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
          ),
          verticalSpace(20),
          AppTextFormField(
            hintText: 'Password',
            validator: (val) {
              if (val == null || val.isEmpty || !AppRegex.isPasswordValid(val)) {
                return 'Please Enter a valid Password';
              }
            },
            controller: context.read<LoginCubit>().passwordController,
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
            contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
          ),
        ],
      ),
    );
  }
}
