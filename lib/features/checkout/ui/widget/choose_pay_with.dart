import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';
import 'package:mentorship_project/core/helpers/strings/app_icons.dart';

class ChoosePayWith extends StatelessWidget {
  const ChoosePayWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pay with", style: TextStyles.font18blackBold),
        verticalSpace(8),
        PaymentOption(
            assetName: AppIcons.mastercard,
            data: 'xxxx-1234',
            isSelected: true),
        verticalSpace(8),
        PaymentOption(
            assetName: AppIcons.applePay, data: 'Apple Pay', assetsHeight: 20),
        verticalSpace(8),
        PaymentOption(assetName: AppIcons.cash, data: "Cash"),
        TextButton(
          onPressed: () {},
          child: Text("+ Add new payment method",
              style: TextStyles.font14BlackRegular),
        ),
      ],
    );
  }
}

class PaymentOption extends StatelessWidget {
  const PaymentOption({
    Key? key,
    this.isSelected = false,
    required this.assetName,
    required this.data,
    this.assetsHeight = 30,
  }) : super();

  final bool isSelected;
  final String assetName;
  final String data;
  final double assetsHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? ColorsManager.primaryColor : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            assetName,
            width: assetsHeight.w,
            height: assetsHeight.h,
          ),
          horizontalSpace(20),
          Center(
            child: Text(data, style: TextStyles.font14Grey79Regular),
          ),
          Spacer(),
          Radio(
            value: isSelected,
            groupValue: true,
            onChanged: (value) {},
            activeColor: Colors.pink,
          )
        ],
      ),
    );
  }
}
