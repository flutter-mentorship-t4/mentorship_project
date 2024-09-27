part of '../home_screen.dart';

class _FilterCategoriesButton extends StatefulWidget {
  const _FilterCategoriesButton();

  @override
  State<_FilterCategoriesButton> createState() => _FilterCategoriesButtonState();
}

class _FilterCategoriesButtonState extends State<_FilterCategoriesButton> {
  List _filterCategories = [
    "All",
    "Electronics",
    "Jewelery",
    "Men's clothing",
    "Women's clothing",
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
        return _CategoryButtonItem(
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

class _CategoryButtonItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function() onTap;

  const _CategoryButtonItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.primaryColor : ColorsManager.lightPrimary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: isSelected
                  ? TextStyles.font16LightPrimaryRegular
                  : TextStyles.font12PrimaryRegular,
            ),
            isSelected
                ? SizedBox(
                    width: 22.w,
                    height: 22.h,
                    child: SvgPicture.asset(
                      AppIcons.stars,
                      color: ColorsManager.white,
                      width: 22.w,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
