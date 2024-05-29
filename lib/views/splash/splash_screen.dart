import 'package:cubit_group_5_mohandseen/core/utils/navigation_helper.dart';
import 'package:cubit_group_5_mohandseen/views/main_layout/main_layout.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      NavigationHelper.goToAndOff(context, MainLayout());
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.logo_dev, size: 200, color: Colors.deepPurple),
            CircularProgressIndicator(color: Colors.deepPurple),
          ],
        ),
      ),
    );
  }
}
