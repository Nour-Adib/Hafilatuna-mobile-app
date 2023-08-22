import 'package:get/get.dart';
import 'package:hafilatuna/pages/home/views/home_screen.dart';
import 'package:hafilatuna/pages/maps/maps_screen.dart';
import 'package:hafilatuna/pages/profile/profile_screen.dart';

class NavbarController extends GetxController {
  final selectedIndex = 1.obs;

  onItemTap(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.to(() => const MapScreen(), transition: Transition.noTransition);
        break;
      case 1:
        Get.to(() => const HomeScreen(), transition: Transition.noTransition);
        break;
      case 2:
        Get.to(() => const ProfileScreen(),
            transition: Transition.noTransition);
        break;
    }
  }
}
