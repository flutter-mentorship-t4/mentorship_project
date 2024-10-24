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
        BlocProvider(
          create: (context) => UserCubit(),
          child: BlocBuilder<UserCubit, Map<String, String?>>(
            builder: (context, state) {
              if (state[SharedPrefKeys.userName] == null &&
                  state[SharedPrefKeys.userEmail] == null) {
                context.read<UserCubit>().loadUserData();
                return Center(child: CircularProgressIndicator());
              }
              return Text(
                'Welcome, ${state[SharedPrefKeys.userName]}',
                style: TextStyles.font14BlackRegular,
              );
            },
          ),
        ),
        const Spacer(),
        SvgPicture.asset(
          AppIcons.notificationOutline,
        ).onTap(() {}),
        horizontalSpace(16),
        Icon(Icons.logout).onTap(() async {
          await FirebaseAuth.instance.signOut();
          await SharedPrefHelper.clearAllData();
          context.pushNamed(Routes.loginScreen);
        })
      ],
    ).paddingOnly(
      top: 14.h,
      bottom: 16.h,
      start: 24.w,
      end: 24.w,
    );
  }
}
