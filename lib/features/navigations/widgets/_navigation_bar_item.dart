part of '../navigation_screen.dart';

class _NavigationBarItem extends StatelessWidget {
  final String title;
  final String assetName;
  final bool isSelected;
  final Function() onTap;

  const _NavigationBarItem({
    required this.isSelected,
    required this.assetName,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ColoredBox(
          color: isSelected ? ColorsManager.lightPrimary : Colors.transparent,
          child: Row(
            children: [
              SvgPicture.asset(
                assetName,
                width: 22.w,
                color: isSelected ? ColorsManager.primaryColor : null,
              ),
              if (isSelected) ...[
                horizontalSpace(14),
                Text(title, style: TextStyles.font13PrimaryRegular),
              ],
            ],
          ).paddingSymmetric(vertical: 12.w, horizontal: 14.h),
        ),
      ),
    );
  }
}
