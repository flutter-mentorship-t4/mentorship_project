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
            context.read<HomeCubit>().clearCart();
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
}
