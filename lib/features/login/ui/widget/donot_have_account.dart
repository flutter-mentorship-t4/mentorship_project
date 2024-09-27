import 'package:flutter/material.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';

class DonotHaveAnAccouts extends StatelessWidget {
  const DonotHaveAnAccouts({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.pushNamed(Routes.signUp);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account ?',
              style: TextStyles.font18BlackRegular,
            ),
            TextSpan(
              text: ' Sign Up  ',
              style: TextStyles.font18PrimaryRegular,
            ),
          ],
        ),
      ),
    );
  }
}
