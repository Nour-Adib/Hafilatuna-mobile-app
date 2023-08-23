import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/pages/onboarding/onboarding_controller.dart';
import 'package:hafilatuna/widgets/top_bar.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController c = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: const TopBar(
        pageTile: "",
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: Get.height * 0.05,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: Get.width * 0.45,
              child:
                  Image(image: Image.asset("assets/images/rtaLogo.png").image),
            ),
          ),
          SizedBox(
            width: Get.width * 0.5,
            child: Image(image: Image.asset("assets/images/logo.png").image),
          ),
          SizedBox(
            width: Get.width,
            child:
                Image(image: Image.asset("assets/images/yellowBus.jpg").image),
          ),
          SizedBox(
            height: Get.height * 0.1,
          ),
          SizedBox(
            width: Get.width * 0.5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffc806)),
              onPressed: () {
                c.goToRegister();
              },
              child: const Text("Register",
                  style: TextStyle(color: Color(0xff000000))),
            ),
          ),
          SizedBox(
            width: Get.width * 0.5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 214, 87, 80)),
              onPressed: () {
                c.goToLogin();
              },
              child: const Text("Login",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ),
        ],
      ),
    );
  }
}
