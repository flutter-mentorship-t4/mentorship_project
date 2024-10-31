import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions/string_extension.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/category_button_item.dart';
import '../../logic/cubit/wishlist_cubit.dart';
import '../../logic/cubit/wishlist_state.dart';

class HorizontalListViewWishList extends StatefulWidget {
  final List<String> filterCat;
  final int selectedFilterIndex;

  const HorizontalListViewWishList({
    required this.filterCat,
    required this.selectedFilterIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalListViewWishList> createState() => _HorizontalListViewWishListState();
}

class _HorizontalListViewWishListState extends State<HorizontalListViewWishList> {
  String _formatCategoryTitle(String category) {
    if (category == "All") return category;
    return category.split("'")[0].capitalize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
          scrollDirection: Axis.horizontal,
          itemCount: widget.filterCat.length,
          separatorBuilder: (context, index) => horizontalSpace(9),
          itemBuilder: (context, index) {
            final category = widget.filterCat[index];
            final cubit = context.read<WishlistCubit>();

            return CategoryButtonItem(
              title: _formatCategoryTitle(category),
              isSelected: cubit.selectedFilterIndex == index,
              onTap: () {
                setState(() {
                  cubit.selectedFilterIndex = index;
                  cubit.filterProducts(category);
                });
              },
            );
          },
        );
      },
    );
  }
}
