import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashScreenController c = Get.put(SplashScreenController());

    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Splash Screen'),
        ),
      ),
    );
  }
}
