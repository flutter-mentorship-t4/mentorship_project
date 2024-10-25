part of '../home_screen.dart';

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<UserCubit>(),
      child: Row(
        children: [
          Image.asset(AppImages.womanAvatar).widthAndHeight(
            height: 32.h,
            width: 32.w,
          ),
          horizontalSpace(8),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserSuccessState) {
                return Text(
                  'Welcome, ${state.userModel.name}',
                  style: TextStyles.font14BlackRegular,
                );
              } else if (state is UserErrorState) {
                return Text('Error: ${state.errorMessage}');
              } else {
                return UserShimmerLoading();
                // Container(
                //   width: 20.w,
                //   height: 20.h,
                //   child: CircularProgressIndicator(color: ColorsManager.primaryColor),
                // );
              }
            },
          ),
          const Spacer(),
          SvgPicture.asset(
            AppIcons.notificationOutline,
          ).onTap(() {}),
          horizontalSpace(16),
          Icon(Icons.logout).onTap(() async {
            context.read<HomeCubit>().signOut();
            context.pushReplacementNamed(Routes.loginScreen);
          })
        ],
      ),
    ).paddingOnly(
      top: 14.h,
      bottom: 16.h,
      start: 24.w,
      end: 24.w,
    );
  }
}

class UserShimmerLoading extends StatelessWidget {
  const UserShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsManager.grey,
      highlightColor: ColorsManager.white,
      child: Container(
        height: 16.h,
        width: 80.w,
        decoration: BoxDecoration(
            color: ColorsManager.grey, borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
