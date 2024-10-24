import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship_project/core/general_cubits/theme/theme_cubit.dart';
import 'package:mentorship_project/features/home/logic/home_state.dart';

import '../../../core/config/theming/colors.dart';
import '../../../core/config/theming/styles.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/extensions/navigations_extensions.dart';
import '../../../core/helpers/extensions/widgets_extentions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/helpers/strings/app_icons.dart';
import '../../../core/helpers/strings/app_images.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/app_icon_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../../core/widgets/category_button_item.dart';
import '../logic/home_cubit.dart';
import 'widgets/products_grid_view.dart';

part 'widgets/_banner_carousel_slider.dart';
part 'widgets/_custom_app_bar.dart';
part 'widgets/_filter_categories_button.dart';
part 'widgets/_floating_action_button.dart';
part 'widgets/_search_bar_and_sorting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> navigationItems = [
    {'title': 'Home', 'assetName': AppIcons.home},
    {'title': 'Categories', 'assetName': AppIcons.categories},
    {'title': 'Cart', 'assetName': AppIcons.cartPlusOutlined},
    {'title': 'Wishlist', 'assetName': AppIcons.heartOutlined},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomeCubit>(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _CustomAppBar(),
              const _SearchBarAndSorting(),
              const _BannerCarouselSlider(),
              const _FilterCategoriesButton(),
              const ProductsGridView(),
            ],
          ),
          floatingActionButton: _FloatingActionButton(),
        ),
      ),
    );
  }
}
