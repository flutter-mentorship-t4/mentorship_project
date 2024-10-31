import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../generated/localization_keys.g.dart';
import 'color_circle.dart';

class ProductColorSelection extends StatefulWidget {
  const ProductColorSelection({Key? key}) : super(key: key);

  @override
  State<ProductColorSelection> createState() => _ProductColorSelectionState();
}

class _ProductColorSelectionState extends State<ProductColorSelection> {
  final Map<Color, String> colorSelected = {
    Color(0xFF5c362b): 'Brown',
    Color(0xFFcb848c): 'Pink',
    Color(0xFF934a5b): 'Red',
    Color(0xFFbba7f4): 'Lavender',
    Color(0xFF9cbba7): 'Green',
    Color(0xFFd10101): 'Scarlet',
  };

  // Track the currently selected color
  Color currentColor = Color(0xFF5c362b); // Default selected color

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display product color text and the selected color name
          Row(
            children: [
              Text(
                LocaleKeys.ProductDetailsScreen_ProductColor.tr(),
                style: TextStyles.font16BlackSemiBold,
              ),
              const SizedBox(width: 8), // Space between the text and color name
              Text(
                colorSelected[currentColor]!,
                style: TextStyles.font16BlackRegular,
              ),
            ],
          ),
          verticalSpace(10),
          // The color picker row
          Container(
            height: 60,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 16),
              padding: EdgeInsets.zero,
              itemCount: colorSelected.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Color color = colorSelected.keys.elementAt(index);
                return GestureDetector(
                  onTap: () => setState(() => currentColor = color),
                  child: ColorCircle(
                    color: color,
                    outerBorder: currentColor == color,
                    showLabel: (color == Color(0xFF5c362b) || color == Color(0xFF9cbba7)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
