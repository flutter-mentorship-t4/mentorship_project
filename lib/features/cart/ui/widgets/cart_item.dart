import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';
import 'package:mentorship_project/core/helpers/spacing.dart';
import 'package:mentorship_project/core/widgets/app_icon_button.dart';

import '../../data/models/cart_item_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;
  final Function(int) onQuantityChanged;
  final VoidCallback onSelectionChanged;
  final VoidCallback onRemove;

  const CartItemWidget(
      {Key? key, required this.item, required this.onQuantityChanged, required this.onSelectionChanged, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelectionChanged(),
      child: Container(
        height: 120.w,
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: item.isSelected ? ColorsManager.primaryColor : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Image.network(
                item.product.image,
                width: 76.83.w,
                height: 95.h,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 185.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.product.title,
                        style: TextStyles.font16BlackRegular,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(6),
                      Text(
                        '${item.product.price.toStringAsFixed(2)} L.E',
                        style: TextStyles.font16BlackRegular,
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 34.h,
                            decoration: BoxDecoration(
                              color: ColorsManager.primaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppIconButton(
                                  onTap: () => onQuantityChanged(item.quantity - 1),
                                  icon: Icon(Icons.remove, color: Colors.white),
                                  hPadding: 0,
                                  vPadding: 0,
                                ),
                                Text('${item.quantity}', style: TextStyles.font14WhiteSemiBold),
                                AppIconButton(
                                  onTap: () => onQuantityChanged(item.quantity + 1),
                                  icon: Icon(Icons.add, color: Colors.white),
                                  hPadding: 0,
                                  vPadding: 0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                horizontalSpace(8),
                SizedBox(
                  width: 24.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0, -10),
                        child: Radio(
                          value: true,
                          groupValue: item.isSelected,
                          onChanged: (_) => onSelectionChanged(),
                          activeColor: ColorsManager.primaryColor,
                        ),
                      ),
                      Text(
                        'Edit',
                        style: TextStyles.font12PrimaryRegular.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
