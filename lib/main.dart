import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/splash_screen/splash_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Hafilatuna',
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
        ),
      ],
    ),
  );
}
