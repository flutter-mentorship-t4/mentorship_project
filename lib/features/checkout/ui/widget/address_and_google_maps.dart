import 'package:flutter/material.dart';
import 'package:mentorship_project/core/config/theming/colors.dart';
import 'package:mentorship_project/core/config/theming/styles.dart';

class AddressAngGoogleMap extends StatelessWidget {
  const AddressAngGoogleMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
