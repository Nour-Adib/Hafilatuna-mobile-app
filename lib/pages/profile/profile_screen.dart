import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/widgets/navbar/navbar.dart';
import 'package:hafilatuna/widgets/navbar/navbar_controller.dart';
import 'package:hafilatuna/widgets/top_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavbarController navbarController = Get.put(NavbarController());

    return Scaffold(
        appBar: const TopBar(
          pageTile: 'Profile',
        ),
        bottomNavigationBar: Obx(() => Navbar(
            currentIndex: navbarController.selectedIndex.value,
            onItemTap: navbarController.onItemTap)),
        body: const Center());
  }
}
