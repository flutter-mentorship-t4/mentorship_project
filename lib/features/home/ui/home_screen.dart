import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/widgets/app_icon_button.dart';
import 'package:mentorship_project/core/widgets/app_text_form_field.dart';

import '../../../core/config/theming/styles.dart';
import '../../../core/helpers/extensions/widgets_extentions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/helpers/strings/app_icons.dart';
import '../../../core/helpers/strings/app_images.dart';

part 'widgets/_banner_carousel_slider.dart';
part 'widgets/_custom_app_bar.dart';
part 'widgets/_filter_categories_button.dart';
part 'widgets/_products_grid_view.dart';
part 'widgets/_search_bar_and_sorting.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _CustomAppBar(),
            const _SearchBarAndSorting(),
            const _BannerCarouselSlider(),
            const _FilterCategoriesButton(),
            const _ProductsGridView(),
          ],
        ),
      ),
    );
  }
}
