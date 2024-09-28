import 'package:flutter/material.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/helpers/extensions/navigations_extensions.dart';
import 'package:mentorship_project/core/widgets/app_bottom_sheet.dart';
import 'package:mentorship_project/core/widgets/app_icon_button.dart';

class ProductDetailsTopBar extends StatelessWidget {
  const ProductDetailsTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Row(
          children: [
            AppIconButton(
              onTap: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
              ),
              backgroundColor: ColorsManager.white,
              hPadding: 10,
              vPadding: 10,
            ),
            Spacer(),
            AppIconButton(
              onTap: () {
                AppBottomSheet.show(
                  context,
                  content: Container(
                    height: 300,
                    child: Center(child: Text('Share')),
                  ),
                );
              },
              icon: Icon(
                Icons.ios_share_rounded,
              ),
              backgroundColor: ColorsManager.white,
              hPadding: 10,
              vPadding: 10,
            ),
          ],
        ),
      ),
    );
  }
}
