import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentorship_project/core/helpers/extensions/navigations_extensions.dart';
import 'package:mentorship_project/core/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home'),
            ElevatedButton(
              onPressed: () async {
                await signout();
                context.pushReplacementNamed(Routes.login);
              },
              child: Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
