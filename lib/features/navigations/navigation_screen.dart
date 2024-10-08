import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship_project/features/home/ui/home_screen.dart';

import '../../../core/helpers/extensions/widgets_extentions.dart';
import '../../../core/helpers/strings/app_icons.dart';
import '../../core/config/theming/colors.dart';
import '../../core/config/theming/styles.dart';
import '../../core/helpers/spacing.dart';

part 'widgets/_navigation_bar_item.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> navigationItems = [
    {'title': 'Home', 'assetName': AppIcons.home},
    {'title': 'Categories', 'assetName': AppIcons.categories},
    {'title': 'Cart', 'assetName': AppIcons.cartPlusOutlined},
    {'title': 'Wishlist', 'assetName': AppIcons.heartOutlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            const HomeScreen(),
            Text('Categories').center(),
            Text('Cart').center(),
            Text('Wishlist').center(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 92.h,
        padding: EdgeInsetsDirectional.only(top: 18.h, bottom: 26.h),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: navigationItems.asMap().entries.map<Widget>((MapEntry e) {
            int index = e.key;
            Map value = e.value;
            return _NavigationBarItem(
              title: value['title'],
              assetName: value['assetName'],
              isSelected: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
