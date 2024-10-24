part of '../home_screen.dart';

class _FilterCategoriesButton extends StatefulWidget {
  const _FilterCategoriesButton();

  @override
  State<_FilterCategoriesButton> createState() => _FilterCategoriesButtonState();
}

class _FilterCategoriesButtonState extends State<_FilterCategoriesButton> {
  final List<String> _filterCategories = [
    "All",
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing",
  ];

  int selectedFilterIndex = 0;

  String _formatCategoryTitle(String category) {
    if (category == "All") return category;
    return category.split("'")[0].capitalize();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
      scrollDirection: Axis.horizontal,
      itemCount: _filterCategories.length,
      separatorBuilder: (context, index) => horizontalSpace(9),
      itemBuilder: (context, index) {
        final category = _filterCategories[index];
        return CategoryButtonItem(
          title: _formatCategoryTitle(category),
          isSelected: selectedFilterIndex == index,
          onTap: () {
            setState(() {
              selectedFilterIndex = index;
            });
            context.read<HomeCubit>().filterProducts(category);
          },
        );
      },
    ).withHeight(70.h);
  }
}

extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) return this;
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
