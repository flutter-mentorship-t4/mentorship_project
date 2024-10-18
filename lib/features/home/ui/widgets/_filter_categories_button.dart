part of '../home_screen.dart';

class _FilterCategoriesButton extends StatefulWidget {
  const _FilterCategoriesButton();

  @override
  State<_FilterCategoriesButton> createState() =>
      _FilterCategoriesButtonState();
}

class _FilterCategoriesButtonState extends State<_FilterCategoriesButton> {
  List _filterCategories = [
    "All",
    "New in",
    "Popular",
    "Modest",
    "Formal",
    "Accessories",
    // "Electronics",
    // "Jewelery",
    // "Men's clothing",
    // "Women's clothing",
  ];

  int selectedFilterIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      scrollDirection: Axis.horizontal,
      itemCount: _filterCategories.length,
      separatorBuilder: (context, index) => horizontalSpace(9),
      itemBuilder: (context, index) {
        return CategoryButtonItem(
          title: _filterCategories[index],
          isSelected: selectedFilterIndex == index,
          onTap: () {
            setState(() {
              selectedFilterIndex = index;
            });
          },
        );
      },
    ).withHeight(70.h);
  }
}
