import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/helpers/extensions/context_extensions.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';

import '../../../../generated/localization_keys.g.dart';
import 'size_circle.dart';

class ProductSizeSelection extends StatefulWidget {
  const ProductSizeSelection({Key? key}) : super(key: key);

  @override
  State<ProductSizeSelection> createState() => _ProductSizeSelectionState();
}

class _ProductSizeSelectionState extends State<ProductSizeSelection> {
  final Map<String, String> sizeSelected = {
    'S': 'Small',
    'M': 'Medium',
    'L': 'Large',
  };

  // Track the currently selected size
  String currentSize = 'S'; // Default selected size

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display product size text and the selected size name
          Row(
            children: [
              Text(
                LocaleKeys.ProductDetailsScreen_ProductSize.tr(),
                style: TextStyles.font16BlackSemiBold,
              ),
              const SizedBox(width: 8), // Space between the text and size name
              Text(
                sizeSelected[currentSize]!,
                style: TextStyles.font16BlackRegular,
              ),
            ],
          ),
          verticalSpace(10),
          Container(
            width: context.width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: context.width * 3,
                    height: 60,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 16),
                      padding: EdgeInsets.zero,
                      itemCount: sizeSelected.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String size = sizeSelected.keys.elementAt(index);
                        return GestureDetector(
                          onTap: () => setState(() => currentSize = size),
                          child: SizeCircle(
                            size: size,
                            selected: currentSize == size,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Text(
                  'Size guide>',
                  style: TextStyles.font12Grey7ERegular.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
