part of '../home_screen.dart';

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AppImages.womanAvatar).widthAndHeight(
          height: 32.h,
          width: 32.w,
        ),
        horizontalSpace(8),
        Text(
          'Welcome, Husam',
          style: TextStyles.font14BlackRegular,
        ),
        const Spacer(),
        SvgPicture.asset(
          AppIcons.notificationOutline,
        ).onTap(() {}),
        horizontalSpace(16),
        SvgPicture.asset(
          AppIcons.search,
        ).onTap(() {}),
      ],
    ).paddingOnly(
      top: 14.h,
      bottom: 16.h,
      start: 25.w,
      end: 25.w,
    );
  }
}
