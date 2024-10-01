import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class signInWith extends StatelessWidget {
  final VoidCallback ontap;
  final String assetsName;
  const signInWith({
    Key? key,
    required this.assetsName,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: .01),
          ],
        ),
        child: SvgPicture.asset(
          assetsName,
          height: 22.h,
        ),
      ),
    );
  }
}
