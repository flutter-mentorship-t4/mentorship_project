import 'package:flutter/material.dart';

import '../../../core/config/theming/colors.dart';
import '../../../core/config/theming/styles.dart';
import '../../../core/helpers/extensions/navigations_extensions.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> notifications = [
      "New update available!",
      "Your order has been shipped",
      "Your profile was viewed 10 times today",
      "Don't miss out on our new deals",
      "Reminder: Complete your profile",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        title: Text('Notification', style: TextStyles.font22BlackSemiBold),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: ListTile(
              title: Text(
                notifications[index],
                style: const TextStyle(fontSize: 16.0),
              ),
              leading: Icon(
                Icons.notifications,
                color: ColorsManager.primaryColor,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
              onTap: () {
                // Placeholder for future notification detail functionality
              },
            ),
          );
        },
      ),
    );
  }
}
