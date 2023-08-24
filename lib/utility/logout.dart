import 'package:get/get.dart';
import 'package:hafilatuna/utility/shared_preferences.dart';
import 'package:hafilatuna/utility/snackbar.dart';

class LogoutService {
  static logout() {
    SharedPreferencesService.setInShared('accessToken', '');
    SnackBarService.showSuccessSnackbar('Success', 'Logout successful');
    Get.offNamed('/onboarding');
  }
}
