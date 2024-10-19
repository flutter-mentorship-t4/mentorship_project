import 'package:flutter/material.dart';

import '../../../../core/config/theming/styles.dart';
import '../../../../core/helpers/extensions/navigations_extensions.dart';
import '../../../../core/routing/routes.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.loginScreen);
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
