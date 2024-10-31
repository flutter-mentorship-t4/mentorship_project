// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/helpers/extensions/navigations_extensions.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';
import 'package:mentorship_project/core/routing/routes.dart';
import 'package:mentorship_project/core/widgets/app_button.dart';
import 'package:mentorship_project/features/checkout/ui/widget/address_and_google_maps.dart';
import 'package:mentorship_project/features/checkout/ui/widget/choose_pay_with.dart';
import 'package:mentorship_project/features/checkout/ui/widget/driving_method.dart';
import 'package:mentorship_project/features/checkout/ui/widget/order_items.dart';
import 'package:mentorship_project/features/checkout/ui/widget/payment_calc.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        title: Text('Checkout', style: TextStyles.font22BlackSemiBold),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pushReplacementNamed(Routes.navigationScreen),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrivingMethod(),
              verticalSpace(16),
              AddressAngGoogleMap(),
              verticalSpace(16),
              OrderItems(),
              verticalSpace(8),
              ChoosePayWith(),
              verticalSpace(8),
              PaymentCalc(),
              verticalSpace(10),
              AppButton(
                label: 'Place Order',
                onTap: () {
                  context.pop();
                  context.pop();
                },
                textStyle: TextStyles.font20WhiteSemiBold,
                width: double.infinity,
                borderRadius: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
