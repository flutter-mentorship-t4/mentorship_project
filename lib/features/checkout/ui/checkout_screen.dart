// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/helpers/extensions/navigations_extensions.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';
import 'package:mentorship_project/core/routing/routes.dart';
import 'package:mentorship_project/core/widgets/app_button.dart';
import 'package:mentorship_project/features/checkout/ui/widget/checkout_type_button.dart';

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
        title: Text('Chaeckout', style: TextStyles.font22BlackSemiBold),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pushReplacementNamed(Routes.navigationScreen),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckoutTypeButton(isSelected: true, label: 'Delivery', onTap: () {}),
                CheckoutTypeButton(isSelected: false, label: 'Pick-up', onTap: () {})
              ],
            ),
            verticalSpace(16),
            Text("Address", style: TextStyles.font18blackBold),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: ColorsManager.primaryColor),
              ),
              child: ListTile(
                title: Text("Home"),
                subtitle: Text("33 Othman Ibn Affan st, Apt B, 3rd Floor"),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text("Edit", style: TextStyles.font12PrimaryRegular),
                ),
              ),
            ),
            verticalSpace(16),
            Text("Order Items", style: TextStyles.font18blackBold),
            verticalSpace(8),
            Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(30),
              // ),
              height: 150.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.network(
                          'https://s3-alpha-sig.figma.com/img/ff0f/4061/4ad6b6e9b84d980459576e4d2e5dacea?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jujKOZ8F-OA6GEuXotKuvslTU-yj71QEHMM3t8hM0SwPSVZAQhdoxWGLXgp3SY4mwYrdr~vZQCOfWncH65i5s3BvUrxLjExvkOuWUSyUoVCoWP05Wftidn2co14JQEc8fEeLF~t8HCWEJZDDC57l~DVRQ7~i1z-0i~OSUbBLsm21CkY2BIZBd~28b5v2OfD1kYOeY4mje50uu9T1ytrKEoM9~VgaWGUIov2T0oSEUAuOvrlGaripeTuuBcgAKMFRgMpzKE6vO9--LzOEXsoK2knNa1tkeTG-InhVCG1BDoMO8n6xuoXFNcPf3WsuqYKLmD1sJT52RPgJz-wTirccFg__',
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                      verticalSpace(10),
                      Text('580 L.E', style: TextStyles.font16BlackSemiBold),
                    ],
                  );
                },
              ),
            ),
            Text(
              "Pay with",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("**** **** **** 1234"),
              trailing: Radio(value: true, groupValue: true, onChanged: (value) {}),
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("Apple Pay"),
              trailing: Radio(value: false, groupValue: true, onChanged: (value) {}),
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text("Cash"),
              trailing: Radio(value: false, groupValue: true, onChanged: (value) {}),
            ),
            TextButton(
              onPressed: () {},
              child: Text("+ Add new payment method"),
            ),
            AppButton(
              label: 'Place Order',
              onTap: () {},
              textStyle: TextStyles.font20WhiteSemiBold,
              width: double.infinity,
              borderRadius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
