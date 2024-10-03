import 'package:flutter/material.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/helpers/extensions/navigations_extensions.dart';
import 'package:mentorship_project/core/routing/routes.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.login);
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Already have an account yet?',
                style: TextStyles.font18BlackRegular,
              ),
              TextSpan(
                text: ' Login ',
                style: TextStyles.font18PrimaryRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
