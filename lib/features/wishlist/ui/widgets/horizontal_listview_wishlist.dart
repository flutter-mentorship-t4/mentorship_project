
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';
import 'package:mentorship_project/core/widgets/category_button_item.dart';

class HorizontalListViewWishList extends StatelessWidget {
  const HorizontalListViewWishList({
    super.key,
    required List filterCat,
    required this.selectedFilterIndex,
  }) : _filterCat = filterCat;

  final List _filterCat;
  final int selectedFilterIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 10.w),
      scrollDirection: Axis.horizontal,
      itemCount: _filterCat.length,
      separatorBuilder: (context, index) => horizontalSpace(9),
      itemBuilder: (context, index) {
        return CategoryButtonItem(
          title: _filterCat[index],
          isSelected: selectedFilterIndex == index,
          onTap: () {},
        );
      },
    );
  }
}
