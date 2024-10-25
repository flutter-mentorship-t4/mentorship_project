import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/config/theming/colors.dart';
import '../../../../core/config/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/cateogory_model.dart';

class CategoryList extends StatefulWidget {
  final List<CategoryModel> categories;
  final Function(String) onCategorySelected;

  const CategoryList({
    Key? key,
    required this.categories,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String? selectedCategory;

  @override
  void initState() {
    super.initState();

    // Automatically select the first category when categories are loaded
    if (widget.categories.isNotEmpty) {
      selectedCategory = widget.categories[0].catName;
      widget.onCategorySelected(selectedCategory!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // Spaces items evenly across the row
        children: widget.categories.map((category) {
          // Check if the category is currently selected
          final isSelected = category.catName == selectedCategory;

          return GestureDetector(
            onTap: () {
              setState(() => selectedCategory = category.catName);
              widget.onCategorySelected(category.catName); // Call the provided callback
            },
            child: Column(
              children: [
                // The circular icon with SVG image
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? ColorsManager.primaryColor : ColorsManager.lightPrimary,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      category.svgPath,
                      width: 30,
                      height: 30,
                      color: isSelected ? ColorsManager.lightPrimary : ColorsManager.primaryColor,
                    ),
                  ),
                ),

                verticalSpace(8), // Spacer between icon and text

                // Category name text
                Container(
                  width: 70.w,
                  height: 40.h,
                  alignment: Alignment.center,
                  child: Text(category.catName,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: isSelected ? TextStyles.font12BlackBold : TextStyles.font12BlackRegular),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
