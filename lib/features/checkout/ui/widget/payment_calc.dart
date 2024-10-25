import 'package:flutter/material.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';

class PaymentCalc extends StatelessWidget {
  const PaymentCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment", style:TextStyles.font18blackBold),
        verticalSpace(5),
        _buildSummaryRow("Subtotal", "1,250 L.E"),
        _buildSummaryRow("Discount", "-200 L.E", isDiscount: true),
        _buildSummaryRow("Delivery fee", "40 L.E"),
        const Divider(),
        _buildSummaryRow("TOTAL", "1,050 L.E", isBold: true),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {bool isDiscount = false, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: isDiscount ? Colors.red : Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
