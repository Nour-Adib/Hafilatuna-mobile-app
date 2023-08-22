import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  var width = Get.width;
  var length = Get.height;

  loginUser() {
    Get.offNamed('/home');
  }
}
