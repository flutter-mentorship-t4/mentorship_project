part of '../home_screen.dart';

class _SearchBarAndSorting extends StatelessWidget {
  const _SearchBarAndSorting();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pushNamed(Routes.searchScreen),
          child: AppTextFormField(
            enabled: false,
            hintText: 'Search here',
            contentPadding: EdgeInsetsDirectional.symmetric(vertical: 9.h),
            prefixIconConstraints: BoxConstraints(
              minWidth: 48.w,
              minHeight: 48.h,
            ),
            prefixIcon: SizedBox(
              width: 20.w,
              height: 20.h,
              child: SvgPicture.asset(
                AppIcons.search,
                color: ColorsManager.primaryColor,
              ).paddingStart(18.w),
            ).paddingEnd(10),
            validator: (value) {},
          ),
        ).expanded(),
        horizontalSpace(14),
        AppIconButton(
          onTap: () {
            _showFilterDialog(context);
          },
          backgroundColor: ColorsManager.lightPrimary,
          icon: SvgPicture.asset(AppIcons.filter),
        ),
      ],
    ).paddingOnly(
      bottom: 18.h,
      start: 24.w,
      end: 24.w,
    );
  }

  void _showFilterDialog(BuildContext context) {
    final List<String> filterCat = [
      "All",
      "electronics",
      "jewelery",
      "men's clothing",
      "women's clothing",
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<String> selectedFilters = []; // Tracks selected filters
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text("Select Filter"),
              content: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: filterCat.map((filter) {
                  final isSelected = selectedFilters.contains(filter);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle selection
                        if (isSelected) {
                          selectedFilters.remove(filter);
                        } else {
                          selectedFilters.add(filter);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: isSelected ? ColorsManager.primaryColor : ColorsManager.lightPrimary,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? ColorsManager.primaryColor : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        filter,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
