import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/pages/home/views/home_screen.dart';
import 'package:hafilatuna/pages/maps/maps_screen.dart';
import 'package:hafilatuna/pages/profile/profile_screen.dart';

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
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/maps',
          page: () => const MapScreen(),
        ),
        GetPage(
          name: '/profile',
          page: () => const ProfileScreen(),
        )
      ],
    ),
  );
}
