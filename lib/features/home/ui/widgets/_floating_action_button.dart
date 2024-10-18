part of '../home_screen.dart';

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: ColorsManager.primaryColor,
      child: Icon(Icons.add, color: Colors.white, size: 20.w),
      onPressed: ()async {
        await FirebaseAuth.instance.signOut();
        context.pushNamed(Routes.loginScreen);
      },
    ).widthAndHeight(width: 40.w, height: 40.h);
  }
}
