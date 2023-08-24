import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hafilatuna/services/user/user.service.dart';

import '../../models/user.model.dart';
import '../../utility/shared_preferences.dart';

class ProfileController extends GetxController {
  var name = "".obs;
  var greenPoints = "".obs;
  var isLoading = false.obs;
  User user = User();

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  getProfile() async {
    isLoading.value = true;
    final dio = Dio();
    final userService = UserService(dio);

    final accessToken =
        await SharedPreferencesService.getFromShared('accessToken');

    await userService.getProfile('Bearer $accessToken').then((response) {
      user = response;
    });
    isLoading.value = false;
  }

  logout() {
    Get.offAllNamed('/onboarding');
  }
}
