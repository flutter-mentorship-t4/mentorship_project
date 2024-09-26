import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/extensions/widgets_extentions.dart';
import '../../../core/config/theming/styles.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/helpers/strings/app_icons.dart';
import '../../../core/helpers/strings/app_images.dart';

part 'widgets/_custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
