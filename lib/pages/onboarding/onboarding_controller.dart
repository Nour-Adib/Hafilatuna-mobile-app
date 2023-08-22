import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var width = Get.width;
  var length = Get.height;

  goToLogin() {
    Get.toNamed('/login');
  }

  goToRegister() {
    Get.toNamed('/register');
  }
}
