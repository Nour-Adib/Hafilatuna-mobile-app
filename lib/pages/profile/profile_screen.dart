import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/pages/profile/profile_controller.dart';
import 'package:hafilatuna/utility/logout.dart';
import 'package:hafilatuna/widgets/navbar/navbar.dart';
import 'package:hafilatuna/widgets/navbar/navbar_controller.dart';
import 'package:hafilatuna/widgets/top_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavbarController navbarController = Get.put(NavbarController());
    final ProfileController c = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      appBar: const TopBar(
        pageTile: 'Profile',
      ),
      bottomNavigationBar: Obx(() => Navbar(
          currentIndex: navbarController.selectedIndex.value,
          onItemTap: navbarController.onItemTap)),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle_rounded,
              size: 150, color: Colors.grey),
          const Text("Mohamed Ahmed",
              style: TextStyle(fontSize: 30, fontFamily: 'Montserrat')),
          SizedBox(height: Get.height * 0.05),
          SizedBox(
            width: Get.width * 0.5,
            child: Image(image: Image.asset("assets/images/green_points.jpg").image),
          ),
          const Text("GREEN POINTS:",
              style: TextStyle(fontSize: 20, fontFamily: 'Montserrat')),
          const Text("123456.00",
              style: TextStyle(fontSize: 20, fontFamily: 'Montserrat')),
          SizedBox(height: Get.height * 0.125),
          SizedBox(
            width: Get.width * 0.5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffEB3830)),
              onPressed: () {},
              child: const Text("LOG OUT",
                  style: TextStyle(color: Color(0xffffffff))),
            ),
          ),
        ],
      )),
    );
  }
}
