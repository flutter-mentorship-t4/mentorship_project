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
      child: Icon(Icons.dark_mode, color: Colors.white, size: 20.w),
      onPressed: () async {
        await context.read<ThemeCubit>().toggleTheme();
      },
    ).widthAndHeight(width: 40.w, height: 40.h);
  }
}
