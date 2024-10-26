import 'package:flutter/material.dart';

import 'checkout_type_button.dart';

class DrivingMethod extends StatelessWidget {
  const DrivingMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CheckoutTypeButton(isSelected: true, label: 'Delivery', onTap: () {}),
        CheckoutTypeButton(isSelected: false, label: 'Pick-up', onTap: () {})
      ],
    );
  }
}
